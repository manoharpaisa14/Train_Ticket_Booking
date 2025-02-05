<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            overflow: hidden;
        }

        .container {
            background-color: rgba(84, 102, 153, 0.7);
            border-radius: 10px;
            padding: 30px;
            max-width: 800px;
            margin-top: 220px;
            position: relative;
            
        }

        .form-group label {
            font-weight: bold;
            color:rgb(247, 248, 248)
        }

        h1 {
            font-size: 48px;
        }

        .btn-secondary {
            background-color: #428bc3;
            border-color: #5A6268;
            font-size: 19px;
            padding: 5px;
            width: 100%;
            
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #34c17f;
            border-color: #6c757d;
        }

        .form-control {
            transition: border-color 2.0s ease, box-shadow 2.0s ease;
        }

        .form-control:focus {
            border-color: #4CAF50; 
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
        }

        .form-control:hover {
            border-color: #17a2b8; 
            background-color: #f8f9fa;
        }

        .form-group select {
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .form-group select:hover {
            background-color: #546372; 
            color: white; 
        }

        .btn-secondary:hover {
            background-color: #34ba5c;
            border-color: #6c757d;
            transition: all 0.3s ease;
        }

        .img-fluid {
            position: absolute;
            top: 0;
            left:0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

    </style>
</head>
<body>
   
    <img src="https://thumbs.dreamstime.com/z/photo-advert-collage-virtual-app-old-man-save-money-booking-tickets-payment-train-airplane-phone-screen-isolated-blue-276691345.jpg" class="img-fluid" alt="Payment Image">

    <div class="container">
        <div class="row jsutify-content-center">
            <div class="col-md-12">
                <form action="payment" method="POST" id="paymentForm">
                    <div class="form-group">
                        <label>Amount:</label>
                         <h1>
                            <%
                                String Tamount = request.getParameter("ta");
                                if (Tamount != null) {
                                	out.print("<span style='color: white;'>" + Tamount + " rs</span>");
                                } else {
                                    out.print("Try again");
                                }
                            %>
                        </h1>
                        <input type="hidden" name="amount" value="<%= Tamount != null ? Tamount : "0" %>"/>
                    </div>
                    <div class="form-group">
                        <label for="paymentMethod">Select your payment method:</label>
                        <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                            <option value="">Select Payment Method</option>
                            <option value="phonepe">PhonePe</option>
                            <option value="gpay">Google Pay</option>
                            <option value="paytm">Paytm</option>
                            <option value="cred">Cred</option>
                        </select>
                    </div>
                    <div class="p-3">
                        <button type="submit" name="generateOtp" value="true" class="btn btn-secondary btn-block">Proceed</button>
                    </div>
                </form>
            </div>      
        </div>          
       
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>