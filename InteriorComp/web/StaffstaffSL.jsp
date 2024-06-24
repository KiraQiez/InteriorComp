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
    %>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff List</title>
    <link rel="stylesheet" href="staff.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        .staff-container {
            margin-top: 20px;
        }

        .rank-section {
            margin-bottom: 40px;
        }

        .rank-title {
            font-size: 24px;
            color: #adbbcc;
            margin-bottom: 10px;
            border-bottom: 2px solid #adbbcc;
            display: inline-block;
            padding-bottom: 5px;
        }

        .staff-card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; 
        }

        .staff-card {
            background-color: #21262d;
            border-radius: 8px;
            padding: 20px;
            flex: 1;
            min-width: 250px;
            max-width: 300px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            align-items: center;
        }

        .staff-card:hover {
            transform: scale(1.05);
            box-shadow: 0 0 25px rgba(0,0,0,0.3);
            cursor: pointer;
        }

        .staff-card img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 2px solid #30363d;
            margin-right: 20px;
        }

        .staff-card .info {
            display: flex;
            flex-direction: column;
        }

        .staff-card h2 {
            margin: 0;
            font-size: 20px;
            color: #8094ab;
        }

        .staff-card p {
            font-size: 16px;
            color: #c9d1d9;
            margin: 5px 0 0;
        }

        .staff-card .staff-rank {
            font-size: 18px;
            color: gray;
        }

        .staff-card .age {
            font-size: 16px;
            color: gray;
        }

        .create-button {
            display: inline-block;
            margin: 20px 0;
            padding: 10px 20px;
            background-color: #0366d6;
            color: #ffffff;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
        }

        .create-button:hover {
            background-color: #025bb5;
        }

        .create-button-container {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
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
                <li><a href="Staffdashboard.jsp" ><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                <li><a href="StaffroomS.jsp" ><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="StaffbookingS.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="StaffguestS.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="StaffstaffS.jsp" class="active"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            </ul>
        </nav>
        
        <div class="main-content">
            <header>
                <h1>Staff</h1>
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
                <a href="StaffstaffS.jsp">Staff</a> / <a href="#" class="active">Staff List</a>
            </div>

            <div class="content">
                <div class="create-button-container">
                    <button class="create-button" onclick="window.location.href='StaffstaffSLC.jsp';">Create Staff</button>
                </div>
                <!-- Admin Section -->
                <div class="rank-section">
                    <h2 class="rank-title">Admin</h2>
                    <div class="staff-card-container">
                        <sql:query var="adminList" dataSource="${myDatasource}">
                            SELECT * FROM STAFF WHERE staffType = 'Admin'
                        </sql:query>
                        <c:forEach var="admin" items="${adminList.rows}">
                            <div class="staff-card" onclick="window.location.href='StaffstaffSLU.jsp?id=<c:out value="${admin.staffID}"/>';">
                                <img src="resource/adminPic.png" alt="Profile Picture">
                                <div class="info">
                                    <h2><c:out value="${admin.staffName}"/></h2>
                                    <p class="staff-rank">Admin</p>
                                    <p class="age">Age: <c:out value="${admin.staffAge}"/></p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Manager Section -->
                <div class="rank-section">
                    <h2 class="rank-title">Manager</h2>
                    <div class="staff-card-container">
                        <sql:query var="managerList" dataSource="${myDatasource}">
                            SELECT * FROM STAFF WHERE staffType = 'Manager'
                        </sql:query>
                        <c:forEach var="manager" items="${managerList.rows}">
                            <div class="staff-card" onclick="window.location.href='StaffstaffSLU.jsp?id=<c:out value="${manager.staffID}"/>';">
                                <img src="resource/adminPic.png" alt="Profile Picture">
                                <div class="info">
                                    <h2><c:out value="${manager.staffName}"/></h2>
                                    <p class="staff-rank">Manager</p>
                                    <p class="age">Age: <c:out value="${manager.staffAge}"/></p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Receptionist Section -->
                <div class="rank-section">
                    <h2 class="rank-title">Receptionist</h2>
                    <div class="staff-card-container">
                        <sql:query var="receptionistList" dataSource="${myDatasource}">
                            SELECT * FROM STAFF WHERE staffType = 'Receptionist'
                        </sql:query>
                        <c:forEach var="receptionist" items="${receptionistList.rows}">
                            <div class="staff-card" onclick="window.location.href='StaffstaffSLU.jsp?id=<c:out value="${receptionist.staffID}"/>';" >
                                <img src="resource/adminPic.png" alt="Profile Picture">
                                <div class="info" >
                                    <h2><c:out value="${receptionist.staffName}"/></h2>
                                    <p class="staff-rank">Receptionist</p>
                                    <p class="age">Age: <c:out value="${receptionist.staffAge}"/></p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Housekeeper Section -->
                <div class="rank-section">
                    <h2 class="rank-title">Housekeeper</h2>
                    <div class="staff-card-container">
                        <sql:query var="housekeeperList" dataSource="${myDatasource}">
                            SELECT * FROM STAFF WHERE staffType = 'Housekeeper'
                        </sql:query>
                        <c:forEach var="housekeeper" items="${housekeeperList.rows}">
                            <div class="staff-card" onclick="window.location.href='StaffstaffSLU.jsp?id=<c:out value="${housekeeper.staffID}"/>';">
                                <img src="resource/adminPic.png" alt="Profile Picture">
                                <div class="info">
                                    
                                    <h2><c:out value="${housekeeper.staffName}"/></h2>
                                    <p class="staff-rank">Housekeeper</p>
                                    <p class="age">Age: <c:out value="${housekeeper.staffAge}"/></p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                
                <!-- Chef Section -->
                <div class="rank-section">
                    <h2 class="rank-title">Chef</h2>
                    <div class="staff-card-container">
                        <sql:query var="chefList" dataSource="${myDatasource}">
                            SELECT * FROM STAFF WHERE staffType = 'Chef'
                        </sql:query>
                        <c:forEach var="chef" items="${chefList.rows}">
                            <div class="staff-card" onclick="window.location.href='StaffstaffSLU.jsp?id=<c:out value="${chef.staffID}"/>';">
                                <img src="resource/adminPic.png" alt="Profile Picture">
                                <div class="info">
                                    <h2><c:out value="${chef.staffName}"/></h2>
                                    <p class="staff-rank">Chef</p>
                                    <p class="age">Age: <c:out value="${chef.staffAge}"/></p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <c:if test="${sessionScope.updateResult != null}">
                        <div id="alert-box" class="alert-box show">
                            <c:choose>
                                <c:when test="${sessionScope.updateResult}">
                                    Staff updated successfully!
                                </c:when>
                                <c:otherwise>
                                    Staff update failed: <c:out value="${sessionScope.updateMessage}" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <%
                            session.removeAttribute("updateResult");
                            session.removeAttribute("updateMessage");
                        %>
            </c:if>
            <c:if test="${sessionScope.createResult != null}">
                        <div id="alert-box" class="alert-box show">
                            <c:choose>
                                <c:when test="${sessionScope.createResult}">
                                    Staff created successfully!
                                </c:when>
                                <c:otherwise>
                                    Staff create failed: <c:out value="${sessionScope.createMessage}" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <%
                            session.removeAttribute("createResult");
                            session.removeAttribute("createMessage");
                        %>
            </c:if>
            <c:if test="${sessionScope.deleteResult != null}">
                        <div id="alert-box" class="alert-box show">
                            <c:choose>
                                <c:when test="${sessionScope.deleteResult}">
                                    Staff deleated successfully!
                                </c:when>
                                <c:otherwise>
                                    Staff deletion failed: <c:out value="${sessionScope.deleteMessage}" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <%
                            session.removeAttribute("deleteResult");
                            session.removeAttribute("deleteMessage");
                        %>
            </c:if>

        </div>
    </div>

    <script>
        const alertBox = document.getElementById('alert-box');
        
        if (alertBox) {
            setTimeout(() => {
                alertBox.classList.remove('show');
            }, 3000);
        }


    </script>
</body>

</html>
