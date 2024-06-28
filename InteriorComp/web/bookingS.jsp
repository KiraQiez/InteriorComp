<!DOCTYPE html>
<html lang="en">

<head>

    <% HttpSession currentSession=request.getSession(false); if (currentSession==null ||
        currentSession.getAttribute("loggedIn")==null || !(Boolean) currentSession.getAttribute("loggedIn")) {
        response.sendRedirect("login.jsp"); return; } String username=(String) currentSession.getAttribute("username");
        String rank=(String) currentSession.getAttribute("rank"); if(rank.equals("Guest")) {
        response.sendRedirect("home.jsp"); return; } %>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link rel="stylesheet" href="staff.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
        <style>
            .dashboard-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: space-between;
            }

            .dashboard-card {
                background-color: #21262d;
                border-radius: 8px;
                padding: 20px;
                flex: 1;
                min-width: 250px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                transition: transform 0.3s, box-shadow 0.3s;
                display: flex;
                align-items: center;
            }

            .dashboard-card:hover {
                transform: scale(1.05);
                box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
            }

            .dashboard-card .icon {
                font-size: 40px;
                margin-right: 20px;
                color: #58a6ff;
            }

            .dashboard-card h2 {
                margin: 0;
                font-size: 24px;
                color: #58a6ff;
            }

            .dashboard-card p {
                font-size: 18px;
                color: #c9d1d9;
                margin: 5px 0 0;
            }

            .chart-container {
                margin-top: 20px;
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
            }

            .chart {
                background-color: #21262d;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                flex: 1;
                min-width: 300px;
            }

            .statistics {
                display: flex;
                gap: 20px;
                margin-top: 20px;
            }

            .stat-item {
                background-color: #21262d;
                border-radius: 8px;
                padding: 20px;
                flex: 1;
                text-align: center;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .stat-item h3 {
                margin: 0;
                font-size: 22px;
                color: #58a6ff;
            }

            .stat-item p {
                font-size: 18px;
                color: #c9d1d9;
                margin: 5px 0 0;
            }

            .content {
                background: #161b22;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                color: #c9d1d9;
                margin-top: 20px;
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
                <li><a href="dashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                <li><a href="roomS.jsp"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="bookingS.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="guestS.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="staffS.jsp"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            </ul>
        </nav>

        <div class="main-content">
            <header>
                <h1>Dashboard</h1>
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
                            <span class="username">
                                <%=username%>
                            </span>
                            <span class="staff-rank">
                                <%=rank%>
                            </span>
                        </div>
                        <div class="dropdown-menu">
                            <form action="editSP.jsp" method="GET">
                                <button type="submit" class="menu-button">Edit Profile</button>
                            </form>
                            <form action="settingS.jsp" method="GET">
                                <button type="event" class="menu-button">Settings</button>
                            </form>
                            <form action="${pageContext.request.contextPath}/LogoutServlet" method="GET">
                                <input type="hidden" name="action" value="logout">
                                <button type="submit" class="menu-button">Log Out</button>
                            </form>
                        </div>
                    </div>
                </div>
            </header>
            <div class="breadcrumb">
                <a href="#" class="active">Dashboard</a>
            </div>

            <div class="content">
                <div class="dashboard-container">

                </div>
            </div>
        </div>
    </div>

</body>

</html>