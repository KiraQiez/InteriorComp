package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateBlockServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String blockID = request.getParameter("blockID");
        String blockName = request.getParameter("blockName");
        String blockDesc = request.getParameter("blockDesc");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InteriorDB", "root", "root");
            String sql = "UPDATE BLOCK SET BLOCKDESC = ?, BLOCKNAME=? WHERE BLOCKID = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, blockDesc);
            pstmt.setString(2, blockName);
            pstmt.setString(3, blockID);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.getSession().setAttribute("updateResult", true);
                request.getSession().setAttribute("updateMessage", "Block updated successfully!");
            } else {
                request.getSession().setAttribute("updateResult", false);
                request.getSession().setAttribute("updateMessage", "Block update failed!");
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

        response.sendRedirect(request.getContextPath() + "/StaffblockSL.jsp");
    }
}
