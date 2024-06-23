package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        String jdbcUrl = "jdbc:derby://localhost:1527/InteriorDB";
        String dbUser = "root"; 
        String dbPassword = "root"; 

        Connection connection = null;
        PreparedStatement checkUsernameStatement = null;
        PreparedStatement checkEmailStatement = null;
        PreparedStatement selectStatement = null;
        PreparedStatement insertStatement = null;
        ResultSet resultSet = null;
        boolean success = false;
        String message = "";

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            System.out.println("Connected to the database");

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

                    // Insert the new user
                    String insertSql = "INSERT INTO USERS (userid, email, username, password, usertype) VALUES (?, ?, ?, ?, ?)";
                    insertStatement = connection.prepareStatement(insertSql);
                    insertStatement.setString(1, newId);
                    insertStatement.setString(2, email);
                    insertStatement.setString(3, username);
                    insertStatement.setString(4, password);
                    insertStatement.setString(5, "User");

                    insertStatement.executeUpdate();
                    success = true;
                    message = "User registered successfully";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            message =  e.getMessage();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (checkUsernameStatement != null) {
                    checkUsernameStatement.close();
                }
                if (checkEmailStatement != null) {
                    checkEmailStatement.close();
                }
                if (selectStatement != null) {
                    selectStatement.close();
                }
                if (insertStatement != null) {
                    insertStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
                message = "Error closing resources: " + e.getMessage();
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }

        request.setAttribute("result", success);
        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }
}
