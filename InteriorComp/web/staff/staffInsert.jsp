<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register New Staff</title>
    <link rel="stylesheet" href="staff.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
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
            width: 90%;
        }

        input[type="submit"] {
            background-color: #0366d6;
            cursor: pointer;
            border: none;
            margin-top: 20px;
            padding: 12px 25px;
        }

        input[type="submit"]:hover {
            background-color: #0255b6;
        }

        .form-section-title {
            padding-bottom: 5px;
            border-bottom: 1px solid #30363d;
            margin-bottom: 20px;
            color: #58a6ff;
            font-size: 18px;
        }

        .alert-box {
            display: none;
            position: fixed;
            top: 20%;
            left: 50%;
            transform: translateX(-50%);
            background: #0366d6;
            color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
            z-index: 1001;
            /* Ensure it's above other elements */
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
                <div class="profile-container">
                    <h1>Register New Staff</h1>
                    <form class="profile-form" action="#" method="POST">
                        <div class="form-section-title">Personal Information</div>
                        <div class="form-group">
                            <div class="form-group">
                                <label for="name">Name:</label>
                                <input type="text" id="name" name="name" placeholder="Enter your name">
                            </div>
                            <label for="username">Username:</label>
                            <input type="text" id="username" name="username" placeholder="Enter your username">
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" placeholder="Enter your email">
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number:</label>
                            <input type="text" id="phone" name="phone" placeholder="Enter your phone number">
                        </div>
                        <div class="form-group">
                            <label for="type">Staff Type:</label>
                            <select id="type" name="type">
                                <option value="manager">Manager</option>
                                <option value="clerk">Clerk</option>
                                <option value="maintenacestaff">Maintenace Staff</option>
                            </select>

                        </div>

                        <div class="form-section-title">Change Password</div>
                        <div class="form-group">
                            <label for="password">New Password:</label>
                            <input type="password" id="password" name="password" placeholder="Enter new password">
                        </div>
                        <div class="form-group">
                            <label for="confirm-password">Confirm New Password:</label>
                            <input type="password" id="confirm-password" name="confirm-password"
                                placeholder="Confirm new password">
                        </div>

                        <input type="submit" value="Save Changes">
                    </form>
                </div>


            </div>
        </div>
</body>

</html>