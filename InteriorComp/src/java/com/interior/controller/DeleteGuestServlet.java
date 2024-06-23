package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteGuestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stdID = request.getParameter("stdID");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InteriorDB", "root", "root");
            String sql = "DELETE FROM STUDENT WHERE stdID = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, stdID);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.getSession().setAttribute("deleteResult", true);
                request.getSession().setAttribute("deleteMessage", "Guest deleted successfully!");
            } else {
                request.getSession().setAttribute("deleteResult", false);
                request.getSession().setAttribute("deleteMessage", "Guest deletion failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("deleteResult", false);
            request.getSession().setAttribute("deleteMessage", "An error occurred: " + e.getMessage());
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
