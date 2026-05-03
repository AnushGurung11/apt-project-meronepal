package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.UserDAO;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.CookieUtil;
import com.aptproject.meronepal.utility.PasswordUtil;
import com.aptproject.meronepal.utility.SessionUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.getWriter().println("Login page - GET working!");
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp");
        rd.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Request bata chine filed haru aaunu paryo (User name , Email, Password)
        // TODO Variable ma store garne.
        // TODO Authentication
        // TODO Using User DAO/getuser function bata herne.
        // TODO User xa vane, User ko Object return hunxa natra null return hunxa
        // TODO Yho User lai session ma rakhne
        // TODO Aaba login vai sake ko hunxa ra success vaye ma Redirect to dashbaord.
        String userName = request.getParameter("username");
        String typedPassword = request.getParameter("password");
        UserDAO userDao = new UserDAO();
        User user = userDao.getUser(userName);
        //if no user found in database send error message
        if (user == null) {
            request.setAttribute("error", "user or password mismatch!");
            response.getWriter().println("No User");

            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp");
            rd.forward(request, response);
        } else {
            String hashedPassword = user.getPasswordHash();
            boolean matched = PasswordUtil.checkPassword(typedPassword, hashedPassword);
            if (matched) {
                // Adding the user in session and redirecting the user to the home servlet.
                SessionUtil.setAttribute(request, "user", user) ;
                //Also adding the user name as cookies key value, setting maximum age to 30 min
                CookieUtil.addCookie(response, "UserName", user.getUserName(), 30*60);
                response.getWriter().println("Logged in");
                System.out.println(user.getUserName());
                System.out.println(user.getEmail());

                response.sendRedirect(request.getContextPath() + "/home");
            } else {
                //if password is mismatched, send error message to login page
                request.setAttribute("error", "user or password mismatch!");
                response.getWriter().println("Password is incorrect");
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp");
                rd.forward(request, response);
            }
        }
    }
}
