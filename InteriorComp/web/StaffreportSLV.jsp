<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="myDatasource" 
    driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/InteriorDB" 
    user="root" 
    password="root" />

<!DOCTYPE html>
<html lang="en">
<head>
    <%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("loggedIn") == null || !(Boolean) currentSession.getAttribute("loggedIn")) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) currentSession.getAttribute("username");
    String rank = (String) currentSession.getAttribute("rank");

    if(rank.equals("Guest")) {
        response.sendRedirect("home.jsp");
        return;
    }

    String reportId = request.getParameter("reportID");
    %>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Details</title>
    <link rel="stylesheet" href="staff.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        .details-container {
            background-color: #161b22;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: auto;
        }

        .details-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #c9d1d9;
        }

        .details-group {
            margin-bottom: 20px;
        }

        .details-group label {
            display: block;
            margin-bottom: 5px;
            color: #c9d1d9;
        }

        .details-group p {
            background-color: #0d1117;
            padding: 10px;
            border: 1px solid #30363d;
            border-radius: 4px;
            color: #c9d1d9;
        }

        .back-button {
            display: inline-block;
            margin-bottom: 20px;
            color: #58a6ff;
            cursor: pointer;
            transition: color 0.3s;
        }

        .back-button:hover {
            color: #0366d6;
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
                <li><a href="Staffdashboard.jsp"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                <li><a href="StaffroomS.jsp"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="StaffbookingS.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="StaffguestS.jsp" class="active"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="StaffstaffS.jsp"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            
            </ul>
        </nav>

        <div class="main-content">
            <header>
                <h1>Report Details</h1>
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
                            <form action="LogoutServlet" method="GET">
                                <input type="hidden" name="action" value="logout">
                                <button type="submit" class="menu-button">Log Out</button>
                            </form>
                        </div>
                    </div>
                </div>
            </header>
            <div class="breadcrumb">
                <a href="StaffreportSL.jsp">Report</a> / <a href="#" class="active">Report Details</a>
            </div>
            <div class="back-button" onclick="history.back()">
                <i class="fas fa-arrow-left"></i> Back
            </div>
            <div class="content">
                <div class="details-container">
                    <h1>Report Details</h1>
                    <sql:query var="reportDetails" dataSource="${myDatasource}">
                        SELECT r.*, s.stdName, hs.staffName AS handledByStaffName, cs.staffName AS checkedByStaffName
                        FROM REPORT r
                        JOIN STUDENT s ON r.studentID = s.stdID
                        JOIN STAFF hs ON r.handledByStaffID = hs.staffID
                        JOIN STAFF cs ON r.checkedByStaffID = cs.staffID
                        WHERE r.reportID = ?
                        <sql:param value="<%= reportId %>" />
                    </sql:query>
                    <c:forEach var="report" items="${reportDetails.rows}">
                        <div class="details-group">
                            <label for="reportID">Report ID:</label>
                            <p id="reportID"><c:out value="${report.reportID}"/></p>
                        </div>
                        <div class="details-group">
                            <label for="reportTitle">Report Title:</label>
                            <p id="reportTitle"><c:out value="${report.reportTitle}"/></p>
                        </div>
                        <div class="details-group">
                            <label for="reportDesc">Report Description:</label>
                            <p id="reportDesc"><c:out value="${report.reportDesc}"/></p>
                        </div>
                        <div class="details-group">
                            <label for="reportStatus">Report Status:</label>
                            <p id="reportStatus"><c:out value="${report.reportStatus}"/></p>
                        </div>
                        <div class="details-group">
                            <label for="studentID">Student ID:</label>
                            <p id="studentID"><c:out value="${report.studentID}"/></p>
                        </div>
                        <div class="details-group">
                            <label for="studentName">Student Name:</label>
                            <p id="studentName"><c:out value="${report.stdName}"/></p>
                        </div>
                        <div class="details-group">
                            <label for="handledByStaffID">Handled By:</label>
                            <p id="handledByStaffID"><c:out value="${report.handledByStaffName}"/></p>
                        </div>
                        <div class="details-group">
                            <label for="checkedByStaffID">Checked By:</label>
                            <p id="checkedByStaffID"><c:out value="${report.checkedByStaffName}"/></p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
