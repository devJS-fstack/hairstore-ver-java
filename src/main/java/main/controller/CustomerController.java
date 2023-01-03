package main.controller;

import java.util.Date;
//import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import main.entity.*;
import main.implementation.AccountRepository;
import main.implementation.BookItemRepository;
import main.implementation.BookRepository;
import main.implementation.CustomerRepository;
import main.implementation.StaffRepository;
import main.util.Constants;
import main.util.Helper;

@Controller
@RequestMapping("customer")
public class CustomerController {
	
	@Autowired
	SessionFactory factory;
	@Autowired
	JavaMailSender mailer;
	
	private CustomerRepository customerRepository = CustomerRepository.getInstance();
	private BookRepository bookRepository = BookRepository.getInstance();
	private StaffRepository staffRepository = StaffRepository.getInstance();
	private BookItemRepository bookItemRepository = BookItemRepository.getInstance();
	private AccountRepository  accountRepository = AccountRepository.getInstance();
	
	@RequestMapping("")
	@Transactional
	private String render(ModelMap model, HttpServletRequest request) {
		String idStore = request.getParameter("idStore");
		Session session = factory.openSession();
		List<Customer> customers = this.customerRepository.find("", session);
		List<Book> bookings = this.bookRepository.find("WHERE idStore = " + idStore, session);
		List<Staff> staffs = this.staffRepository.find("WHERE idStore = " + idStore, session);
		List<BookItem> bookItems = this.bookItemRepository.find("", session);
		String rawBookings = Helper.parseRawDataToJson(bookings);
		String rawStaffs = Helper.parseRawDataToJson(staffs);
		String rawBookItems = Helper.parseRawDataToJson(bookItems);
		String rawCustomers = Helper.parseRawDataToJson(customers);
		model.addAttribute("rawBookings", rawBookings);
		model.addAttribute("rawBookItems", rawBookItems);
		model.addAttribute("rawCustomers", rawCustomers);
		model.addAttribute("rawStaffs", rawStaffs);
		model.addAttribute("idStore", idStore);
		model.addAttribute("customers", customers);
		model.addAttribute("totalCustomer", customers.size());
		model.addAttribute("layout", "staff/customer.jsp");
		return "";
	}
	
	@RequestMapping("create")
	@Transactional
	@ResponseBody
	private String createCustomer(ModelMap model, @RequestBody PayloadAuthen payload) {
		Session session = factory.openSession();
		String status = "failed";
		String phone = payload.getPhone();
		String email = payload.getEmail();
		String name = payload.getNameEmployee();
		String randomPassword = Helper.generateRandomSixNumber();
		String hashedPassword = BCrypt.hashpw(randomPassword, BCrypt.gensalt());
		TaiKhoan tk = new TaiKhoan(phone, hashedPassword, Constants.STATUS_ACTIVE_ACCOUNT, "1");
		Customer customer = new Customer(tk, name, email, new Date());
		Boolean isSaveTK = accountRepository.save(tk, session);
		Boolean isSaveCM = customerRepository.save(customer, session);
		if (isSaveTK && isSaveCM) {
			String body = Constants.TEXT_NEW_ACCOUNT.replace("${account}", phone).replace("${password}", randomPassword);
			Helper.sendMail(mailer, email, Constants.SUBJECT_NEW_ACCOUNT_CUSTOMER, body);
			status = "success";
		}
		
		
		Map<String, String> map = new HashMap<>();
		map.put("status", status);
		String json = new Gson().toJson(map);
		
		return json;
	}
	
	@RequestMapping("edit")
	@Transactional
	@ResponseBody
	private String editCustomer(ModelMap model, @RequestBody PayloadAuthen payload) {
		Session session = factory.openSession();
		String status = "failed";
		String phone = payload.getPhone();
		String email = payload.getEmail();
		String name = payload.getNameEmployee();
		Customer customer = customerRepository.findByPhone(phone, session);
		customer.setEmailCustomer(email);
		customer.setNameCustomer(name);
		if (customer != null) {
			Boolean isUpdate = customerRepository.update(customer, session);
			if (isUpdate) {
				status = "success";
			}
		}
		
		
		Map<String, String> map = new HashMap<>();
		map.put("status", status);
		String json = new Gson().toJson(map);
		
		return json;
	}
	
	@RequestMapping("set-status")
	@Transactional
	@ResponseBody
	private String setStatusCustomer(ModelMap model, @RequestBody PayloadAuthen payload) {
		Session session = factory.openSession();
		String status = "failed";
		String phone = payload.getPhone();
		String statusAccount = payload.getStatusAccount();
		TaiKhoan taiKhoan = accountRepository.customFindById(phone, session);
		if (taiKhoan != null && statusAccount != null) {
			taiKhoan.setStatus(statusAccount);
			Boolean isUpdate = accountRepository.update(taiKhoan, session);
			if (isUpdate) {
				status = "success";
			}
		}
		
		
		Map<String, String> map = new HashMap<>();
		map.put("status", status);
		String json = new Gson().toJson(map);
		
		return json;
	}
}
