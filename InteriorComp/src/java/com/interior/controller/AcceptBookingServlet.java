/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iqmal
 */
public class AcceptBookingServlet extends HttpServlet {

    private PreparedStatement pstmt;
    private Connection conn;
    boolean isBookingSuccess = false;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingID = request.getParameter("bookingID");
        String roomID = request.getParameter("roomID");
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InteriorDB", "root", "root");
            String sql = "UPDATE BOOKING SET BOOKSTATUS = 'SUCCESS' WHERE bookingID = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bookingID);
            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                updateAvailability(roomID);
                request.getSession().setAttribute("acceptResult", true);
                request.getSession().setAttribute("acceptMessage", "Booking accepted successfully!");
            } else {
                request.getSession().setAttribute("acceptResult", false);
                request.getSession().setAttribute("acceptMessage", "Booking fail to be accepted!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("acceptResult", false);
            request.getSession().setAttribute("acceptMessage", "An error occurred: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/StaffbookingSL.jsp");
    }

    public void updateAvailability(String roomID) throws SQLException {
        try {
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/InteriorDB";
            String usr = "root", pass = "root";

            Class.forName(driver);
            conn = DriverManager.getConnection(connectionString, usr, pass);

            // Create the SQL query to get the current availability
            String sql = "SELECT AVAILABILITY FROM ROOM WHERE ROOMID = ?";

            // Prepare the statement
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, roomID);

            // Execute the query
            ResultSet rs = pstmt.executeQuery();

            // Check the result and decrement the availability
            int availability = 0;
            if (rs.next()) {
                availability = rs.getInt("AVAILABILITY");
                availability--;
            }

            // Close the result set and the prepared statement
            rs.close();
            pstmt.close();

            // Create the SQL query to update the availability
            String updateSql = "UPDATE ROOM SET AVAILABILITY = ? WHERE ROOMID = ?";

            // Prepare the statement
            PreparedStatement pstmtUpdate = conn.prepareStatement(updateSql);
            pstmtUpdate.setInt(1, availability);
            pstmtUpdate.setString(2, roomID);

            // Execute the update
            pstmtUpdate.executeUpdate();

            // Close the prepared statement
            pstmtUpdate.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
