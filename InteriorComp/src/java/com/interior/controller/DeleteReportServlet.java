package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportID = request.getParameter("reportID");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InteriorDB", "root", "root");
            String sql = "DELETE FROM REPORT WHERE REPORTID = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reportID);
            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.getSession().setAttribute("deleteResult", true);
                request.getSession().setAttribute("deleteMessage", "Report deleted successfully!");
            } else {
                request.getSession().setAttribute("deleteResult", false);
                request.getSession().setAttribute("deleteMessage", "Report deletion failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("deleteResult", false);
            request.getSession().setAttribute("deleteMessage", "An error occurred: " + e.getMessage());
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
