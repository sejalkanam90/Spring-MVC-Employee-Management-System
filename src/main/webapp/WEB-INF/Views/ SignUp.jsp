<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EMS - Create Account</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            position: relative;
            overflow-x: hidden;
        }
        
        /* Animated Background */
        .bg-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            overflow: hidden;
        }
        
        .bg-animation .circle {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 20s infinite;
        }
        
        .circle:nth-child(1) {
            width: 300px;
            height: 300px;
            top: -100px;
            left: -100px;
            animation-delay: 0s;
        }
        
        .circle:nth-child(2) {
            width: 500px;
            height: 500px;
            bottom: -200px;
            right: -150px;
            animation-delay: 5s;
        }
        
        .circle:nth-child(3) {
            width: 200px;
            height: 200px;
            top: 50%;
            left: 70%;
            animation-delay: 10s;
        }
        
        .circle:nth-child(4) {
            width: 400px;
            height: 400px;
            bottom: 20%;
            left: -150px;
            animation-delay: 2s;
        }
        
        @keyframes float {
            0%, 100% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-50px) rotate(180deg);
            }
        }
        
        /* Main Container */
        .signup-wrapper {
            position: relative;
            z-index: 1;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }
        
        /* Glassmorphism Card */
        .signup-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 32px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            width: 100%;
            max-width: 550px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .signup-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 30px 60px -12px rgba(0, 0, 0, 0.3);
        }
        
        /* Header Section */
        .signup-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 40px 35px;
            text-align: center;
            color: white;
            position: relative;
            overflow: hidden;
        }
        
        .signup-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: shine 8s infinite;
        }
        
        @keyframes shine {
            0% {
                transform: translateX(-100%) translateY(-100%) rotate(45deg);
            }
            100% {
                transform: translateX(100%) translateY(100%) rotate(45deg);
            }
        }
        
        .logo-wrapper {
            position: relative;
            z-index: 1;
        }
        
        .logo-img {
            width: 85px;
            height: 85px;
            border-radius: 50%;
            margin-bottom: 20px;
            border: 3px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }
        
        .logo-img:hover {
            transform: scale(1.05);
        }
        
        .signup-header h3 {
            font-weight: 700;
            font-size: 1.75rem;
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }
        
        .signup-header p {
            opacity: 0.9;
            font-size: 0.9rem;
            font-weight: 400;
        }
        
        /* Body Section */
        .signup-body {
            padding: 40px 35px;
        }
        
        /* Form Styles */
        .form-group {
            margin-bottom: 22px;
        }
        
        .form-label {
            font-weight: 600;
            margin-bottom: 10px;
            display: block;
            font-size: 0.85rem;
            color: #4a5568;
            letter-spacing: 0.3px;
        }
        
        .form-label i {
            margin-right: 8px;
            color: #667eea;
        }
        
        .input-group {
            border-radius: 14px;
            transition: all 0.3s ease;
        }
        
        .input-group:focus-within {
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.2);
        }
        
        .input-group-text {
            background: #f7fafc;
            border: 1px solid #e2e8f0;
            border-right: none;
            border-radius: 14px 0 0 14px;
            color: #667eea;
        }
        
        .form-control {
            border: 1px solid #e2e8f0;
            border-left: none;
            padding: 12px 15px;
            border-radius: 0 14px 14px 0;
            font-size: 0.95rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #667eea;
            box-shadow: none;
        }
        
        /* Password Toggle Button */
        .password-toggle {
            border: 1px solid #e2e8f0;
            border-left: none;
            border-radius: 0 14px 14px 0;
            background: #f7fafc;
            color: #718096;
        }
        
        .password-toggle:hover {
            background: #edf2f7;
        }
        
        /* Password Strength Indicator */
        .password-strength {
            margin-top: 8px;
            font-size: 0.7rem;
        }
        
        .strength-weak {
            color: #dc3545;
        }
        
        .strength-medium {
            color: #fd7e14;
        }
        
        .strength-strong {
            color: #28a745;
        }
        
        /* Signup Button */
        .signup-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 14px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 15px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .signup-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s ease;
        }
        
        .signup-btn:hover::before {
            left: 100%;
        }
        
        .signup-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px -5px rgba(102, 126, 234, 0.4);
        }
        
        .signup-btn:active {
            transform: translateY(0);
        }
        
        /* Links */
        .links {
            text-align: center;
            margin-top: 25px;
        }
        
        .links a {
            color: #667eea;
            text-decoration: none;
            font-size: 0.85rem;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        
        .links a:hover {
            color: #764ba2;
            text-decoration: underline;
        }
        
        /* Footer */
        .signup-footer {
            text-align: center;
            padding: 20px 35px;
            border-top: 1px solid #e2e8f0;
            font-size: 0.75rem;
            color: #a0aec0;
            background: rgba(255, 255, 255, 0.8);
        }
        
        /* Alert Messages */
        .alert {
            border-radius: 14px;
            padding: 14px;
            margin-bottom: 25px;
            border: none;
            font-size: 0.85rem;
            font-weight: 500;
        }
        
        .alert-success {
            background: linear-gradient(135deg, #d4edda 0%, #c3e6cb 100%);
            color: #155724;
        }
        
        .alert-danger {
            background: linear-gradient(135deg, #fcebeb 0%, #f5c6cb 100%);
            color: #721c24;
        }
        
        /* Confirm Password Match */
        #confirmMsg {
            margin-top: 5px;
            font-size: 0.7rem;
        }
        
        /* Responsive */
        @media (max-width: 576px) {
            .signup-header, .signup-body {
                padding: 30px 25px;
            }
            
            .signup-header h3 {
                font-size: 1.5rem;
            }
            
            .logo-img {
                width: 70px;
                height: 70px;
            }
        }
    </style>
</head>
<body>

    <!-- Animated Background -->
    <div class="bg-animation">
        <div class="circle"></div>
        <div class="circle"></div>
        <div class="circle"></div>
        <div class="circle"></div>
    </div>

    <div class="signup-wrapper">
        <div class="signup-card">
            <div class="signup-header">
                <div class="logo-wrapper">
                    <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" 
                         alt="EMS Logo" 
                         class="logo-img">
                </div>
                <h3>Create Account</h3>
                <p>Join the Employee Management System</p>
            </div>
            
            <div class="signup-body">
                <!-- Dynamic Message Display -->
                <%
                String msg = (String) request.getAttribute("msg");
                if (msg != null) {
                    if (msg.contains("successfully")) {
                %>
                    <div class="alert alert-success">
                        <i class="fas fa-check-circle me-2"></i> <%= msg %>
                    </div>
                <%
                    } else {
                %>
                    <div class="alert alert-danger">
                        <i class="fas fa-exclamation-triangle me-2"></i> <%= msg %>
                    </div>
                <%
                    }
                }
                %>
                
                <form action="${pageContext.request.contextPath}/signup" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-user"></i> Username
                        </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fas fa-user"></i>
                            </span>
                            <input type="text" 
                                   name="username" 
                                   class="form-control" 
                                   placeholder="Enter username" 
                                   required 
                                   autofocus>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-envelope"></i> Email Address
                        </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fas fa-envelope"></i>
                            </span>
                            <input type="email" 
                                   name="email" 
                                   class="form-control" 
                                   placeholder="Enter your email" 
                                   required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-lock"></i> Password
                        </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fas fa-lock"></i>
                            </span>
                            <input type="password" 
                                   name="password" 
                                   class="form-control" 
                                   id="password" 
                                   placeholder="Create a password" 
                                   required 
                                   onkeyup="checkPasswordStrength()">
                            <button class="btn password-toggle" 
                                    type="button" 
                                    onclick="togglePassword()">
                                <i class="fas fa-eye" id="toggleIcon"></i>
                            </button>
                        </div>
                        <div class="password-strength" id="passwordStrength"></div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-lock"></i> Confirm Password
                        </label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fas fa-lock"></i>
                            </span>
                            <input type="password" 
                                   name="confirmPassword" 
                                   class="form-control" 
                                   id="confirmPassword" 
                                   placeholder="Confirm your password" 
                                   required>
                        </div>
                        <div id="confirmMsg" class="password-strength"></div>
                    </div>
                    
                    <button type="submit" class="signup-btn">
                        <i class="fas fa-user-plus me-2"></i> Sign Up
                    </button>
                    
                    <div class="links">
                        Already have an account? 
                        <a href="${pageContext.request.contextPath}/login">Login here</a>
                    </div>
                </form>
            </div>
            
            <div class="signup-footer">
                <p>&copy; 2026 Employee Management System. All rights reserved.</p>
            </div>
        </div>
    </div>

    <script>
        function togglePassword() {
            const pwd = document.getElementById('password');
            const icon = document.getElementById('toggleIcon');
            
            if (pwd.type === 'password') {
                pwd.type = 'text';
                icon.className = 'fas fa-eye-slash';
            } else {
                pwd.type = 'password';
                icon.className = 'fas fa-eye';
            }
        }
        
        function checkPasswordStrength() {
            const pwd = document.getElementById('password').value;
            const div = document.getElementById('passwordStrength');
            let s = 0, msg = '', cls = '';
            
            if (pwd.length >= 8) s++;
            if (pwd.match(/[a-z]+/)) s++;
            if (pwd.match(/[A-Z]+/)) s++;
            if (pwd.match(/[0-9]+/)) s++;
            if (pwd.match(/[$@#&!]+/)) s++;
            
            if (s <= 1) { 
                msg = '🔴 Weak password'; 
                cls = 'strength-weak'; 
            } else if (s <= 3) { 
                msg = '🟠 Medium password'; 
                cls = 'strength-medium'; 
            } else { 
                msg = '🟢 Strong password'; 
                cls = 'strength-strong'; 
            }
            
            div.innerHTML = pwd.length ? msg : '';
            div.className = 'password-strength ' + cls;
        }
        
        document.getElementById('confirmPassword').addEventListener('keyup', function() {
            const pwd = document.getElementById('password').value;
            const confirm = this.value;
            const msg = document.getElementById('confirmMsg');
            
            if (pwd === confirm && confirm !== '') {
                msg.innerHTML = '✓ Passwords match';
                msg.style.color = '#28a745';
            } else if (confirm !== '') {
                msg.innerHTML = '✗ Passwords do not match';
                msg.style.color = '#dc3545';
            } else { 
                msg.innerHTML = ''; 
            }
        });
        
        function validateForm() {
            const pwd = document.getElementById('password').value;
            const confirm = document.getElementById('confirmPassword').value;
            
            if (pwd !== confirm) {
                alert('Passwords do not match!');
                return false;
            }
            
            if (pwd.length < 6) {
                alert('Password must be at least 6 characters!');
                return false;
            }
            
            return true;
        }
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

