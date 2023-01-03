package main.controller;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

@RequestMapping("service")
@Controller
public class ServiceController {
	@Autowired
	SessionFactory factory;
	
	private TypeServiceRepository typeServiceRepository = TypeServiceRepository.getInstance();
	private ServiceRepository serviceRepository = ServiceRepository.getInstance();
	private StaffRepository staffRepository = StaffRepository.getInstance();
	private StaffServiceRepository staffServiceRepository = StaffServiceRepository.getInstance();
	@RequestMapping("")
	@Transactional
	String render(ModelMap model, HttpServletRequest request) {
		Session session = factory.openSession();
		String idStore = request.getParameter("idStore");
		if (idStore != null) {
			List<TypeService> categories = this.typeServiceRepository.find("", session);
			List<Service> services = this.serviceRepository.findServicesActive("", session);
			List<Staff> staffs = this.staffRepository.findStaffActive("and typeStaff = 1 and idStore = " + idStore, session);
			List<StaffService> staffServices = this.staffServiceRepository.find("", session);
			model.addAttribute("layout", "staff/service.jsp");
			model.addAttribute("categories", categories);
			model.addAttribute("services", services);
			model.addAttribute("staffs", staffs);
			model.addAttribute("staffServices", staffServices);
			model.addAttribute("idStore", idStore);
			model.addAttribute("totalService", services.size());
			model.addAttribute("totalCategory", categories.size());
			
			String rawStaffs = Helper.parseRawDataToJson(staffs);
			String rawStaffServices = Helper.parseRawDataToJson(staffServices);
			String rawCategories = Helper.parseRawDataToJson(categories);
			String rawServices = Helper.parseRawDataToJson(services);
			model.addAttribute("rawStaffs", rawStaffs);
			model.addAttribute("rawStaffServices", rawStaffServices	);
			model.addAttribute("rawCategories", rawCategories);
			model.addAttribute("rawServices", rawServices);
		}
		return "";
	}
	
