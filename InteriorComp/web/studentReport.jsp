<%-- 
    Document   : studentReport
    Created on : Jun 13, 2024, 3:46:38 PM
    Author     : Iqmal
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
'
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:setDataSource var="myDatasource" 
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/Interior" 
                   user="root" 
                   password=" " />

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Report Page</title>
        <link rel="stylesheet" href="style.css">
        <style>
            .welcome-text {
                color: #fff;
                font-weight: 600;
                margin-left: 20px;
            }

            .report-title {
                text-align: center;
                color: #ff9900;
                margin-top: 5%;
                margin-bottom: 20px;
                text-transform: uppercase;
                font-size: 24px;
            }

            .report-card {
                background-color: #fff;
                border-radius: 10px;
                padding: 20px;
                width: 60%;
                height: auto;
                align-items: center;
                margin: 0 auto;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .report-header {
                display: flex;
                justify-content: space-between; /* Ensure space is distributed between items */
                align-items: flex-start; /* Align items at the start */
                margin-bottom: 20px;
                flex-wrap: nowrap; /* Prevent wrapping */

            }

            .problem-container {
                width: 60%; /* Adjust width to allow space for the report details */
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .problem-details1 {
                background-color: peachpuff;
                padding: 10px;
                border-radius: 5px;
                margin-bottom: 10px;
            }

            .problem-details2 {
                flex-grow: 1;
                background-color: peachpuff;
                padding: 10px;
                border-radius: 5px;
                margin-bottom: 10px;
            }

            .report-details {
                width: 35%; /* Adjust width for the report details */
                margin-left: 5%; /* Add some space between the two containers */
                color: #1D222D;
                padding: 10px;
                display: flex; /* Use flexbox to align items vertically */
                flex-direction: column; /* Column layout */
                justify-content: space-between; /* Space items to align submit button at the bottom */
                flex-grow: 1; /* Allow to grow and fill vertical space */
            }

            .problem-input {
                width: 100%;
                background-color: peachpuff;
                border: none;
                color: #1D222D;
                font-size: 20px;
                font-weight: bold;
                padding: 5px;
            }

            .problem-container textarea {
                width: 100%;
                height: 200px;
                border: none;
                background-color: peachpuff;
                color: #1D222D;
                font-size: 16px;
                padding: 10px;
                flex-grow: 1;
                resize: none; /* Prevent resizing */
            }

            .report-details p {
                margin: 10px 0;
            }

            .status-pending {
                color: #666;
                font-weight: bold;
                padding: 5px 10px;
                background-color: #ccc;
                border-radius: 5px;
                display: inline-block;
            }

            .submit-button {
                background-color: #fdae30;
                color: #1D222D;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
                align-self: center; /* Center the button horizontally */ 
            }

            .submit-button:hover {
                background-color: #f8ca7f;
            }
        </style>
    </head>
    <body>
        <header>
            <nav class="navbar">
                <div class="site-logo">
                    <svg class="logo" xmlns="http://www.w3.org/2000/svg" width="98" height="85" viewBox="0 0 98 85" fill="none">
                    <path d="M61.3353 7.62261L56.6131 2.59874C55.264 1.1635 53.0767 1.1635 51.7276 2.59874L2.44269 55.0316C1.09362 56.4669 1.09362 58.7939 2.44269 60.2291L7.16494 65.253C8.51402 66.6882 10.7013 66.6882 12.0504 65.253L61.3353 12.8201C62.6844 11.3849 62.6844 9.05786 61.3353 7.62261Z" fill="#FCDE57" />
                    <path d="M60.297 30.0619L55.4946 35.171C54.1869 36.5622 54.1869 38.8177 55.4946 40.2089L85.9131 72.5703C87.2207 73.9614 89.3408 73.9614 90.6485 72.5703L95.4508 67.4611C96.7585 66.07 96.7585 63.8145 95.4508 62.4233L65.0323 30.0619C63.7247 28.6707 61.6046 28.6707 60.297 30.0619Z" fill="#FCDE57" />
                    <path d="M70.1254 71.2642C70.799 71.9853 71.1771 72.9605 71.1771 73.9771C71.1771 74.9936 70.799 75.9688 70.1254 76.6899L65.4356 81.6792C64.7579 82.3958 63.8412 82.798 62.8857 82.798C61.9302 82.798 61.0135 82.3958 60.3357 81.6792L48.1516 68.7169C47.4739 68.0003 46.5572 67.5981 45.6017 67.5981C44.6462 67.5981 43.7295 68.0003 43.0518 68.7169L29.246 83.4045C28.5683 84.1211 27.6516 84.5233 26.6961 84.5233C25.7406 84.5233 24.8239 84.1211 24.1461 83.4045L19.7911 78.7713C19.1171 78.0514 18.739 77.0763 18.74 76.0601C18.741 75.0439 19.1209 74.0697 19.7963 73.3512L43.4361 48.2958C44.1152 47.5799 45.0325 47.1783 45.9886 47.1783C46.9446 47.1783 47.862 47.5799 48.5411 48.2958L70.1254 71.2642Z" fill="#FCDE57" />
                    </svg>
                    <h1>INTERIOR</h1>
                </div>

                <ul class="nav_links">
                    <li><a href="Homepage.html">Home</a></li>
                    <li><a href="login.jsp">Room</a></li>
                    <li><a href="Report.html" class="active">Report</a></li>
                    <li><a href="login.jsp">Profile</a></li>
                </ul>
            </nav>
        </header>

        <h2 class="report-title">REPORT</h2>
        <div class="report-card">
            <div class="report-header">
                <div class="problem-container">
                    <form method="post" action="studentReport">
                        <div class="problem-details1">
                            <input type="text" class="problem-input" name="reportTitle" placeholder="Enter your problem" required>
                        </div>
                        <div class="problem-details2">
                            <textarea name="reportDesc" placeholder="Elaborate your concern" required></textarea>
                        </div>
                        <button type="submit" class="submit-button">SUBMIT</button>
                    </form>
                </div>
                <div class="report-details">
                    <p class="report-info"><b id="current-date"></b></p>
                    <p class="report-info"><b>Current Status:</b><span class="status-pending"><br>PENDING</span></p>
                </div>
            </div>
        </div>
        <script>
        // Function to format date as DD-MM-YYYY
        function formatDate(date) {
            const day = String(date.getDate()).padStart(2, '0');
            const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are zero-indexed
            const year = date.getFullYear();
            return `${day}-${month}-${year}`;
        }

        // Get the current date
        const currentDate = new Date();

        // Format the date
        const formattedDate = formatDate(currentDate);

        // Insert the formatted date into the HTML
        document.getElementById('current-date').textContent = formattedDate;
    </script>
    </body>
</html>
