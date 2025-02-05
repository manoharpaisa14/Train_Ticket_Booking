<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Success</title>
 <style>
        body {
            background-image: url('https://t3.ftcdn.net/jpg/06/82/91/60/360_F_682916051_1BeDfZ6BLWKSBcrFWAEtsj42BbrWfLDE.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            height: 10vh; 
            width: 100%;
        }
        @keyframes blink {
            0% { opacity: 1; }
            50% { opacity: 0; }
            100% { opacity: 1; }
        }

        .blink {
            animation: blink 1s infinite;
        }
        .btn-gradient-hover {
            background: linear-gradient( #548dc2, #ff9a8b);
            transition: background 0.3s ease-in-out;
        }

        .btn-gradient-hover:hover {
            background: linear-gradient(0deg, rgba(34,193,195,1) 0%, rgba(253,187,45,1) 100%);
        }

        .card-body {
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 10px;
            padding: 30px;
        }
        .container-fluid{
            display: flex;
            justify-content: center;
            margin-top: 170px;
        }

        .row {
            width: 100%;
        }

        .col-md-6 {
            max-width: 400px;
        }

    </style>
    <title>Success</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div>
                    <div class="card-body">
                        <h1 class="text-success">Payment Successful!</h1>
                        <p class="text-primary blink">Get your ticket below...</p>
                        <form action="Ticket.jsp" method="GET">
                            <input type="hidden" name="NoOfTickets" value="<%= request.getParameter("NoOfTickets") %>">
                            <button type="submit" class="btn btn-primary btn-block btn-gradient-hover">Get Ticket</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
