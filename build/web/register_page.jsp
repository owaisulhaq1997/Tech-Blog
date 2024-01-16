
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <!-- adding css from bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="css/mystyle.css" type="text/css">

    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background p-5">
            <div class="container">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-user-circle fa-3x"></span><br>
                            Register here
                        </div>
                        <div class="card-body">
                            <form action="RegisterServlet" method="POST" id="registration_form">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Username</label>
                                    <input type="text" class="form-control" id="username" name="user_name">
                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="user_email">
                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" name="user_password">
                                </div>

                                <div class="mb-3">
                                    <label for="gender" class="form-label">Gender</label>
                                    <br>
                                    <input type="radio" id="gender" value="male" name="user_gender"> Male 
                                    <input type="radio" id="gender" value="female" name="user_gender"> Female
                                </div>

                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input" id="termsnconditions" name="condition">
                                    <label class="form-check-label" for="termsnconditions">Agree Terms & Conditions</label>
                                </div>

                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fas fa-sync-alt fa-3x fa-spin"></span>
                                    <h4>Please wait...</h4>
                                </div>
                                <br/>
                                <div class="d-flex justify-content-center">
                                    <button type="submit" class="btn primary-background text-white" id="submit-btn">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--JavaScript-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            console.log("loaded...");
            $("#registration_form").on("submit", function (event) {
                event.preventDefault();
                let form = new FormData(this);
                $("#loader").show();
                $("#submit-btn").hide();
//                now send form data to register servlet
                $.ajax({
                    url: "RegisterServlet",
                    type: "POST",
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(form);
                        console.log(textStatus);
                        console.log(jqXHR);
                        $("#loader").hide();
                        $("#submit-btn").show();
                        if(data.trim() === 'success'){
                            swal("Successfully Registered!", "Login Using Your Credentials", "success").then((value) => {
                            window.location = "login_page.jsp";
                        });
                        }else{
                            swal("Error",data,"error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        $("#loader").hide();
                        $("#submit-btn").show();
                        swal("Something went wrong!", "Try again", "error");
                    },
                    processData: false,
                    contentType: false
                });
            });
        </script>
    </body>
</html>
