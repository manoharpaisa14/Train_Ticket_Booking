<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
     <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
        }

        .bg-image {
            background-image: url('https://t3.ftcdn.net/jpg/10/14/18/58/240_F_1014185892_A9XTRW7PkLz8p18OtvVjpPeGzst5pOud.jpg');
            background-size: cover;
            background-position: center;
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: -1;
            background-attachment:fixed;
        }

        .navbar-custom {
            background-color: #333;
        }

        .navbar-custom a {
            color: white !important;
        }

        .vh-50 {
            height: 50vh;
        }

        .card {
            border-radius: 1rem;
        }
        #switch-to-login,#switch-to-register{
            text-decoration: none;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body style="background-color: whitesmoke;">
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">Train Ticket Booking</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="bg-image"></div>
    <section class="vh-50 rail">
        <div class="container py-5 h-50 mt-4">
            <div class="row d-flex justify-content-end align-items-center">
                <div class="col-11 col-md-7 col-lg-5 col-xl-4">
                    <div class="card bg-dark text-white" style="border-radius: 1rem;">
                        <div class="card-body p-5 text-center">

                            <form id="login-form" action="LoginCheck" method="post" style="display: block;">
                                <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                <hr class="hr"/>
                                <div class="form-outline form-white mb-4">
                                    <input type="text" name="username" placeholder="Username" class="form-control form-control-sm" required>
                                </div>

                                <div class="form-outline form-white mb-4">
                                    <input type="password" name="password" placeholder="Password" class="form-control form-control-sm"/>
                                </div>

                                <div>
                                    <button class="btn btn-outline-light btn-lg px-5" style="margin-bottom: 100px;" role="button" area-pressed="true" type="submit">Login</button>

                                    <p style="margin-top:-40px;" class="form-outline">
                                        <a href="javascript:void(0);" id="switch-to-register" class="text-white-50">Don't have an account? Sign up here</a>
                                    </p>
                                </div>

                                
                            </form>

                            <form id="register-form" action="RegisterCheck" method="post" style="display: none; margin-bottom:-50px;">
                                <h2 class="fw-bold mb-2 text-uppercase">Sign Up</h2>
                                <hr class="hr"/>
                                <div class="form-outline form-white mb-4">
                                    <input type="text" name="username" placeholder="Username" class="form-control form-control-sm" required>
                                </div>
                                <div class="form-outline form-white mb-4">
                                    <input type="email" name="email" placeholder="Email" class="form-control form-control-sm" required/>
                                </div>
                                <div class="form-outline form-white mb-4">
                                    <input type="text" name="phone" placeholder="Phone" class="form-control form-control-sm" required/>
                                </div>
                                <div class="form-outline form-white mb-4">
                                    <input type="password" name="password" placeholder="Password" class="form-control form-control-sm" required/>
                                </div>
                                <div>
                                    <button type="submit" class="btn btn-outline-light btn-lg px-5">Sign Up</button>
                                <p class="mt-3"><a href="#" id="switch-to-login" class="text-white-50">Already have an account? Login here</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        document.getElementById("switch-to-register").addEventListener("click", function () {
            document.getElementById("login-form").style.display = "none";
            document.getElementById("register-form").style.display = "block";
        });
        document.getElementById("switch-to-login").addEventListener("click", function () {
            document.getElementById("register-form").style.display = "none";
            document.getElementById("login-form").style.display = "block";
        });
    </script>
</body>
</html>