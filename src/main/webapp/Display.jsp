<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <title>Available Trains</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
     
      body {
         color: white;
         padding-top: 50px;
         overflow: hidden;
         background-attachment: fixed;
      }

      
      .container {
         background-color: rgba(0, 0, 0, 0.5); 
         border-radius: 15px;
         padding: 30px;
         max-width: 800px;
         margin-top: 50px;
         margin-left:auto;
         margin-right: auto;
         z-index:1;
      }

      .btn-primary {
         width: 100%;
         font-size: 18px;
         padding:5px;
         margin-top: 20px;
      }

      h1 {
         font-size: 36px;
         margin-bottom: 20px;
      }

      li {
         font-size: 18px;
         padding: 10px;
         list-style-type: none;
      }

      .footer {
         position: absolute;
         bottom: 0;
         width: 100%;
         text-align: center;
         padding: 10px;
         background-color: rgba(0, 0, 0, 0.8);
         color: white;
      }
      .img-fluid {
            position: absolute;
            top: 0;
            left:0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index:-1;
        }

    </style>
</head>
<body>
    <img src="https://media.istockphoto.com/id/1152782467/photo/pendolino-at-sunset.jpg?s=612x612&w=0&k=20&c=zverzUAZnnuT6tjr8gFxUTc0jt7ESLyA0n2_NgfobVk=" class="img-fluid" alt="Trains Image">
   <div class="container">
       <h1 class="text-center">Available Trains</h1>
       <ul>
           <%
            List<String> trains = (List<String>) request.getAttribute("trains");
            List<BigDecimal> prices = (List<BigDecimal>) request.getAttribute("prices");
            BigDecimal ta = BigDecimal.ZERO;

            // Retrieve the travel date from the session
            LocalDate travelDate = (LocalDate) request.getSession().getAttribute("travelDate");

            // Check if travel date is not null
            if (travelDate != null) {
          %>
             <p><strong>Travel Date:</strong> <%= travelDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) %></p>
          <%
            }

            // Check if there are available trains
            if (trains != null && !trains.isEmpty()) {
                for (int i = 0; i < trains.size(); i++) {
                    String train = trains.get(i);
                    BigDecimal price = prices.get(i); 
                    ta = ta.add(price);
                    out.println("<li class='list-group-item'>"+ train + " - Price: " + price + " INR" + "</li>");
                }
            } else {
                out.println("<li class='list-group-item'>No trains available for the selected route and criteria.</li>");
            }
          %>
       </ul>
       <a href="payment.jsp?ta=<%= ta %>" class="btn btn-primary">Proceed to Payment</a>
   </div>

   <div class="footer">
      <p>© 2025 Train Reservation System</p>
   </div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
   