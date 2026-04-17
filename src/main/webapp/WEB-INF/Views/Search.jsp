<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.linkcode.employeemanagement.pojo.Employee"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Employee</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
	color: #333;
	min-height: 100vh;
}

/* Dark Mode */
body.dark-mode {
	background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
	color: #e2e8f0;
}

body.dark-mode .search-container {
	background: #1e293b;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}

body.dark-mode h2 {
	color: #60a5fa;
}

body.dark-mode .search-box input {
	background: #334155;
	color: white;
	border-color: #475569;
}

body.dark-mode .search-box input::placeholder {
	color: #94a3b8;
}

body.dark-mode table th {
	background: linear-gradient(to bottom, #2563eb, #1e40af);
}

body.dark-mode table td {
	border-bottom-color: #334155;
}

body.dark-mode table tr:nth-child(even) {
	background-color: #334155;
}

body.dark-mode .footer {
	color: #94a3b8;
}

.search-container {
	max-width: 1000px;
	margin: 100px auto 50px;
	background: white;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	text-align: center;
	transition: all 0.3s;
}

h2 {
	color: #2c3e50;
	margin-bottom: 30px;
	font-size: 28px;
}

.search-box {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-bottom: 30px;
	flex-wrap: wrap;
}

.search-box input {
	padding: 12px 20px;
	width: 300px;
	border: 2px solid #ddd;
	border-radius: 30px;
	font-size: 16px;
	outline: none;
	transition: all 0.3s;
}

.search-box input:focus {
	border-color: #3498db;
}

.search-box button {
	padding: 12px 25px;
	background: linear-gradient(to right, #3498db, #2980b9);
	color: white;
	border: none;
	border-radius: 30px;
	cursor: pointer;
	font-size: 16px;
	font-weight: 600;
	transition: all 0.3s;
}

.search-box button:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
}


.message {
	padding: 15px 20px;
	border-radius: 10px;
	margin: 20px 0;
	font-weight: bold;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 12px;
	font-size: 16px;
}


.message.success {
	background: #d4edda;
	color: #155724;
	border-left: 5px solid #28a745;
}


.message.error {
	background: #f8d7da;
	color: #721c24;
	border-left: 5px solid #dc3545;
}


body.dark-mode .message.success {
	background: #064e3b;
	color: #86efac;
	border-left-color: #10b981;
}

body.dark-mode .message.error {
	background: #7f1d1d;
	color: #fca5a5;
	border-left-color: #ef4444;
}


table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 25px;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

th, td {
	padding: 12px 15px;
	text-align: left;
	border-bottom: 1px solid #e0e0e0;
}

th {
	background: linear-gradient(to bottom, #3498db, #2980b9);
	color: white;
	font-weight: 600;
	font-size: 14px;
}

tr:nth-child(even) {
	background-color: #f8f9fa;
}

tr:hover {
	background-color: #e8f4fc;
	transition: all 0.2s;
}

.footer {
	text-align: center;
	padding: 20px;
	color: #7f8c8d;
	margin-top: 20px;
	font-size: 14px;
}

/* Icons */
.fa-check-circle {
	color: #28a745;
	font-size: 18px;
}

.fa-exclamation-triangle {
	color: #dc3545;
	font-size: 18px;
}

body.dark-mode .fa-check-circle {
	color: #10b981;
}

body.dark-mode .fa-exclamation-triangle {
	color: #ef4444;
}

/* Responsive */
@media ( max-width : 600px) {
	.search-container {
		margin: 80px 15px 30px;
		padding: 25px;
	}
	.search-box input {
		width: 100%;
	}
	.search-box button {
		width: 100%;
	}
	table {
		display: block;
		overflow-x: auto;
		white-space: nowrap;
	}
	h2 {
		font-size: 22px;
	}
}
</style>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

	<%
	String msg = (String) request.getAttribute("msg");
	Employee emp = (Employee) request.getAttribute("emp");
	%>

	<jsp:include page="Navbar.jsp" />

	<div class="search-container">
		<h2>
			<i class="fas fa-search" style="color: #3498db;"></i> Search Employee
		</h2>

		<form action="${pageContext.request.contextPath}/search" method="post">
			<div class="search-box">
				<input type="text" name="id" placeholder="Enter Employee ID"
					required>
				<button type="submit">
					<i class="fas fa-search"></i> Search
				</button>
			</div>
		</form>

		
		<%
		if (msg != null) {
			boolean isNotFound = msg.toLowerCase().contains("not");
		%>
		<div class="message <%=isNotFound ? "error" : "success"%>">
			<i
				class="fas <%=isNotFound ? "fa-exclamation-triangle" : "fa-check-circle"%>"></i>
			<%=msg%>
		</div>
		<%
		}
		%>

		<!-- Display Employee Table if found -->
		<%
		if (emp != null) {
		%>
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
				<tr>
					<td><%=emp.getId()%></td>
					<td><%=emp.getName()%></td>
					<td><%=emp.getEmail()%></td>
					<td><%=emp.getContact()%></td>
					<td><%=emp.getDesignation()%></td>
					<td>₹ <%=String.format("%,.2f", emp.getSalary())%></td>
				</tr>
			</tbody>
		</table>
		<%
		}
		%>
	</div>

	<div class="footer">
		<p>
			<i class="fas fa-copyright"></i> 2026 Employee Management System. All
			rights reserved.
		</p>
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
