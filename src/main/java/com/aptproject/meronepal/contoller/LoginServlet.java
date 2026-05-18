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


/**
 * Login servlet is used for handling user login and session management
 * URL Mapping for login {@code /login}
 * On successful login, redirect to home page
 */
@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     *
     * do request renders the Login page
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp");
        rd.forward(request, response);
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     *
     * Post request takes the parameters
     * userName and password and check for the user data
     * Any error is thrown on the response
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Taking email and password for the request object
        String email = request.getParameter("email");
        String typedPassword = request.getParameter("password");

        //Creating an empty User DAO object for creating a user object
        UserDAO userDao = new UserDAO();

        //Using email, a user is created using the email
        User user = userDao.getUser(email);

        try{
            if (user == null) {
                request.setAttribute("error", "user or password mismatch!");
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp");
                rd.forward(request, response);
            } else {
                String hashedPassword = user.getPasswordHash();
                boolean matched = PasswordUtil.checkPassword(typedPassword, hashedPassword);
                if (matched) {
                    SessionUtil.setAttribute(request, "user", user) ;
                    SessionUtil.setAttribute(request, "role", user.getUserRole());
                    CookieUtil.addCookie(response, "UserName", user.getUserName(), 30*60);

                    System.out.println(user.getUserName());
                    System.out.println(user.getEmail());
                    System.out.println(user.getUserRole());

                    if ("Admin".equalsIgnoreCase(user.getUserRole())) {
                        response.sendRedirect(request.getContextPath() + "/dashboard");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/home");
                    }
                } else {
                    request.setAttribute("error", "email or password mismatch!");
                    RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp");
                    rd.forward(request, response);
                }
            }
        } catch (Exception e){
            System.out.println(e.getLocalizedMessage());
        }

    }
}
