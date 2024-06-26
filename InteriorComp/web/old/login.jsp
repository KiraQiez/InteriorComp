<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <header>
        <nav class="navbar">
            <div class="site-logo">
                <svg class="logo" xmlns="http://www.w3.org/2000/svg" width="98" height="85" viewBox="0 0 98 85"
                    fill="none">
                </svg>
                <h1>INTERIOR</h1>
            </div>
            <ul class="nav_links">
                <li><a class="active" href="home.jsp">Home</a></li>
                <li><a href="#">Room</a></li>
                <li><a href="#">Report</a></li>
                <li><a href="#">Profile</a></li>
            </ul>
        </nav>
    </header>
    <div class="board">
        <div class="login">
            <h1>Login</h1>
            <form action="CheckLogin" method="post">
                <input type="text" name="username" placeholder="Username" required value="${param.username}">
                <input type="password" name="password" placeholder="Password" required value="${param.password}">
                <button type="submit">Login</button>
                <c:if test="${not empty errorMessage}">
                    <div class="error-message" >${errorMessage}</div>
                </c:if>
            </form>
        </div>
        <div class="loginChange">
            <h1>Hello friend!</h1>
            <p>Did you have an account yet?
                <br>
                No? Register a new account now:</p>
            <form action="register.jsp">
                <button type="submit">Register</button>
            </form>
        </div>
    </div>
</body>

</html>
