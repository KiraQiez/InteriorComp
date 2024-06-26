<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<sql:setDataSource var="myDatasource_1" 
driver="org.apache.derby.jdbc.ClientDriver"
 url="jdbc:derby://localhost:1527/InteriorDB" user="root" 
password="root"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="normal">
    <header>
        <nav class="navbar">
            <div class="site-logo">
                <svg class="logo" xmlns="http://www.w3.org/2000/svg" width="98" height="85" viewBox="0 0 98 85" fill="none">
                    <path d="M61.3353 7.62261L56.6131 2.59874C55.264 1.1635 53.0767 1.1635 51.7276 2.59874L2.44269 55.0316C1.09362 56.4669 1.09362 58.7939 2.44269 60.2291L7.16494 65.253C8.51402 66.6882 10.7013 66.6882 12.0504 65.253L61.3353 12.8201C62.6844 11.3849 62.6844 9.05786 61.3353 7.62261Z" fill="#FCDE57" />
                    <path d="M60.297 30.0619L55.4946 35.171C54.1869 36.5622 54.1869 38.8177 55.4946 40.2089L85.9131 72.5703C87.2207 73.9614 89.3408 73.9614 90.6485 72.5703L95.4508 67.4611C96.7585 66.07 96.7585 63.8145 95.4508 62.4233L65.0323 30.0619C63.7247 28.6707 61.6046 28.6707 60.297 30.0619Z" fill="#FCDE57" />
                    <path d="M70.1254 71.2642C70.799 71.9853 71.1771 72.9605 71.1771 73.9771C71.1771 74.9936 70.799 75.9688 70.1254 76.6899L65.4356 81.6792C64.7579 82.3958 63.8412 82.798 62.8857 82.798C61.9302 82.798 61.0135 82.3958 60.3357 81.6792L48.1516 68.7169C47.4739 68.0003 46.5572 67.5981 45.6017 67.5981C44.6462 67.5981 43.7295 68.0003 43.0518 68.7169L29.246 83.4045C28.5683 84.1211 27.6516 84.5233 26.6961 84.5233C25.7406 84.5233 24.8239 84.1211 24.1461 83.4045L19.7911 78.7713C19.1171 78.0514 18.739 77.0763 18.74 76.0601C18.741 75.0439 19.1209 74.0697 19.7963 73.3512L43.4361 48.2958C44.1152 47.5799 45.0325 47.1783 45.9886 47.1783C46.9446 47.1783 47.862 47.5799 48.5411 48.2958L70.1254 71.2642Z" fill="#FCDE57" />
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
        <div class="loginChange">
            <h1>Hello friend!</h1>
            <p>Already have an account?
                <br>
                Sign In now!</p>
            <form action="login.jsp">
                <button type="submit">Sign In</button>
            </form>
        </div>
 
        <c:set var="username" value="${param.username}"/>  
        <c:set var="password" value="${param.password}"/>

        <c:set var="usertype" value="student"/>
        
        <c:if test="${(username != null) && (password != null)}">
            <sql:update dataSource="${myDatasource_1}" var="result">
                INSERT INTO USERS (username, password, usertype)
                VALUES (?, ?, ?)
                <sql:param value="${username}"/>  
                <sql:param value="${password}"/>
                <sql:param value="${usertype}"/> 
            </sql:update>
        </c:if>
        
        <div class="login">
            <h1>Register</h1>
            <form action="register.jsp" method="post">
                <input type="text" name="username" placeholder="Username" id="username" required>
                <input type="password" name="password" placeholder="Password" id="password" required>
                <button type="submit">Register</button>
                
            <c:if test="${result >= 1}">
                <p class="message">User registered successfully!</p>
            </c:if>
            <c:if test="${result < 1}">
                <p class="error-message">Error: User registration failed.</p>
            </c:if>


            </form>
        </div>
    </div>
</body>
</html>
