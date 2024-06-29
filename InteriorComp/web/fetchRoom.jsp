<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("loggedIn") == null || !(Boolean) currentSession.getAttribute("loggedIn")) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) currentSession.getAttribute("username");
    String rank = (String) currentSession.getAttribute("rank");

    String blockID = request.getParameter("blockID");

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        String driver = "org.apache.derby.jdbc.ClientDriver";
        String connectionString = "jdbc:derby://localhost:1527/InteriorDB";
        String dbUser = "root";
        String dbPass = "root";

        Class.forName(driver);

        conn = DriverManager.getConnection(connectionString, dbUser, dbPass);

        String query = "SELECT ROOMID, AVAILABILITY FROM ROOM WHERE BLOCKID = ? AND AVAILABILITY > 0";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, blockID);
        rs = pstmt.executeQuery();

        StringBuilder options = new StringBuilder();
        while (rs.next()) {
            options.append("<option value=\"").append(rs.getString("ROOMID")).append("\">")
                    .append(rs.getString("ROOMID")).append(" - ")
                    .append(rs.getInt("AVAILABILITY")).append(" Slot(s) left")
                    .append("</option>");
        }

        out.println(options.toString());
    } catch (SQLException sqle) {
        out.println(sqle.getMessage());
    } catch (Exception e) {
        out.println(e.getMessage());
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
    }
%>
