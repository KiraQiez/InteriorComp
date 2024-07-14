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

public class CreateStaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = "password"; // Default password
        String userType = "Staff"; // Default user type
        
        String staffName = request.getParameter("staffName");
        String staffType = request.getParameter("staffType");
        int staffAge = Integer.parseInt(request.getParameter("staffAge"));

        String jdbcUrl = "jdbc:derby://localhost:1527/InteriorDB";
        String dbUser = "root"; 
        String dbPassword = "root"; 

        Connection connection = null;
        PreparedStatement checkEmailStatement = null;
        PreparedStatement checkUsernameStatement = null;
        PreparedStatement selectStatement = null;
        PreparedStatement insertUserStatement = null;
        PreparedStatement insertStaffStatement = null;
        ResultSet resultSet = null;
        String message = "";

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Check if email already exists
            String checkEmailSql = "SELECT COUNT(*) FROM USERS WHERE email = ?";
            checkEmailStatement = connection.prepareStatement(checkEmailSql);
            checkEmailStatement.setString(1, email);
            resultSet = checkEmailStatement.executeQuery();
        
            if (resultSet.next() && resultSet.getInt(1) > 0) {
                message = "Email already exists";
            } else {
                // Check if username already exists
                String checkUsernameSql = "SELECT COUNT(*) FROM USERS WHERE username = ?";
                checkUsernameStatement = connection.prepareStatement(checkUsernameSql);
                checkUsernameStatement.setString(1, username);
                resultSet = checkUsernameStatement.executeQuery();

                if (resultSet.next() && resultSet.getInt(1) > 0) {
                    message = "Username already exists";
                } else {
                    // Get the highest existing user ID
                    String selectSql = "SELECT USERID FROM USERS ORDER BY USERID DESC FETCH FIRST ROW ONLY";
                    selectStatement = connection.prepareStatement(selectSql);
                    resultSet = selectStatement.executeQuery();

                    String newId = "U001"; 
                    if (resultSet.next()) {
                        String highestUserId = resultSet.getString("USERID");
                        int nextId = Integer.parseInt(highestUserId.substring(1)) + 1;
                        newId = "U" + String.format("%03d", nextId);
                    }

                    // Insert into USERS table
                    String insertUserSql = "INSERT INTO USERS (userID, email, username, password, userType) VALUES (?, ?, ?, ?, ?)";
                    insertUserStatement = connection.prepareStatement(insertUserSql);
                    insertUserStatement.setString(1, newId);
                    insertUserStatement.setString(2, email);
                    insertUserStatement.setString(3, username);
                    insertUserStatement.setString(4, password);
                    insertUserStatement.setString(5, userType);

                    insertUserStatement.executeUpdate();

                    // Insert into STAFF table
                    String insertStaffSql = "INSERT INTO STAFF (staffID, staffName, staffType, staffAge) VALUES (?, ?, ?, ?)";
                    insertStaffStatement = connection.prepareStatement(insertStaffSql);
                    insertStaffStatement.setString(1, newId);
                    insertStaffStatement.setString(2, staffName);
                    insertStaffStatement.setString(3, staffType);
                    insertStaffStatement.setInt(4, staffAge);

                    insertStaffStatement.executeUpdate();

                    request.getSession().setAttribute("createResult", true);
                    request.getSession().setAttribute("createMessage", "Staff created successfully!");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("createResult", false);
            request.getSession().setAttribute("createMessage", "An error occurred: " + e.getMessage());
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (checkEmailStatement != null) checkEmailStatement.close();
                if (checkUsernameStatement != null) checkUsernameStatement.close();
                if (selectStatement != null) selectStatement.close();
                if (insertUserStatement != null) insertUserStatement.close();
                if (insertStaffStatement != null) insertStaffStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (message.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/StaffstaffSL.jsp");
        } else {
            request.getSession().setAttribute("createResult", false);
            request.getSession().setAttribute("createMessage", message);
            response.sendRedirect(request.getContextPath() + "/StaffstaffSL.jsp");
        }
    }
}
