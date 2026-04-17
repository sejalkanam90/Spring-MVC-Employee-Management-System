package com.linkcode.employeemanagement.repository;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.linkcode.employeemanagement.pojo.Employee;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

@Repository
public class EmployeeRepository {

	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;

	// Open database connection
	public static void openConnection() {
		factory = Persistence.createEntityManagerFactory("employeemanagement");
		manager = factory.createEntityManager();
		transaction = manager.getTransaction();
	}

	// Close database connection
	public static void closeConnection() {
		if (factory != null) {
			factory.close();
		}
		if (manager != null) {
			manager.close();
		}
		if (transaction.isActive()) {
			transaction.rollback();
		}
	}

	// Add new employee to database
	public Employee addEmployee(String name, String email, String des, long contact, double sal) {
		openConnection();
		transaction.begin();

		Employee emp = new Employee();
		emp.setName(name);
		emp.setEmail(email);
		emp.setDesignation(des);
		emp.setContact(contact);
		emp.setSalary(sal);

		manager.persist(emp);
		transaction.commit();
		closeConnection();
		System.out.println("Employee added");
		return emp;
	}

	// Search employee by ID
	public Employee searchEmployee(int id) {
		openConnection();
		transaction.begin();

		Employee emp = manager.find(Employee.class, id);

		transaction.commit();
		closeConnection();
		return emp;
	}

	// Get all employees list
	public List<Employee> getAllEmployees() {
		openConnection();
		transaction.begin();

		// JPQL query
		String jpql = "from Employee";
		Query query = manager.createQuery(jpql);
		List<Employee> emps = query.getResultList();
		transaction.commit();
		closeConnection();
		return emps;
	}

	// Remove employee by ID
	public Employee removeEmployee(int id) {
		openConnection();
		transaction.begin();

		Employee emp = manager.find(Employee.class, id);
		if (emp != null) {
			manager.remove(emp);
		}

		transaction.commit();
		closeConnection();
		return emp;
	}

	//Update employee by id

	public Employee updateEmployee(int id, String name, String email, String des, long contact, double sal) {
		openConnection();
		transaction.begin();

		Employee emp = manager.find(Employee.class, id);
		if (emp != null) {
			emp.setName(name);
			emp.setEmail(email);
			emp.setDesignation(des);
			emp.setContact(contact);
			emp.setSalary(sal);
			manager.merge(emp);
		}

		transaction.commit();
		closeConnection();
		System.out.println("Employee updated with ID: " + id);
		return emp;
	}
}
