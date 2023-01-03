package main.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import main.entity.*;
import main.implementation.*;
import main.util.Constants;
import main.util.Helper;

@Controller
@RequestMapping("employee")
public class EmployeeController {
	@Autowired
	SessionFactory factory;
	@Autowired
	JavaMailSender mailer;
	
	private StaffRepository staffRepository = StaffRepository.getInstance();
	private ServiceRepository serviceRepository = ServiceRepository.getInstance();
	private TypeStaffRepository typeStaffRepository = TypeStaffRepository.getInstance();
	private StoreRepository storeRepository = StoreRepository.getInstance();
	private AccountRepository accountRepository = AccountRepository.getInstance();
	private StaffServiceRepository staffServiceRepository = StaffServiceRepository.getInstance();
	private RegisShiftRepository regisShiftRepository = RegisShiftRepository.getInstance();
	
	@RequestMapping(value="", produces = "text/html; charset=UTF-8")
	@Transactional
	String render(ModelMap model, HttpServletRequest request) {
		Session session = factory.openSession();
		String idStore = request.getParameter("idStore");
		List<Staff> employees = this.staffRepository.find("WHERE idStore =" + idStore, session);
		List<Staff> employeesActive = this.staffRepository.findStaffActive("AND typeStaff = 1", session);
		List<Staff> managers = this.staffRepository.find("WHERE (typeStaff = 3 or typeStaff = 4) AND idStore = " + idStore, session);
		List<Service> services = this.serviceRepository.findServicesActive("", session);
		List<TypeStaff> typeEmployees = this.typeStaffRepository.find("", session);
		List<StaffService> staffServices = this.staffServiceRepository.find("", session);
		List<RegisShift> regisShift = this.regisShiftRepository.
				findByCondition(new Date(), idStore, session);

		model.addAttribute("totalEmployee", employees.size());
		model.addAttribute("employees", employees);
		model.addAttribute("idStore", idStore);
		model.addAttribute("managers", managers);
		model.addAttribute("services", services);
		model.addAttribute("typeEmployees", typeEmployees);
		model.addAttribute("employeesActive", employeesActive);
		model.addAttribute("layout", "staff/employee.jsp");
		
		String rawStaffs = Helper.parseRawDataToJson(employees);
		String rawStaffServices = Helper.parseRawDataToJson(staffServices);
		String rawRegisShifts = Helper.parseRawDataToJson(regisShift);
		model.addAttribute("rawStaffs", rawStaffs);
		model.addAttribute("rawStaffServices", rawStaffServices);
		model.addAttribute("rawRegisShifts", rawRegisShifts);
		
		return "";
	}
	
