

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

@WebServlet("/ticket")
public class Ticket extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters for ticket identification
        String trainNumber = request.getParameter("trainNumber");
        String seatNumber = request.getParameter("seatNumber");
        String departureTime = request.getParameter("departureTime");
        Integer numberOfTickets = Integer.parseInt(request.getParameter("numberOfTickets"));

        System.out.println("Train Number: " + trainNumber);
        System.out.println("Seat Number: " + seatNumber);
        System.out.println("Number of Tickets: " + numberOfTickets);

        String mysqlurl = "jdbc:mysql://localhost:3306/TrainTicketDB";
        String user = "root";
        String pass = "root";
        String driver = "com.mysql.cj.jdbc.Driver";

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(mysqlurl, user, pass);
            System.out.println("Database connection established");

                    // SQL query to fetch ticket details
            String query = "SELECT tb.train_name, tb.train_number, tb.seat_number, " +
                           "tb.coach_type, tb.price, tb.no_of_tickets, p.payment_method, tb.travel_date " +
                           "FROM tickets_booked tb " +
                           "JOIN payments p ON tb.price = p.amount " +
                           "WHERE tb.train_number = ? AND tb.seat_number = ? AND tb.departure_time = ? AND tb.no_of_tickets = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, trainNumber);
            ps.setString(2, seatNumber);
            ps.setString(3, departureTime);
            ps.setInt(4, numberOfTickets);
            rs = ps.executeQuery();

            if (rs.next()) {
                       // Set ticket details in request attributes
                request.setAttribute("trainName", rs.getString("train_name"));
                request.setAttribute("trainNumber", rs.getString("train_number"));
                request.setAttribute("seatNumber", rs.getString("seat_number"));
                request.setAttribute("departureTime", rs.getString("departure_time"));
                request.setAttribute("coachType", rs.getString("coach_type"));
                request.setAttribute("price", rs.getBigDecimal("price"));
                request.setAttribute("numberOfTickets", rs.getInt("no_of_tickets"));
                request.setAttribute("travelDate", rs.getDate("travel_date"));
              

                       // Forward to JSP for display
                request.getRequestDispatcher("Ticket.jsp").forward(request, response);
            } else {
                System.out.println("No ticket found for the given details.");
                response.sendRedirect("Fail.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Fail.jsp"); // Redirect on error
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}