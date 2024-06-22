<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="myDatasource" 
driver="org.apache.derby.jdbc.ClientDriver"
url="jdbc:derby://localhost:1527/InteriorDB" user="root" 
password="root" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Block List</title>
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
                <li><a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                <li><a href="roomS.jsp"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="bookingS.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="guestS.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="staffS.jsp"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            </ul>
        </nav>
        
        <div class="main-content">
            <header>
                <h1>Block List</h1>
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
                            <span class="username">Username</span>
                            <span class="staff-rank">Manager</span>
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
                <a href="roomS.jsp">Room</a> / <a href="#" class="active">Block List</a>
            </div>

            <div class="content">
                <h1>Block List</h1>
                <%
                    int rowsPerPage = 10; 
                    int currentPage = 1; 
                    String pageParam = request.getParameter("page");
                    
                    if (pageParam != null) {
                        try {
                            currentPage = Integer.parseInt(pageParam);
                        } catch (NumberFormatException e) {
                            currentPage = 1; 
                        }
                    }
                    int offset = (currentPage - 1) * rowsPerPage;

                    // Construct the SQL query
                    String sqlQuery = "SELECT b.blockid, b.maxRoom, COUNT(r.roomid) AS currentRooms " +
                                      "FROM block b LEFT JOIN Room r ON b.blockid = r.blockid " +
                                      "GROUP BY b.blockid, b.maxRoom " +
                                      "OFFSET " + offset + " ROWS FETCH NEXT " + rowsPerPage + " ROWS ONLY";
                %>

                <sql:query var="block_list" dataSource="${myDatasource}" sql="<%= sqlQuery %>" />

                <div class="table-container">
                    <div class="header-actions">
                        <form action="roomSC.jsp" method="get" style="display:inline;">
                            <button class="action-button">Create Room</button>
                        </form>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Block ID</th>
                                <th>Max Room</th>
                                <th>Current Room Count</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${block_list.rowsByIndex}">
                                <tr>
                                    <td><c:out value="${row[0]}" /></td>
                                    <td><c:out value="${row[1]}" /></td>
                                    <td><c:out value="${row[2]}" /></td>
                                    <td>
                                        <form action="StaffRoomDetails.jsp" method="get" style="display:inline;">
                                            <input type="hidden" name="roomID" value="${row[0]}"/>
                                            <button type="submit" class="view-button">View</button>
                                        </form>
                                        <form action="${pageContext.request.contextPath}/DeleteBlock" method="get" style="display:inline;">
                                            <input type="hidden" name="blockID" value="${row[0]}"/>
                                            <button type="submit" class="view-button">Delete</button>
                                        </form>
                                        
                                        
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <div class="pagination-container">
                        <form action="blockList.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="page" value="<%= currentPage > 1 ? currentPage - 1 : 1 %>" />
                            <button type="submit" class="pagination-button">Prev</button>
                        </form>
                        <span>Page <%= currentPage %></span>
                        <form action="blockList.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="page" value="<%= currentPage + 1 %>" />
                            <button type="submit" class="pagination-button">Next</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
