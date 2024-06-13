/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.interior.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iqmal
 */
public class studentReport extends HttpServlet {

    private PreparedStatement pstmt;
    private Connection conn;

    public void init() throws ServletException {
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
        String reportTitle = request.getParameter("reportID");
        String reportDesc = request.getParameter("reportStatus");
        String reportDate = request.getParameter("current-date");
        try {
            insertReport(reportTitle, reportDesc, reportDate);
            return;
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            out.close();
        }
    }

    protected void insertReport(String reportTitle, String reportDesc, String reportDate)
            throws SQLException {

        // create a statement
        String sql = "INSERT INTO REPORT(REPORTTITLE, REPORTDESC, REPORTSTATUS, STDID, MANAGERID, STAFFMAINTENANCEID, REPORTDATE) VALUES (?, ?, 'PENDING, 20241, 3011, 3012, ?)";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, reportTitle);
        pstmt.setString(2, reportDesc);
        pstmt.setString(3, reportDate);
        pstmt.execute(sql);
    }
}
