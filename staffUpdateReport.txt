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
public class staffUpdateReport extends HttpServlet {

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
        String reportID = request.getParameter("reportID");
        String status = request.getParameter("reportStatus");
        
        try{
            updateStatus(status, reportID);
            return;
        }catch(Exception e){
            out.println("Error: " + e.getMessage());
        }finally{
            out.close();
        }
    }

    protected void updateStatus(String status, String reportID)
            throws SQLException{
        
        // create a statement
        String sql = "UPDATE REPORT SET REPORTSTATUS = ? WHERE REPORTID = ?";
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, status);
        pstmt.setString(2, reportID);
        pstmt.executeUpdate();
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
