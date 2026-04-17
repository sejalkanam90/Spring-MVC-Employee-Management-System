<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            transition: background 0.3s, color 0.3s;
            background: white;  /* Light mode default */
        }

        /* Dark Mode */
        body.dark-mode {
            background: #1a1a2e;
            color: #eee;
        }

        /* Navbar */
        .navbar {
            background: white;
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
            padding: 12px 0;
            transition: all 0.3s;
        }

        body.dark-mode .navbar {
            background: #1f2937;
            box-shadow: 0 2px 20px rgba(0,0,0,0.3);
        }

        .navbar-brand {
            font-weight: 800;
            font-size: 1.5rem;
            background: linear-gradient(135deg, #2563eb 0%, #1e40af 100%);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        body.dark-mode .navbar-brand {
            background: linear-gradient(135deg, #60a5fa 0%, #818cf8 100%);
            -webkit-background-clip: text;
            background-clip: text;
        }

        .nav-link {
            font-weight: 500;
            margin: 0 5px;
            transition: all 0.3s;
            color: #374151;
        }

        body.dark-mode .nav-link {
            color: #cbd5e1;
        }

        .nav-link:hover {
            transform: translateY(-2px);
            color: #2563eb;
        }

        body.dark-mode .nav-link:hover {
            color: #60a5fa;
        }

        /* Dark Mode Toggle Button */
        .dark-mode-btn {
            background: #e5e7eb;
            border: none;
            border-radius: 50px;
            padding: 8px 18px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        body.dark-mode .dark-mode-btn {
            background: #374151;
            color: white;
        }

        .dark-mode-btn:hover {
            transform: scale(1.05);
            background: #2563eb;
            color: white;
        }

        .navbar-toggler {
            border: none;
        }

        .navbar-toggler:focus {
            box-shadow: none;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
            <i class="fas fa-users"></i> Linkcode
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/add">
                        <i class="fas fa-user-plus"></i> Add
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/search">
                        <i class="fas fa-search"></i> Search
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/update">
                        <i class="fas fa-edit"></i> Update
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/remove">
                        <i class="fas fa-trash-alt"></i> Remove
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </li>
                <li class="nav-item ms-2">
                    <button class="dark-mode-btn" onclick="toggleDarkMode()">
                        <i class="fas fa-moon" id="darkIcon"></i>
                        <span id="darkText">Dark</span>
                    </button>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div style="margin-top: 76px;"></div>

<script>
    function toggleDarkMode() {
        const body = document.body;
        const icon = document.getElementById('darkIcon');
        const text = document.getElementById('darkText');
        
        if (body.classList.contains('dark-mode')) {
            // Dark mode → Light mode (White background)
            body.classList.remove('dark-mode');
            icon.className = 'fas fa-moon';
            text.textContent = 'Dark';
            localStorage.setItem('darkMode', 'disabled');
        } else {
            
            body.classList.add('dark-mode');
            icon.className = 'fas fa-sun';
            text.textContent = 'Light';
            localStorage.setItem('darkMode', 'enabled');
        }
    }

   
    document.addEventListener('DOMContentLoaded', function() {
        const icon = document.getElementById('darkIcon');
        const text = document.getElementById('darkText');
        
        if (localStorage.getItem('darkMode') === 'enabled') {
            document.body.classList.add('dark-mode');
            icon.className = 'fas fa-sun';
            text.textContent = 'Light';
        } else {
            document.body.classList.remove('dark-mode');
            icon.className = 'fas fa-moon';
            text.textContent = 'Dark';
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
