package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportID = request.getParameter("reportID");
        String reportStatus = request.getParameter("reportStatus");
        String handledByStaffID = request.getParameter("handledByStaffID");
        String checkedByStaffID = request.getParameter("checkedByStaffID");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InteriorDB", "root", "root");
            String sql = "UPDATE REPORT SET REPORTSTATUS = ?, HANDLEDBYSTAFFID = ?, CHECKEDBYSTAFFID = ? WHERE REPORTID = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reportStatus);
            pstmt.setString(2, handledByStaffID);
            pstmt.setString(3, checkedByStaffID);
            pstmt.setString(4, reportID);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.getSession().setAttribute("updateResult", true);
                request.getSession().setAttribute("updateMessage", "Report updated successfully!");
            } else {
                request.getSession().setAttribute("updateResult", false);
                request.getSession().setAttribute("updateMessage", "Report update failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("updateResult", false);
            request.getSession().setAttribute("updateMessage", "An error occurred: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/StaffreportSL.jsp");
    }
}
