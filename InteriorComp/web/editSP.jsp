<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="staff.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .profile-container {
            padding: 20px;
            background-color: #161b22;
            color: #c9d1d9;
            max-width: 600px;
            margin: 40px auto;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
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

        input, select {
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
            box-shadow: 0 4px 6px rgba(0,0,0,0.5);
            z-index: 1001; /* Ensure it's above other elements */
        }
    </style>
    <script>
        function saveProfile(e) {
            e.preventDefault(); // Stop form from submitting normally
            var alertBox = document.getElementById('alert-box');
            alertBox.style.display = 'block'; // Show the alert box
            setTimeout(function() {
                alertBox.style.display = 'none'; // Hide the alert box after 2 seconds
            }, 2000);
        }
    </script>
</head>
<body>
    <% String Header="Student List" ; %>
    <% String dHeader="Student" ; %>
        <%@ include file="StaffHeader.jsp" %>
            <div class="breadcrumb">
                <a href="Staffdashboard.jsp">Dashboard</a> / <a href="#" class="active">Edit Profile</a>
            </div>

            <div class="profile-container">
                <h1>Profile Settings</h1>
                <form class="profile-form" onsubmit="saveProfile(event)">
                    <div class="form-section-title">Personal Information</div>
                    <div class="form-group">
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
                    
                    <div class="form-section-title">Change Password</div>
                    <div class="form-group">
                        <label for="password">New Password:</label>
                        <input type="password" id="password" name="password" placeholder="Enter new password">
                    </div>
                    <div class="form-group">
                        <label for="confirm-password">Confirm New Password:</label>
                        <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm new password">
                    </div>
    
                    <input type="submit" value="Save Changes">
                </form>
            </div>
            <div id="alert-box" class="alert-box">Profile Updated Successfully!</div>
        </div>
    </div>
</body>
</html>
