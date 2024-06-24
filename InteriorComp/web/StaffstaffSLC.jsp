<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    } else if (!rank.equals("Admin") && !rank.equals("Manager")) {
        response.sendRedirect("noPermS.jsp");
        return;
    }
    %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Staff</title>
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
                <li><a href="StaffguestS.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="StaffstaffS.jsp" class="active"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            </ul>
        </nav>

        <div class="main-content">
            <header>
                <h1>Create Staff</h1>
            </header>
            <div class="breadcrumb">
                <a href="StaffstaffS.jsp">Staff</a> / <a href="StaffstaffSL.jsp">Staff List</a> / <a href="#" class="active">Create Staff</a>
            </div>
            <div class="back-button" onclick="history.back()">
                <i class="fas fa-arrow-left"></i> Back
            </div>
            <div class="content">
                <div class="form-container">
                    <form action="CreateStaffServlet" method="post">
                        <div class="form-section-title"><strong>User Information</strong></div>
                        <br>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" id="username" name="username" required>
                        </div>
                        <div class="form-section-title"><strong>Staff Information</strong></div>
                        <br>
                        
                        <div class="form-group">
                            <label for="staffName">Staff Name:</label>
                            <input type="text" id="staffName" name="staffName" required>
                        </div>
                        <div class="form-group">
                            <label for="staffType">Staff Type:</label>
                            <select id="staffType" name="staffType" required>
                                <option value="Admin">Admin</option>
                                <option value="Manager">Manager</option>
                                <option value="Receptionist">Receptionist</option>
                                <option value="Housekeeper">Housekeeper</option>
                                <option value="Chef">Chef</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="staffAge">Staff Age:</label>
                            <input type="number" id="staffAge" name="staffAge" required>
                        </div>
                        <button type="submit">Create Staff</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
