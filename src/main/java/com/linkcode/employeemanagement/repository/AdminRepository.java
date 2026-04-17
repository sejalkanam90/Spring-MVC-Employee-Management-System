package com.linkcode.employeemanagement.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.linkcode.employeemanagement.pojo.Admin;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

@Repository
public class AdminRepository {
	
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
	}

	// Add Admin (Signup)
	public Admin addAdmin(String username, String email, String password) {
		openConnection();
		transaction.begin();
		
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setEmail(email);
		admin.setPassword(password);
		
		manager.persist(admin);
		
		transaction.commit();
		closeConnection();
		return admin;
	}
	
	// Find Admin by Username and Password
	public Admin findAdmin(String user, String pass) {
		openConnection();
		transaction.begin();
		
		
		String jpql = "FROM Admin WHERE username = :username AND password = :password";
		TypedQuery<Admin> query = manager.createQuery(jpql, Admin.class);
		query.setParameter("username", user);
		query.setParameter("password", pass);
		
		List<Admin> adminList = query.getResultList();
		
		Admin result = null;
		if (adminList != null && !adminList.isEmpty()) {
			result = adminList.get(0);
		}
		
		transaction.commit();  
		closeConnection();
		return result;
	}
	
	// Find Admin by Email and Password (Login)
	public Admin findByEmailAndPassword(String email, String password) {
		openConnection();
		
		String jpql = "SELECT a FROM Admin a WHERE a.email = :email AND a.password = :password";
		TypedQuery<Admin> query = manager.createQuery(jpql, Admin.class);
		query.setParameter("email", email);
		query.setParameter("password", password);
		
		List<Admin> result = query.getResultList();
		closeConnection();
		
		return result.isEmpty() ? null : result.get(0);
	}
}


