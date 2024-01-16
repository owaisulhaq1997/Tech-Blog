<%@page import="com.tech.blog.entities.User"%>
<%
    User user2 = (User) session.getAttribute("currentUser");
%>

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <div class="container-fluid">
        <a class="navbar-brand" href="profile_page.jsp"><span class="fa fa-book"></span> Tech Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp"><span class="fa fa-home"></span> Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <span class="fa fa-ellipsis-h"></span> Categories
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Programming</a></li>
                        <li><a class="dropdown-item" href="#">Networking</a></li>
                        <!--            <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>-->
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-edit"></span> Add Post</a>
                </li>
            </ul>
        </div>
        <div class="ms-auto">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#profileModal"><span class="fa fa-user-circle"></span>
                        <% if(user2!=null){%>
                        <%= user2.getUsername()%>
                        <%}%>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><span class="fa fa-power-off"></span> Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


