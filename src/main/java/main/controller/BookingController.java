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

import org.hibernate.Query;
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

import io.jsonwebtoken.Claims;
import main.entity.*;
import main.implementation.*;
import main.util.Constants;
import main.util.Helper;

@Controller
@RequestMapping("booking")
public class BookingController {
	@Autowired
	SessionFactory factory;
	
	private StaffRepository staffRepository = StaffRepository.getInstance();
	private ServiceRepository serviceRepository = ServiceRepository.getInstance();
	private ShiftRepository shiftRepository = ShiftRepository.getInstance();
	private BookRepository bookRepository = BookRepository.getInstance();
	private BookItemRepository bookItemRepository = BookItemRepository.getInstance();
	private CustomerRepository customerRepository = CustomerRepository.getInstance();
	private RegisShiftRepository regisShiftRepository = RegisShiftRepository.getInstance();
	private BillRepository billRepository = BillRepository.getInstance();
	private StoreRepository storeRepository = StoreRepository.getInstance();
	
	@RequestMapping(value="", produces = "text/html; charset=UTF-8")
	@Transactional
	String render(ModelMap model, HttpServletRequest request) {
		Session session = factory.openSession();
		String idStore = request.getParameter("idStore");
		List<Staff> employees = this.staffRepository.findStylistActive(idStore, session);
		List<Service> services = this.serviceRepository.findServicesActive("", session);
		List<Shift> shifts = this.shiftRepository.find("", session);
		List<Book> bookings = this.bookRepository.find("WHERE idStore = " + idStore, session);
		List<BookItem> bookItems = this.bookItemRepository.find("", session);
		List<Customer> customers = this.customerRepository.find("", session);
		List<RegisShift> regisShifts = this.regisShiftRepository.find("WHERE idStore = " + idStore, session);
		Store store = this.storeRepository.findById(idStore, session);
		
		model.addAttribute("totalEmployee", employees.size());
		model.addAttribute("employees", employees);
		model.addAttribute("shifts", shifts);
		model.addAttribute("services", services);
		model.addAttribute("layout", "staff/booking.jsp");
		
		String rawBookings = Helper.parseRawDataToJson(bookings);
		String rawShifts = Helper.parseRawDataToJson(shifts);
		String rawBookItems = Helper.parseRawDataToJson(bookItems);
		String rawCustomers = Helper.parseRawDataToJson(customers);
		String rawRegisShifts = Helper.parseRawDataToJson(regisShifts);
		String rawStore = Helper.parseRawDataToJson(store);
		model.addAttribute("rawBookings", rawBookings);
		model.addAttribute("rawShifts", rawShifts);
		model.addAttribute("rawBookItems", rawBookItems);
		model.addAttribute("rawCustomers", rawCustomers);
		model.addAttribute("rawRegisShifts", rawRegisShifts);
		model.addAttribute("rawStore", rawStore);
		model.addAttribute("idStore", idStore);
		
		return "";
	}
	
