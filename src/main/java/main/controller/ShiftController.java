package main.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import main.entity.BillSalary;
import main.entity.PayloadAuthen;
import main.entity.RegisShift;
import main.entity.Service;
import main.entity.Staff;
import main.entity.StaffService;
import main.entity.TypeStaff;
import main.implementation.BillSalaryRepository;
import main.implementation.RegisShiftRepository;
import main.implementation.StaffRepository;
import main.implementation.StoreRepository;
import main.implementation.TypeStaffRepository;
import main.util.Constants;
import main.util.Helper;

@Controller
@RequestMapping("shift")
public class ShiftController {

	@Autowired
	SessionFactory factory;
	
	private RegisShiftRepository regisShiftRepository = RegisShiftRepository.getInstance();
	private StaffRepository staffRepository = StaffRepository.getInstance();
	private StoreRepository storeRepository = StoreRepository.getInstance();
	private TypeStaffRepository typeStaffRepository = TypeStaffRepository.getInstance();
	private BillSalaryRepository billSalaryRepository = BillSalaryRepository.getInstance();
	
	@RequestMapping(value="", produces = "text/html; charset=UTF-8")
	@Transactional
	String render(ModelMap model, HttpServletRequest request) {
		Session session = factory.openSession();
		String idStore = request.getParameter("idStore");
		List<RegisShift> regisShift = this.regisShiftRepository.
				find("WHERE idStore = " + idStore, session);
		List<Staff> employeesActive = this.staffRepository.findStaffActive("", session);
		List<TypeStaff> typeStaffs = this.typeStaffRepository.find("", session);


		model.addAttribute("idStore", idStore);
		model.addAttribute("layout", "staff/shift.jsp");
		
		String rawStaffs = Helper.parseRawDataToJson(employeesActive);
		String rawRegisShifts = Helper.parseRawDataToJson(regisShift);
		String rawTypeStaffs = Helper.parseRawDataToJson(typeStaffs);
		model.addAttribute("rawStaffs", rawStaffs);
		model.addAttribute("rawTypeStaffs", rawTypeStaffs);
		model.addAttribute("rawRegisShifts", rawRegisShifts);
		
		return "";
	}
	
	@RequestMapping(value="update-done-work", produces = "text/html; charset=UTF-8")
	@Transactional
	@ResponseBody
	String updateDoneWork(ModelMap model, @RequestBody PayloadAuthen payload) {
		Session session = factory.openSession();
		String status = "failed";
		String date = payload.getArrDate();
		String idStaff = payload.getAccountId();
		Date dateQuery = Helper.convertStringToDate(date, Constants.FORMAT_DATE);
		RegisShift regisShift = this.regisShiftRepository.findByDateAndIdStaff(dateQuery, idStaff, session);
		if (regisShift != null) {
			regisShift.setStatusRegis(Constants.STATUS_DONE_SHIFT);
			Boolean isUpdate = this.regisShiftRepository.update(regisShift, session);
			if (isUpdate) {
				status = "success";
			}
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	@RequestMapping(value="create-invoice", produces = "text/html; charset=UTF-8")
	@Transactional
	@ResponseBody
	String createInvoice(ModelMap model, @RequestBody PayloadAuthen payload) {
		Session session = factory.openSession();
		String status = "failed";
		String idBill = payload.getIdBill();
		int payment = payload.getPayment();
		String idStaff = payload.getAccountId();
		int amountDay = payload.getAmountDay();
		String monthPay = payload.getMonthPay();
		String firstDate = payload.getFirstDate();
		String lastDate = payload.getLastDate();
		
		
		BillSalary billSalary = new BillSalary(idBill, monthPay, idStaff, Constants.STATUS_DONE_BILL, amountDay, payment, new Date());
		
		Boolean isSave = this.billSalaryRepository.save(billSalary, session);
		if (isSave) {
			String hql = "UPDATE RegisShift SET statusRegis=? WHERE statusRegis=? AND idStaff=? AND dateRegis between ? and ?";
			
			Query query = session.createQuery(hql)
					.setParameter(0, Constants.STATUS_DONE_BILL)
					.setParameter(1, Constants.STATUS_DONE_SHIFT)
					.setParameter(2, idStaff)
					.setParameter(3, Helper.convertStringToDate(firstDate, Constants.FORMAT_DATE))
					.setParameter(4, Helper.convertStringToDate(lastDate, Constants.FORMAT_DATE));
			int update = query.executeUpdate();
			if (update > 0) {
				status = "success";				
			}
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
}
