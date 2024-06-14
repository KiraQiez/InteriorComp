
<!DOCTYPE html>
<html lang="en">
<head>
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
                <li><a href="dashboard.jsp" ><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                <li><a href="roomS.jsp" ><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="bookingS.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="guestS.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="staffS.jsp" class="active"><i class="fas fa-users"></i> <span>Staff</span></a></li>
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
                                <button type="submit" class="menu-button">Log Out</civ>
                            </form>
                        </div>
                    </div>
                </div>
            </header>
            <div class="breadcrumb">
                <a href="#" class="active">Staff</a> 
            </div>

            <div class="content">
                <h1>Staff</h1>
                <div class="navigation-card" onclick="window.location.href='guestList.jsp';">
                    <img src="resource/guest-list.png" alt="Guest List" class="card-image">
                    <div class="card-content">
                        <div class="card-title">Staff List</div>
                        <div class="card-description">View and manage all registered guests. This section allows for quick access to guest profiles, stay history, and contact information.</div>
                        <button class="card-button">View Guest List</button>
                    </div>
                </div>
            </div>
    </div>
</body>
</html>
