package com.interior.controller;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckLogin extends HttpServlet {
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
        String userType = "Student";

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
                 else if (loginStatus == 3) {
                    errorMessage = "Username already exist.";
                }
            }

            if (errorMessage != null) {
                request.setAttribute("errorMessage", errorMessage);
                request.setAttribute("username", username);
                request.setAttribute("password", password);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                // Create a new session if it doesn't exist
                HttpSession session = request.getSession(true);
                // Set session attributes
                session.setAttribute("username", username);
                if(userType != "Student"){
                    response.sendRedirect(request.getContextPath() + "/StaffHome.jsp");
                }
                else{
                    response.sendRedirect(request.getContextPath() + "/home.jsp");
                }
                
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
        String sqlCheckUsername = "SELECT * FROM STUDENT WHERE username = ?";
        pstmt = conn.prepareStatement(sqlCheckUsername);
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();

        if (!rs.next()) {
            return 1; // Username does not exist
        }

        String sqlCheckPassword = "SELECT * FROM STUDENT WHERE username = ? AND password = ?";
        pstmt = conn.prepareStatement(sqlCheckPassword);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();
    

        if (!rs.next()) {
            return 2; // Password is incorrect
        }
        

        return 0; // login account successfully
    }
}
