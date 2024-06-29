package com.interior.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class insertBooking extends HttpServlet {

    private PreparedStatement pstmt;
    private Connection conn;

    public void init() throws ServletException {
        initializeJdbc();
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet INSERT BOOKING</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet successINSERTBOOKING at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();

        // Get the current system date
        LocalDate currentDate = LocalDate.now();

        // Format the date as needed (e.g., "yyyy-MM-dd")
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // obtain parameter
        String bookingID = "B100100";
        String bookingStatus = "PENDING";
        String bookingDate = currentDate.format(formatter);

        // foreign key
        String stdID = "U001";
        String staffID = "S010";
        String roomID = request.getParameter("roomID");
        String sessionID = request.getParameter("sessionID");

        try {
            if (checkIncome(stdID)) {
                bookingStatus = "SUCCESS";
            }
            createBooking(bookingID, bookingDate, bookingStatus, stdID, staffID, roomID, sessionID);
            return;
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            out.close();
        }
    }

    protected void createBooking(String bookingID, String bookingDate, String bookingStatus, String stdID, String staffID, String roomID, String sessionID)
            throws SQLException {

        // create a statement
        String sql = "INSERT INTO BOOKING (BOOKINGID, BOOKINGDATE, BOOKINGSTATUS, STDID, STAFFID, ROOMID, SESSIONID)"
                + "VALUES(?, ?, ?, ?, ?, ?, ?)";

        pstmt = conn.prepareStatement(sql);
        // Set parameters
        pstmt.setString(1, bookingID);
        pstmt.setString(2, bookingDate);
        pstmt.setString(3, bookingStatus);
        pstmt.setString(4, stdID);
        pstmt.setString(5, staffID);
        pstmt.setString(6, roomID);
        pstmt.setString(7, sessionID);
        pstmt.executeUpdate();
    }

    public boolean checkIncome(String stdID) throws SQLException {
        // Create the SQL query
        String sql = "SELECT STDINCOME FROM STUDENT WHERE STDID = ?";

        // Prepare the statement
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, stdID);

        // Execute the query
        ResultSet rs = pstmt.executeQuery();

        // Check the result
        if (rs.next()) {
            double income = rs.getDouble("STDINCOME");
            return income < 2000;
        }

        // Close the result set and the prepared statement
        rs.close();
        pstmt.close();

        // If no result was found, return false
        return false;
    }

    public void updateAvailability(Connection conn, String roomID) throws SQLException {
        // Create the SQL query to get the current availability
        String sql = "SELECT AVAILABILITY FROM ROOM WHERE ROOMID = ?";

        // Prepare the statement
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, roomID);

        // Execute the query
        ResultSet rs = pstmt.executeQuery();

        // Check the result and decrement the availability
        int availability = 0;
        if (rs.next()) {
            availability = rs.getInt("AVAILABILITY");
            availability--;
        }

        // Close the result set and the prepared statement
        rs.close();
        pstmt.close();

        // Create the SQL query to update the availability
        String updateSql = "UPDATE ROOM SET AVAILABILITY = ? WHERE ROOMID = ?";

        // Prepare the statement
        PreparedStatement pstmtUpdate = conn.prepareStatement(updateSql);
        pstmtUpdate.setInt(1, availability);
        pstmtUpdate.setString(2, roomID);

        // Execute the update
        pstmtUpdate.executeUpdate();

        // Close the prepared statement
        pstmtUpdate.close();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
