<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.linkcode.employeemanagement.pojo.Employee"%>
<%@ page import="java.util.List"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Employee - EMS</title>

<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Inter', sans-serif;
	background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
	min-height: 100vh;
	padding-top: 80px;
}

/* Dark Mode */
body.dark-mode {
	background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
	color: #e2e8f0;
}

body.dark-mode .container {
	background: #1e293b;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}

body.dark-mode h2, body.dark-mode h3 {
	color: #60a5fa;
}

body.dark-mode .search-section, body.dark-mode .card {
	background: #0f172a;
	border-color: #334155;
}

body.dark-mode .form-group label {
	color: #cbd5e1;
}

body.dark-mode .form-group input {
	background: #334155;
	border-color: #475569;
	color: white;
}

body.dark-mode .form-group input:focus {
	border-color: #60a5fa;
}

body.dark-mode .message.success {
	background: #064e3b;
	color: #86efac;
}

body.dark-mode .message.error {
	background: #7f1d1d;
	color: #fca5a5;
}

body.dark-mode .search-section {
	background: #0f172a;
	border-color: #334155;
}

body.dark-mode table th {
	background: #1e40af;
	color: white;
}

body.dark-mode table td {
	background: #1e293b;
	color: #e2e8f0;
	border-bottom-color: #334155;
}

body.dark-mode table tr:hover td {
	background: #334155;
}

/* Container */
.container {
	max-width: 1200px;
	margin: 0px auto;
	padding: 30px;
	background: white;
	border-radius: 20px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
	transition: all 0.3s;
}

h2 {
	text-align: center;
	color: #1e90ff;
	margin-bottom: 30px;
	font-weight: 700;
}

h2 i, h3 i {
	margin-right: 10px;
}

h3 {
	color: #1e90ff;
	margin-bottom: 20px;
	font-weight: 600;
}

/* Search Section */
.search-section {
	padding: 25px;
	border: 1px solid #b0e0e6;
	border-radius: 15px;
	background: #f8ffff;
	margin-bottom: 30px;
	text-align: center;
	transition: all 0.3s;
}

.search-section h3 {
	margin-bottom: 20px;
	font-size: 1.3rem;
}

.search-box {
	display: flex;
	justify-content: center;
	gap: 10px;
	flex-wrap: wrap;
}

.search-box input {
	padding: 12px 20px;
	width: 250px;
	border: 2px solid #ddd;
	border-radius: 30px;
	font-size: 16px;
}

.search-box input:focus {
	border-color: #1e90ff;
	outline: none;
}

.search-box button {
	padding: 12px 25px;
	background: linear-gradient(135deg, #1e90ff, #2563eb);
	color: white;
	border: none;
	border-radius: 30px;
	cursor: pointer;
	font-weight: 600;
	transition: all 0.3s;
}

.search-box button:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(30, 144, 255, 0.3);
}

/* Form Section */
.form-section {
	padding: 25px;
	border: 1px solid #b0e0e6;
	border-radius: 15px;
	background: #f8ffff;
	margin-top: 20px;
	transition: all 0.3s;
}

.form-group {
	margin-bottom: 18px;
}

.form-group label {
	font-weight: 600;
	display: block;
	margin-bottom: 8px;
	color: #333;
}

.form-group label i {
	margin-right: 8px;
	color: #1e90ff;
}

.form-group input {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 10px;
	font-size: 14px;
	transition: all 0.3s;
}

.form-group input:focus {
	border-color: #1e90ff;
	outline: none;
	transform: scale(1.02);
}

.required-star {
	color: red;
	margin-left: 3px;
}

/* Button */
.update-btn {
	width: 100%;
	padding: 14px;
	background: linear-gradient(135deg, #28a745, #1e7e34);
	color: white;
	border: none;
	border-radius: 10px;
	font-weight: 700;
	font-size: 16px;
	cursor: pointer;
	transition: all 0.3s;
	margin-top: 10px;
}

.update-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(40, 167, 69, 0.3);
}

.update-btn i {
	margin-right: 8px;
}

/* Message */
.message {
	text-align: center;
	padding: 12px;
	border-radius: 10px;
	margin-bottom: 20px;
	font-weight: 500;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
}

.message.success {
	background: #d4edda;
	color: #155724;
	border-left: 4px solid #28a745;
}

.message.error {
	background: #f8d7da;
	color: #721c24;
	border-left: 4px solid #dc3545;
}

/* Card */
.card {
	background: #f8ffff;
	border: 1px solid #b0e0e6;
	border-radius: 15px;
	padding: 25px;
	margin-top: 30px;
	transition: all 0.3s;
}

/* ✅ Card Heading - BLUE */
.card h3 {
	color: #1e90ff !important;
	text-align: center;
	margin-bottom: 20px;
	font-weight: 600;
}

.card h3 i {
	color: #1e90ff !important;
}

/* Dark Mode Card Heading */
body.dark-mode .card h3 {
	color: #60a5fa !important;
}

body.dark-mode .card h3 i {
	color: #60a5fa !important;
}

/* Table */
.table-responsive {
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table th, table td {
	padding: 12px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

table th {
	background: #add8e6;
	color: #333;
	font-weight: 600;
}

table tr:hover td {
	background: #e6f7ff;
}

/* Responsive */
@media ( max-width : 600px) {
	body {
		padding-top: 70px;
	}
	.container {
		margin: 15px;
		padding: 20px;
	}
	.search-box {
		flex-direction: column;
	}
	.search-box input {
		width: 100%;
	}
	.search-box button {
		width: 100%;
	}
}
</style>
</head>
<body>

	<%
	String msg = (String) request.getAttribute("msg");
	Employee emp = (Employee) request.getAttribute("employee");
	List<Employee> emps = (List<Employee>) request.getAttribute("emps");
	%>

	<jsp:include page="Navbar.jsp" />

	<div class="container">
		<h2>
			<i class="fas fa-edit"></i> Update Employee
		</h2>

		<!-- Search Section -->
		<div class="search-section">
			<h3>
				<i class="fas fa-search"></i> Search Employee by ID
			</h3>
			<form action="${pageContext.request.contextPath}/update"
				method="post">
				<div class="search-box">
					<input type="text" name="id" placeholder="Enter Employee ID"
						required>
					<button type="submit">
						<i class="fas fa-search"></i> Search
					</button>
				</div>
			</form>
		</div>

		
		<% if (msg != null) { 
		    String lowerMsg = msg.toLowerCase();
		    boolean isSuccess = lowerMsg.contains("success") || 
		                       (lowerMsg.contains("found") && !lowerMsg.contains("not"));
		%>
			<div class="message <%= isSuccess ? "success" : "error" %>">
				<i class="fas <%= isSuccess ? "fa-check-circle" : "fa-exclamation-triangle" %>"></i>
				<%= msg %>
			</div>
		<% } %>

		
		<%
		if (emp != null) {
		%>
		<div class="form-section">
			<h3 style="text-align: center; margin-bottom: 20px;">
				<i class="fas fa-user-edit"></i> Edit Employee Details
			</h3>
			<form action="${pageContext.request.contextPath}/updateEmployee"
				method="post" onsubmit="showLoading(this)">
				<input type="hidden" name="id" value="<%=emp.getId()%>">

				<div class="form-group">
					<label><i class="fas fa-user"></i> Full Name <span
						class="required-star">*</span></label> <input type="text" name="name"
						value="<%=emp.getName()%>" pattern="[A-Za-z ]+"
						title="Only letters allowed" required>
				</div>

				<div class="form-group">
					<label><i class="fas fa-envelope"></i> Email Address <span
						class="required-star">*</span></label> <input type="email" name="email"
						value="<%=emp.getEmail()%>" required>
				</div>

				<div class="form-group">
					<label><i class="fas fa-briefcase"></i> Designation <span
						class="required-star">*</span></label> <input type="text"
						name="designation" value="<%=emp.getDesignation()%>" required>
				</div>

				<div class="form-group">
					<label><i class="fas fa-phone"></i> Contact Number <span
						class="required-star">*</span></label> <input type="tel" name="contact"
						value="<%=emp.getContact()%>" pattern="[0-9]{10}" maxlength="10"
						title="Enter 10 digit mobile number" required>
				</div>

				<div class="form-group">
					<label><i class="fas fa-rupee-sign"></i> Salary <span
						class="required-star">*</span></label> <input type="number" name="salary"
						value="<%=emp.getSalary()%>" min="0" step="1" required>
				</div>

				<button type="submit" class="update-btn" id="updateBtn">
					<i class="fas fa-save"></i> Update Employee
				</button>
			</form>
		</div>
		<%
		}
		%>

		
		<div class="card">
			<h3><i class="fas fa-users"></i> Current Employees</h3>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th><i class="fas fa-id-badge"></i> ID</th>
							<th><i class="fas fa-user"></i> Name</th>
							<th><i class="fas fa-envelope"></i> Email</th>
							<th><i class="fas fa-phone"></i> Contact</th>
							<th><i class="fas fa-briefcase"></i> Designation</th>
							<th><i class="fas fa-rupee-sign"></i> Salary</th>
						</tr>
					</thead>
					<tbody>
						<% if (emps != null && !emps.isEmpty()) { 
							for (Employee e : emps) {
						%>
							<tr>
								<td><%= e.getId() %></td>
								<td><%= e.getName() %></td>
								<td><%= e.getEmail() %></td>
								<td><%= e.getContact() %></td>
								<td><%= e.getDesignation() %></td>
								<td>₹ <%= String.format("%,.2f", e.getSalary()) %></td>
							</tr>
						<% 
							}
						} else { 
						%>
							<tr>
								<td colspan="6" style="text-align: center;">No employees found</td>
							</tr>
						<% } %>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script>
		
		function showLoading(form) {
			var btn = form.querySelector('#updateBtn');
			if (btn) {
				btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Updating...';
				btn.disabled = true;
			}
			return true;
		}

		
		function syncDarkMode() {
			if (localStorage.getItem('darkMode') === 'enabled') {
				document.body.classList.add('dark-mode');
			} else {
				document.body.classList.remove('dark-mode');
			}
		}

		syncDarkMode();

		window.addEventListener('storage', function(e) {
			if (e.key === 'darkMode') {
				syncDarkMode();
			}
		});
	</script>

</body>
</html>
