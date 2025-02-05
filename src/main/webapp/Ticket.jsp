<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Invoice</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 650px; 
            margin-top: 120px;
            background-color: rgb(228, 223, 223);
            padding:0px;
            border-radius: 20px;
            border-top-right-radius: 40px;
            border-top-left-radius: 40px;
            border-bottom-left-radius: 40px;
        }
        .newcontainer {
            background-color: rgb(255,191,0);
            padding: 5px;
            display: flex;
            align-items: center; 
             border-top-right-radius: 40px;
             border-top-left-radius: 40px;     
        }
        .new3container {
            background-color: rgb(255,191,0);
            
            padding: 5px;
            border-bottom-right-radius: 40px;
            border-bottom-left-radius: 40px;
        }
        h1, h2 {
            font-family: 'Open Sans', sans-serif;
            font-size: 28px; 
            margin-bottom: 1px;
            font-weight: 600;
        }        
        .card-body {
            padding: 22px;
        }
        .newcontainer svg {
            width: 30px;
            height: 30px;
            margin-right: 20px;
            margin-left: 30px; 
        }
        .container {
            background-color: rgba(228, 223, 223, 0.5); 
        }
        h2{
            margin-left: 60px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="newcontainer">
            <svg height="200px" width="200px" version="1.1" id="_x32_" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <style type="text/css"> .st0{fill:#000000;} </style> <g> <path class="st0" d="M349.917,432.716v-0.635H162.472v0.635h-10.544L89.982,512h45.644l13.705-20.233h213.334L376.367,512h45.659 l-61.95-79.284H349.917z M162.558,472.248l13.988-20.648h158.912l13.988,20.648H162.558z"></path> <path class="st0" d="M256.002,0C112.749,0,71.397,51.982,71.397,91.663v258.601c0,34.895,28.29,63.216,63.224,63.216h242.765 c34.942,0,63.217-28.321,63.217-63.216V91.663C440.603,51.982,399.259,0,256.002,0z M189.091,56.987h133.815 c8.888,0,16.106,7.21,16.106,16.098c0,8.912-7.218,16.114-16.106,16.114H189.091c-8.889,0-16.098-7.202-16.098-16.114 C172.992,64.197,180.201,56.987,189.091,56.987z M160.275,358.439c-11.093,0-20.084-8.991-20.084-20.084 c0-11.094,8.991-20.084,20.084-20.084c11.093,0,20.084,8.99,20.084,20.084C180.358,349.448,171.368,358.439,160.275,358.439z M241.943,239.278H134.731v-98.064h107.212V239.278z M351.737,358.439c-11.094,0-20.084-8.991-20.084-20.084 c0-11.094,8.99-20.084,20.084-20.084c11.092,0,20.084,8.99,20.084,20.084C371.821,349.448,362.829,358.439,351.737,358.439z M382.047,239.278H270.061v-98.064h111.986V239.278z"></path> </g> </g></svg>
            <h1>TRAIN TICKET</h1>
        </div>
        <div class="new2container mt-4">
            <div class="card-body rounded-3">
                <div class="row">
                    <div class="col-12 col-md-6">
                        <p><strong>Train Name:</strong> ${trainName}</p>
                        <p><strong>Train Number:</strong> ${trainNumber}</p>
                        <p><strong>Seat Number:</strong> ${seatNumber}</p>
                    </div>
                 
                    <div class="col-12 col-md-6">
                        <p><strong>Departure Time:</strong> ${departureTime}</p>
                        <p><strong>Coach Type:</strong> ${coachType}</p>
                        <p><strong>Price:</strong> ${price} INR</p>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12 col-md-6">
                        <p><strong>Number of Tickets:</strong> ${numberOfTickets}</p>
                    </div>
                    <div class="col-12 col-md-6">
                        <p><strong>Travel Date:</strong> ${travelDate}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="new3container">
            <h2>BOARDING PASS</h2>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>    
</body>
</html>