<%-- 
    Document   : studentReport
    Created on : Jun 13, 2024, 3:46:38 PM
    Author     : Iqmal
--%>
<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("loggedIn") == null || !(Boolean) currentSession.getAttribute("loggedIn")) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) currentSession.getAttribute("username");
    String rank = (String) currentSession.getAttribute("rank");
    String ID = (String) currentSession.getAttribute("ID");
%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
'
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:setDataSource var="myDatasource" 
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/Interior" 
                   user="root" 
                   password=" " />

                   <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="guest.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
            .dashboard-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: space-between;
            }

            .dashboard-card {
                background-color: #21262d;
                border-radius: 8px;
                padding: 20px;
                flex: 1;
                min-width: 250px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                transition: transform 0.3s, box-shadow 0.3s;
                display: flex;
                align-items: center;
            }

            .dashboard-card:hover {
                transform: scale(1.05);
                box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
            }

            .dashboard-card .icon {
                font-size: 40px;
                margin-right: 20px;
                color: #58a6ff;
            }

            .dashboard-card h2 {
                margin: 0;
                font-size: 24px;
                color: #58a6ff;
            }

            .dashboard-card p {
                font-size: 18px;
                color: #c9d1d9;
                margin: 5px 0 0;
            }

            .chart-container {
                margin-top: 20px;
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
            }

            .chart {
                background-color: #21262d;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                flex: 1;
                min-width: 300px;
            }

            .statistics {
                display: flex;
                gap: 20px;
                margin-top: 20px;
            }

            .stat-item {
                background-color: #21262d;
                border-radius: 8px;
                padding: 20px;
                flex: 1;
                text-align: center;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .stat-item h3 {
                margin: 0;
                font-size: 22px;
                color: #58a6ff;
            }

            .stat-item p {
                font-size: 18px;
                color: #c9d1d9;
                margin: 5px 0 0;
            }

            .content {
                background: #161b22;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                color: #c9d1d9;
                margin-top: 20px;
            }
            .form-container {
                background-color: #161b22;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                margin: auto;
            }

            .form-container h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #c9d1d9;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                color: #c9d1d9;
            }

            .form-group select{
                width: 100%;
            }

            .form-group input{
                width: 97%;
            }

            .form-group select, 
            .form-group input,
            .form-group textarea{ 
                padding: 10px;
                border: 1px solid #30363d;
                border-radius: 4px;
                background-color: #0d1117;
                color: #c9d1d9;
            }
    
            .form-group select:focus, 
            .form-group input:focus,
            .form-group textarea:focus{
                outline: none;
                border-color: #58a6ff;
            }

            .form-container button[type="submit"] {
                display: block;
                width: 100%;
                padding: 10px;
                background-color: #0366d6;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background 0.3s;
            }

            .form-container button[type="submit"]:hover {
                background-color: #0255b6;
            }
        </style>
</head>
<body>
    <div class="container">
        <nav class="navbar">
            <div class="logo">
                <img src="resource/logo.svg" alt="Logo">
                <span>INTERIOR</span>
            </div>
            <div class="profile">
                <img src="resource/adminPic.png" alt="Admin Profile Picture">
            </div>
            <ul>
                <li><a href="Studentdashboard.jsp"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                <li><a href="roomS.jsp"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="StudentbookingS.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="guestS.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="Studentreport.jsp"  class="active"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            </ul>
        </nav>
        
        <div class="main-content">
            <header>
                <h1>Dashboard</h1>
                <div class="search-profile">
                    <div class="search-bar">
                        <input type="text" placeholder="Search...">
                        <button><i class="fas fa-search"></i></button>
                    </div>
                    <div class="user-profile">
                        <div class="profile-pic-container">
                            <img src="resource/adminPic.png" alt="Profile Picture">
                        </div>
                        <div class="profile-info">
                            <span class="username"><%= username %></span>
                            <span class="staff-rank"><%= rank %></span>
                        </div>
                        <div class="dropdown-menu">
                            <form action="editSP.jsp" method="GET">
                                <button type="submit" class="menu-button">Edit Profile</button>
                            </form>
                            <form action="settingS.jsp" method="GET">
                                <button type="event" class="menu-button">Settings</button>
                            </form>
                            <form action="${pageContext.request.contextPath}/LogoutServlet" method="GET">
                                <input type="hidden" name="action" value="logout">
                                <button type="submit" class="menu-button">Log Out</button>
                            </form>
                        </div>
                    </div>
                </div>
            </header>

            <div class="content">
                <div class="form-container">
                        <h1>Report</h1>

                        <form action="insertReport" method="post">
                            <div class="form-group">
                                <input type="text" class="problem-input" name="reportTitle" placeholder="Report Title" required>
                            </div>
                            <div class="form-group">
                                <textarea name="reportDesc" placeholder="Elaborate your concern" required></textarea>
                            </div>
                            <button type="submit">Submit Report</button>
                        </form>
                    </div>
                    <script>
                    // Function to format date as DD-MM-YYYY
                    function formatDate(date) {
                        const day = String(date.getDate()).padStart(2, '0');
                        const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are zero-indexed
                        const year = date.getFullYear();
                        return `${day}-${month}-${year}`;
                    }

                    // Get the current date
                    const currentDate = new Date();

                    // Format the date
                    const formattedDate = formatDate(currentDate);

                    // Insert the formatted date into the HTML
                    document.getElementById('current-date').textContent = formattedDate;
                </script>
            </div>
            
        </div>
              
    </div>
    
</body>
</html>