<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="myDatasource" 
driver="org.apache.derby.jdbc.ClientDriver"
url="jdbc:derby://localhost:1527/InteriorDB" user="root" 
password="root"/>

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
    <title>Room</title>
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
                <li><a href="roomS.jsp" class="active"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="bookingS.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="guestS.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="staffS.jsp"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            </ul>
        </nav>
        
        <div class="main-content">
            <header>
                <h1>Room</h1>
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
                <a href="roomS.jsp">Room</a> / <a href="#" class="active">Room List</a>
            </div>

            <div class="content">
                <h1>Room List</h1>
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

                    // Get filter parameters
                    String capacity = request.getParameter("capacity");
                    String availability = request.getParameter("availability");
                    String roomType = request.getParameter("roomType");

                    // Construct the SQL query with filters
                    StringBuilder query = new StringBuilder("SELECT * FROM ROOM WHERE 1=1");
                    if (capacity != null && !capacity.isEmpty()) {
                        query.append(" AND MAX_CAPACITY = ").append(capacity);
                    }
                    if (availability != null && !availability.equals("all")) {
                        query.append(" AND AVAILABILITY = '").append(availability).append("'");
                    }
                    if (roomType != null && !roomType.equals("all")) {
                        query.append(" AND ROOMTYPE = '").append(roomType).append("'");
                    }
                    query.append(" OFFSET ").append(offset).append(" ROWS FETCH NEXT ").append(rowsPerPage).append(" ROWS ONLY");

                    String sqlQuery = query.toString();
                %>

                <sql:query var="room_list" dataSource="${myDatasource}" sql="<%= sqlQuery %>"/>

                <div class="table-container">
                    <div class="header-actions">
                        <form action="roomSC.jsp" method="get" style="display:inline;">
                            <button class="action-button">Create Room</button>
                        </form>
                        <div class="filter-dropdown">
                            <button class="action-button">Filter</button>
                            <div class="dropdown-menu">
                                <form action="roomSL.jsp" method="get" style="display:inline;">
                                    <label for="capacity">Capacity</label>
                                    <input type="number" name="capacity" id="capacity" min="1" max="10" />

                                    <label for="availability">Availability</label>
                                    <select name="availability" id="availability">
                                        <option value="all">All</option>
                                        <option value="available">Available</option>
                                        <option value="occupied">Occupied</option>
                                    </select>

                                    <label for="roomType">Room Type</label>
                                    <select name="roomType" id="roomType">
                                        <option value="all">All</option>
                                        <option value="Normal">Normal</option>
                                        <option value="Deluxe">Deluxe</option>
                                        <option value="Luxury">Luxury</option>
                                    </select>
                                    <button type="submit" class="apply-button">Apply</button>
                                    <button type="reset" class="clear-button">Clear</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Room ID</th>
                                <th>Block</th>
                                <th>Room Type</th>
                                <th>Max Capacity</th>
                                <th>Availability</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${room_list.rowsByIndex}">
                                <tr>
                                    <c:forEach var="column" items="${row}">
                                        <td><c:out value="${column}"/></td>
                                    </c:forEach>
                                    <td>
                                        <form action="StaffRoomDetails.jsp" method="get" style="display:inline;">
                                            <input type="hidden" name="roomID" value="${row[0]}"/>
                                            <button type="submit" class="view-button">View</button>
                                        </form>
                                        <form action="StaffRoomDetails.jsp" method="get" style="display:inline;">
                                            <input type="hidden" name="roomID" value="${row[0]}"/>
                                            <button type="submit" class="view-button">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <div class="pagination-container">
                        <form action="roomSL.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="page" value="<%= currentPage > 1 ? currentPage - 1 : 1 %>" />
                            <button type="submit" class="pagination-button">Prev</button>
                        </form>
                        <span>Page <%= currentPage %></span>
                        <form action="roomSL.jsp" method="get" style="display:inline;">
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
