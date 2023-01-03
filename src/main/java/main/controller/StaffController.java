package main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import main.util.Constants;
import main.util.Helper;

@Controller
public class StaffController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("login")
	@Transactional
	String login(ModelMap model, HttpServletRequest request) {
		model.addAttribute("layout", "staff/login.jsp");
		return "";
	}
	
	@RequestMapping("")
	@Transactional
	String index(ModelMap model, HttpServletRequest request) {
		model.addAttribute("layout", "staff/login.jsp");
		return "";
	}
	
	@RequestMapping("page-err")
	@Transactional
	String renderError(ModelMap model, HttpServletRequest request) {
		model.addAttribute("layout", "pageNotFound.jsp");
		return "";
	}
}
