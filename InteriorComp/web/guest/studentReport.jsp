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
                       <title>Dashboard</title>
                       <link rel="stylesheet" href="guest.css">
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
                                   <li><a href="dashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                                   <li><a href="roomS.jsp"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                                   <li><a href="bookingS.jsp"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                                   <li><a href="guestS.jsp"><i class="fas fa-user"></i> <span>Guest</span></a></li>
                                   <li><a href="staffS.jsp"><i class="fas fa-users"></i> <span>Staff</span></a></li>
                               </ul>
                           </nav>
                       </div>
                   </body>
                   </html>  