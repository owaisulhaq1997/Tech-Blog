<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <!-- adding css from bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="css/mystyle.css" type="text/css">
    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid" alt="error.png"/>
            <h3 class="display-3">Something went wrong!!!</h3>
            <h3><%= exception%> <br/></h3>
            <a href="index.jsp" class="btn primary-background text-white btn-lg">Home</a>
        </div>
        
    </body>
</html>
