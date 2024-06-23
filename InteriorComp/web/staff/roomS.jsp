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
                <a href="#" class="active">Room</a>
            </div>
            <div class="content">
                <h1>Room</h1>
                <!-- Room List Card -->
                <div class="navigation-card" onclick="window.location.href='roomSL.jsp';">
                    <img src="resource/bookingList.png" alt="Room List" class="card-image">
                    <div class="card-content">
                        <div class="card-title">Room List</div>
                        <div class="card-description">Explore our comprehensive list of available rooms.</div>
                        <button class="card-button">View Room List</button>
                    </div>
                </div>
                <!-- Create Room Card -->
                <div class="navigation-card" onclick="window.location.href='roomSC.jsp';">
                    <img src="resource/house.png" alt="Create Room" class="card-image">
                    <div class="card-content">
                        <div class="card-title">Create Room</div>
                        <div class="card-description">Set up a new room within our system.</div>
                        <button class="card-button">Create Room</button>
                    </div>
                </div>
                <!-- Block List Card -->
                <div class="navigation-card" onclick="window.location.href='blockSL.jsp';">
                    <img src="resource/block-list.png" alt="Block List" class="card-image">
                    <div class="card-content">
                        <div class="card-title">Block List</div>
                        <div class="card-description">Manage and review all room blocks and their statuses.</div>
                        <button class="card-button">View Block List</button>
                    </div>
                </div>
                <!-- Create Block Card -->
                <div class="navigation-card" onclick="window.location.href='blockSC.jsp';">
                    <img src="resource/block.png" alt="Create Block" class="card-image">
                    <div class="card-content">
                        <div class="card-title">Create Block</div>
                        <div class="card-description">Initiate new blocks for room allocation, perfect for expanding your property's capacity.</div>
                        <button class="card-button">Create Block</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
