package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteStaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String staffID = request.getParameter("id");

        String jdbcUrl = "jdbc:derby://localhost:1527/InteriorDB";
        String dbUser = "root"; 
        String dbPassword = "root"; 

        Connection connection = null;
        PreparedStatement deleteStaffStatement = null;
        PreparedStatement deleteUserStatement = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Delete from STAFF table
            String deleteStaffSql = "DELETE FROM STAFF WHERE STAFFID = ?";
            deleteStaffStatement = connection.prepareStatement(deleteStaffSql);
            deleteStaffStatement.setString(1, staffID);
            deleteStaffStatement.executeUpdate();

            // Delete from USERS table
            String deleteUserSql = "DELETE FROM USERS WHERE USERID = ?";
            deleteUserStatement = connection.prepareStatement(deleteUserSql);
            deleteUserStatement.setString(1, staffID);
            deleteUserStatement.executeUpdate();

            request.getSession().setAttribute("deleteResult", true);
            request.getSession().setAttribute("deleteMessage", "Staff deleted successfully!");

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("deleteResult", false);
            request.getSession().setAttribute("deleteMessage", "An error occurred: " + e.getMessage());
        } finally {
            try {
                if (deleteStaffStatement != null) deleteStaffStatement.close();
                if (deleteUserStatement != null) deleteUserStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/StaffstaffSL.jsp");
    }
}
