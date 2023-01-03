package main.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import main.entity.*;
import main.implementation.BillRepository;
import main.implementation.BookItemRepository;
import main.implementation.BookRepository;
import main.implementation.CustomerRepository;
import main.implementation.ShiftRepository;
import main.implementation.StaffRepository;
import main.util.Constants;
import main.util.Helper;

@Controller
@RequestMapping("dashboard-manager")
public class DashboardController {
	@Autowired
	SessionFactory factory;
	
	private CustomerRepository customerRepository = CustomerRepository.getInstance();
	private BillRepository billRepository = BillRepository.getInstance();
	private BookRepository bookRepository = BookRepository.getInstance();
	private BookItemRepository bookItemRepository = BookItemRepository.getInstance();
	private ShiftRepository shiftRepository = ShiftRepository.getInstance();
	private StaffRepository staffRepository = StaffRepository.getInstance();
	@RequestMapping(value="", produces = "text/html; charset=UTF-8")
	@Transactional
	String render(ModelMap model, HttpServletRequest request) {
		Session session = factory.openSession();
		String idStore = request.getParameter("idStore");
		List<Shift> shifts = this.shiftRepository.find("", session);
		List<BookItem> bookItems = this.bookItemRepository.find("", session);
		
		String rawShifts = Helper.parseRawDataToJson(shifts);
		String rawBookItems = Helper.parseRawDataToJson(bookItems);
		model.addAttribute("idStore", idStore);
		model.addAttribute("rawShifts", rawShifts);
		model.addAttribute("rawBookItems", rawBookItems);
		model.addAttribute("layout", "staff/dashboard.jsp");
		
		return "";
	}
	
	@RequestMapping(value="customer-revenue-currentweek", produces = "text/html; charset=UTF-8")
	@Transactional
	@ResponseBody
	String getCustomerAndRevenue(ModelMap model, @RequestBody PayloadAuthen payload) {
		Session session = factory.openSession();
		String idStore = payload.getIdStore();
		Date firstDate = Helper.convertStringToDate(payload.getFirstDate(), Constants.FORMAT_DATE);
		Date lastDate = Helper.convertStringToDate(payload.getLastDate(), Constants.FORMAT_DATE);
		List<Customer> customers = this.customerRepository.customFind(firstDate, lastDate, session);
		List<Bill> bills = this.billRepository.customFind(firstDate, lastDate, Integer.parseInt(idStore), session);
		Map<String, Object> map = new HashMap<>();
		Map<String, Date> start_end =  new HashMap<>();
		Date maxDateBook = this.bookRepository.maxDateBook(session);
		Date minDateBook = this.bookRepository.minDateBook(session);
		map.put("status", "success");
		map.put("customers", customers);
		map.put("revenue", bills);
		start_end.put("min", minDateBook);
		start_end.put("max", maxDateBook);
		map.put("start_end", start_end);
		
		String json = new Gson().toJson(map);
		return json;
	}
	
	@RequestMapping(value="book-revenue", produces = "text/html; charset=UTF-8")
	@Transactional
	@ResponseBody
	String getBookAndRevenue(@RequestBody PayloadAuthen payload) {
		Session session = factory.openSession();
		int idStore = Integer.parseInt(payload.getIdStore());
		Date firstDate = Helper.convertStringToDate(payload.getFirstDate(), Constants.FORMAT_DATE);
		Date lastDate = Helper.convertStringToDate(payload.getLastDate(), Constants.FORMAT_DATE);
		String oldDate = payload.getArrDate();
		List<Bill> bills = this.billRepository.customFind(firstDate, lastDate, idStore, session);
		List<Book> books = this.bookRepository.customFind(firstDate, lastDate, idStore, session);
		long count_bookSuccess = this.bookRepository.countBookByStatusAndDate(firstDate, lastDate, idStore, Constants.STATUS_DONE_BOOK, session);
		long count_bookPending = this.bookRepository.countBookByStatusAndDate(firstDate, lastDate, idStore, Constants.BOOKED, session);
		Date minDate = this.customerRepository.minDateCreate(session);
		List<Customer> oldCustomers = this.customerRepository.findCustomerByRange(minDate, Helper.convertStringToDate(oldDate, Constants.FORMAT_DATE), session);
		List<Customer> newCustomers = this.customerRepository.findCustomerByRange(firstDate, lastDate, session);
		List<Map<String, Integer>> arrCountOldCustomer = this.generateArrCustomer(oldCustomers);
		List<Map<String, Integer>> arrCountNewCustomer = this.generateArrCustomer(newCustomers);
		
		Map<String, Object> map = new HashMap<>();
		map.put("status_b", "success");
		map.put("data_bill", bills);
		map.put("data", books);
		map.put("count_bookSuccess", count_bookSuccess);
		map.put("count_bookPending", count_bookPending);
		map.put("arrCountOldCustomer", arrCountOldCustomer);
		map.put("arrCountNewCustomer", arrCountNewCustomer);
		
		String json = new Gson().toJson(map);
		return json;
	}
	
	@RequestMapping(value="pagination", produces = "text/html; charset=UTF-8")
	@Transactional
	@ResponseBody
	private String paginationBook(@RequestBody PayloadAuthen payload) {
		Map<String, Object> map = new HashMap<>();
		Session session = factory.openSession();
		int pageNumber = payload.getPageNumber();
		String idStore = payload.getIdStore();
		int skip = (pageNumber - 1) * 10;
		long countAll = this.bookRepository.count("WHERE idStore = " + Integer.parseInt(idStore), session);
		List<Book> books = this.bookRepository.findBySkip(skip, Integer.parseInt(idStore), session);
		int totalPage = (int) Math.ceil(countAll / Constants.MAX_PAGE);
		
		
		map.put("totalPage", totalPage);
		map.put("bookedArr", books);
		map.put("status", "success");
		String json = new Gson().toJson(map);
		return json;
	}
	
	@RequestMapping(value="perfomance-employee", produces = "text/html; charset=UTF-8")
	@Transactional
	@ResponseBody
	private String perfomanceEmployee(@RequestBody PayloadAuthen payload) {
		Map<String, Object> map = new HashMap<>();
		Session session = factory.openSession();
		String idStore = payload.getIdStore();
		Date firstDate = Helper.convertStringToDate(payload.getFirstDate(), Constants.FORMAT_DATE);
		Date lastDate = Helper.convertStringToDate(payload.getLastDate(), Constants.FORMAT_DATE);
		List<Book> books = this.bookRepository.customFind(firstDate, lastDate, Integer.parseInt(idStore), session);
		long totalPayment = this.bookRepository.totalPaymentByDate(firstDate, lastDate, Integer.parseInt(idStore), session);
		map.put("status_p", "success");
		map.put("total_payment", totalPayment);
		map.put("performance_employee", books);
		String json = new Gson().toJson(map);
		return json;
	}
	
	@RequestMapping(value="info-employee", produces = "text/html; charset=UTF-8")
	@Transactional
	@ResponseBody
	private String infoEmployee(@RequestBody PayloadAuthen payload) {
		Map<String, Object> map = new HashMap<>();
		Session session = factory.openSession();
		String status = "failed";
		Staff staff = this.staffRepository.findById(payload.getAccountId(), session);
		if (staff != null) {
			map.put("employee", staff);
			status = "success";
		}
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	private List<Map<String, Integer>> generateArrCustomer(List<Customer> customers) {
		List<Map<String, Integer>> list = new ArrayList<>();
		int count = 0;
		
		for (Customer customer : customers) {
			count++;
		}
		Map<String, Integer> map = new HashMap<>();
		map.put("count", count);
		list.add(map);
		return list;
	}
}
