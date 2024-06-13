package com.interior.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class studentRoomDetails extends HttpServlet {

    private PreparedStatement pstmt;
    private Connection conn;

    public void init() throws ServletException {
        initializeJdbc();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String errorMessage = null;

        try (PrintWriter out = response.getWriter()) {
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/INTERIOR";
            String usr = "root", pass = "";

            Class.forName(driver);
            conn = DriverManager.getConnection(connectionString, usr, pass);
            
            // start
            String sql = "SELECT b.BOOKINGID, b.BOOKINGDATE, b.CHECKIN, b.CHECKOUT FROM BOOKING b WHERE bookingID=101";
            pstmt = conn.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            int bookingID = rs.getInt("BOOKINGID");
            String bookingDate = rs.getString("BOOKINGDATE");
            String checkIn = rs.getString("CHECKIN");
            String checkOut = rs.getString("CHECKOUT");

            out.println("<!DOCTYPE html><html>");
            out.println("<header>");
            out.println("<title>Room Details</title>");
            out.println("</header>");

            while (rs.next()) {
                out.println("<body><p>" + bookingID + "</p>");
                out.println("<p>" + bookingDate + "</p>");
                out.println("<p>" + checkIn + "</p>");
                out.println("<p>" + checkOut + "</p>");
                out.println("</body>");
                out.println("</html>");
            }

        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void initializeJdbc() {
        try {
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/INTERIOR";
            String usr = "root", pass = "";

            Class.forName(driver);
            conn = DriverManager.getConnection(connectionString, usr, pass);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