	@RequestMapping(value = "/create-category", method = RequestMethod.POST)
	@ResponseBody
	private String createCategory(@RequestBody TypeService typeService) {
		Map<String, Object> map = new HashMap<>();
		Session session = factory.openSession();
		String status = "failed";
		int maxId = this.typeServiceRepository.maxIdType(session);
		typeService.setIdTypeService(maxId + 1);
		Boolean isSave = this.typeServiceRepository.save(typeService, session);
		if (isSave) {
			status = "success";
		}
		
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	@RequestMapping(value = "/edit-category", method = RequestMethod.POST)
	@ResponseBody
	private String editCategory(@RequestBody TypeService typeService) {
		Map<String, Object> map = new HashMap<>();
		Session session = factory.openSession();
		String status = "failed";
		List<TypeService> originTS = this.typeServiceRepository.find("WHERE idTypeService = " + typeService.getIdTypeService(), session);
		if (originTS.size() > 0) {
			originTS.get(0).setDescription(typeService.getDescription());
			originTS.get(0).setNameType(typeService.getNameType());
			Boolean isUpdate = this.typeServiceRepository.update(originTS.get(0), session);
			if (isUpdate) {
				status = "success";
			}
		}
		
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	@RequestMapping(value = "/delete-category", method = RequestMethod.POST)
	@ResponseBody
	private String deleteCategory(@RequestBody TypeService typeService) {
		Map<String, Object> map = new HashMap<>();
		Session session = factory.openSession();
		String status = "failed";
		Query query1 = session.createQuery("UPDATE Service SET typeService = 1 WHERE typeService = " + typeService.getIdTypeService());
		Query query2 = session.createQuery("update TypeService t SET amount = (SELECT Count(idService) FROM Service s WHERE s.typeService = t.idTypeService)");
		query1.executeUpdate();
		query2.executeUpdate();
		List<TypeService> originTS = this.typeServiceRepository.find("WHERE idTypeService = " + typeService.getIdTypeService(), session);
		if (originTS.size() > 0) {
			Boolean isUpdate = this.typeServiceRepository.delete(originTS.get(0), session);
			if (isUpdate) {
				status = "success";
			}
		}
		
		map.put("status", status);
		String json = new Gson().toJson(map);
		return json;
	}
	
	@RequestMapping(value = "/add-service", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	private void addService(ModelMap model, @RequestParam("file") MultipartFile photo,
							  HttpServletRequest request, HttpServletResponse response) {
		Session session = factory.openSession();
		String nameImage = String.valueOf(new Date().getTime()) + ".jpg";
		int lastId = this.serviceRepository.maxId(session) + 1;
		Helper.uploadImage(photo, nameImage);
		String nameService = request.getParameter("name_service");
		String description = request.getParameter("description_service");
		String category = request.getParameter("category_name");
		String price = request.getParameter("price_service").replace("$", "");
		String[] arrEmployee = request.getParameter("arrEmployee").split(",");
		String pathImg = Constants.BASE_URL_IMAGES.replace("${baseUrl}", Helper.getRootDomain(request)) + nameImage;
		Service service = new Service(lastId, Integer.parseInt(category), nameService, description, 
				Integer.parseInt(price), Constants.STATUS_SERVICE_ACTIVE, pathImg);
		Boolean isSave = this.serviceRepository.save(service, session);
		if (isSave) {
			List<StaffService> staffServices = new ArrayList<>();
			for (String idEmployee : arrEmployee) {
				StaffService staffService = new StaffService(idEmployee, lastId);
				this.staffServiceRepository.save(staffService, session);
			}
			this.typeServiceRepository.updateAmount(session);
		}
		try {
			String referer = request.getHeader("Referer");
			response.sendRedirect(referer);
		} catch (Exception e) {
			
		}
	}
	
	@RequestMapping(value = "/edit-service-without-img", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	private void editServiceWithoutImg(ModelMap model,
							  HttpServletRequest request, HttpServletResponse response) {
		Session session = factory.openSession();
		String nameService = request.getParameter("name_service");
		String description = request.getParameter("description_service");
		int category = Integer.parseInt(request.getParameter("category_name"));
		int price = Integer.parseInt(request.getParameter("price_service").replace("$", ""));
		String[] arrEmployee = request.getParameter("arrEmployee").split(",");
		int idService = Integer.parseInt(request.getParameter("idServiceNew"));
		Service service = this.serviceRepository.findById(idService, session);
		if (service != null) {
			service.setNameService(nameService);
			service.setDescription(description);
			service.setTypeService(category);
			service.setPrice(price);
			Boolean isUpdate = this.serviceRepository.update(service, session);
			if (isUpdate) {
				this.staffServiceRepository.deleteByIdService(idService, session);
				for (String idEmployee : arrEmployee) {
					StaffService staffService = new StaffService(idEmployee, idService);
					this.staffServiceRepository.save(staffService, session);
				}
				this.typeServiceRepository.updateAmount(session);
			}
		}
		try {
			String referer = request.getHeader("Referer");
			response.sendRedirect(referer);
		} catch (Exception e) {
			
		}
	}
	
	@RequestMapping(value = "/edit-service", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	private void editService(ModelMap model, @RequestParam("file") MultipartFile photo,
							  HttpServletRequest request, HttpServletResponse response) {
		Session session = factory.openSession();
		String nameService = request.getParameter("name_service");
		String description = request.getParameter("description_service");
		int category = Integer.parseInt(request.getParameter("category_name"));
		int price = Integer.parseInt(request.getParameter("price_service").replace("$", ""));
		String[] arrEmployee = request.getParameter("arrEmployee").split(",");
		int idService = Integer.parseInt(request.getParameter("idServiceNew"));
		Service service = this.serviceRepository.findById(idService, session);
		String nameImage = String.valueOf(new Date().getTime()) + ".jpg";
		String pathImg = Constants.BASE_URL_IMAGES.replace("${baseUrl}", Helper.getRootDomain(request)) + nameImage;
		updateImage(service.getPathImg(), photo, nameImage);
		if (service != null) {
			service.setNameService(nameService);
			service.setDescription(description);
			service.setTypeService(category);
			service.setPrice(price);
			service.setPathImg(pathImg);
			Boolean isUpdate = this.serviceRepository.update(service, session);
			if (isUpdate) {
				this.staffServiceRepository.deleteByIdService(idService, session);
				for (String idEmployee : arrEmployee) {
					StaffService staffService = new StaffService(idEmployee, idService);
					this.staffServiceRepository.save(staffService, session);
				}
				this.typeServiceRepository.updateAmount(session);
			}
		}
		try {
			String referer = request.getHeader("Referer");
			response.sendRedirect(referer);
		} catch (Exception e) {
			
		}
	}
	
	private void updateImage(String pathImgOld, MultipartFile photo, String newName) {
		String[] pathSplit = pathImgOld.split("/");
		String oldName = pathSplit[pathSplit.length - 1];
		File oldFile = new File(Constants.ORIGIN_PATH_IMAGES + oldName);
		oldFile.delete();
		Helper.uploadImage(photo, newName);
	}
	
}
