<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<div class="row">
    <%
        //Thread.sleep(1000);
        int catId = Integer.parseInt(request.getParameter("cid"));
        PostDao postDao = new PostDao(ConnectionProvider.getConnection());
        LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
        User user = (User) session.getAttribute("currentUser");

        List<Post> posts = null;
        if (catId <= 0) {
            posts = postDao.getAllPosts();
        } else {
            posts = postDao.getPostByCategory(catId);
        }
        if (posts.size() > 0) {
            for (Post post : posts) {
    %>
    <div class="col-md-6">
        <div class="card mt-2">
            <div class="card-body">
                <b><%= post.getpTitle()%></b>
                <p><%= post.getpContent()%></p>
            </div>
            <div class="card-footer primary-background">
                <a href="show_blog_page.jsp?post_id=<%= post.getpId()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-up"></i><span class="like-counter"> <%= likeDao.countLikesOnPost(post.getpId())%></span></a>
                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-comment-dots"></i><span> 20</span></a>
            </div>
        </div>
    </div>
    <%}
        } else {
            out.println("<h3 class='display-5 text-center'>No Posts in this Category.</h3>");
        }

    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="js/myScripts.js"></script>