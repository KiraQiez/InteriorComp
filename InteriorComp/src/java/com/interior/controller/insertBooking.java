/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.interior.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author Iqmal
 */
public class insertBooking extends HttpServlet {

    private PreparedStatement pstmt;
    private Connection conn;

    public void init() throws ServletException{
        initializeJdbc();
    }
    
    private void initializeJdbc() {
        try {
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/Interior";
            String usr = "root", pass = " ";

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
            out.println("<title>Servlet staffUpdateReport</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet staffUpdateReport at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        
        // obtain parameter
        String roomDesc = request.getParameter("roomType");
        String roomNumber = request.getParameter("roomNumber");
        String IC = request.getParameter("IC");
        String phoneNo = request.getParameter("phone-no");
        String address = request.getParameter("address");
        String income = request.getParameter("income");
        
        try{
            createBooking(roomDesc, roomNumber, IC, phoneNo, address, income);
            return;
        }catch(Exception e){
            out.println("Error: " + e.getMessage());
        }finally{
            out.close();
        }
    }

    protected void createBooking(String roomDesc, String roomNumber, String IC, String phoneNo, String address, String income)
            throws SQLException{
        
        // create a statement
        String sql = "INSERT INTO BOOKING (BOOKINGDATE, CHECKIN, CHECKOUT, STDID, STAFFID, ROOMID)"
                + "VALUES(?, ?, ?, ?, ?)";
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, roomDesc);
        pstmt.setString(2, roomNumber);
        pstmt.setString(3, IC);
        pstmt.setString(4, phoneNo);
        pstmt.setString(5, address);
        pstmt.setString(6, income);
        
        pstmt.executeUpdate();
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

