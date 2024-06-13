<%-- 
    Document   : studentRoomBooking
    Created on : Jun 13, 2024, 10:30:34 AM
    Author     : Iqmal
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/INTERIOR" user="root" password=" " />
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html lang="en">

    <head>
        <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Room Booking</title>
                <link rel="stylesheet" href="style.css">
                    <style>
                        /* BASE STYLES */
                        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');
                        /* END OF BASE STYLES */
                        /* START NEW CSS FROM HERE */

                        body {
                            background: #1D222D;
                        }

                        .container {
                            min-height: 600px;
                        }

                        .container-table {
                            border-spacing: 1em;
                            width: 700px;
                            height: 50%;
                        }

                        .input-wrapper {
                            background: #fefefe;
                            border-radius: 15px;
                            padding: 15px;
                        }

                        .input-table {
                            border-spacing: 1em;
                            width: 100%;
                            height: 60%;
                        }

                        .input-box {
                            width: 100%;
                        }

                        #roomType,
                        .input-box select,
                        .input-box input {
                            width: 100%;
                            height: 40px;
                            background-color: #D9D9D9;
                            border: none;
                            border-radius: 10px;
                            padding: 0 15px;
                            box-sizing: border-box;
                            color: #000000;
                        }

                        .input-box input::placeholder {
                            color: #ffffff;
                        }

                        .submit-btn button {
                            display: inline-block;
                            width: 60%;
                            padding: 10px 0;
                            font-size: 18px;
                            border-radius: 10px;
                            background-color: #fdae30;
                            color: #ffffff;
                            font-weight: bold;
                            border: none;
                            cursor: pointer;
                            transition: background-color 0.3s;
                        }

                        .label {
                            text-align: right;
                            font-weight: 600;
                            width: 150px;
                            padding: 10px;
                        }

                        .create-btn:hover {
                            background-color: #ffcf67;
                        }

                        .total-payment {
                            background-color: #D9D9D9;
                            font-size: 24px;
                            padding: 15px;
                            border-radius: 15px;
                        }

                        .submit-btn {
                            text-align: center;
                        }
                    </style>
                    </head>

                    <body>
                        <header>
                            <nav class="navbar">
                                <div class="site-logo">
                                    <svg class="logo" xmlns="http://www.w3.org/2000/svg" width="98" height="85" viewBox="0 0 98 85"
                                         fill="none">
                                        <path
                                            d="M61.3353 7.62261L56.6131 2.59874C55.264 1.1635 53.0767 1.1635 51.7276 2.59874L2.44269 55.0316C1.09362 56.4669 1.09362 58.7939 2.44269 60.2291L7.16494 65.253C8.51402 66.6882 10.7013 66.6882 12.0504 65.253L61.3353 12.8201C62.6844 11.3849 62.6844 9.05786 61.3353 7.62261Z"
                                            fill="#FCDE57" />
                                        <path
                                            d="M60.297 30.0619L55.4946 35.171C54.1869 36.5622 54.1869 38.8177 55.4946 40.2089L85.9131 72.5703C87.2207 73.9614 89.3408 73.9614 90.6485 72.5703L95.4508 67.4611C96.7585 66.07 96.7585 63.8145 95.4508 62.4233L65.0323 30.0619C63.7247 28.6707 61.6046 28.6707 60.297 30.0619Z"
                                            fill="#FCDE57" />
                                        <path
                                            d="M70.1254 71.2642C70.799 71.9853 71.1771 72.9605 71.1771 73.9771C71.1771 74.9936 70.799 75.9688 70.1254 76.6899L65.4356 81.6792C64.7579 82.3958 63.8412 82.798 62.8857 82.798C61.9302 82.798 61.0135 82.3958 60.3357 81.6792L48.1516 68.7169C47.4739 68.0003 46.5572 67.5981 45.6017 67.5981C44.6462 67.5981 43.7295 68.0003 43.0518 68.7169L29.246 83.4045C28.5683 84.1211 27.6516 84.5233 26.6961 84.5233C25.7406 84.5233 24.8239 84.1211 24.1461 83.4045L19.7911 78.7713C19.1171 78.0514 18.739 77.0763 18.74 76.0601C18.741 75.0439 19.1209 74.0697 19.7963 73.3512L43.4361 48.2958C44.1152 47.5799 45.0325 47.1783 45.9886 47.1783C46.9446 47.1783 47.862 47.5799 48.5411 48.2958L70.1254 71.2642Z"
                                            fill="#FCDE57" />
                                    </svg>
                                    <h1>INTERIOR</h1>
                                </div>

                                <ul class="nav_links">
                                    <li><a href="login.jsp">Home</a></li>
                                    <li><a class="active" href="login.jsp">Room</a></li>
                                    <li><a href="login.jsp">Report</a></li>
                                    <li><a href="login.jsp">Profile</a></li>
                                </ul>
                            </nav>
                        </header>

                        <div class="container">
                            <form action="#">
                                <table class="container-table">
                                    <tr>
                                        <td colspan="2">
                                            <div class="input-wrapper">
                                                <c:set var="roomType" value="${param.roomType}"/>
                                                <form action="insertBooking.java">
                                                    <table class="input-table">
                                                        <tr>
                                                            <td class="label">Room Type: </td>
                                                            <td>
                                                                <input id="roomType" type="text" value='Basic' readonly>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td class="label">Room No: </td>
                                                            
                                                            <td>
                                                                <div class="input-box">
                                                                  <input id='roomNumber' type="text">
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td class="label">User IC: </td>
                                                            <td>
                                                                <div class="input-box">
                                                                    <input id='IC' type="text">
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td class="label">Phone No: </td>
                                                            <td>
                                                                <div class="input-box">
                                                                    <input id='phone-no' type="text">
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td class="label">Address: </td>
                                                            <td>
                                                                <div class="input-box">
                                                                    <input id='address' type="text">
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td class="label">Income: </td>
                                                            <td>
                                                                <div class="input-box">
                                                                    <input id='income' type="text">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="total-payment">
                                                <h3>Total Payment</h3>
                                            </div>
                                        </td>

                                        <td>
                                            <div class="total-payment">
                                                <h3>RM500.00</h3>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" class="submit-btn">
                                            <button type="submit">SUBMIT</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>

                        </div>

                    </body>

                    </html>
