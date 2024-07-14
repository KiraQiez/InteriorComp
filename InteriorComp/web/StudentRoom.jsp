<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <% String Header="Room"; %>
    <% String dHeader="Room"; %>
    <%@ include file="StudentHeader.jsp" %>
    
    <%
    
        // Query to check if the student has a room ID
        String roomID = null;
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InteriorDB", "root", "root");
            PreparedStatement pst = conn.prepareStatement("SELECT roomID FROM STUDENT WHERE stdID = ?");
            pst.setString(1, ID);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                roomID = rs.getString("roomID");
            }
            rs.close();
            pst.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        if (roomID == null || roomID.isEmpty()) {
            response.sendRedirect("StudentnoRoomAssigned.jsp");
            return;
        }
    %>
    


    <div class="breadcrumb">
        <a href="#" class="active">Room</a>
    </div>

    <div class="content">
        <h1>Your Room Details</h1>
        <sql:query var="room_details" dataSource="${myDatasource}">
            SELECT * FROM ROOM WHERE roomID = '<%= roomID %>'
        </sql:query>

        <table>
            <thead>
                <tr>
                    <th>Room ID</th>
                    <th>Block</th>
                    <th>Room Type</th>
                    <th>Max Capacity</th>
                    <th>Availability</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="row" items="${room_details.rows}">
                    <tr>
                        <td><c:out value="${row.roomID}"/></td>
                        <td><c:out value="${row.blockID}"/></td>
                        <td><c:out value="${row.roomType}"/></td>
                        <td><c:out value="${row.maxCapacity}"/></td>
                        <td><c:out value="${row.availability}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
