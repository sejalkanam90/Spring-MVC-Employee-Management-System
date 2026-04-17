package com.linkcode.employeemanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.linkcode.employeemanagement.pojo.Admin;
import com.linkcode.employeemanagement.service.AdminService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminService service;

    // ==================== SIGNUP PAGE ====================
    @GetMapping("/signup")
    public String signup() {
        return "SignUp";
    }

    // ==================== CREATE ACCOUNT ====================
    @PostMapping("/signup")
    public String createAccount(@RequestParam("username") String username,
                               @RequestParam("email") String email,
                               @RequestParam("password") String password,
                               ModelMap map) {

        Admin admin = service.addAdmin(username, email, password);

        if (admin != null) {
            map.addAttribute("msg", "Account created successfully! Please login.");
        } else {
            map.addAttribute("msg", "Registration failed! Please try again.");
        }

        return "SignUp";
    }

    // ==================== LOGIN PAGE ====================
    @GetMapping("/login")
    public String showLogin(HttpSession session) {

        Admin admin = (Admin) session.getAttribute("login");

        if (admin != null) {
            return "redirect:/home"; // already logged in
        }

        return "Login";
    }

    // ==================== LOGIN ====================
    @PostMapping("/login")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        ModelMap map,
                        HttpSession session) {

        Admin admin = service.login(email, password);

        if (admin != null) {
            session.setAttribute("login", admin);
            session.setMaxInactiveInterval(1800); 
            return "redirect:/home";
        } else {
            map.addAttribute("msg", "Invalid email or password!");
            return "Login";
        }
    }

    // ==================== LOGOUT ====================
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}


