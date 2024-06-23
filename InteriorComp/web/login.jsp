<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }
        .login-container {
            background-color: rgba(22, 27, 34, 0.95);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 20px;
            color: #58a6ff;
            font-size: 28px;
        }
        .login-container form {
            display: flex;
            flex-direction: column;
            position: relative;
        }
        .input-group {
            position: relative;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            background-color: #21262d;
            border-radius: 4px;
        }
        .input-group input {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: transparent;
            color: #c9d1d9;
            outline: none;
        }
        .input-group .fa {
            margin-left: 10px;
            color: #c9d1d9;
        }
        .input-group .fa-eye,
        .input-group .fa-eye-slash {
            margin-right: 10px;
            cursor: pointer;
        }
        .login-container button {
            padding: 10px;
            background-color: #0366d6;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 16px;
        }
        .login-container button:hover {
            background-color: #0255b6;
        }
        .login-container .register-link {
            margin-top: 20px;
            display: block;
            color: #58a6ff;
            text-decoration: none;
            transition: color 0.3s;
        }
        .login-container .register-link:hover {
            color: #0366d6;
        }

        .alert-box {
            display: none;
            position: fixed;
            top: 20%;
            left: 50%;
            transform: translateX(-50%);
            background-color: #2d333b;
            color: #c9d1d9;
            border: 1px solid #444c56;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.5);
            z-index: 1001;
        }

        .alert-box.show {
            display: block;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>
            <img src="resource/logo.svg" alt="INTERIOR Logo">
            INTERIOR
        </h1>
        <div class="nav">
            <a href="home.html">Home</a>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </div>
    <div class="main-content">
        <div class="login-container">
            <h2>Login</h2>
            <form action="CheckLogin" method="POST">
                <div class="input-group">
                    <i class="fa fa-user"></i>
                    <input type="text" name="username" placeholder="Username" required>
                </div>
                <div class="input-group">
                    <i class="fa fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" id="password" required>
                    <i class="fa fa-eye" id="togglePassword"></i>
                </div>
                <button type="submit">Login</button>
            </form>
            <a href="register.jsp" class="register-link">Don't have an account? Register</a>
        </div>
    </div>

    <c:if test="${requestScope.result != null}">
        <div id="alert-box" class="alert-box show">
            <c:choose>
                <c:when test="${requestScope.result}">
                    User logged in successfully!
                </c:when>
                <c:otherwise>
                    User login failed: <c:out value="${requestScope.message}" />
                </c:otherwise>
            </c:choose>
        </div>
    </c:if>

    <script>
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password');
        const alertBox = document.getElementById('alert-box');

        togglePassword.addEventListener('click', function (e) {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });

        if (alertBox && alertBox.classList.contains('show')) {
            setTimeout(() => {
                alertBox.classList.remove('show');
            }, 3000);
        }
    </script>
</body>
</html>
