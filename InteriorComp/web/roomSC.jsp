<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Room</title>
    <link rel="stylesheet" href="staff.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        .form-container {
            background-color: #161b22;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }

        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #c9d1d9;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #c9d1d9;
        }

        .form-group select, 
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #30363d;
            border-radius: 4px;
            background-color: #0d1117;
            color: #c9d1d9;
        }

        .form-group select:focus, 
        .form-group input:focus {
            outline: none;
            border-color: #58a6ff;
        }

        button[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #0366d6;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #0255b6;
        }



        .back-button {
            display: inline-block;
            margin-bottom: 20px;
            color: #58a6ff;
            cursor: pointer;
            transition: color 0.3s;
        }

        .back-button:hover {
            color: #0366d6;
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
                <li><a href="dashboard.html"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                <li><a href="roomS.jsp" class="active"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="booking.html"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="guest.html"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="staff.html"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            </ul>
        </nav>

        <div class="main-content">
            <header>
                <h1>Create Room</h1>
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
                            <a href="#">Edit Profile</a>
                            <a href="#">Settings</a>
                            <a href="#">Log Out</a>
                        </div>
                    </div>
                </div>
            </header>
            <div class="breadcrumb">
                <a href="roomS.jsp">Room</a> / <a href="#" class="active">Create Room</a>
            </div>
            <div class="back-button" onclick="history.back()">
                <i class="fas fa-arrow-left"></i> Back
            </div>
            <div class="content">
                <div class="form-container">
                    <h1>Create Room</h1>
                    <form action="CreateRoom" method="post">
                        <div class="form-group">
                            <label for="roomType">Room Type:</label>
                            <select id="roomType" name="roomType" required>
                                <option value="Normal">Normal</option>
                                <option value="Deluxe">Deluxe</option>
                                <option value="Luxury">Luxury</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="block">Block:</label>
                            <select id="block" name="block" required>
                                <option value="A">Block A</option>
                                <option value="B">Block B</option>
                                <option value="C">Block C</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="capacity">Capacity:</label>
                            <input type="number" id="capacity" name="capacity" required>
                        </div>

                        <button type="submit">Create Room</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
