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
 * Servlet for handling user login and session management.
 * URL Mapping: {@code /login}
 *
 * GET: forwards to {@code login.jsp} to display login form
 * POST: validates credentials, creates session, redirects based on user role
 *
 * On successful login: redirects to {@code /dashboard} for Admin or {@code /home} for regular users
 */
@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {

    /**
     * doGet — displays the login page
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Forward to login form page
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp");
        rd.forward(request, response);
    }

    /**
     * doPost — processes login form submission
     *
     * @param request  {@code HttpServletRequest} containing email and password
     * @param response {@code HttpServletResponse} for redirect or forward
     * @throws ServletException if servlet processing fails
     * @throws IOException      if redirect or I/O operation fails
     *
     * Expected params:
     * {@code email} — user's email address
     * {@code password} — plain text password for verification
     *
     * On success: sets session attributes {@code user} and {@code role},
     * adds cookie for {@code UserName}, redirects by role.
     * On failure: sets {@code error} attribute and forwards back to login form.
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read email and password from form
        String email = request.getParameter("email");
        String typedPassword = request.getParameter("password");

        // Get user from database using email
        UserDAO userDao = new UserDAO();
        User user = userDao.getUser(email);

        try {
            // Check if user exists
            if (user == null) {
                request.setAttribute("error", "user or password mismatch!");
                RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp");
                rd.forward(request, response);
            } else {
                // Verify password hash
                String hashedPassword = user.getPasswordHash();
                boolean matched = PasswordUtil.checkPassword(typedPassword, hashedPassword);

                if (matched) {
                    // Login successful: set session and cookie
                    SessionUtil.setAttribute(request, "user", user);
                    SessionUtil.setAttribute(request, "role", user.getUserRole());
                    CookieUtil.addCookie(response, "UserName", user.getUserName(), 30*60);

                    // Log user details for debugging
                    System.out.println(user.getUserName());
                    System.out.println(user.getEmail());
                    System.out.println(user.getUserRole());

                    // Redirect based on user role
                    if ("Admin".equalsIgnoreCase(user.getUserRole())) {
                        response.sendRedirect(request.getContextPath() + "/dashboard");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/home");
                    }
                } else {
                    // Password mismatch
                    request.setAttribute("error", "email or password mismatch!");
                    RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp");
                    rd.forward(request, response);
                }
            }
        } catch (Exception e) {
            // Log any unexpected errors
            System.out.println(e.getLocalizedMessage());
        }
    }
}