import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fetchRooms")
public class FetchRoomServlet extends HttpServlet {
    private Connection conn;

    @Override
    public void init() throws ServletException {
        initializeJdbc();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String blockId = request.getParameter("blockId");
        PrintWriter out = response.getWriter();
        
        try {
            String query = "SELECT ROOMID FROM ROOM WHERE BLOCKID = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, blockId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                out.println("<option value=\"" + rs.getString("ROOMID") + "\">Room " + rs.getString("ROOMID") + "</option>");
            }
        } catch (SQLException e) {
            out.println("<option value=\"\">Error: " + e.getMessage() + "</option>");
        } finally {
            out.close();
        }
    }

    private void initializeJdbc() {
        try {
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/InteriorDB";
            String usr = "root";
            String pass = "root";

            Class.forName(driver);
            conn = DriverManager.getConnection(connectionString, usr, pass);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void destroy() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}