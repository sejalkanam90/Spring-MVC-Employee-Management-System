<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.linkcode.employeemanagement.pojo.Employee"%>
<%@ page import="java.util.List"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Remove Employee</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style type="text/css">

/* Global Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, sans-serif;
	background-color: #f0f8ff;
	color: #333;
	line-height: 1.6;
	padding-top: 80px;
}

/* Dark Mode */
body.dark-mode {
	background-color: #1a1a2e;
	color: #e2e8f0;
}

body.dark-mode .container {
	background-color: #1e293b;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

body.dark-mode .form-section {
	background-color: #0f172a;
	border-color: #334155;
}

body.dark-mode .form-section h2 {
	color: #60a5fa;
}

body.dark-mode .form-group label {
	color: #cbd5e1;
}

body.dark-mode .form-group input[type="text"] {
	background-color: #334155;
	border-color: #475569;
	color: white;
}

body.dark-mode .message.success {
	background-color: #064e3b;
	color: #86efac;
}

body.dark-mode .message.error {
	background-color: #7f1d1d;
	color: #fca5a5;
}

body.dark-mode .table-heading {
	color: #60a5fa !important;
}

body.dark-mode thead th {
	background-color: #1e40af;
	color: white;
}

body.dark-mode tbody td {
	border-bottom-color: #334155;
}

body.dark-mode tbody tr:nth-child(even) {
	background-color: #334155;
}

body.dark-mode tbody tr:hover {
	background-color: #3b4252;
}

/* Main Container */
.container {
	max-width: 1200px;
	
	padding: 30px;
	background-color: #fff;
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s;
}

/* Form Section */
.form-section {
	padding: 30px;
	border: 1px solid #b0e0e6;
	border-radius: 12px;
	background-color: #f8ffff;
	margin-bottom: 30px;
	text-align: center;
	transition: all 0.3s;
}

.form-section h2 {
	color: #1e90ff;
	margin-top: 0;
	margin-bottom: 20px;
	font-size: 1.8em;
}

.form-section h2 i {
	margin-right: 10px;
}

.form-group {
	margin-bottom: 15px;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	flex-wrap: wrap;
}

.form-group label {
	font-weight: bold;
	color: #555;
}

.form-group label i {
	margin-right: 5px;
}

.form-group input[type="text"] {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 250px;
	transition: border-color 0.3s;
}

.form-group input[type="text"]:focus {
	border-color: #1e90ff;
	outline: none;
}

.btn {
	padding: 10px 25px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	font-weight: bold;
	transition: all 0.3s ease;
}

.btn-remove {
	background-color: #ff6347;
	color: white;
}

.btn-remove:hover {
	background-color: #e5533d;
	transform: translateY(-2px);
}

.btn-remove i {
	margin-right: 8px;
}

/* Message Section */
.message {
	text-align: center;
	font-size: 1.1em;
	padding: 12px;
	border-radius: 5px;
	margin-bottom: 20px;
	font-weight: bold;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
}

/* Green - Success */
.message.success {
	background-color: #d4edda;
	color: #155724;
	border-left: 4px solid #28a745;
}

/* Red - Error */
.message.error {
	background-color: #f8d7da;
	color: #721c24;
	border-left: 4px solid #dc3545;
}


.table-heading {
	color: #1e90ff !important;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 15px;
	font-size: 1.6em;
	background-color: transparent !important;
	border-left: none !important;
}

.table-heading i {
	margin-right: 10px;
	color: #1e90ff !important;
}

/* Table Styles */
table {
	width: 100%;
	border-collapse: collapse;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
	margin-top: 10px;
}

thead th {
	background-color: #add8e6;
	color: #333;
	font-weight: bold;
	text-transform: uppercase;
	padding: 12px;
	text-align: left;
}

thead th i {
	margin-right: 8px;
}

tbody td {
	padding: 10px 12px;
	border-bottom: 1px solid #ddd;
}

tbody tr:nth-child(even) {
	background-color: #f9f9f9;
}

tbody tr:hover {
	background-color: #e6f7ff;
	transition: all 0.2s;
}

/* Divider */
.divider {
	margin: 20px 0;
	border: none;
	height: 1px;
	background: linear-gradient(to right, transparent, #b0e0e6, transparent);
}

/* Responsive */
@media (max-width: 768px) {
	body {
		padding-top: 70px;
	}
	
	.container {
		margin: 15px;
		padding: 20px;
	}
	
	.form-section {
		padding: 20px;
	}
	
	.form-group {
		flex-direction: column;
	}
	
	.form-group input[type="text"] {
		width: 100%;
	}
	
	.btn {
		width: 100%;
	}
	
	.table-heading {
		font-size: 1.3em;
	}
	
	table {
		display: block;
		overflow-x: auto;
		white-space: nowrap;
	}
}
</style>

</head>
<body>

	<%
	String msg = (String) request.getAttribute("msg");
	List<Employee> emps = (List<Employee>) request.getAttribute("emps");
	%>

	<jsp:include page="Navbar.jsp" />

	<div class="container">
		<!-- Remove Form Section -->
		<div class="form-section">
			<h2><i class="fas fa-trash-alt"></i> Remove Employee Record</h2>
			<form action="${pageContext.request.contextPath}/remove" method="post">
				<div class="form-group">
					<label for="id"><i class="fas fa-id-badge"></i> Employee ID:</label> 
					<input type="text" id="id" name="id" placeholder="Enter ID to remove" required>
				</div>
				<button type="submit" class="btn btn-remove">
					<i class="fas fa-trash"></i> Remove
				</button>
			</form>
		</div>

		
		<% if (msg != null) { %>
			<div class="message <%= msg.contains("Removed") ? "success" : "error" %>">
				<i class="fas <%= msg.contains("Removed") ? "fa-check-circle" : "fa-exclamation-triangle" %>"></i>
				<%= msg %>
			</div>
		<% } %>

		<!-- Divider -->
		<hr class="divider">

		
		<% if (emps != null && !emps.isEmpty()) { %>
			<div class="table-heading">
				<i class="fas fa-users"></i> Current Employees
			</div>
			<table>
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
					<% for (Employee empItem : emps) { %>
						<tr>
							<td><%= empItem.getId() %></td>
							<td><%= empItem.getName() %></td>
							<td><%= empItem.getEmail() %></td>
							<td><%= empItem.getContact() %></td>
							<td><%= empItem.getDesignation() %></td>
							<td>₹ <%= String.format("%,.2f", empItem.getSalary()) %></td>
						</tr>
					<% } %>
				</tbody>
			</table>
		<% } else if (emps != null && emps.isEmpty() && msg != null) { %>
			<div class="message error">
				<i class="fas fa-info-circle"></i>
				No employees found in the system.
			</div>
		<% } %>
	</div>

	<script>
		
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

