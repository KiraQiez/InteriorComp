package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateRoom extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form data
        String roomType = request.getParameter("roomType");
        String block = request.getParameter("block");
        int capacity = Integer.parseInt(request.getParameter("capacity"));

        // Database connection
        String jdbcUrl = "jdbc:derby://localhost:1527/InteriorDB";
        String dbUser = "root"; 
        String dbPassword = "root"; 

        Connection connection = null;
        PreparedStatement insertStatement = null;
        Statement selectStatement = null;
        ResultSet resultSet = null;

        try {
            // Load the Derby JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Establish the connection
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Step 1: Get the highest current ROOMID
            String selectSql = "SELECT ROOMID FROM ROOM ORDER BY ROOMID DESC FETCH FIRST ROW ONLY";
            selectStatement = connection.createStatement();
            resultSet = selectStatement.executeQuery(selectSql);

            String newRoomId = "R001"; // Default to R001 if no existing IDs
            if (resultSet.next()) {
                String highestRoomId = resultSet.getString("ROOMID");
                int nextId = Integer.parseInt(highestRoomId.substring(1)) + 1;
                newRoomId = "R" + String.format("%03d", nextId);
            }

            // Step 2: Insert new room with generated ROOMID
            String insertSql = "INSERT INTO ROOM (ROOMID, BLOCK, ROOMTYPE, MAXCAPACITY, Availability, STATUS) VALUES (?, ?, ?, ?, ?, ?)";
            insertStatement = connection.prepareStatement(insertSql);
            insertStatement.setString(1, newRoomId);
            insertStatement.setString(2, block);
            insertStatement.setString(3, roomType);
            insertStatement.setInt(4, capacity);
            insertStatement.setInt(5, capacity);
            insertStatement.setString(6, "Working");

            // Execute the insert operation
            insertStatement.executeUpdate();

            // Redirect to a success page
            response.sendRedirect("roomS.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to an error page
            response.sendRedirect("roomError.jsp");
        } finally {
            // Close resources
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (selectStatement != null) {
                    selectStatement.close();
                }
                if (insertStatement != null) {
                    insertStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
