package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateRoom extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String roomType = request.getParameter("roomType");
        String block = request.getParameter("block");
        int capacity = Integer.parseInt(request.getParameter("capacity"));

        String jdbcUrl = "jdbc:derby://localhost:1527/InteriorDB";
        String dbUser = "root"; 
        String dbPassword = "root"; 

        Connection connection = null;
        PreparedStatement insertStatement = null;
        PreparedStatement selectStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            String selectSql = "SELECT ROOMID FROM ROOM WHERE BLOCKID = ? ORDER BY ROOMID DESC FETCH FIRST ROW ONLY";
            selectStatement = connection.prepareStatement(selectSql);
            selectStatement.setString(1, block);
            resultSet = selectStatement.executeQuery();

            String newRoomId;
            if (resultSet.next()) {
                String highestRoomId = resultSet.getString("ROOMID");
                int nextId = Integer.parseInt(highestRoomId.split("-R")[1]) + 1;
                newRoomId = block + "-R" + String.format("%03d", nextId);
            } else {
                newRoomId = block + "-R001";
            }

            String insertSql = "INSERT INTO ROOM (ROOMID, BLOCKID, ROOMTYPE, MAXCAPACITY, AVAILABILITY) VALUES (?, ?, ?, ?, ?)";
            insertStatement = connection.prepareStatement(insertSql);
            insertStatement.setString(1, newRoomId);
            insertStatement.setString(2, block);
            insertStatement.setString(3, roomType);
            insertStatement.setInt(4, capacity);
            insertStatement.setString(5, "Empty");

            insertStatement.executeUpdate();

            request.getSession().setAttribute("createResult", true);
            request.getSession().setAttribute("createMessage", "Room created successfully!");

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("createResult", false);
            request.getSession().setAttribute("createMessage", "An error occurred: " + e.getMessage());
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (selectStatement != null) selectStatement.close();
                if (insertStatement != null) insertStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/staff/roomSL.jsp");
    }
}