	@Transactional
	@RequestMapping(value = "/add-booking", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	String addBooking(@RequestBody PayloadAuthen payload, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();
		Session session = factory.openSession();
		String status = "failed";
		String dateBook = payload.getArrDate();
		String phoneBook = payload.getPhone();
		String idShift = payload.getIdShift();
		String idStaff = payload.getAccountId();
		String idStore = payload.getIdStore();
		String[] arrService = payload.getArrService();
		Staff staff = this.staffRepository.findById(idStaff, session);
		
		Book book = this.generateBook(dateBook, idShift, staff, 0, phoneBook, idStore, Constants.BOOKED);
		List<BookItem> bookItems = this.generateBookItem(arrService, book, session);
		book.setPayment(this.getPayment(bookItems));
		
		Boolean isInsertBook = this.bookRepository.save(book, session);
		Boolean isInsertListBookItem = this.bookItemRepository.insertMany(bookItems, session);
		
		if (isInsertBook && isInsertListBookItem) {
			status = "success";
		}
		
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	@Transactional
	@RequestMapping(value = "/edit-booking", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	String editBooking(@RequestBody PayloadAuthen payload, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();
		Session session = factory.openSession();
		String status = "failed";
		String dateBook = payload.getArrDate();
		String oldPhone = payload.getOldPhone();
		String phoneBook = payload.getPhone();
		String idShift = payload.getIdShift();
		String idStaff = payload.getAccountId();
		String idStore = payload.getIdStore();
		String[] arrService = payload.getArrService();
		Staff staff = this.staffRepository.findById(idStaff, session);
		this.preprocessBook(session, oldPhone);
		
		Book book = this.generateBook(dateBook, idShift, staff, 0, phoneBook, idStore, Constants.BOOKED);
		List<BookItem> bookItems = this.generateBookItem(arrService, book, session);
		book.setPayment(this.getPayment(bookItems));
		
		Boolean isInsertBook = this.bookRepository.save(book, session);
		Boolean isInsertListBookItem = this.bookItemRepository.insertMany(bookItems, session);
		
		if (isInsertBook && isInsertListBookItem) {
			status = "success";
		}
		
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	@Transactional
	@RequestMapping(value = "/cancel-booking", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	String cancel(@RequestBody PayloadAuthen payload, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();
		Session session = factory.openSession();
		String status = "failed";
		String phone = payload.getPhone();
		Book book = this.bookRepository.findByPhoneAndStatus(phone, Constants.BOOKED, session);
		if (book != null) {
			book.setStatusBook(Constants.STATUS_CANCEL_BOOK);
			Boolean isUpdate = this.bookRepository.update(book, session);
			if (isUpdate) {
				status = "success";				
			}
		}
		
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	@Transactional
	@RequestMapping(value = "/create-bill", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	String createBill(@RequestBody PayloadAuthen payload, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();
		Session session = factory.openSession();
		String status = "failed";
		String phone = payload.getPhone();
		String arrDate = payload.getArrDate();
		String idBill = payload.getIdBill();
		int payment = payload.getPayment();
		String idStaff = payload.getAccountId();
		String idStore = payload.getIdStore();
		Book book = this.bookRepository.findByPhoneAndStatus(phone, Constants.BOOKED, session);
		book.setStatusBook(Constants.STATUS_DONE_BOOK);
		Bill bill = new Bill(idBill, Helper.convertStringToDate(arrDate, Constants.FORMAT_DATE),
				Constants.STATUS_DONE_BILL, payment, idStaff, phone, Integer.parseInt(idStore));
		
		Boolean isSave = this.billRepository.save(bill, session);
		Boolean isUpdate = this.bookRepository.update(book, session);
		if (isSave && isUpdate) {
			status = "success";
		}
		
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	private Book generateBook(String dateString, String idShiftBook, Staff staff,
			  int payment, String phoneCus, 
			  String idStore, String status) {
		Date dateParse = Helper.convertStringToDate(dateString, Constants.FORMAT_DATE);
		int paymentParse = Integer.valueOf(payment);
		int idStoreParse = Integer.valueOf(idStore);
		
		Book book = new Book(dateParse, idShiftBook, staff, paymentParse, phoneCus, idStoreParse, status);
		
		return book;
	}
	
	private void preprocessBook(Session session, String phoneCus) {
		Book existBook = this.bookRepository.findByPhoneAndStatus(phoneCus, Constants.BOOKED, session);
		if (existBook == null) {
			System.out.println("Not existed for this book");
			return;
		}

		BookItem bookItem = this.bookItemRepository.findOne("", session);		
		int matchedRemoveBookItem = this.bookItemRepository.deleteByField(existBook.getDateBook(),existBook.getIdShiftBook(), existBook.getStaff().getIdStaff(), session);
		int matchedRemoveBook = this.bookRepository.deleteByField(existBook.getDateBook(),existBook.getIdShiftBook(), existBook.getStaff().getIdStaff(), session);
		
		if (matchedRemoveBookItem > 0 && matchedRemoveBook == 1) {
			System.out.println("Preprocess successfully");
		}
	}
	
	private List<BookItem> generateBookItem(String[] arrService, Book book, Session session) {
		List<BookItem> listBookItem = new ArrayList<>();
		for (String idService: arrService) {
			Service service = this.serviceRepository.findById(Integer.parseInt(idService), session);
			BookItem bookItem = new BookItem(book.getDateBook(), book.getIdShiftBook(), 
					book.getStaff().getIdStaff(), service, service.getPrice());
			listBookItem.add(bookItem);
		}
		
		return listBookItem;
	}
	
	private int getPayment(List<BookItem> bookItems) {
		int result = 0;
		for (BookItem bookItem : bookItems ) {
			result += bookItem.getPrice();
		}
		return result;
	}
}
