package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.SessionUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.format.DateTimeFormatter;

/**
 * Servlet for displaying user profile page.
 * URL Mapping: {@code /profile}
 *
 * GET: checks session, sets user attributes, forwards to {@code profile.jsp}
 * Redirects to {@code /login} if user not authenticated.
 */
@WebServlet(name = "UserProfileServlet", urlPatterns = {"/profile"})
public class UserProfileServlet extends HttpServlet {

    // Path to profile view JSP
    private static final String PROFILE_JSP = "WEB-INF/pages/profile/profile.jsp";

    /**
     * doGet — displays profile page for logged-in user
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     *
     * Sets request attributes: {@code user}, {@code userName}, {@code email},
     * {@code phoneNumber}, {@code userRole}, {@code formattedCreatedAt}
     * Also handles one-time flash messages from session.
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user from session
        User user = (User) SessionUtil.getAttribute(request, "user");

        // Redirect to login if not authenticated
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Set user fields as request attributes for JSP
        request.setAttribute("user",        user);
        request.setAttribute("userName",    user.getUserName());
        request.setAttribute("email",       user.getEmail());
        request.setAttribute("phoneNumber", user.getPhoneNumber());
        request.setAttribute("userRole",
                user.getUserRole() != null ? user.getUserRole() : "Customer");

        // Format creation date for display
        if (user.getCreatedAt() != null) {
            String formattedDate = user.getCreatedAt()
                    .format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
            request.setAttribute("formattedCreatedAt", formattedDate);
        } else {
            request.setAttribute("formattedCreatedAt", "N/A");
        }

        // Handle one-time flash message from session
        Object flashMessage = SessionUtil.getAttribute(request, "message");
        if (flashMessage != null) {
            request.setAttribute("success", flashMessage.toString());
            SessionUtil.removeAttribute(request, "message");
        }

        // Forward to profile view
        RequestDispatcher rd = request.getRequestDispatcher(PROFILE_JSP);
        rd.forward(request, response);
    }
}