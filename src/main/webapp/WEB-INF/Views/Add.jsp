<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Employee - EMS</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>

/* Body */
body, html {
	margin: 0;
	padding: 0;
	min-height: 100vh;
	font-family: 'Poppins', sans-serif;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

/* Dark Mode */
body.dark-mode {
	background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
}

body.dark-mode .main-container {
	background: #1e293b;
}

body.dark-mode .form-section {
	background: #1e293b;
}

body.dark-mode h2 {
	color: #60a5fa;
}

body.dark-mode label {
	color: #cbd5e1;
}

body.dark-mode input {
	background: #334155;
	border-color: #475569;
	color: white;
}

body.dark-mode input:focus {
	border-color: #60a5fa;
}

body.dark-mode .alert-success {
	background: #064e3b;
	color: #86efac;
	border: none;
}

body.dark-mode .alert-danger {
	background: #7f1d1d;
	color: #fca5a5;
	border: none;
}

/* Wrapper */
.main-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 100px 0 50px;
}

/* Main Box */
.main-container {
	display: flex;
	width: 90%;
	max-width: 1000px;
	background: #fff;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0,0,0,0.2);
	overflow: hidden;
	transition: all 0.3s;
}

/* Form */
.form-section {
	flex: 1;
	padding: 40px;
}

h2 {
	text-align: center;
	color: #4a69bd;
	margin-bottom: 25px;
	font-weight: 600;
}

h2 i {
	margin-right: 10px;
}

/* Inputs */
.form-group {
	margin-bottom: 15px;
}

label {
	font-weight: 600;
	display: block;
	margin-bottom: 5px;
}

label i {
	margin-right: 8px;
	color: #4a69bd;
}

.required-star {
	color: red;
	font-size: 18px;
	margin-left: 3px;
}

input {
	width: 100%;
	padding: 10px;
	border-radius: 8px;
	border: 1px solid #ccc;
	transition: all 0.3s ease;
}

input:focus {
	border-color: #4a69bd;
	box-shadow: 0 0 6px rgba(74,105,189,0.3);
	outline: none;
	transform: scale(1.02);
}

/* Button */
.submit-btn {
	width: 100%;
	padding: 12px;
	background: #4a69bd;
	color: white;
	border: none;
	border-radius: 8px;
	font-weight: 600;
	cursor: pointer;
	transition: 0.3s;
	margin-top: 10px;
}

.submit-btn:hover {
	background: #3b5394;
	transform: translateY(-2px);
}

.submit-btn i {
	margin-right: 8px;
}

/* Alert */
.alert {
	margin-top: 15px;
	padding: 12px;
	border-radius: 8px;
	text-align: center;
	font-weight: 500;
}

.alert-success {
	background: #d4edda;
	color: #155724;
	border-left: 4px solid #28a745;
}

.alert-danger {
	background: #f8d7da;
	color: #721c24;
	border-left: 4px solid #dc3545;
}

/* Image */
.image-section {
	flex: 1;
	background-image: url('https://images.unsplash.com/photo-1521737604893-d14cc237f11d?w=800&q=80');
	background-size: cover;
	background-position: center;
}

/* Responsive */
@media (max-width: 768px) {
	.main-wrapper {
		padding: 80px 0 30px;
	}
	
	.main-container {
		flex-direction: column;
		margin: 0 15px;
	}

	.image-section {
		display: none;
	}

	.form-section {
		padding: 25px;
	}
}
</style>

</head>
<body>

<!-- Navbar -->
<jsp:include page="Navbar.jsp" />

<div class="main-wrapper">

	<div class="main-container">

		<!-- Form -->
		<div class="form-section">
			<h2><i class="fas fa-user-plus"></i> Add New Employee</h2>

			<form action="${pageContext.request.contextPath}/add" method="post" onsubmit="showLoading(this)">

				<div class="form-group">
					<label><i class="fas fa-user"></i> Full Name <span class="required-star">*</span></label>
					<input type="text" name="name" placeholder="Enter full name" pattern="[A-Za-z ]+" title="Only letters allowed" required>
				</div>

				<div class="form-group">
					<label><i class="fas fa-envelope"></i> Email <span class="required-star">*</span></label>
					<input type="email" name="email" placeholder="example@company.com" required>
				</div>

				<div class="form-group">
					<label><i class="fas fa-phone"></i> Contact Number <span class="required-star">*</span></label>
					<input type="tel" name="contact" placeholder="9876543210" pattern="[0-9]{10}" maxlength="10" title="Enter 10 digit mobile number" required>
				</div>

				<div class="form-group">
					<label><i class="fas fa-briefcase"></i> Designation <span class="required-star">*</span></label>
					<input type="text" name="designation" placeholder="Software Engineer" required>
				</div>

				<div class="form-group">
					<label><i class="fas fa-rupee-sign"></i> Salary <span class="required-star">*</span></label>
					<input type="number" name="salary" placeholder="50000" min="0" step="1" required>
				</div>

				<button type="submit" class="submit-btn" id="submitBtn">
					<i class="fas fa-save"></i> Add Employee
				</button>

				<% if (msg != null) { %>
					<div class="alert <%= msg.toLowerCase().contains("success") ? "alert-success" : "alert-danger" %>">
						<i class="fas <%= msg.toLowerCase().contains("success") ? "fa-check-circle" : "fa-exclamation-triangle" %>"></i>
						<%= msg %>
					</div>
				<% } %>

			</form>
		</div>

		<!-- Image -->
		<div class="image-section"></div>

	</div>

</div>

<script>
	// Loading Effect on Submit
	function showLoading(form) {
		var btn = form.querySelector('#submitBtn');
		if (btn) {
			btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Adding Employee...';
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
	
	window.addEventListener('darkModeChanged', function() {
		syncDarkMode();
	});
</script>

</body>
</html>

