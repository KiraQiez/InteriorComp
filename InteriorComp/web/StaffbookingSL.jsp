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

            if (rank.equals("Guest")) {
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
                    <li><a href="Staffdashboard.jsp" ><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                    <li><a href="StaffroomS.jsp"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                    <li><a href="StaffbookingS.jsp" class="active"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                    <li><a href="StaffguestS.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                    <li><a href="StaffstaffS.jsp"><i class="fas fa-users"></i> <span>Staff</span></a></li>
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
                                <span class="username"><%= username%></span>
                                <span class="staff-rank"><%= rank%></span>
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
                    <a href="StaffbookingS.jsp">Booking</a> / <a href="StaffbookingSL.jsp" class="active">Booking List</a>
                </div>

                <div class="content">
                    <h1>Booking</h1>
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
                    %>

                    <sql:query var="book_list" dataSource="${myDatasource}">
                        SELECT * FROM BOOKING WHERE BOOKSTATUS='PENDING'
                        ORDER BY BOOKINGID
                        OFFSET <%= offset%> ROWS 
                        FETCH NEXT <%= rowsPerPage%> ROWS ONLY
                    </sql:query>

                    <div class="table-container">
                        <div class="header-actions">
                            <form action="StaffroomSLC.jsp" method="get" style="display:inline;">
                                <button class="action-button">Create Room</button>
                            </form>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Booking Date</th>
                                    <th>Student ID</th>
                                    <th>SESSION</th>
                                    <th>BOOK STATUS</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty book_list.rows}">
                                        <tr><td colspan="6">No room available.</td></tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="row" items="${book_list.rows}">
                                            <tr>
                                                <td><c:out value="${row.bookingID}"/></td>
                                                <td><c:out value="${row.bookingDate}"/></td>
                                                <td><c:out value="${row.STDID}"/></td>
                                                <td><c:out value="${row.SESSIONID}"/></td>
                                                <td><c:out value="${row.BOOKSTATUS}"/></td>
                                                <td class="actions">
                                                    <form action="AcceptBookingServlet" method="get" style="display:inline;">
                                                        <input type="hidden" name="bookingID" value="${row.bookingID}"/>
                                                        <button type="submit" class="view-button">Accept</button>
                                                    </form>
                                                        
                                                    <form action="StaffBookingDetails.jsp" method="get" style="display:inline;">
                                                        <input type="hidden" name="bookingID" value="${row.bookingID}"/>
                                                        <button type="submit" class="view-button">View</button>
                                                    </form>
                                                    
                                                    <form action="RejectBookingServlet" method="get" style="display:inline;">
                                                        <input type="hidden" name="bookingID" value="${row.bookingID}"/>
                                                        <button type="submit" class="view-button">Reject</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>

                        </table>

                        <c:if test="${sessionScope.createResult != null}">
                            <div id="alert-box" class="alert-box show">
                                <c:choose>
                                    <c:when test="${sessionScope.createResult}">
                                        Room created successfully!
                                    </c:when>
                                    <c:otherwise>
                                        Room creation failed: <c:out value="${sessionScope.createMessage}" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <%
                                session.removeAttribute("createResult");
                                session.removeAttribute("createMessage");
                            %>
                        </c:if>

                        <c:if test="${sessionScope.acceptResult != null}">
                            <div id="alert-box" class="alert-box show">
                                <c:choose>
                                    <c:when test="${sessionScope.acceptResult}">
                                        Booking accepted successfully!
                                    </c:when>
                                    <c:otherwise>
                                        Booking fail to be accepted!: <c:out value="${sessionScope.acceptMessage}" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <%
                                session.removeAttribute("acceptResult");
                                session.removeAttribute("acceptMessage");
                            %>
                        </c:if>

                        <c:if test="${sessionScope.rejectResult != null}">
                            <div id="alert-box" class="alert-box show">
                                <c:choose>
                                    <c:when test="${sessionScope.rejectResult}">
                                        Booking rejected!
                                    </c:when>
                                    <c:otherwise>
                                        Booking rejection failed: <c:out value="${sessionScope.rejectMessage}" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <%
                                session.removeAttribute("rejectResult");
                                session.removeAttribute("rejectMessage");
                            %>
                        </c:if>

                        <div class="pagination-container">
                            <form action="StaffroomSL.jsp" method="get" style="display:inline;">
                                <input type="hidden" name="page" value="<%= currentPage > 1 ? currentPage - 1 : 1%>" />
                                <button type="submit" class="pagination-button">Prev</button>
                            </form>
                            <span>Page <%= currentPage%></span>
                            <form action="StaffroomSL.jsp" method="get" style="display:inline;">
                                <input type="hidden" name="page" value="<%= currentPage + 1%>" />
                                <button type="submit" class="pagination-button">Next</button>
                            </form>
                        </div>
                    </div>
                </div>
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
