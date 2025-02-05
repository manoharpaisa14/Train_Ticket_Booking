

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class LoginCheck
 */
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("username");
		
		String password = request.getParameter("password");
				
	 String mysqlurl = "jdbc:mysql://localhost:3306/TrainTicketDB";
	 String user = "root";
	 String pass = "root";
	 String driver = "com.mysql.cj.jdbc.Driver";
	 
	 Connection con = null;
	 
	 PreparedStatement ps = null;
	 
	 ResultSet rs = null;
	 
	 try {
		 
		 Class.forName(driver);
		 con = DriverManager.getConnection(mysqlurl,user,pass);
		 System.out.println("done");
		 String query = "select * from users WHERE username=? AND password=?";
		 
		 ps = con.prepareStatement(query);
		 ps.setString(1, username);
		 ps.setString(2, password);
		 rs = ps.executeQuery();
		 
		 if(rs.next()) {
			 response.sendRedirect("bookingForm.jsp");
		 }else {
			 response.sendRedirect("login.jsp");
		 }
		 
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
	 
		
	}
	
	}