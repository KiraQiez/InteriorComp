package com.interior.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PreparedStatement pstmt;
    private Connection conn;

    public void init() throws ServletException {
        initializeJdbc();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String errorMessage = null;

        try {
            if (username == null || username.isEmpty() ||
                password == null || password.isEmpty()) {
                errorMessage = "All fields are required.";
            } else {
                int loginStatus = loginPass(username, password);
                if (loginStatus == 1) {
                    errorMessage = "Username does not exist.";
                } else if (loginStatus == 2) {
                    errorMessage = "Password is incorrect.";
                }
            }

            if (errorMessage != null) {
                request.setAttribute("result", false);
                request.setAttribute("message", errorMessage);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession(true);

                // session control
                session.setAttribute("username", username);
                String usertype = getUserType(username);
                session.setAttribute("usertype", usertype);
                String ID = getUserID(username);
                session.setAttribute("ID", ID);
                String rank = getUserRank(username);
                session.setAttribute("rank", rank);
                
                // redirect
                if(usertype.equals("Staff")){
                    response.sendRedirect(request.getContextPath() + "/Staffdashboard.jsp");

                }
                else{                  
                    response.sendRedirect(request.getContextPath() + "/Studentdashboard.jsp");
                }
                
                session.setAttribute("loggedIn", true);

                
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void initializeJdbc() {
        try {
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/InteriorDB";
            String usr = "root", pass = "root";

            Class.forName(driver);
            conn = DriverManager.getConnection(connectionString, usr, pass);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private int loginPass(String username, String password) throws SQLException {
        String sqlCheckUsername = "SELECT * FROM USERS WHERE username = ?";
        pstmt = conn.prepareStatement(sqlCheckUsername);
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();

        if (!rs.next()) {
            return 1; 
        }

        String sqlCheckPassword = "SELECT * FROM USERS WHERE username = ? AND password = ?";
        pstmt = conn.prepareStatement(sqlCheckPassword);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();

        if (!rs.next()) {
            return 2; 
        }

        return 0; 
    }

    private String getUserType(String username) throws SQLException {
        String sql = "SELECT usertype FROM USERS WHERE username = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            return rs.getString("usertype");
        }

        return null;
    }

    private String getUserRank(String username) throws SQLException {
        String sql = "SELECT staffType FROM STAFF WHERE staffID = (SELECT userID FROM USERS WHERE username = ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            return rs.getString("staffType");
        }

        return "Guest";
    }
    
    private String getUserID(String username) throws SQLException {
        String sql = "SELECT userID FROM USERS U JOIN STUDENT S ON U.userID = S.stdID WHERE U.username = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();

        // retriving ID from SQL
        String userID = "";
        if (rs.next()) {
            userID = rs.getString("userID");
        }

        return userID;
    }
}
