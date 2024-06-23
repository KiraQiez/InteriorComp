package com.interior.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateBlockServlet extends HttpServlet {
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
            String sql = "INSERT INTO BLOCK (BLOCKID, BLOCKNAME, BLOCKDESC) VALUES (?, ?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, blockID);
            pstmt.setString(2, blockName);
            pstmt.setString(3, blockDesc);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                request.getSession().setAttribute("createResult", true);
                request.getSession().setAttribute("createMessage", "Block created successfully!");
            } else {
                request.getSession().setAttribute("createResult", false);
                request.getSession().setAttribute("createMessage", "Block creation failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("createResult", false);
            request.getSession().setAttribute("createMessage", "An error occurred: " + e.getMessage());
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
