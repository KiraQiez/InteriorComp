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
public class RejectBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingID = request.getParameter("bookingID");
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InteriorDB", "root", "root");
            String sql = "UPDATE BOOKING SET BOOKSTATUS = 'REJECTED' WHERE bookingID = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bookingID);
            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.getSession().setAttribute("rejectResult", true);
                request.getSession().setAttribute("rejectMessage", " Booking rejected!");
            } else {
                request.getSession().setAttribute("rejectResult", false);
                request.getSession().setAttribute("rejectMessage", "Booking fail to be rejected!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("rejectResult", false);
            request.getSession().setAttribute("rejectMessage", "An error occurred: " + e.getMessage());
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
