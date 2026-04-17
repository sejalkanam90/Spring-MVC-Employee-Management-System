# 🏢 Employee Management System

[![Java](https://img.shields.io/badge/Java-17-blue.svg)](https://www.java.com/)
[![Spring](https://img.shields.io/badge/Spring%20MVC-6.x-brightgreen.svg)](https://spring.io/)
[![Hibernate](https://img.shields.io/badge/Hibernate-6.5-orange.svg)](https://hibernate.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-blue.svg)](https://mysql.com/)
[![License](https://img.shields.io/badge/License-Educational-yellow.svg)](LICENSE)

## 📖 Overview

The **Employee Management System** is a feature-rich web application built with **Spring MVC**, **JSP**, **Hibernate (JPA)**, and **MySQL**. It provides complete CRUD operations for managing employee records with a modern, responsive user interface.

---

## ✨ Features

| Category | Features |
|----------|----------|
| **Employee Management** | Add, Search, Update, Delete, View All Employees |
| **Authentication** | Admin Login & Signup |
| **UI/UX** | Dark Mode, Responsive Design, Loading Effects |
| **Security** | Form Validation, SQL Injection Protection |

---

## 🛠️ Technology Stack

| Layer | Technology | Version |
|-------|------------|---------|
| Backend Framework | Spring MVC | 6.x |
| ORM | Hibernate (JPA) | 6.5.x |
| View Layer | JSP / JSTL | 3.x |
| Database | MySQL | 8.x |
| Frontend | Bootstrap | 5.3 |
| Icons | Font Awesome | 6.4 |
| Language | Java | 17 |
| Server | Apache Tomcat | 10.1 |
| Build Tool | Maven | 3.9+ |

---

## 📋 Prerequisites

| Software | Version |
|----------|---------|
| Java JDK | 17+ |
| Apache Tomcat | 10.1+ |
| MySQL Server | 8.0+ |
| Eclipse / STS | Latest |
| Maven | 3.9+ |
| Git | Latest |

---

## ⚙️ Installation Guide

| Step | Action |
|------|--------|
| 1 | `git clone https://github.com/sejalkanam90/Spring-MVC-Employee-Management-System.git` |
| 2 | `CREATE DATABASE employeemanagement;` |
| 3 | Update `persistence.xml` with your database password |
| 4 | Import as Maven Project in Eclipse |
| 5 | Run on Tomcat 10 Server |

---

## 🔗 Access URLs

| Page | URL |
|------|-----|
| Login | `/login` |
| Signup | `/signup` |
| Dashboard | `/home` |
| Add Employee | `/add` |
| Search Employee | `/search` |
| Update Employee | `/update` |
| Remove Employee | `/remove` |

---

## 📁 Project Structure

| Directory | Contents |
|-----------|----------|
| `controller/` | EmployeeController, AdminController |
| `service/` | EmployeeService, AdminService |
| `repository/` | EmployeeRepository, AdminRepository |
| `pojo/` | Employee, Admin (Entity Classes) |
| `views/` | All JSP files |
| `resources/META-INF/` | persistence.xml |

---

## 🗄️ Database Schema

### Employee Table

| Column | Type | Constraints |
|--------|------|-------------|
| id | INT | PRIMARY KEY, AUTO_INCREMENT |
| name | VARCHAR(100) | NOT NULL |
| email | VARCHAR(100) | NOT NULL, UNIQUE |
| designation | VARCHAR(100) | - |
| contact | BIGINT | - |
| salary | DOUBLE | - |

### Admin Table

| Column | Type | Constraints |
|--------|------|-------------|
| id | INT | PRIMARY KEY, AUTO_INCREMENT |
| username | VARCHAR(50) | NOT NULL |
| email | VARCHAR(100) | NOT NULL, UNIQUE |
| password | VARCHAR(255) | NOT NULL |

---

## 🔧 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/login` | Show login page |
| POST | `/login` | Authenticate admin |
| GET | `/signup` | Show signup page |
| POST | `/signup` | Register admin |
| GET | `/home` | Dashboard |
| POST | `/add` | Add employee |
| POST | `/search` | Search employee |
| POST | `/update` | Update employee |
| POST | `/remove` | Delete employee |

---

## 👨‍💻 Author

| Name | GitHub |
|------|--------|
| **Sejal Kanam** | [sejalkanam90](https://github.com/sejalkanam90) |

---

## 📄 License

This project is for **educational purposes only**.

