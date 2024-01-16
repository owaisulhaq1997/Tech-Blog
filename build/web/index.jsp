
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    List<Post> posts = postDao.getAllPosts();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <!-- adding css from bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="css/mystyle.css" type="text/css">

    </head>
    <body>
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        <!--banner-->
        <div class="container-fluid primary-background">
            <div class="jumbotron custom-jumbotron">
                <div class="container">
                    <h2 class="display-3">Welcome to Tech Blog</h2>
                    <p>A programming language is a system of notation for writing computer programs. The source code for a simple computer program written in the C programming language. The gray lines are comments that help explain the program to humans in a natural language. When compiled and run, it will give the output "Hello, world!".</p>
                    <a href="register_page.jsp" class='btn btn-outline-light btn-lg'><span class="fa fa-user-plus"></span> Start! It's Free</a>
                    <a href="login_page.jsp" class='btn btn-outline-light btn-lg'><span class="fa fa-user-circle fa-spin"></span> Login</a>
                </div>
            </div>
        </div>
        <!--cards-->
        <div class="container">
            <!--row-1-->
            <div class="row pt-3">
                <!--card-1-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <%
                                if (posts.size() > 0) {
                                    for (Post post : posts) {
                            %>
                            <b><%= post.getpTitle()%></b>
                            <p><%= post.getpContent()%></p>
                            <pre><%= post.getpCode()%></pre>

                        </div>
                        <div class="card-footer primary-background">
                            <a href="show_blog_page.jsp?post_id=<%= post.getpId()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                            <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-up"></i><span> 10</span></a>
                            <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-comment-dots"></i><span> 20</span></a>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>

        <!--JavaScript-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    </body>
</html>
