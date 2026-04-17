# 🏢 Employee Management System

A complete web application for managing employee records built with **Spring MVC**, **JSP**, **Hibernate (JPA)**, and **MySQL**.

---

## 📌 Features

### Employee Management
- ➕ Add Employee
- 🔍 Search Employee by ID
- ✏️ Update Employee Details
- 🗑️ Remove Employee
- 📋 View All Employees

### System Features
- 🔐 Admin Login / Signup
- 🌙 Dark Mode Toggle
- 📱 Responsive Design
- ⚡ Loading Effects
- ✅ Form Validation

---

## 🛠️ Technology Stack

| Technology | Version |
|------------|---------|
| Spring MVC | 6.x |
| JSP | 3.x |
| Hibernate (JPA) | 6.5.x |
| MySQL | 8.x |
| Bootstrap | 5.3 |
| Java | 17 |
| Tomcat | 10.1 |
| Maven | 3.9+ |

---

## 📋 Prerequisites

- Java JDK 17+
- Apache Tomcat 10.1+
- MySQL 8.0+
- Eclipse / STS
- Maven

---

## ⚙️ Installation Guide

### 1. Clone Repository

git clone https://github.com/sejalkanam90/Spring-MVC-Employee-Management-System.git



2. Create Database
CREATE DATABASE employeemanagement;

4. Configure Database
Update persistence.xml:

xml
<property name="jakarta.persistence.jdbc.user" value="root"/>
<property name="jakarta.persistence.jdbc.password" value="your_password"/>

4. Import Project
File → Import → Maven → Existing Maven Projects → Finish

6. Run on Server
Right Click → Run As → Run on Server → Tomcat 10

🔗 Access URLs
Page	URL
Login	/login
Signup	/signup
Home	/home
Add Employee	/add
Search	/search
Update	/update
Remove	/remove

📁 Project Structure

EmployeeManagementSystem/
├── controller/     # Request handlers
├── service/        # Business logic
├── repository/     # Database operations
└── pojo/          # Entity classes


🗄️ Database Schema
Employee Table
Column	Type	Constraints
id	INT	PRIMARY KEY
name	VARCHAR	NOT NULL
email	VARCHAR	UNIQUE
designation	VARCHAR	-
contact	BIGINT	-
salary	DOUBLE	-

Admin Table
Column	Type	Constraints
id	INT	PRIMARY KEY
username	VARCHAR	NOT NULL
email	VARCHAR	UNIQUE
password	VARCHAR	NOT NULL

👨‍💻 Author
Sejal Kanam

GitHub: sejalkanam90

📄 License
Educational Purpose Only


