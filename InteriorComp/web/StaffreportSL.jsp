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
    <title>Report List</title>
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
                <li><a href="Staffdashboard.jsp"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                <li><a href="StaffroomS.jsp"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="StaffbookingS.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="StaffguestS.jsp" class="active"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="StaffstaffS.jsp"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            </ul>
        </nav>

        <div class="main-content">
            <header>
                <h1>Report List</h1>
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
                <a href="StaffreportSL.jsp">Report</a> / <a href="#" class="active">Report List</a>
            </div>

            <div class="content">
                <h1>Report List</h1>
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
                
                <sql:query var="report_list" dataSource="${myDatasource}">
                    SELECT reportID, reportTitle, reportStatus 
                    FROM REPORT 
                    ORDER BY reportID 
                    OFFSET <%= offset %> ROWS 
                    FETCH NEXT <%= rowsPerPage %> ROWS ONLY
                </sql:query>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Report ID</th>
                                <th>Title</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty report_list.rows}">
                                    <tr><td colspan="4">No reports available.</td></tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="row" items="${report_list.rows}">
                                        <tr>
                                            <td><c:out value="${row.reportID}"/></td>
                                            <td><c:out value="${row.reportTitle}"/></td>
                                            <td><c:out value="${row.reportStatus}"/></td>
                                            <td class="actions">
                                                <form action="StaffreportSLV.jsp" method="get" style="display:inline;">
                                                    <input type="hidden" name="reportID" value="${row.reportID}"/>
                                                    <button type="submit" class="view-button">View</button>
                                                </form>
                                                <form action="StaffreportSLU.jsp" method="get" style="display:inline;">
                                                    <input type="hidden" name="reportID" value="${row.reportID}"/>
                                                    <button type="submit" class="view-button">Update</button>
                                                </form>
                                                <form action="DeleteReportServlet" method="post" style="display:inline;">
                                                    <input type="hidden" name="reportID" value="${row.reportID}"/>
                                                    <button type="submit" class="view-button">Delete</button>
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
                                    Report created successfully!
                                </c:when>
                                <c:otherwise>
                                    Report creation failed: <c:out value="${sessionScope.createMessage}" />
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
                                    Report deleted successfully!
                                </c:when>
                                <c:otherwise>
                                    Report deletion failed: <c:out value="${sessionScope.deleteMessage}" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <%
                            session.removeAttribute("deleteResult");
                            session.removeAttribute("deleteMessage");
                        %>
                    </c:if>

                    <c:if test="${sessionScope.updateResult != null}">
                        <div id="alert-box" class="alert-box show">
                            <c:choose>
                                <c:when test="${sessionScope.updateResult}">
                                    Report updated successfully!
                                </c:when>
                                <c:otherwise>
                                    Report update failed: <c:out value="${sessionScope.updateMessage}" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <%
                            session.removeAttribute("updateResult");
                            session.removeAttribute("updateMessage");
                        %>
                    </c:if>

                    <div class="pagination-container">
                        <form action="StaffreportSL.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="page" value="<%= currentPage > 1 ? currentPage - 1 : 1 %>" />
                            <button type="submit" class="pagination-button">Prev</button>
                        </form>
                        <span>Page <%= currentPage %></span>
                        <form action="StaffreportSL.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="page" value="<%= currentPage + 1 %>" />
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
