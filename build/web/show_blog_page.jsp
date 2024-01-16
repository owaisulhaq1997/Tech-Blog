
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%
    int id = 0;
    String name = null;
    String email = null;
    String gender = null;
    String password = null;
    Timestamp reg_date = null;
    User user = (User) session.getAttribute("currentUser");
    if (user != null) {
        id = user.getUserId();
        name = user.getUsername();
        email = user.getEmail();
        password = user.getPassword();
        gender = user.getGender();
        reg_date = user.getReg_date();
    } else {
        response.sendRedirect("login_page.jsp");
    }
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    Post post = postDao.getPostByPostId(postId);
    ArrayList<Category> categories = postDao.getAllCategories();
    UserDao userDao = new UserDao((Connection) ConnectionProvider.getConnection());
    User poster = userDao.getUserByUserId(post.getUserId());
    LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= post.getpTitle()%></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="css/mystyle.css" type="text/css">
    </head>
    <body>
        <%@include file="profile_navbar.jsp" %>
        <!--main content of page-->
        <main>
            <div class="container">
                <div class="row my-4">
                    <div class="col-md-8 offset-md-2">
                        <div class="card">
                            <div class="card-header primary-background text-center" style="color: #ffffff">
                                <h4><%= post.getpTitle()%></h4>
                            </div>
                            <div class="card-body">
                                <p><%= post.getpContent()%></p>
                                <pre><%= post.getpCode()%></pre>
                                <p>Posted By: <%= poster.getUsername() %></p>
                                <p>Posted Date: <%= post.getpDate().toLocaleString() %></p>
                            </div>
                            <div class="card-footer primary-background">
                                <a href="#" onclick="doPost(<%= postId %>,<%= id %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-up"></i><span class="like-counter"> <%= likeDao.countLikesOnPost(postId) %></span></a>
                                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-comment-dots"></i><span> 20</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--main content of page-->
        <!--start of user modal-->
        <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-center primary-background color-white">
                        <h3 class="modal-title w-100" id="exampleModalLabel" style="color: white;">Tech Blog</h3>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center" id="profile-details">
                        <table class="table max-width: 100px;">
                            <tbody>
                                <tr>
                                    <th><h5>ID:</h5></th>
                                    <td><h5><%= id%></h5></td>
                                </tr>
                                <tr>
                                    <th><h5>Name:</h5></th>
                                    <td><h5><%= name%></h5></td>
                                </tr>
                                <tr>
                                    <th><h5>Email:</h5></th>
                                    <td><h5><%= email%></h5></td>
                                </tr>
                                <tr>
                                    <th><h5>Gender:</h5></th>
                                    <td><h5><%= gender%></h5></td>
                                </tr>
                                <tr>
                                    <th><h5>Registration Date:</h5></th>
                                    <td><h5><%= reg_date%></h5></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--profile-edit-->
                    <div id="profile-edit" style="display: none;">
                        <h3 class="text-center mt-2">Edit Details</h3>
                        <form action="EditServlet" method="POST">
                            <table class="table">
                                <tr>
                                    <td><h5 style="text-align: center">ID:</h5></td>
                                    <td><%= id%></td>
                                </tr>
                                <tr>
                                    <td><h5 style="text-align: center">Name</h5></td>
                                    <td><input type="text" value="<%=name%>" class="form-control" name="user_name"/></td>
                                </tr>
                                <tr>
                                    <td><h5 style="text-align: center">Email:</h5></td>
                                    <td><input type="email" value="<%=email%>" class="form-control" name="user_email"/></td>
                                </tr>
                                <tr>
                                    <td><h5 style="text-align: center">Password:</h5></td>
                                    <td><input type="password" value="<%=password%>" class="form-control" name="user_password"/></td>
                                </tr>
                                <tr>
                                    <td><h5 style="text-align: center">Gender:</h5></td>
                                    <td>
                                        <input type="radio" id="gender" value="male" name="user_gender"> Male &nbsp;&nbsp;
                                        <input type="radio" id="gender" value="female" name="user_gender"> Female
                                    </td>
                                </tr>
                            </table>
                            <div class="container text-center mb-2">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                            </div>
                        </form>
                    </div>
                    <!--profile-edit-->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="edit-profile-btn">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of user modal-->
        <!--add post modal-->
        <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Post</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <select class="form-control" name="cid" id="cid">
                                    <option selected disabled>---Select Category---</option>
                                    <%
                                        if (categories.size() > 0) {
                                            for (Category c : categories) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%= c.getcName()%></option>
                                    <% }
                                        }%>
                                </select>
                            </div>  <br/>
                            <input type="text" class="form-control" placeholder="Enter Post Title" name="pTitle" id="pTitle"/> <br/>
                            <textarea class="form-control" rows="5" placeholder="Enter Post Content" name="pContent" id="pContent"></textarea> <br/>
                            <textarea class="form-control" rows="5" placeholder="Enter Program Code (if any)" name="pCode" id="programCode"></textarea> <br/>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--add post modal-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/myScripts.js"></script>
        <script>
            let toggleEdit = true;
            $(document).ready(function () {
                $("#edit-profile-btn").click(function () {
                    if (toggleEdit) {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        toggleEdit = false;
                        $(this).text("Back");
                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        toggleEdit = true;
                        $(this).text("Edit");
                    }
                });
            });
            $("#add-post-form").on("submit", function (event) {
                event.preventDefault();
                var selectElement = document.getElementById('cid');
                var selectedValue = selectElement.value;
                console.log(selectedValue);
                console.log(document.getElementById('pTitle').value);
                console.log(document.getElementById('pContent').value);
                console.log(document.getElementById('programCode').value);
                let form = new FormData(this);
                console.log("form: " + form.toLocaleString());
                $.ajax({
                    url: "AddPostServlet",
                    type: "POST",
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log("successfully posted\n" + data);
                        if (data.trim() === 'posted') {
                            swal("Successfully Posted!", "Your Post has been posted. Kindly view.", "success").then((value) => {
                                window.location = "profile_page.jsp";
                            });
                        } else {
                            swal("Error", data, "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Error", data, "error");
                    },
                    processData: false,
                    contentType: false
                });
            });
        </script>
    </body>
</html>
