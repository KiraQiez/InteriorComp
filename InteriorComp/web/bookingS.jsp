<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookings</title>
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
                <li><a href="roomS.jsp"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                <li><a href="bookingS.jsp" class="active"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                <li><a href="guestS.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                <li><a href="staffS.jsp"><i class="fas fa-users"></i> <span>Staff</span></a></li>
            </ul>
        </nav>

        <div class="main-content">
            <header>
                <h1>Booking</h1>
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
                <a href="#" class="active">Booking</a> 
            </div>
            <div class="content">
                <h1>Booking</h1>
                <div class="navigation-card" onclick="window.location.href='bookingList.jsp';">
                    <img src="resource/bookingList.png" alt="Booking List" class="card-image">
                    <div class="card-content">
                        <div class="card-title">Booking List</div>
                        <div class="card-description">View and manage all current hotel bookings. This includes modifications, updates, and cancellations.</div>
                        <button class="card-button">View Booking List</button>
                    </div>
                </div>

                <div class="navigation-card" onclick="window.location.href='requestList.jsp';">
                    <img src="resource/approval.png" alt="Request List" class="card-image">
                    <div class="card-content">
                        <div class="card-title">Request List</div>
                        <div class="card-description">Review and respond to booking requests awaiting approval or confirmation.</div>
                        <button class="card-button">View Request List</button>
                    </div>
                </div>

                <div class="navigation-card" onclick="window.location.href='billList.jsp';">
                    <img src="resource/bill.png" alt="Bill List" class="card-image">
                    <div class="card-content">
                        <div class="card-title">Bill List</div>
                        <div class="card-description">Manage and review all generated bills for services provided, ensuring accuracy and compliance.</div>
                        <button class="card-button">View Bill List</button>
                    </div>
                </div>

                <div class="navigation-card" onclick="window.location.href='receiptList.jsp';">
                    <img src="resource/receipt.png" alt="Receipt List" class="card-image">
                    <div class="card-content">
                        <div class="card-title">Receipt List</div>
                        <div class="card-description">Access a detailed list of all receipts issued for payments received, providing clear financial records.</div>
                        <button class="card-button">View Receipt List</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

