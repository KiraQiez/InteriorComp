<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="myDatasource" 
driver="org.apache.derby.jdbc.ClientDriver"
url="jdbc:derby://localhost:1527/InteriorDB" user="root" 
password="root"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff List</title>
    <link rel="stylesheet" href="staff.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        .staff-container {
            margin-top: 20px;
        }

        .rank-section {
            margin-bottom: 40px;
        }

        .rank-title {
            font-size: 24px;
            color: #58a6ff;
            margin-bottom: 10px;
            border-bottom: 2px solid #58a6ff;
            display: inline-block;
            padding-bottom: 5px;
        }

        .staff-card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; 

        }

        .staff-card {
            background-color: #21262d;
            border-radius: 8px;
            padding: 20px;
            flex: 1;
            min-width: 250px;
            max-width: 300px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            align-items: center;
        }

        .staff-card:hover {
            transform: scale(1.05);
            box-shadow: 0 0 25px rgba(0,0,0,0.3);
            cursor: pointer;
        }

        .staff-card img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 2px solid #30363d;
            margin-right: 20px;
        }

        .staff-card .info {
            display: flex;
            flex-direction: column;
        }

        .staff-card h2 {
            margin: 0;
            font-size: 20px;
            color: #58a6ff;
        }

        .staff-card p {
            font-size: 16px;
            color: #c9d1d9;
            margin: 5px 0 0;
        }

        .staff-card .staff-rank {
            font-size: 18px;
            color: gray;
        }

        .staff-card .age {
            font-size: 16px;
            color: gray;
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
                                <button type="submit" class="menu-button">Log Out</button>
                            </form>
                        </div>
                    </div>
                </div>
            </header>
            <div class="breadcrumb">
                <a href="staffS.jsp">Staff</a> / <a href="#" class="active">Staff List</a>
            </div>

            <div class="content">
                <!-- Admin Section -->
                <div class="rank-section">
                    <h2 class="rank-title">Admin</h2>
                    <div class="staff-card-container">
                        <div class="staff-card">
                            <img src="resource/adminPic.png" alt="Profile Picture">
                            <div class="info">
                                <h2>Tim Cook</h2>
                                <p class="staff-rank">Admin</p>
                                <p class="age">Age: 60</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Manager Section -->
                <div class="rank-section">
                    <h2 class="rank-title">Manager</h2>
                    <div class="staff-card-container">
                        <div class="staff-card">
                            <img src="resource/adminPic.png" alt="Profile Picture">
                            <div class="info">
                                <h2>Ali</h2>
                                <p class="staff-rank">Manager</p>
                                <p class="age">Age: 35</p>
                            </div>
                        </div>
                        <div class="staff-card">
                            <img src="resource/adminPic.png" alt="Profile Picture">
                            <div class="info">
                                <h2>Alia</h2>
                                <p class="staff-rank">Manager</p>
                                <p class="age">Age: 32</p>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <!-- Receptionist Section -->
                <div class="rank-section">
                    <h2 class="rank-title">Receptionist</h2>
                    <div class="staff-card-container">
                        <div class="staff-card">
                            <img src="resource/adminPic.png" alt="Profile Picture">
                            <div class="info">
                                <h2>Jane Smith</h2>
                                <p class="staff-rank">Receptionist</p>
                                <p class="age">Age: 28</p>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <!-- Housekeeper Section -->
                <div class="rank-section">
                    <h2 class="rank-title">Housekeeper</h2>
                    <div class="staff-card-container">
                        <div class="staff-card">
                            <img src="resource/adminPic.png" alt="Profile Picture">
                            <div class="info">
                                <h2>Mike Johnson</h2>
                                <p class="staff-rank">Housekeeper</p>
                                <p class="age">Age: 40</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Chef Section -->
                <div class="rank-section">
                    <h2 class="rank-title">Chef</h2>
                    <div class="staff-card-container">
                        <div class="staff-card">
                            <img src="resource/adminPic.png" alt="Profile Picture">
                            <div class="info">
                                <h2>Susan Brown</h2>
                                <p class="staff-rank">Chef</p>
                                <p class="age">Age: 45</p>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
