package com.cdgn.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cdgn.model.Employee;
import com.cdgn.service.EmployeeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService service;
	@RequestMapping("/save")
	public ModelAndView saveEmployee(@ModelAttribute Employee employee) {
		Employee emp = service.saveEmployee(employee);
		ModelAndView mav = new ModelAndView("register.jsp");
		if(emp!=null) {
			mav.addObject("status","employee registered successfully");
		}
		else {
			mav.addObject("satus","employee failed to register");
		}
		return mav;
	}
	@RequestMapping("/emplogin")
	public ModelAndView checkLogin(@RequestParam String email,@RequestParam String password,HttpSession session) {
		boolean available = service.checkLogin(email,password);
		ModelAndView mav ;
		if(email.equals("admin@codegnan.com")&&password.equals("admin")) {
			mav = new ModelAndView("admin.jsp");
			session.setAttribute("email", email);
		}
		else {
			if(available) {
				mav = new ModelAndView("employee.jsp");
				session.setAttribute("email",email);
			}
			else {
				mav = new ModelAndView("login.jsp");
				mav.addObject("status","Invalid credentials");
			}
		}
		return mav;
	}
	@RequestMapping("/findAll")
	public ModelAndView getAllEmployees() {
		List<Employee> empList = service.getAllEmployees();
		ModelAndView mav = new ModelAndView("viewemps.jsp");
		mav.addObject("empList",empList);
		return mav;
	}
	@RequestMapping("/search")
	public ModelAndView getByEmail(@RequestParam String email) {
		Employee employee = service.findByEmail(email);
		ModelAndView mav;
		if(employee != null) {
			 mav = new ModelAndView("viewemp.jsp");
			mav.addObject("employee",employee);
		}
		else {
			 mav = new ModelAndView("search.jsp");
			mav.addObject("status","Invalid Id");
		}
		return mav;
	}
	@RequestMapping("/delete")
	public ModelAndView getById(@RequestParam int id) {
		 service.getById(id);
		 ModelAndView mav = new ModelAndView("findAll");
		return mav;
	}
	@RequestMapping("/edit")
	public ModelAndView editById(@ModelAttribute Employee employee) {
		service.saveEmployee(employee);
		ModelAndView mav = new ModelAndView("findAll");
		return mav;
	}
	@RequestMapping("/emplogout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView("login.jsp");
		return mav;
	}
	@RequestMapping("/view")
	public ModelAndView viewByEmail(@RequestParam String email){
	Employee employee	= service.findByEmail(email);
	ModelAndView mav = new ModelAndView("viewprofile.jsp");
	mav.addObject("employee",employee);
	return mav;
		
	}
}
