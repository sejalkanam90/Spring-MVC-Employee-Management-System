🏢 Employee Management System
📌 Project Overview
The Employee Management System is a web application developed using Spring MVC, JSP, Hibernate (JPA), and MySQL. It provides full employee record management with CRUD operations, secure admin authentication, and a responsive UI.

🚀 Key Features
Employee Management
➕ Create Employee
🔍 Search Employee (by ID)
✏️ Update Employee
🗑️ Delete Employee
📋 View All Employees
System Features
🔐 Admin Authentication (Login & Signup)
🌙 Dark Mode
📱 Responsive UI
⚡ Loading Effects
✅ Form Validation
🛠️ Technology Stack
Layer	Technology	Version
Backend	Spring MVC	6.x
ORM	Hibernate (JPA)	6.5.x
View	JSP / JSTL	3.x
Database	MySQL	8.x
Frontend	Bootstrap	5.3
Icons	Font Awesome	6.4
Language	Java	17
Server	Apache Tomcat	10.1
Build Tool	Maven	3.9+
📋 Prerequisites
Java JDK 17+
Apache Tomcat 10.1+
MySQL 8.0+
Eclipse / STS
Maven 3.9+
Git
⚙️ Installation Guide
1. Clone Repository
git clone https://github.com/sejalkanam90/Spring-MVC-Employee-Management-System.git


2. Create Database
sql
CREATE DATABASE employeemanagement;


3. Configure Database
Update persistence.xml:
xml
<property name="jakarta.persistence.jdbc.user" value="root"/>
<property name="jakarta.persistence.jdbc.password" value="your_password"/>

4. Import Project
text
File → Import → Maven → Existing Maven Projects → Finish

5. Update Maven
text
Right Click Project → Maven → Update Project → OK

6. Run on Server
text
Right Click → Run As → Run on Server → Apache Tomcat 10


🔗 Access URLs
Page	URL
Login	http://localhost:8082/EmployeeManagementSystem/login
Signup	http://localhost:8082/EmployeeManagementSystem/signup
Dashboard	http://localhost:8082/EmployeeManagementSystem/home
Add Employee	http://localhost:8082/EmployeeManagementSystem/add
Search	http://localhost:8082/EmployeeManagementSystem/search
Update	http://localhost:8082/EmployeeManagementSystem/update
Remove	http://localhost:8082/EmployeeManagementSystem/remove


📁 Project Structure

EmployeeManagementSystem/
├── src/main/java/com/linkcode/employeemanagement/
│   ├── controller/
│   ├── service/
│   ├── repository/
│   └── pojo/
├── src/main/resources/META-INF/
│   └── persistence.xml
├── src/main/webapp/WEB-INF/
│   ├── views/
│   ├── web.xml
│   └── dispatcher-servlet.xml
└── pom.xml





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

### API Endpoints

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

**Sejal Kanam**

GitHub: https://github.com/sejalkanam90

---

## 📄 License

This project is for educational purposes only.
