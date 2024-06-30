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
        .report-title {
            text-align: center;
            color: #ffffff;
            margin-bottom: 20px;
            text-transform: uppercase;
            font-size: 24px;
        }

        .report-card {
            background-color: #1f242a; /* Darker background color */
            border-radius: 10px;
            padding: 20px;
            width: 60%;
            margin: 0 auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Adjusted shadow */
        }

        .report-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            color: #c9d1d9;
            border-bottom: 1px solid #30363d; /* Separator line */
        }

        .problem-container {
            flex-grow: 1; /* Take remaining space */
        }

        .problem-details1,
        .problem-details2 {
            margin-bottom: 15px;
        }

        .problem-details1 input {
            width: 100%;
            padding: 10px;
            border: 1px solid #30363d;
            border-radius: 4px;
            background-color: #21262d;
            color: #c9d1d9;
            font-size: 16px;
        }

        .problem-details2 textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #30363d;
            border-radius: 4px;
            background-color: #21262d;
            color: #c9d1d9;
            font-size: 16px;
            resize: vertical; 
        }

        .submit-button {
            padding: 10px 20px;
            background-color: #0366d6;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .submit-button:hover {
            background-color: #0255b6;
        }
        .report-details {
            margin-left: 20px;
        margin-top: 20px; /* Adjusted margin-top to create space */
        }

        .report-info {
            margin-bottom: 10px; /* Adjusted margin-bottom for spacing between items */
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
                <li><a href="dashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                <li><a href="roomS.jsp"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="bookingS.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="guestS.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="staffS.jsp"><i class="fas fa-users"></i> <span>Staff</span></a></li>
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
                <h2 class="report-title">REPORT</h2>
                    <div class="report-card">
                        <div class="report-header">
                            <div class="problem-container">
                                <form method="post" action="studentReport">
                                    <div class="problem-details1">
                                        <input type="text" class="problem-input" name="reportTitle" placeholder="Enter your problem" required>
                                    </div>
                                    <div class="problem-details2">
                                        <textarea name="reportDesc" placeholder="Elaborate your concern" required></textarea>
                                    </div>
                                    <button type="submit" class="submit-button">SUBMIT</button>
                                </form>
                            </div>
                            <div class="report-details">
                                <p class="report-info"><b id="current-date"></b></p>
                                <p class="report-info"><b>Current Status:</b><span class="status-pending"><br>PENDING</span></p>
                            </div>
                        </div>
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