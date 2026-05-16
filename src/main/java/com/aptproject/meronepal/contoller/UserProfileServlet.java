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
 * Servlet responsible for the read-only user profile view.
 *
 * <p>Maps to {@code /profile}. Retrieves the authenticated {@link User}
 * from the HTTP session and forwards all display attributes to the
 * profile JSP. No DAO calls are made here — the session object is the
 * single source of truth for the currently logged-in user.</p>
 *
 * <p>Unauthenticated requests (no session or null user) are redirected
 * to {@code /login} rather than returning a 500 error.</p>
 */
@WebServlet(name = "UserProfileServlet", urlPatterns = {"/profile"})
public class UserProfileServlet extends HttpServlet {

    /** Path to the profile view JSP, relative to the web-app root. */
    private static final String PROFILE_JSP = "WEB-INF/pages/profile/profile.jsp";

    /**
     * Handles GET requests to {@code /profile}.
     *
     * <p>Reads the {@link User} stored under the key {@code "user"} in the
     * current session and exposes each field as a request attribute so the
     * JSP can render them via EL (e.g. {@code ${userName}}) without calling
     * bean getters directly.</p>
     *
     * <p>Also consumes any one-shot flash message placed in the session by
     * other servlets (e.g. {@code BookingServlet} stores {@code "message"}
     * after a successful or failed booking). The message is removed from the
     * session after being forwarded so it only shows once.</p>
     *
     * @param request  the incoming {@link HttpServletRequest}
     * @param response the outgoing {@link HttpServletResponse}
     * @throws ServletException if the RequestDispatcher fails
     * @throws IOException      if an I/O error occurs during forwarding
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve the authenticated user — getSession(false) avoids creating a new session
        User user = (User) SessionUtil.getAttribute(request, "user");

        // Guard: no active session or user not logged in → redirect to login
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Expose individual fields as request attributes for the JSP
        request.setAttribute("user",        user);
        request.setAttribute("userName",    user.getUserName());
        request.setAttribute("email",       user.getEmail());
        request.setAttribute("phoneNumber", user.getPhoneNumber());
        // Defensive null-check: role may be null if old session pre-dates the getUser() fix
        request.setAttribute("userRole",
                user.getUserRole() != null ? user.getUserRole() : "Customer");


        if (user.getCreatedAt() != null) {
            String formattedDate = user.getCreatedAt()
                    .format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
            request.setAttribute("formattedCreatedAt", formattedDate);
        } else {
            request.setAttribute("formattedCreatedAt", "N/A");
        }

        // Consume one-shot flash message from session (set by BookingServlet on redirect)
        Object flashMessage = SessionUtil.getAttribute(request, "message");
        if (flashMessage != null) {
            request.setAttribute("success", flashMessage.toString());
            SessionUtil.removeAttribute(request, "message"); // show once, then discard
        }

        RequestDispatcher rd = request.getRequestDispatcher(PROFILE_JSP);
        rd.forward(request, response);
    }
}
