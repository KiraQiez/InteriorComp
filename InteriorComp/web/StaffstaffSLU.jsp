<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="myDatasource" 
    driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/InteriorDB" 
    user="root" 
    password="root" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Staff</title>
    <link rel="stylesheet" href="staff.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #0d1117;
            color: #c9d1d9;
            margin: 0;
            padding: 0;
        }
        
        .container {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }


        .main-content {
            flex: 1;
            padding: 20px;
        }

        .profile-container {
            padding: 20px;
            background-color: #161b22;
            color: #c9d1d9;
            max-width: 600px;
            margin: 40px auto;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        .profile-form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            margin-bottom: 5px;
            font-size: 16px;
            color: #c9d1d9;
        }

        input,
        select {
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #30363d;
            background-color: #0d1117;
            color: #c9d1d9;
            width: 100%;
        }

        input[readonly] {
            background-color: #2a2d34;
        }

        .form-buttons {
            display: flex;
            justify-content: space-between;
        }

        input[type="submit"],
        .delete-button {
            background-color: #0366d6;
            cursor: pointer;
            border: none;
            padding: 12px 25px;
            color: #ffffff;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
            flex: 1;
            margin-right: 10px;
        }

        input[type="submit"]:hover,
        .delete-button:hover {
            background-color: #0255b6;
        }

        .form-section-title {
            padding-bottom: 5px;
            border-bottom: 1px solid #30363d;
            margin-bottom: 20px;
            color: #58a6ff;
            font-size: 18px;
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
                <a href="StaffstaffS.jsp">Staff</a> / <a href="#" class="active">Update Staff</a>
            </div>

            <div class="content">
                <div class="profile-container">
                    <h1>Update Staff</h1>
                    <c:set var="staffID" value="${param.id}" />

                    <!-- SQL Query to fetch staff details -->
                    <sql:query var="staff" dataSource="${myDatasource}">
                        SELECT STAFFID, STAFFNAME, STAFFTYPE, STAFFAGE FROM STAFF WHERE STAFFID = ?
                        <sql:param value="${staffID}" />
                    </sql:query>

                    <form class="profile-form" action="UpdateStaffServlet" method="POST">
                        <div class="form-section-title">Personal Information</div>
                        <div class="form-group">
                            <label for="id">ID:</label>
                            <c:if test="${not empty staff.rows}">
                                <input type="text" id="id" name="id" value="${staff.rows[0].STAFFID}" readonly>
                            </c:if>
                        </div>
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <c:if test="${not empty staff.rows}">
                                <input type="text" id="name" name="name" value="${staff.rows[0].STAFFNAME}">
                            </c:if>
                        </div>
                        <div class="form-group">
                            <label for="type">Staff Type:</label>
                            <select id="type" name="type">
                                <c:if test="${not empty staff.rows}">
                                    <option value="Admin" <c:if test="${staff.rows[0].STAFFTYPE == 'Admin'}">selected</c:if>>Admin</option>
                                    <option value="Manager" <c:if test="${staff.rows[0].STAFFTYPE == 'Manager'}">selected</c:if>>Manager</option>
                                    <option value="Receptionist" <c:if test="${staff.rows[0].STAFFTYPE == 'Receptionist'}">selected</c:if>>Receptionist</option>
                                    <option value="Housekeeper" <c:if test="${staff.rows[0].STAFFTYPE == 'Housekeeper'}">selected</c:if>>Housekeeper</option>
                                    <option value="Chef" <c:if test="${staff.rows[0].STAFFTYPE == 'Chef'}">selected</c:if>>Chef</option>
                                </c:if>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="age">Age:</label>
                            <c:if test="${not empty staff.rows}">
                                <input type="number" id="age" name="age" value="${staff.rows[0].STAFFAGE}">
                            </c:if>
                        </div>
                        <input type="hidden" name="id" value="${staffID}">
                        <div class="form-buttons">
                            <input type="submit" value="Save Changes">
                            <form action="DeleteStaffServlet" method="POST" style="margin: 0;">
                                <input type="hidden" name="id" value="${staffID}">
                                <button type="submit" class="delete-button">Delete</button>
                            </form>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
