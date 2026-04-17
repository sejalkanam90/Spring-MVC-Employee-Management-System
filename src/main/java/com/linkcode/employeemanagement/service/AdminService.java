package com.linkcode.employeemanagement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linkcode.employeemanagement.pojo.Admin;
import com.linkcode.employeemanagement.repository.AdminRepository;

@Service
public class AdminService {

    @Autowired
    private AdminRepository repository;

    // Add Admin (Signup)
    public Admin addAdmin(String username, String email, String password) {
        return repository.addAdmin(username, email, password);
    }
    
    // Login Validation
    public Admin login(String email, String password) {
        return repository.findByEmailAndPassword(email, password);
    }
}