	@RequestMapping(value = "/add-employee", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	private void addEmployee(ModelMap model, @RequestParam("file") MultipartFile photo, HttpSession httpSession,
							  HttpServletRequest request, HttpServletResponse response) {
		Session session = factory.openSession();
		String nameImage = String.valueOf(new Date().getTime());
		String phone = request.getParameter("phone");
		String idStaff = "NV-" + nameImage;
		nameImage += ".jpg";
		String surName = (String) httpSession.getAttribute("surName");
		String nameEmployee = (String) httpSession.getAttribute("nameEmployee");
		String sex = (String) httpSession.getAttribute("sex");
		String email = request.getParameter("email");
		String cccd = request.getParameter("cccd");
		String idStore = request.getParameter("store_id");
		String pathImg = Constants.BASE_URL_IMAGES.replace("${baseUrl}", Helper.getRootDomain(request)) + nameImage;
		String idManager = request.getParameter("manager_name");
		int typeStaff = Integer.parseInt(request.getParameter("type_staff"));
		String randomPassword = Helper.generateRandomSixNumber();
		String hashedPassword = BCrypt.hashpw(randomPassword, BCrypt.gensalt());
		
		Store store = this.storeRepository.findById(idStore, session);
		Staff staff = new Staff(idStaff, surName, nameEmployee, sex, phone, email, cccd, store, Constants.STATUS_STAFF_ACTIVE,
								pathImg, idManager, typeStaff);
		TaiKhoan tk = new TaiKhoan(idStaff, hashedPassword, Constants.STATUS_ACTIVE_ACCOUNT, Helper.getRoleByTypeStaff(typeStaff));
		Boolean isSaveTK = this.accountRepository.save(tk, session);
		if (isSaveTK) {
			Boolean isSaveST = this.staffRepository.save(staff, session);
			if(isSaveST) {
				Helper.uploadImage(photo, nameImage);
				String body = Constants.TEXT_NEW_ACCOUNT.replace("${account}", idStaff).replace("${password}", randomPassword);
				Helper.sendMail(mailer, email, Constants.SUBJECT_NEW_ACCOUNT, body);
				if (!request.getParameter("arrServices").equals("")) {
					String[] arrIdService = request.getParameter("arrServices").split(",");
					for (String idService : arrIdService) {
						StaffService staffService = new StaffService(idStaff, Integer.parseInt(idService));
						this.staffServiceRepository.save(staffService, session);
					}
				}
			}
		}
		
		try {
			String referer = request.getHeader("Referer");
			response.sendRedirect(referer);
		} catch (Exception e) {
			
		}
	}
	
	@RequestMapping(value = "/edit-employee-without-img", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	private void editEmployee(ModelMap model, HttpSession httpSession,
							  HttpServletRequest request, HttpServletResponse response) {
		Session session = factory.openSession();
		String phone = request.getParameter("phone");
		String idStaff = request.getParameter("idStaff");
		String surName = (String) httpSession.getAttribute("surName");
		String nameEmployee = (String) httpSession.getAttribute("nameEmployee");
		String sex = (String) httpSession.getAttribute("sex");
		String email = request.getParameter("email");
		String cccd = request.getParameter("cccd");
		String idManager = request.getParameter("manager_name");
		int typeStaff = Integer.parseInt(request.getParameter("type_staff"));
		Staff staff = this.staffRepository.findById(idStaff, session);
		TaiKhoan tk = this.accountRepository.customFindById(idStaff, session);
		if (staff != null && tk != null) {
			staff.setSurName(surName);
			staff.setNameStaff(nameEmployee);
			staff.setGender(sex);
			staff.setPhone(phone);
			staff.setEmail(email);
			staff.setCccd(cccd);
			staff.setTypeStaff(typeStaff);
			staff.setIdManager(idManager);
			tk.setRole(Helper.getRoleByTypeStaff(typeStaff));
			Boolean isUpdateST = this.staffRepository.update(staff, session);
			Boolean isUpdateTK = this.accountRepository.update(tk, session);
			if (isUpdateST && isUpdateTK) {
				this.staffServiceRepository.deleteByIdStaff(idStaff, session);
				if (!request.getParameter("arrServices").equals("")) {
				String[] arrIdService = request.getParameter("arrServices").split(",");
				for (String idService : arrIdService) {
					StaffService staffService = new StaffService(idStaff, Integer.parseInt(idService));
					this.staffServiceRepository.save(staffService, session);
					}
				}
			}
		}	
		
		try {
			String referer = request.getHeader("Referer");
			response.sendRedirect(referer);
		} catch (Exception e) {
			
		}
	}
	
	@RequestMapping(value = "/edit-manager-without-img", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	private void editManagerWithoutImg(ModelMap model, HttpSession httpSession,
							  HttpServletRequest request, HttpServletResponse response) {
		Session session = factory.openSession();
		String phone = request.getParameter("phone");
		String idStaff = request.getParameter("idManager");
		String surName = (String) httpSession.getAttribute("surName");
		String nameEmployee = (String) httpSession.getAttribute("nameEmployee");
		String email = request.getParameter("email");
		String cccd = request.getParameter("cccd");
		Staff staff = this.staffRepository.findById(idStaff, session);
		if (staff != null) {
			staff.setSurName(surName);
			staff.setNameStaff(nameEmployee);
			staff.setPhone(phone);
			staff.setEmail(email);
			staff.setCccd(cccd);
			Boolean isUpdate = this.staffRepository.update(staff, session);
			if (isUpdate) {
				httpSession.removeAttribute("nameEmployee");
				httpSession.removeAttribute("surName");
			}
		}
		
		try {
			String referer = request.getHeader("Referer");
			response.sendRedirect(referer);
		} catch (Exception e) {
			
		}
	}
	
	@RequestMapping(value = "/edit-manager-with-img", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	private void editManagerWithImg(ModelMap model, HttpSession httpSession, @RequestParam("file") MultipartFile photo,
							  HttpServletRequest request, HttpServletResponse response) {
		Session session = factory.openSession();
		String phone = request.getParameter("phone");
		String idStaff = request.getParameter("idManager");
		String surName = (String) httpSession.getAttribute("surName");
		String nameEmployee = (String) httpSession.getAttribute("nameEmployee");
		String email = request.getParameter("email");
		String cccd = request.getParameter("cccd");
		Staff staff = this.staffRepository.findById(idStaff, session);
		if (staff != null) {
			String nameImage = String.valueOf(new Date().getTime()) + ".jpg";
			updateImage(staff.getPathImgStaff(), photo, nameImage);
			String pathImg = Constants.BASE_URL_IMAGES.replace("${baseUrl}", Helper.getRootDomain(request)) + nameImage;
			staff.setPathImgStaff(pathImg);
			staff.setSurName(surName);
			staff.setNameStaff(nameEmployee);
			staff.setPhone(phone);
			staff.setEmail(email);
			staff.setCccd(cccd);
			Boolean isUpdate = this.staffRepository.update(staff, session);
			if (isUpdate) {
				httpSession.removeAttribute("nameEmployee");
				httpSession.removeAttribute("surName");
			}
		}
		
		try {
			String referer = request.getHeader("Referer");
			response.sendRedirect(referer);
		} catch (Exception e) {
			
		}
	}
	
	@RequestMapping(value = "/edit-employee-withimg", method = RequestMethod.POST)
	private void updateEmployeeWithImg(ModelMap model, HttpSession httpSession, @RequestParam("file") MultipartFile photo,
							  HttpServletRequest request, HttpServletResponse response) {
		Session session = factory.openSession();
		String nameImage = String.valueOf(new Date().getTime()) + ".jpg";
		String pathImg = Constants.BASE_URL_IMAGES.replace("${baseUrl}", Helper.getRootDomain(request)) + nameImage;
		String phone = request.getParameter("phone");
		String idStaff = request.getParameter("idStaff");
		String surName = (String) httpSession.getAttribute("surName");
		String nameEmployee = (String) httpSession.getAttribute("nameEmployee");
		String sex = (String) httpSession.getAttribute("sex");
		String email = request.getParameter("email");
		String cccd = request.getParameter("cccd");
		String idManager = request.getParameter("manager_name");
		int typeStaff = Integer.parseInt(request.getParameter("type_staff"));
		Staff staff = this.staffRepository.findById(idStaff, session);
		TaiKhoan tk = this.accountRepository.customFindById(idStaff, session);
		updateImage(staff.getPathImgStaff(), photo, nameImage);
		if (staff != null && tk != null) {
			staff.setSurName(surName);
			staff.setNameStaff(nameEmployee);
			staff.setGender(sex);
			staff.setPhone(phone);
			staff.setEmail(email);
			staff.setCccd(cccd);
			staff.setTypeStaff(typeStaff);
			staff.setIdManager(idManager);
			staff.setPathImgStaff(pathImg);
			tk.setRole(Helper.getRoleByTypeStaff(typeStaff));
			Boolean isUpdateST = this.staffRepository.update(staff, session);
			Boolean isUpdateTK = this.accountRepository.update(tk, session);
			if (isUpdateST && isUpdateTK) {
				this.staffServiceRepository.deleteByIdStaff(idStaff, session);
				if (!request.getParameter("arrServices").equals("")) {
					String[] arrIdService = request.getParameter("arrServices").split(",");
					for (String idService : arrIdService) {
						StaffService staffService = new StaffService(idStaff, Integer.parseInt(idService));
						this.staffServiceRepository.save(staffService, session);
						}
				}
			}
		}
		
		try {
			String referer = request.getHeader("Referer");
			response.sendRedirect(referer);
		} catch (Exception e) {
			
		}
	}
	
	@Transactional
	@RequestMapping(value = "/regis-shift", method = RequestMethod.POST)
	@ResponseBody
	String setStatus(@RequestBody PayloadAuthen payload) {
		Map<String, Object> map = new HashMap<>();
		String status = "success";
		Session session = factory.openSession();
		String idStore = payload.getIdStore();
		String rawArrDate = payload.getArrDate();
		String rawArrEmployee = payload.getArrEmployee();
		String[] arrDate = rawArrDate.split(",");
		String[] arrEmployee = rawArrEmployee.split(",");
		
		for (String employee : arrEmployee) {
			for (String date: arrDate) {
				int numberDateOfWeek = Helper.getDayNumberOfWeek(date) - 1;
				Store store = this.storeRepository.findById(idStore, session);
				Date dateParse = Helper.convertStringToDate(date, Constants.FORMAT_DATE);
				RegisShift regisShift = new RegisShift(dateParse, employee, numberDateOfWeek, store, Constants.STATUS_REGIS_SHIFT);
				Boolean isSave = this.regisShiftRepository.save(regisShift, session);
				if (!isSave) {
					status = "failed";
					break;
				}
			}
		}
		
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	private void updateImage(String pathImgOld, MultipartFile photo, String newName) {
		String[] pathSplit = pathImgOld.split("/");
		String oldName = pathSplit[pathSplit.length - 1];
		File oldFile = new File(Constants.ORIGIN_PATH_IMAGES + oldName);
		oldFile.delete();
		Helper.uploadImage(photo, newName);
	}
}
