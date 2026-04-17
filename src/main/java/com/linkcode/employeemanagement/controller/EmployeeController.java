package com.linkcode.employeemanagement.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.linkcode.employeemanagement.pojo.Admin;
import com.linkcode.employeemanagement.pojo.Employee;
import com.linkcode.employeemanagement.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService service;

	// ==================== HOME PAGE ====================
	@GetMapping("/home")
	public String home(@SessionAttribute(value = "login", required = false) Admin admin) {
		if (admin != null) {
			return "Home";
		}
		return "redirect:/login";
	}

	// ==================== ADD EMPLOYEE ====================
	@GetMapping("/add")
	public String add(@SessionAttribute(value = "login", required = false) Admin admin) {
		if (admin == null) {
			return "redirect:/login";
		}
		return "Add";
	}

	@PostMapping("/add")
	public String addEmployee(@RequestParam("name") String name,
	                          @RequestParam("email") String email,
	                          @RequestParam("designation") String des,
	                          @RequestParam("contact") long contact,
	                          @RequestParam("salary") double sal,
	                          ModelMap map,
	                          @SessionAttribute(value = "login", required = false) Admin admin) {

		if (admin == null) {
			return "redirect:/login";
		}

		Employee emp = service.addEmployee(name, email, des, contact, sal);

		if (emp != null) {
			map.addAttribute("msg", "Employee Added Successfully");
		} else {
			map.addAttribute("msg", "Employee not added");
		}
		return "Add";
	}

	// ==================== SEARCH ====================
	@GetMapping("/search")
	public String search(@SessionAttribute(value = "login", required = false) Admin admin) {
		if (admin == null) return "redirect:/login";
		return "Search";
	}

	@PostMapping("/search")
	public String searchEmployee(@RequestParam("id") int id,
	                             ModelMap map,
	                             @SessionAttribute(value = "login", required = false) Admin admin) {

		if (admin == null) return "redirect:/login";

		Employee emp = service.searchEmployee(id);

		if (emp != null) {
			map.addAttribute("msg", "Record Found");
			map.addAttribute("emp", emp);
		} else {
			map.addAttribute("msg", "Record not Found");
		}
		return "Search";
	}

	// ==================== REMOVE ====================
	@GetMapping("/remove")
	public String remove(ModelMap map,
	                     @SessionAttribute(value = "login", required = false) Admin admin) {

		if (admin == null) return "redirect:/login";

		List<Employee> emps = service.getAllEmployees();
		map.addAttribute("emps", emps);

		return "Remove";
	}

	@PostMapping("/remove")
	public String removeEmployee(@RequestParam("id") int id,
	                              ModelMap map,
	                              @SessionAttribute(value = "login", required = false) Admin admin) {

		if (admin == null) return "redirect:/login";

		Employee emp = service.removeEmployee(id);

		if (emp != null) {
			map.addAttribute("msg", "Employee Removed Successfully!");
		} else {
			map.addAttribute("msg", "Employee Not Found!");
		}

		map.addAttribute("emps", service.getAllEmployees());

		return "Remove";
	}

	// ==================== UPDATE ====================
	@GetMapping("/update")
	public String update(ModelMap map,
	                     @SessionAttribute(value = "login", required = false) Admin admin) {

		if (admin == null) return "redirect:/login";

		map.addAttribute("emps", service.getAllEmployees());
		return "Update";
	}

	@PostMapping("/update")
	public String searchForUpdate(@RequestParam("id") int id,
	                              ModelMap map,
	                              @SessionAttribute(value = "login", required = false) Admin admin) {

		if (admin == null) return "redirect:/login";

		Employee emp = service.searchEmployee(id);
		map.addAttribute("emps", service.getAllEmployees());

		if (emp != null) {
			map.addAttribute("employee", emp);
			map.addAttribute("msg", "Employee Found!");
		} else {
			map.addAttribute("msg", "Employee Not Found!");
		}
		return "Update";
	}

	@PostMapping("/updateEmployee")
	public String updateEmployee(@RequestParam("id") int id,
	                              @RequestParam("name") String name,
	                              @RequestParam("email") String email,
	                              @RequestParam("designation") String des,
	                              @RequestParam("contact") long contact,
	                              @RequestParam("salary") double sal,
	                              ModelMap map,
	                              @SessionAttribute(value = "login", required = false) Admin admin) {

		if (admin == null) return "redirect:/login";

		Employee emp = service.updateEmployee(id, name, email, des, contact, sal);

		if (emp != null) {
			map.addAttribute("msg", "Employee Updated Successfully!");
		} else {
			map.addAttribute("msg", "Employee Not Found!");
		}

		map.addAttribute("emps", service.getAllEmployees());

		return "Update";
	}
}


