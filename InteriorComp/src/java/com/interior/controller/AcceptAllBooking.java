/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.interior.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iqmal
 */
public class AcceptAllBooking extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingID = request.getParameter("bookingID");
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InteriorDB", "root", "root");
            String sql = "UPDATE BOOKING SET BOOKSTATUS = 'SUCCESS' WHERE BOOKSTATUS = 'PENDING'";

            pstmt = conn.prepareStatement(sql);
            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.getSession().setAttribute("acceptResult", true);
                request.getSession().setAttribute("acceptMessage", "All Booking accepted successfully!");
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
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/StaffbookingSL.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
