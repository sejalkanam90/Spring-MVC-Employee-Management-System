package com.linkcode.employeemanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linkcode.employeemanagement.pojo.Employee;
import com.linkcode.employeemanagement.repository.EmployeeRepository;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeRepository repository;

	public Employee addEmployee(String name, String email, String des, long contact, double sal) {

		return repository.addEmployee(name, email, des, contact, sal);
	}

	public Employee searchEmployee(int id) {
		return repository.searchEmployee(id);

	}

	public List<Employee> getAllEmployees() {
		return repository.getAllEmployees();
	}

	public Employee removeEmployee(int id) {
		return repository.removeEmployee(id);

	}

	public Employee updateEmployee(int id, String name, String email, String des, long contact, double sal) {
		return repository.updateEmployee(id, name, email, des, contact, sal);
	}

}