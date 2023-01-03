package main.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import main.entity.*;
import main.implementation.*;
import main.util.Constants;
import main.util.Helper;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwt;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Controller
@RequestMapping("/user")
public class AuthenticationController {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	JavaMailSender mailer;

	private AccountRepository accountRepository = AccountRepository.getInstance();
	private StaffRepository staffRepository = StaffRepository.getInstance();
	private CustomerRepository customerRepository = CustomerRepository.getInstance();
	@Transactional
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String login(HttpServletResponse response, @RequestBody PayloadAuthen payload
							) {
		Session session = factory.openSession();
		String account = payload.getAccountId();
		String password = payload.getPassword();
		Map<String, Object> map = new HashMap<>();
		String status = "failed";
		try {
			TaiKhoan tk = this.accountRepository.findById(account, session);
			if (tk != null) {
				String originPass = tk.getPassword();
				Boolean isMatchPassword = BCrypt.checkpw(password, originPass);
				if (isMatchPassword) {
					Staff staff = this.staffRepository.findById(account, session);
					String token = this.generateToken(account, staff.getSurName() + " " + staff.getNameStaff(), 
							tk.getRole(), staff.getPathImgStaff(), staff.getStore().getIdStore());
					payload.setAccessToken(token);
					map.put("idStore", staff.getStore().getIdStore());
					map.put("token", token);
					status = "success";
				}			
			}
		} catch (Exception e) {
		}
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	@Transactional
	@RequestMapping(value = "/check-duplicate", method = RequestMethod.POST)
	@ResponseBody
	public String checkDuplicate(HttpServletResponse response, @RequestBody PayloadAuthen payload
							) {
		Session session = factory.openSession();
		String status = "Not found";
		switch (payload.getReferenceDuplicate()) {
		case "EMAIL":
			Staff staffByEmail = this.staffRepository.findByEmail(payload.getEmail(), session);
			if (staffByEmail != null && !staffByEmail.getEmail().equals(payload.getOldEmail())) {
				status = "Found";
			}
			break;
		case "EMAIL_CUSTOMER":
			Customer customerByEmail = this.customerRepository.findByEmail(payload.getEmail(), session);
			if (customerByEmail != null && !customerByEmail.getEmailCustomer().equals(payload.getOldEmail())) {
				status = "Found";
			}
			break;
		case "PHONE":
			Staff staffByPhone = this.staffRepository.findByPhone(payload.getPhone(), session);
			if (staffByPhone != null && !staffByPhone.equals(payload.getOldPhone())) {
				status = "Found";
			}
			break;
		case "PHONE_CUSTOMER":
			Customer customerByPhone = this.customerRepository.findByPhone(payload.getPhone(), session);
			if (customerByPhone != null && !customerByPhone.equals(payload.getOldPhone())) {
				status = "Found";
			}
			break;
		default:
			status = "ERROR";
			break;
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("status", status);
		
		String json = new Gson().toJson(map);
		
		return json;
	}
	
	@Transactional
	@RequestMapping(value = "/send-mail-forgot-password", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	String sendMailForgotPassword(@RequestBody PayloadAuthen payload, HttpServletRequest request) {
		Session session = factory.openSession();
		Map<String, Object> map = new HashMap<>();
		String email = payload.getEmail();
		String status = "success";
		String baseUrl = request.getRequestURL().toString().replace(request.getRequestURI(), request.getContextPath());
		String hashedPassword = BCrypt.hashpw(payload.getPassword(), BCrypt.gensalt());
		String token = this.generateTokenToUpdatePassword(email, hashedPassword);
		String bodyVerifyMessage = Constants.TEXT_FORGOT_PASSWORD.replace("${baseUrl}", baseUrl).replace("${token}", token);
		Helper.sendMail(mailer, email, Constants.SUBJECT_FORGOT_PASSWORD, bodyVerifyMessage);
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	@Transactional
	@RequestMapping(value = "/confirm-update", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	void confirmUpdatePassword(HttpServletRequest request, HttpServletResponse response) {
		String token = request.getParameter("accessToken");
		String baseUrl = request.getRequestURL().toString().replace(request.getRequestURI(), request.getContextPath());
		String url = baseUrl + "/login.htm";
		if (token != null) {
			try {
				Session session = factory.openSession();
				Claims claims = Helper.parseClaim(token);
				String email = (String )claims.get("email");
				String hashPass = (String )claims.get("hashPass");
				Staff staff = this.staffRepository.findByEmail(email, session);
				if (staff != null && hashPass != null) {
					TaiKhoan tk = this.accountRepository.findById(staff.getIdStaff(), session);
					tk.setPassword(hashPass);
					Boolean isUpdate = this.accountRepository.update(tk, session);
					if (isUpdate) {
						String newToken = this.generateToken(staff.getIdStaff(), staff.getSurName() + " " + staff.getNameStaff(), 
								tk.getRole(), staff.getPathImgStaff(), staff.getStore().getIdStore());
						response.sendRedirect(url + "?accessToken=" + newToken);
						return;
					}
				}
			} catch(Exception e) {
				System.out.println("Exception when redirect: " + e);
			}
		}
		
		try {
			response.sendRedirect(url);
		} catch(IOException e) {}
	}
	
	@Transactional
	@RequestMapping(value = "/verify-token", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	String verifyToken(@RequestBody PayloadAuthen payload, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();
		String accessToken = payload.getAccessToken();
		String status = "failed";
		try {
			Claims claims = Helper.parseClaim(accessToken);
			if (claims != null) {
				Session session = factory.openSession();
				String accountId = (String) claims.get("accountId");
				String role = (String) claims.get("role");
				Staff staff = this.staffRepository.findById(accountId, session);
				if (staff != null) {
					status = "success";
					map.put("employee", staff);
					map.put("role", role);
					map.put("idEmployee", accountId);
				}
			}
		} catch (Exception e) {
		}
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	@Transactional
	@RequestMapping(value = "/send-vietnam-data", method = RequestMethod.POST)
	@ResponseBody
	String getVietnameseData(@RequestBody PayloadAuthen payload, HttpSession httpSession) {
		httpSession.setAttribute("surName", payload.getSurNameEmployee());
		httpSession.setAttribute("nameEmployee", payload.getNameEmployee());
		httpSession.setAttribute("sex", payload.getSex());
		Map<String, Object> map = new HashMap<>();
		map.put("status", "success");
		String json = new Gson().toJson(map);
		return json;
	}
	
	@Transactional
	@RequestMapping(value = "/set-status", method = RequestMethod.POST)
	@ResponseBody
	String setStatus(@RequestBody PayloadAuthen payload, HttpSession httpSession) {
		Map<String, Object> map = new HashMap<>();
		String status = "success";
		Session session = factory.openSession();
		Staff staff = this.staffRepository.findById(payload.getAccountId(), session);
		TaiKhoan tk = this.accountRepository.customFindById(payload.getAccountId(), session);
		if (staff != null && tk != null) {
			staff.setStatus(payload.getStatusEmployee());
			tk.setStatus(payload.getStatusAccount());
			Boolean isUpdateST = this.staffRepository.update(staff, session);
			Boolean isUpdateTK = this.accountRepository.update(tk, session);
			if (isUpdateST && isUpdateTK) {
				status = "success";
			}
		}
		
		
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	String generateToken(String account, String name, String role, String pathImg, String idStore) {
		Calendar calendar = Calendar.getInstance();
	    calendar.add(Calendar.MONTH, 1);
		String jwt = Jwts.builder()
		        .setExpiration(calendar.getTime())
		        .claim("accountId", account)
		        .claim("nameEmployee", name)
		        .claim("idStore", idStore)
		        .claim("pathImg", pathImg)
		        .claim("role", role)
		        .signWith(SignatureAlgorithm.HS256, Constants.SECRET_KEY_ACCESS_TOKEN.getBytes())
		        .compact();
		
		return jwt;
	}
	
	String generateTokenToUpdatePassword(String email, String hashPass) {
		Calendar calendar = Calendar.getInstance();
	    calendar.add(Calendar.DATE, 1);
		String jwt = Jwts.builder()
		        .setExpiration(calendar.getTime())
		        .claim("email", email)
		        .claim("hashPass", hashPass)
		        .signWith(SignatureAlgorithm.HS256, Constants.SECRET_KEY_ACCESS_TOKEN.getBytes())
		        .compact();
		
		return jwt;
	}
 }