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

    String stdID = request.getParameter("stdID");
    %>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Guest</title>
    <link rel="stylesheet" href="staff.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
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
                <li><a href="Staffdashboard.jsp" ><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                <li><a href="StaffroomS.jsp" ><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="StaffbookingS.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="StaffguestS.jsp" class="active"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="StaffstaffS.jsp"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            </ul>
        </nav>

        <div class="main-content">
            <header>
                <h1>Update Guest</h1>
            </header>
            <div class="breadcrumb">
                <a href="StaffguestS.jsp">Guest</a> / <a href="StaffguestSL.jsp" class="active">Guest List</a> / <a href="#" class="active">Update Guest</a>
            </div>
            <div class="back-button" onclick="history.back()">
                <i class="fas fa-arrow-left"></i> Back
            </div>
            <div class="content">
                <div class="form-container">
                    <sql:query var="guestDetails" dataSource="${myDatasource}">
                        SELECT * FROM STUDENT WHERE stdID = ?
                        <sql:param value="<%= stdID %>" />
                    </sql:query>
                    <c:forEach var="guest" items="${guestDetails.rows}">
                        <form action="UpdateGuestServlet" method="post">
                            <input type="hidden" name="stdID" value="${guest.stdID}">
                            <div class="form-group">
                                <label for="stdID">ID:</label>
                                <input type="text" id="stdID" name="stdID" value="${guest.stdID}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="stdName">Name:</label>
                                <input type="text" id="stdName" name="stdName" value="${guest.stdName}" required>
                            </div>
                            <div class="form-group">
                                <label for="stdIC">IC:</label>
                                <input type="text" id="stdIC" name="stdIC" value="${guest.stdIC}" required>
                            </div>
                            <div class="form-group">
                                <label for="stdPhone">Phone No:</label>
                                <input type="text" id="stdPhone" name="stdPhone" value="${guest.stdPhone}" required>
                            </div>
                            <div class="form-group">
                                <label for="stdAddress">Address:</label>
                                <input type="text" id="stdAddress" name="stdAddress" value="${guest.stdAddress}" required>
                            </div>
                            <div class="form-group">
                                <label for="stdIncome">Income:</label>
                                <input type="text" id="stdIncome" name="stdIncome" value="${guest.stdIncome}" required>
                            </div>
                            <div class="form-group">
                                <label for="stdParentPhoneNum">Parent Phone No:</label>
                                <input type="text" id="stdParentPhoneNum" name="stdParentPhoneNum" value="${guest.stdParentPhoneNum}" required>
                            </div>
                            <button type="submit">Update Guest</button>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
