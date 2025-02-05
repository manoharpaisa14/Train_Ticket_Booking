
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

@WebServlet("/payment")
public class payment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve payment data
        String amount = request.getParameter("amount");
        String paymentMethod = request.getParameter("paymentMethod");
        String enteredOtp = request.getParameter("otp");
        String generateOtp = request.getParameter("generateOtp");
        
        Integer numberOfTickets = (Integer) request.getSession().getAttribute("numberOfTickets");
        String trainName = (String) request.getSession().getAttribute("trainName");
        String trainNumber = (String) request.getSession().getAttribute("trainNumber");
        String coachTypeStr = (String) request.getSession().getAttribute("coachType");
        String seatNumber = (String) request.getSession().getAttribute("seatNumber");
        BigDecimal price = (BigDecimal) request.getSession().getAttribute("price");
        String departureTime = (String) request.getSession().getAttribute("departureTime");
        LocalDate travelDate = (LocalDate) request.getSession().getAttribute("travelDate");
         
        
        // Handle OTP generation
        if ("true".equals(generateOtp)) {
            String generatedOtp = generateOTP();
            System.out.println("Generated OTP: " + generatedOtp); // Print OTP to console
            request.getSession().setAttribute("otp", generatedOtp); // Store OTP in session

            request.setAttribute("otpGenerated", true);
            request.setAttribute("amount", amount);
            request.setAttribute("paymentMethod", paymentMethod);
            request.getRequestDispatcher("OtpEntry.jsp").forward(request, response); // Redirect to OTP entry page
            return;
        }

        // Validate OTP
        String generatedOtp = (String) request.getSession().getAttribute("otp");
        if (enteredOtp != null && enteredOtp.equals(generatedOtp)) {
           
           boolean success = processPayment(amount, paymentMethod, trainName,trainNumber,coachTypeStr,seatNumber,price,departureTime,numberOfTickets,travelDate);
           if (success) {
               request.getRequestDispatcher("success.jsp").forward(request, response);
           } else {
               request.setAttribute("message", "Booking failed. Please try again.");
               request.getRequestDispatcher("Fail.jsp").forward(request, response);
           }

        } else {
            request.setAttribute("otpGenerated", true); // Show OTP input again
            request.setAttribute("message", "Invalid OTP. Please try again.");
            request.setAttribute("amount", amount); // Pass amount back to the page
            request.setAttribute("paymentMethod", paymentMethod); // Pass payment method back
            request.getRequestDispatcher("Fail.jsp").forward(request, response); // Redirect back to OTP entry page
        }
    }

    private String generateOTP() {
        int otp = (int) (Math.random() * 10000);
        return String.format("%04d", otp);
    }

    private boolean processPayment(String amount, String paymentMethod,String trainName,String trainNumber,String seatNumber,String coachType,BigDecimal price,String departureTime,Integer numberOfTickets, LocalDate travelDate) {
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
    	
    	  String pquery = "INSERT INTO payments (amount, payment_method) VALUES (?, ?)";
    	  
    	  ps = con.prepareStatement(pquery);
    
            ps.setBigDecimal(1,new BigDecimal(amount));
            ps.setString(2, paymentMethod);
            ps.executeUpdate();
            ps.close();
            System.out.println("Payment details inserted");
            
            
            
          String train = "SELECT * FROM trains WHERE train_name = ? AND train_number = ? AND no_of_tickets >= ?";
          
          ps = con.prepareStatement(train);
          
          ps.setString(1, trainName);
          ps.setString(2, trainNumber);
          ps.setInt(3, numberOfTickets);
          
          System.out.println("Train Name: " + trainName);
          System.out.println("Train Number: " + trainNumber);
          System.out.println("Seat Number: " + numberOfTickets);
        //  System.out.println("Number of Tickets: " + numberOfTickets);

          
         rs = ps.executeQuery();
          
        
          if(rs.next()) {
        	  
        	  String ticket = "INSERT INTO tickets_booked (train_name, train_number, seat_number, coach_type, price, departure_time, no_of_tickets, travel_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        	  
        	  ps = con.prepareStatement(ticket);
        	  
        	  ps.setString(1, trainName);
        	  ps.setString(2, trainNumber);
        	  ps.setString(3, seatNumber);
        	  ps.setString (4, coachType);
        	  ps.setBigDecimal(5,price);
        	  ps.setString(6, departureTime);
        	  ps.setInt(7, numberOfTickets);
        	  ps.setDate(8, Date.valueOf(travelDate));
        	  ps.executeUpdate();
        	  System.out.println("Ticket booking details inserted");
        	  return true;
          } else {
              System.out.println("No train details found");
              return false;
          }
         
            
        } catch (Exception e) {
            e.printStackTrace();
}
	return false;
    }
}