package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.utility.CookieUtil;
import com.aptproject.meronepal.utility.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Logout servlet handles user logout by clearing session attributes,
 * removing cookies, and redirecting to the login page.
 * URL Mapping for logout {@code /logout}
 */
@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {

    /**
     * @param request  the HttpServletRequest object
     * @param response the HttpServletResponse object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     *
     * Handles GET request by removing session attributes,
     * expiring the UserName cookie, and redirecting to login page.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Remove specific session attributes before invalidating
        SessionUtil.removeAttribute(request, "user");
        SessionUtil.removeAttribute(request, "role");

        // Invalidate the entire session
        SessionUtil.invalidateSession(request);

        // Expire the UserName cookie by setting its max age to 0
<<<<<<< HEAD
<<<<<<< HEAD
        CookieUtil.deleteCookie(response, "user");
=======
        CookieUtil.addCookie(response, "UserName", "", 0);
>>>>>>> 25e2045 (Logout)
=======
        CookieUtil.deleteCookie(response, "user");
>>>>>>> a37e247 (admin service and packages view)

        // Redirect to login page
        response.sendRedirect(request.getContextPath() + "/login");
        System.out.println("User logout successful");
    }
}