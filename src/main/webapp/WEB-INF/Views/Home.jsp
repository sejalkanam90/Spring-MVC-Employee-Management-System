<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.linkcode.employeemanagement.repository.EmployeeRepository"%>
<%@ page import="com.linkcode.employeemanagement.pojo.Employee"%>
<%@ page import="java.util.List"%>

<%
EmployeeRepository repo = new EmployeeRepository();
List<Employee> empList = repo.getAllEmployees();
int empCount = (empList != null) ? empList.size() : 0;
%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EMS - Employee Management System</title>

<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Google Fonts - Inter -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<!-- AOS Animation Library -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* Smooth Scroll */
html {
	scroll-behavior: smooth;
}

body {
	font-family: 'Inter', sans-serif;
	transition: background-color 0.3s ease, color 0.3s ease;
	background: #ffffff;
	color: #1e293b;
}

/* ==================== DARK MODE STYLES ==================== */
body.dark-mode {
	background: #0f172a;
	color: #e2e8f0;
}

body.dark-mode .stat-card, body.dark-mode .action-card, body.dark-mode .feature-item,
	body.dark-mode .testimonial-card {
	background: #1e293b;
	color: #e2e8f0;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}

body.dark-mode .stat-card p, body.dark-mode .action-card p, body.dark-mode .feature-item p
	{
	color: #94a3b8;
}

body.dark-mode .stat-card h3 {
	color: #ffffff;
}

body.dark-mode .hero {
	background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #0f172a 100%);
}

body.dark-mode .features-section {
	background: #0f172a;
}

body.dark-mode .footer {
	background: #020617;
}

body.dark-mode .section-title h2 {
	color: #ffffff;
}

/* Custom Scrollbar */
::-webkit-scrollbar {
	width: 8px;
}

::-webkit-scrollbar-track {
	background: #f1f1f1;
}

::-webkit-scrollbar-thumb {
	background: linear-gradient(135deg, #2563eb, #1e40af);
	border-radius: 10px;
}

body.dark-mode ::-webkit-scrollbar-track {
	background: #1e293b;
}

/* ==================== HERO SECTION ==================== */
.hero {
	background: linear-gradient(135deg, #1e3c72 0%, #2a5298 50%, #1e3c72 100%);
	padding: 100px 0 80px;
	color: white;
	position: relative;
	overflow: hidden;
	transition: all 0.3s;
}

.hero::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background:
		url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="rgba(255,255,255,0.05)" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,154.7C960,171,1056,181,1152,165.3C1248,149,1344,107,1392,85.3L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>')
		no-repeat bottom;
	background-size: cover;
	opacity: 0.3;
}

.hero h1 {
	font-size: 3.5rem;
	font-weight: 800;
	margin-bottom: 20px;
}

.hero p {
	font-size: 1.2rem;
	opacity: 0.95;
	max-width: 600px;
	margin: 0 auto;
}

.btn-hero {
	background: white;
	color: #2a5298;
	padding: 12px 30px;
	border-radius: 50px;
	font-weight: 600;
	margin-top: 30px;
	transition: all 0.3s;
	display: inline-block;
	text-decoration: none;
}

.btn-hero:hover {
	transform: translateY(-3px) scale(1.05);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
}

body.dark-mode .btn-hero {
	background: #1e293b;
	color: #60a5fa;
}

/* ==================== STATS SECTION ==================== */
.stats-section {
	margin-top: -50px;
	margin-bottom: 60px;
}

.stat-card {
	background: white;
	border-radius: 20px;
	padding: 25px;
	text-align: center;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
	transition: all 0.3s;
}

.stat-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
}

.stat-card i {
	font-size: 2.5rem;
	margin-bottom: 15px;
}

.stat-card h3 {
	font-size: 2rem;
	font-weight: 700;
	margin-bottom: 5px;
	color: #1e3c72;
}

.stat-card p {
	color: #64748b;
	margin: 0;
}

/* ==================== SECTION TITLE ==================== */
.section-title {
	text-align: center;
	margin-bottom: 50px;
}

.section-title h2 {
	font-size: 2.5rem;
	font-weight: 700;
	color: #1e293b;
	margin-bottom: 15px;
}

.title-line {
	width: 80px;
	height: 4px;
	background: linear-gradient(135deg, #2563eb, #1e40af);
	margin: 0 auto;
	border-radius: 5px;
}

/* ==================== ACTION CARDS ==================== */
.action-card {
	background: white;
	border-radius: 20px;
	padding: 35px 25px;
	text-align: center;
	transition: all 0.4s;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
	height: 100%;
}

.action-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 25px 40px rgba(0, 0, 0, 0.15);
}

.card-icon {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 20px;
	font-size: 2rem;
	transition: all 0.3s;
}

.action-card:hover .card-icon {
	transform: scale(1.1);
}

.action-card h4 {
	font-weight: 700;
	margin-bottom: 15px;
}

.action-card p {
	color: #64748b;
	font-size: 0.9rem;
	margin-bottom: 20px;
}

.card-btn {
	display: inline-block;
	padding: 10px 25px;
	border-radius: 50px;
	text-decoration: none;
	font-weight: 600;
	transition: all 0.3s;
}

.card-btn:hover {
	transform: scale(1.05);
}

/* Card Colors */
.card-add .card-icon {
	background: #dbeafe;
	color: #2563eb;
}

.card-add .card-btn {
	background: #2563eb;
	color: white;
}

.card-search .card-icon {
	background: #d1fae5;
	color: #10b981;
}

.card-search .card-btn {
	background: #10b981;
	color: white;
}

.card-update .card-icon {
	background: #fed7aa;
	color: #f59e0b;
}

.card-update .card-btn {
	background: #f59e0b;
	color: white;
}

.card-remove .card-icon {
	background: #fee2e2;
	color: #ef4444;
}

.card-remove .card-btn {
	background: #ef4444;
	color: white;
}

/* ==================== FEATURES SECTION ==================== */
.features-section {
	background: #f8fafc;
	padding: 60px 0;
	margin-top: 60px;
	transition: all 0.3s;
}

.feature-item {
	text-align: center;
	padding: 20px;
	transition: all 0.3s;
}

.feature-item:hover {
	transform: translateY(-5px);
}

.feature-item i {
	font-size: 2.5rem;
	color: #2563eb;
	margin-bottom: 15px;
}

.feature-item h5 {
	font-weight: 600;
	margin-bottom: 10px;
}

.feature-item p {
	color: #64748b;
	font-size: 0.9rem;
}

/* ==================== TESTIMONIAL SECTION ==================== */
.testimonial {
	background: linear-gradient(135deg, #1e3c72, #2a5298);
	padding: 60px 0;
	color: white;
}

.testimonial-card {
	background: rgba(255, 255, 255, 0.1);
	border-radius: 20px;
	padding: 30px;
	backdrop-filter: blur(10px);
	transition: all 0.3s;
}

.testimonial-card:hover {
	transform: translateY(-5px);
	background: rgba(255, 255, 255, 0.15);
}

.testimonial-card i.fa-quote-left {
	font-size: 3rem;
	opacity: 0.5;
	margin-bottom: 15px;
}


.testimonial-card .fa-star {
	font-size: 1.2rem;
	color: #ffc107 !important;
	opacity: 1 !important;
}

/* Dark Mode Stars - Extra Bright */
body.dark-mode .testimonial-card .fa-star {
	color: #ffd700 !important;
	text-shadow: 0 0 3px rgba(255, 215, 0, 0.5);
}

/* ==================== FOOTER ==================== */
.footer {
	background: #0f172a;
	color: #94a3b8;
	padding: 50px 0 20px;
}

.footer h5 {
	color: white;
	margin-bottom: 20px;
}

.footer a {
	color: #94a3b8;
	text-decoration: none;
	transition: color 0.3s;
}

.footer a:hover {
	color: #60a5fa;
}

.footer-bottom {
	text-align: center;
	padding-top: 30px;
	border-top: 1px solid #1e293b;
	margin-top: 30px;
}

/* ==================== ANIMATIONS ==================== */
@
keyframes fadeInDown {from { opacity:0;
	transform: translateY(-40px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes fadeInUp {from { opacity:0;
	transform: translateY(40px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.hero h1 {
	animation: fadeInDown 0.8s ease;
}

.hero p {
	animation: fadeInUp 0.8s ease;
}

/* ==================== RESPONSIVE ==================== */
@media ( max-width : 768px) {
	.hero h1 {
		font-size: 2rem;
	}
	.hero p {
		font-size: 1rem;
	}
	.stats-section {
		margin-top: -30px;
	}
	.section-title h2 {
		font-size: 1.8rem;
	}
	.stat-card {
		margin-bottom: 15px;
	}
	.action-card {
		margin-bottom: 20px;
	}
}
</style>
</head>
<body>

	<!-- Navbar -->
	<jsp:include page="Navbar.jsp" />

	<!-- Hero Section -->
	<section class="hero">
		<div class="container text-center">
			<h1 data-aos="fade-down">Employee Management System</h1>
			<p data-aos="fade-up">Streamline your workforce management with
				our modern, intuitive platform</p>
			<a href="#actions" class="btn-hero" data-aos="fade-up"
				data-aos-delay="200"> Get Started <i
				class="fas fa-arrow-right ms-2"></i>
			</a>
		</div>
	</section>

	<!-- Stats Dashboard -->
	<section class="stats-section">
		<div class="container">
			<div class="row g-4">
				<div class="col-md-3 col-sm-6" data-aos="fade-up"
					data-aos-delay="100">
					<div class="stat-card">
						<i class="fas fa-users" style="color: #2563eb;"></i>
						<h3><%=empCount%></h3>
						<p>Total Employees</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6" data-aos="fade-up"
					data-aos-delay="200">
					<div class="stat-card">
						<i class="fas fa-user-check" style="color: #10b981;"></i>
						<h3><%=empCount%></h3>
						<p>Active Employees</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6" data-aos="fade-up"
					data-aos-delay="300">
					<div class="stat-card">
						<i class="fas fa-building" style="color: #f59e0b;"></i>
						<h3>8+</h3>
						<p>Departments</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6" data-aos="fade-up"
					data-aos-delay="400">
					<div class="stat-card">
						<i class="fas fa-trophy" style="color: #ef4444;"></i>
						<h3>99%</h3>
						<p>Satisfaction Rate</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Action Cards Section -->
	<section id="actions" class="container my-5">
		<div class="section-title" data-aos="fade-up">
			<h2>Quick Actions</h2>
			<div class="title-line"></div>
		</div>

		<div class="row g-4">
			<!-- Add Employee -->
			<div class="col-md-3 col-sm-6" data-aos="fade-up"
				data-aos-delay="100">
				<div class="action-card card-add">
					<div class="card-icon">
						<i class="fas fa-user-plus"></i>
					</div>
					<h4>Add Employee</h4>
					<p>Add new employee to the system with complete details</p>
					<a href="${pageContext.request.contextPath}/add" class="card-btn">
						Add Now <i class="fas fa-arrow-right ms-1"></i>
					</a>
				</div>
			</div>

			<!-- Search Employee -->
			<div class="col-md-3 col-sm-6" data-aos="fade-up"
				data-aos-delay="200">
				<div class="action-card card-search">
					<div class="card-icon">
						<i class="fas fa-search"></i>
					</div>
					<h4>Search Employee</h4>
					<p>Find employee details quickly by ID or name</p>
					<a href="${pageContext.request.contextPath}/search"
						class="card-btn"> Search Now <i
						class="fas fa-arrow-right ms-1"></i>
					</a>
				</div>
			</div>

			<!-- Update Employee -->
			<div class="col-md-3 col-sm-6" data-aos="fade-up"
				data-aos-delay="300">
				<div class="action-card card-update">
					<div class="card-icon">
						<i class="fas fa-edit"></i>
					</div>
					<h4>Update Employee</h4>
					<p>Modify employee information as needed</p>
					<a href="${pageContext.request.contextPath}/update"
						class="card-btn"> Update Now <i
						class="fas fa-arrow-right ms-1"></i>
					</a>
				</div>
			</div>

			<!-- Remove Employee -->
			<div class="col-md-3 col-sm-6" data-aos="fade-up"
				data-aos-delay="400">
				<div class="action-card card-remove">
					<div class="card-icon">
						<i class="fas fa-trash-alt"></i>
					</div>
					<h4>Remove Employee</h4>
					<p>Delete employee records from the system</p>
					<a href="${pageContext.request.contextPath}/remove"
						class="card-btn"> Remove Now <i
						class="fas fa-arrow-right ms-1"></i>
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Why Choose Us Section -->
	<section class="features-section">
		<div class="container">
			<div class="section-title" data-aos="fade-up">
				<h2>Why Choose Us?</h2>
				<div class="title-line"></div>
			</div>
			<div class="row g-4">
				<div class="col-md-3 col-sm-6" data-aos="fade-up"
					data-aos-delay="100">
					<div class="feature-item">
						<i class="fas fa-shield-alt"></i>
						<h5>Secure Data</h5>
						<p>Your employee data is safe and secure with enterprise-grade
							encryption</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6" data-aos="fade-up"
					data-aos-delay="200">
					<div class="feature-item">
						<i class="fas fa-bolt"></i>
						<h5>Fast Access</h5>
						<p>Quick search and retrieval of records in milliseconds</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6" data-aos="fade-up"
					data-aos-delay="300">
					<div class="feature-item">
						<i class="fas fa-sync-alt"></i>
						<h5>Real-time Updates</h5>
						<p>Instant updates across the system with no delay</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6" data-aos="fade-up"
					data-aos-delay="400">
					<div class="feature-item">
						<i class="fas fa-headset"></i>
						<h5>24/7 Support</h5>
						<p>Round the clock customer support for your assistance</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Testimonial Section -->
	<section class="testimonial">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8 text-center" data-aos="fade-up">
					<div class="testimonial-card">
						<i class="fas fa-quote-left"></i>
						<p class="fs-5">"This Employee Management System has
							transformed how we manage our workforce. Efficient, modern, and
							incredibly easy to use!"</p>
						<h6 class="mt-3">- Sarah Johnson, HR Manager at TechCorp</h6>
						<div class="mt-2">
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-4">
					<h5>
						<i class="fas fa-users"></i> EMS
					</h5>
					<p>Modern Employee Management System for efficient workforce
						management.</p>
					<div>
						<a href="#" class="me-3"><i class="fab fa-facebook-f"></i></a> <a
							href="#" class="me-3"><i class="fab fa-twitter"></i></a> <a
							href="#" class="me-3"><i class="fab fa-linkedin-in"></i></a> <a
							href="#" class="me-3"><i class="fab fa-github"></i></a>
					</div>
				</div>
				<div class="col-md-4 mb-4">
					<h5>Quick Links</h5>
					<ul class="list-unstyled">
						<li><a href="${pageContext.request.contextPath}/add"><i
								class="fas fa-angle-right"></i> Add Employee</a></li>
						<li><a href="${pageContext.request.contextPath}/search"><i
								class="fas fa-angle-right"></i> Search Employee</a></li>
						<li><a href="${pageContext.request.contextPath}/update"><i
								class="fas fa-angle-right"></i> Update Employee</a></li>
						<li><a href="${pageContext.request.contextPath}/remove"><i
								class="fas fa-angle-right"></i> Remove Employee</a></li>
					</ul>
				</div>
				<div class="col-md-4 mb-4">
					<h5>Contact Info</h5>
					<ul class="list-unstyled">
						<li><i class="fas fa-envelope me-2"></i> support@ems.com</li>
						<li><i class="fas fa-phone me-2"></i> +1 (234) 567-890</li>
						<li><i class="fas fa-map-marker-alt me-2"></i> Mumbai, India</li>
					</ul>
				</div>
			</div>
			<div class="footer-bottom">
				<p>&copy; 2026 Employee Management System. All rights reserved.
				</p>
			</div>
		</div>
	</footer>

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	<script>
		
		AOS.init({
			duration : 800,
			once : true,
			offset : 100
		});

		
		window.toggleDarkMode = function() {
			const body = document.body;
			const icon = document.getElementById('darkIcon');
			const text = document.getElementById('darkText');

			if (body.classList.contains('dark-mode')) {
				body.classList.remove('dark-mode');
				if (icon)
					icon.className = 'fas fa-moon';
				if (text)
					text.textContent = 'Dark';
				localStorage.setItem('darkMode', 'disabled');
			} else {
				body.classList.add('dark-mode');
				if (icon)
					icon.className = 'fas fa-sun';
				if (text)
					text.textContent = 'Light';
				localStorage.setItem('darkMode', 'enabled');
			}
		};

		
		function loadDarkModePreference() {
			const icon = document.getElementById('darkIcon');
			const text = document.getElementById('darkText');

			if (localStorage.getItem('darkMode') === 'enabled') {
				document.body.classList.add('dark-mode');
				if (icon)
					icon.className = 'fas fa-sun';
				if (text)
					text.textContent = 'Light';
			} else {
				document.body.classList.remove('dark-mode');
				if (icon)
					icon.className = 'fas fa-moon';
				if (text)
					text.textContent = 'Dark';
			}
		}

		
		document.addEventListener('DOMContentLoaded', function() {
			loadDarkModePreference();
		});
	</script>
</body>
</html>

