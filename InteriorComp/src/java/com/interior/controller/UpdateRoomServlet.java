package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomID = request.getParameter("roomID");
        String block = request.getParameter("block");
        String roomType = request.getParameter("roomType");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String availability = request.getParameter("availability");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InteriorDB", "root", "root");
            String sql = "UPDATE ROOM SET BLOCKID = ?, ROOMTYPE = ?, MAXCAPACITY = ?, AVAILABILITY = ? WHERE ROOMID = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, block);
            pstmt.setString(2, roomType);
            pstmt.setInt(3, capacity);
            pstmt.setString(4, availability);
            pstmt.setString(5, roomID);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.getSession().setAttribute("updateResult", true);
                request.getSession().setAttribute("updateMessage", "Room updated successfully!");
            } else {
                request.getSession().setAttribute("updateResult", false);
                request.getSession().setAttribute("updateMessage", "Room update failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("updateResult", false);
            request.getSession().setAttribute("updateMessage", "An error occurred: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/StaffroomSL.jsp");
    }
}
