<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<sql:setDataSource var="myDatasource" 
    driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/InteriorDB" 
    user="root" 
    password="root" />


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <%= Header %>
    </title>
    <link rel="stylesheet" href="main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
</head>

<body>

    
    <%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("loggedIn") == null || !(Boolean) currentSession.getAttribute("loggedIn")) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) currentSession.getAttribute("username");
    String usertype = (String) currentSession.getAttribute("usertype");
    String ID = (String) currentSession.getAttribute("ID");

    if (!"Student".equals(usertype)) {
        response.sendRedirect("unauthorized.html");
        return;
    }
    %>
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
                    <li><a href="Studentdashboard.jsp" class="<%= "Dashboard".equals(dHeader) ? "active" : "" %>"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                    <li><a href="StudentRoom.jsp" class="<%= "Room".equals(dHeader) ? "active" : "" %>"><i class="fas fa-bed"></i> <span>Room</span></a></li>
                    <li><a href="StudentBookingS.jsp" class="<%= "Booking".equals(dHeader) ? "active" : "" %>"><i class="fas fa-calendar-check"></i> <span>Booking</span></a></li>
                    <li><a href="StudentReport.jsp" class="<%= "Report".equals(dHeader) ? "active" : "" %>"><i class="fas fa-file-alt"></i> <span>Report</span></a></li>
                    <li><a href="StudentBill.jsp" class="<%= "Bill".equals(dHeader) ? "active" : "" %>"><i class="fas fa-receipt"></i> <span>Bill</span></a></li>
                </ul>
                
            </nav>

            <div class="main-content">
                <header>
                    <h1>
                        <%= dHeader%>
                    </h1>
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
                                <span class="username">
                                    <%= username%>
                                </span>
                                <span class="staff-rank">
                                    Student
                                </span>
                            </div>
                            <div class="dropdown-menu">
                                <form action="editSP.jsp" method="GET">
                                    <button type="submit" class="menu-button">Edit Profile</button>
                                </form>
                                <form action="LogoutServlet" method="GET">
                                    <input type="hidden" name="action" value="logout">
                                    <button type="submit" class="menu-button">Log Out</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </header>