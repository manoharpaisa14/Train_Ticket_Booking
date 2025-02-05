

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class Booking
 */
public class Booking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
        String departureFrom = request.getParameter("departureFrom");
        String toDestination = request.getParameter("toDestination");
        String numberOfTicketsStr = request.getParameter("numberOfTickets");
        String coachType = request.getParameter("coachType");
        String travelDateStr = request.getParameter("travelDate");
        
        Integer numberOfTickets = Integer.parseInt(numberOfTicketsStr);
        
 
        String coachTypeStr;
        switch (coachType) {
            case "1":
                coachTypeStr = "AC First Class (1A)";
                break;
            case "2":
                coachTypeStr = "First Class";
                break;
            case "3":
                coachTypeStr = "Second Sitting (2S)";
                break;
            case "4":
                coachTypeStr = "Sleeper (SL)";
                break;
            default:
                coachTypeStr = "Unknown";
                break;
        }
        
        LocalDate travelDate = LocalDate.parse(travelDateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        
     String mysqlurl = "jdbc:mysql://localhost:3306/TrainTicketDB";
   	 String user = "root";
   	 String pass = "root";
   	 String driver = "com.mysql.cj.jdbc.Driver";
   	 
   	 Connection con = null;
   	 
   	 PreparedStatement ps = null;
   	 
   	 ResultSet rs = null;
       
        List<String> trains = new ArrayList<>();
        List<BigDecimal> prices = new ArrayList<>();
        
        try {
        	
        	Class.forName(driver);
        	
        	con = DriverManager.getConnection(mysqlurl,user,pass);
        	
        	String query = "SELECT * from trains WHERE departure_from = ? AND to_destination = ? AND no_of_tickets = ? AND coach_type = ?";
        	
        	ps = con.prepareStatement(query);
        	
        	ps.setString(1,departureFrom);
       	     ps.setString(2,toDestination);
        	ps.setInt(3,(numberOfTickets));
        	ps.setString(4,coachTypeStr);
        	
        	
        	
        	rs = ps.executeQuery();
        	
        	while(rs.next()) {
        		
        		String trainName = rs.getString("train_name");
        		String trainNumber = rs.getString("train_number");
        		String seatNumber = rs.getString("seat_number");
        		BigDecimal p = rs.getBigDecimal("price");
        		BigDecimal tp = p.multiply(new BigDecimal(numberOfTicketsStr));

        		String departureTime = rs.getString("departure_time");
        	  
        	
        
        	 trains.add(rs.getString("departure_from") + " - " + rs.getString("to_destination")+ " - " + rs.getString("no_of_tickets") + " - " + rs.getString("coach_type"));
        
        	//int tp = p * Integer.parseInt(numberOfTicketsStr);
        	prices.add(tp);
        		
        	
        	
            
             
             System.out.println("Train Name: " + trainName);
             System.out.println("Train Number: " + trainNumber);
             System.out.println("Seat Number: " + seatNumber);
             System.out.println("Coach Type: " + coachTypeStr);
             System.out.println("Number of Tickets: " + numberOfTickets);
             System.out.println("Price: " + tp);
             System.out.println("Departure Time: " + departureTime);

             
             
             request.getSession().setAttribute("trainName", trainName);
             request.getSession().setAttribute("trainNumber", trainNumber);
             request.getSession().setAttribute("seatNumber", seatNumber);
             request.getSession().setAttribute("coachType", coachTypeStr);
             request.getSession().setAttribute("numberOfTickets", numberOfTickets);
             request.getSession().setAttribute("price", tp);
             request.getSession().setAttribute("departureTime", departureTime);
             request.getSession().setAttribute("travelDate", travelDate);
            
           
        }   
        	if (!trains.isEmpty()) {
                String insertQuery = "UPDATE trains SET travel_date = ? WHERE train_name = ? AND train_number = ? AND no_of_tickets = ?";
                ps = con.prepareStatement(insertQuery);
                ps.setDate(1, java.sql.Date.valueOf(travelDate));
                ps.setString(2, trains.get(0).split(" - ")[0]); 
                ps.setString(3, trains.get(0).split(" - ")[1]);
                ps.setInt(4, Integer.parseInt(numberOfTicketsStr));
                ps.executeUpdate();
            }
        	
             request.setAttribute("trains", trains);
             request.setAttribute("prices", prices); 
             request.setAttribute("travelDate", travelDate);
             
            request.getRequestDispatcher("Display.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

       
    }
}
