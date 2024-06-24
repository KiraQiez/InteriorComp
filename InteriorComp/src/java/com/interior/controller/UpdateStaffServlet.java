package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateStaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String staffID = request.getParameter("id");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        int age = Integer.parseInt(request.getParameter("age"));

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InteriorDB", "root", "root");
            String sql = "UPDATE STAFF SET STAFFNAME = ?, STAFFTYPE = ?, STAFFAGE = ? WHERE STAFFID = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, type);
            pstmt.setInt(3, age);
            pstmt.setString(4, staffID);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.getSession().setAttribute("updateResult", true);
                request.getSession().setAttribute("updateMessage", "Staff updated successfully!");
            } else {
                request.getSession().setAttribute("updateResult", false);
                request.getSession().setAttribute("updateMessage", "Staff update failed!");
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

        response.sendRedirect(request.getContextPath() + "/StaffstaffSL.jsp");
    }
}
