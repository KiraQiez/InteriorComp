package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateGuestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stdID = request.getParameter("stdID");
        String stdName = request.getParameter("stdName");
        String stdIC = request.getParameter("stdIC");
        String stdPhone = request.getParameter("stdPhone");
        String stdAddress = request.getParameter("stdAddress");
        String stdIncome = request.getParameter("stdIncome");
        String stdParentPhoneNum = request.getParameter("stdParentPhoneNum");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InteriorDB", "root", "root");
            String sql = "UPDATE STUDENT SET stdName = ?, stdIC = ?, stdPhone = ?, stdAddress = ?, stdIncome = ?, stdParentPhoneNum = ? WHERE stdID = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, stdName);
            pstmt.setString(2, stdIC);
            pstmt.setString(3, stdPhone);
            pstmt.setString(4, stdAddress);
            pstmt.setString(5, stdIncome);
            pstmt.setString(6, stdParentPhoneNum);
            pstmt.setString(7, stdID);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.getSession().setAttribute("updateResult", true);
                request.getSession().setAttribute("updateMessage", "Guest updated successfully!");
            } else {
                request.getSession().setAttribute("updateResult", false);
                request.getSession().setAttribute("updateMessage", "Guest update failed!");
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

        response.sendRedirect(request.getContextPath() + "/StaffguestSL.jsp");
    }
}
