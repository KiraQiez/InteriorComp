<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>No Permission</title>
    <link rel="stylesheet" href="staff.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        .no-permission-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
            color: #c9d1d9;
            background: url('resource/no_permission_bg.jpg') no-repeat center center;
            background-size: cover;
            padding: 20px;
        }

        .no-permission-box {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            max-width: 500px;
            width: 100%;
        }

        .no-permission-box h1 {
            font-size: 48px;
            color: #ff4f4f;
            margin-bottom: 20px;
        }

        .no-permission-box p {
            font-size: 20px;
            margin-bottom: 40px;
            color: #c9d1d9;
        }

        .back-button1, .home-button {
            background-color: #0366d6;
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 18px;
            transition: background-color 0.3s, transform 0.3s;
            margin: 10px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .back-button1:hover, .home-button:hover {
            background-color: #0255b6;
            transform: translateY(-3px);
        }

        .icon {
            font-size: 100px;
            color: #ff4f4f;
            margin-bottom: 20px;
            animation: shake 0.5s;
            animation-iteration-count: infinite;
        }

        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
            100% { transform: translateX(0); }
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
                <li><a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                <li><a href="roomS.jsp"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="booking.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="guest.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="staff.jsp"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            </ul>
        </nav>

        <div class="main-content">
            <header>
                <h1>No Permission</h1>
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
                <a href="#" class="active">No Permission</a>
            </div>
            <div class="no-permission-container">
                <div class="no-permission-box">
                    <i class="fas fa-lock icon"></i>
                    <h1>No Permission</h1>
                    <p>Sorry, you do not have permission to access this page.</p>
                    <a href="javascript:history.back()" class="back-button1"><i class="fas fa-arrow-left"></i> Back</a>
                    <a href="dashboard.jsp" class="home-button"><i class="fas fa-home"></i> Home</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
