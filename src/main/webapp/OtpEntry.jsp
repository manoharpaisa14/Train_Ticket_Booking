<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>OTP Entry</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        .container {
            position: relative;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .row {
            width: 100%;
            display: flex;
            justify-content: center;
        }
        .card {
            background: rgb(2,0,36);
            background: linear-gradient(rgba(2,0,36,0.8) 0%, rgba(9,9,121,0.6) 35%, rgba(0,212,255,0.6) 80%); /* Semi-transparent background for the card */
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0px 4px 6px rgb(192, 191, 202);
        }
        h1 {
            color: #f7f7f7;
            font-weight: bold;
        }
        .form-control {
            border-radius: 16px;
        }
        .form-label{
            color:white;
        }
        .btn-block {
            width: 100%;
            padding:6px;
        }
    </style>
</head>
<body>
    <img src="https://images.pexels.com/photos/2790396/pexels-photo-2790396.jpeg?cs=srgb&dl=pexels-markp-2790396.jpg&fm=jpg" class="img-fluid position-absolute top-0 start-0 w-100 h-100" style="object-fit: cover; opacity: 0.7;" alt="Background">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-6">
                <div class="card">
                    <h1 class="text-center mb-4">Enter OTP</h1>
                    <form action="payment" method="POST" id="otpForm">
                        <div class="form-group mb-3">
                            <label for="otp" class="form-label">OTP:</label>
                            <input type="text" class="form-control" id="otp" name="otp" required maxlength="6" placeholder="Enter your OTP" />
                        </div>
                        <input type="hidden" name="amount" value="<%= request.getAttribute("amount") != null ? request.getAttribute("amount") : "" %>" />
                        <input type="hidden" name="paymentMethod" value="<%= request.getAttribute("paymentMethod") != null ? request.getAttribute("paymentMethod") : "" %>" />
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-block">Verify OTP</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>