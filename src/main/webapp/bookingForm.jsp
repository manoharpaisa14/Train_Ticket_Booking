<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Your Train Ticket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
     <style>
        body {
            background-image: url('https://t3.ftcdn.net/jpg/10/57/50/46/240_F_1057504684_LXmFAUTABc7Yksbm6bqdj5Jrs6u17NiD.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color:white; 
        }
        .container {
            background-color:rgba(0,0,0,0); 
            padding: 20px;
            border-radius: 10px;
            max-width: 600px;
            margin-top: 50px;
            margin-left:5px;
            padding-top: 90px;
        }
        h2 {
            background-image: linear-gradient(to right, #1A2980 0%, #509190 60%, #1A2980  100%);
            padding-block:10px;padding-left:40px;
            border-radius:10px;
        }
        .form-control, .form-select {
            background-color: rgba(222, 245, 255, 0.7); 
            border: 1px solid rgb(214, 24, 24); 
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-grad {background-image: linear-gradient(to right, #1A2980 0%, #26D0CE  51%, #1A2980  100%)}
         .btn-grad {
            margin: 10px;
            padding: 10px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;
            border:none;            
            
            border-radius: 10px;
            display: block;
          }
          .btn-grad:hover {
            background-position: right center;
            color: #fff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container mt-3">
        <h2>Plan Your Train Trip in Minutes</h2>
        <form action="Booking" method="post">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="departureFrom" class="form-label">Departure From:</label>
                    <input type="text" class="form-control" id="departureFrom" name="departureFrom" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="toDestination" class="form-label">To Destination:</label>
                    <input type="text" class="form-control" id="toDestination" name="toDestination" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="numberOfTickets" class="form-label">No of Tickets:</label>
                    <input type="number" class="form-control" id="numberOfTickets" name="numberOfTickets" required min="1" max="3">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="coachType" class="form-label">Coach Type:</label>
                    <select class="form-select" id="coachType" name="coachType" aria-label="Coach Type" required>
                        <option selected value="">Select</option>
                        <option value="1">AC First Class (1A)</option>
                        <option value="2">First Class</option>
                        <option value="3">Second Sitting (2S)</option>
                        <option value="4">Sleeper (SL)</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="travelDate" class="form-label">Travel Date</label>
                    <input type="date" class="form-control" id="travelDate" name="travelDate" required>
                </div>
            </div>
            <button type="submit" class="btn-grad">Search Trains</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>