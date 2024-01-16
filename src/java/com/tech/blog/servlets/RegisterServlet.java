package com.tech.blog.servlets;

import com.mysql.jdbc.Connection;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

    private String username;
    private String email;
    private String password; 
    private String gender;
    private User user;
    private UserDao userDao;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String condition = request.getParameter("condition");
            if(condition != null){
                this.username = request.getParameter("user_name");
                this.password = request.getParameter("user_password");
                this.email = request.getParameter("user_email");
                this.gender = request.getParameter("user_gender");  
                this.user = new User(this.username, this.email, this.password, this.gender);
                this.userDao = new UserDao((Connection) ConnectionProvider.getConnection());
                String result = userDao.saveUser(user);
                if(result.equalsIgnoreCase("success")){
                    out.println(result);
                }else{
                    out.println(result);
                }
            }else{
                out.println("Kindly check with the Terms & Conditions first");
            }
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    // Optionally, you might want to include the doGet method as well:
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
}
