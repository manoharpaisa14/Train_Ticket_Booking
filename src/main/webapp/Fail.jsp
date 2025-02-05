<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Failed</title>
 <style>
        /* Set a transparent background image for the page */
        body {
            background-image: url('https://t3.ftcdn.net/jpg/05/83/87/88/360_F_583878813_lQ9MoaTWRBSjxourBrYYn8DNjM0xmHwA.jpg'); /* Replace with your image URL */
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
        .card-body {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 30px;
            margin-top: 10px;
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
                <div class="card-body">
                    <div>
                        <h1 class="text-danger blink">Payment Failed!</h1>
                        <p class="text-primary">Check your otp and try again..</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
