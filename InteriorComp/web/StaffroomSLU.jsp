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

    String roomId = request.getParameter("roomID");
    %>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Room</title>
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
                <li><a href="StaffroomS.jsp" class="active"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="StaffbookingS.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="StaffguestS.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="StaffstaffS.jsp"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            </ul>
        </nav>

        <div class="main-content">
            <header>
                <h1>Update Room</h1>
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
                <a href="StaffroomS.jsp">Room</a> / <a href="StaffroomSL.jsp">Room List</a> / <a href="#" class="active">Update Room</a>
            </div>
            <div class="back-button" onclick="history.back()">
                <i class="fas fa-arrow-left"></i> Back
            </div>
            <div class="content">
                <div class="form-container">
                    <h1>Update Room</h1>
                    <sql:query var="roomDetails" dataSource="${myDatasource}">
                        SELECT * FROM ROOM WHERE ROOMID = ?
                        <sql:param value="<%= roomId %>" />
                    </sql:query>
                    <sql:query var="blockList" dataSource="${myDatasource}">
                        SELECT BLOCKID FROM BLOCK
                    </sql:query>
                    <c:forEach var="room" items="${roomDetails.rows}">
                        <form action="UpdateRoomServlet" method="post">
                            <div class="form-group">
                                <label for="roomID">Room ID:</label>
                                <input type="text" id="roomID" name="roomID" value="${room.roomID}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="roomType">Room Type:</label>
                                <select id="roomType" name="roomType" required>
                                    <option value="Normal" <c:if test="${room.roomType == 'Normal'}">selected</c:if>>Normal</option>
                                    <option value="Deluxe" <c:if test="${room.roomType == 'Deluxe'}">selected</c:if>>Deluxe</option>
                                    <option value="Luxury" <c:if test="${room.roomType == 'Luxury'}">selected</c:if>>Luxury</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="block">Block:</label>
                                <select id="block" name="block" required>
                                    <c:forEach var="block" items="${blockList.rows}">
                                        <option value="${block.BLOCKID}" <c:if test="${room.blockID == block.BLOCKID}">selected</c:if>>Block ${block.BLOCKID}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="capacity">Capacity:</label>
                                <input type="number" id="capacity" name="capacity" value="${room.maxCapacity}" required>
                            </div>

                            <div class="form-group">
                                <label for="availability">Availability:</label>
                                <select id="availability" name="availability" required>
                                    <option value="Empty" <c:if test="${room.availability == 'Empty'}">selected</c:if>>Empty</option>
                                    <option value="Partially Occupied" <c:if test="${room.availability == 'Partially Occupied'}">selected</c:if>>Partially Occupied</option>
                                    <option value="Full" <c:if test="${room.availability == 'Full'}">selected</c:if>>Full</option>
                                </select>                                
                            </div>

                            <button type="submit">Update Room</button>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
