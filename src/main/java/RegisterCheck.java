import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/RegisterCheck")
public class RegisterCheck extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        String mysqlurl = "jdbc:mysql://localhost:3306/TrainTicketDB";
        String dbUser = "root";
        String dbPass = "root";
        String driver = "com.mysql.cj.jdbc.Driver";

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(mysqlurl, dbUser, dbPass);

            // Insert query to register a new user
            String query = "INSERT INTO users (username, email, password, phone) VALUES (?, ?, ?, ?)";

            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phone);

            int result = ps.executeUpdate();

            if (result > 0) {
                // Registration successful, redirect to login page
                response.sendRedirect("login.jsp");
            } else {
                // Registration failed, show error message
                response.sendRedirect("register.jsp?error=Registration failed. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=An error occurred during registration.");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
