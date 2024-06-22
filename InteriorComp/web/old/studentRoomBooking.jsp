<%-- Document : studentRoomBooking Created on : Jun 13, 2024, 10:30:34 AM Author : Iqmal --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
            <sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver"
                url="jdbc:derby://localhost:1527/InteriorDB" user="root" password="root" />
            <%@ page contentType="text/html" pageEncoding="UTF-8" %>
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
                                margin: 0 auto;
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
                                    <img src="resource/logo.svg">
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
                            <form action="insertBooking" method="post">
                                <table class="container-table">
                                    <tr>
                                        <td colspan="2">
                                            <div class="input-wrapper">
                                                <c:set var="roomType" value="${param.roomType}" />
                                                <form action="insertBooking.java">
                                                    <table class="input-table">
                                                        <tr>
                                                            <td class="label">Room Type: </td>
                                                            <td>
                                                                <input id="roomType" name="roomType" type="text"
                                                                    value="${param.roomType}" readonly>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td class="label">Room No: </td>
                                                            <td>
                                                                <div class="input-box">
                                                                    <sql:query var="roomNo"
                                                                        dataSource="${myDatasource}">
                                                                        SELECT ROOMNUMBER FROM ROOM WHERE ROOMDESC = ?
                                                                        <sql:param value="${roomType}" />
                                                                    </sql:query>
                                                                    <select id="roomNumber" name="roomNumber">
                                                                        <c:forEach var="room" items="${roomNo.rows}">
                                                                            <option value="${room.ROOMNUMBER}">
                                                                                ${room.ROOMNUMBER}</option>
                                                                        </c:forEach>
                                                                    </select>
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
                                                            <td class="label">Booking Date: </td>
                                                            <td>
                                                                <div class="input-box">
                                                                    <input id='bookingDate' name='bookingdate'
                                                                        type="date">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="label">Check In: </td>
                                                            <td>
                                                                <div class="input-box">
                                                                    <input id='checkin' name='checkin' type="date">
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td class="label">Check Out: </td>
                                                            <td>
                                                                <div class="input-box">
                                                                    <input id='checkout' name='checkout' type="date">
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
                                                                    <input id='income' name="income" type="text">
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