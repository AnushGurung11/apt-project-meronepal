package com.aptproject.meronepal.contoller;

<<<<<<< HEAD
<<<<<<< HEAD
import com.aptproject.meronepal.model.User;
=======
import com.aptproject.meronepal.dao.UserDAO;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.PasswordUtil;
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
=======
import com.aptproject.meronepal.model.User;
>>>>>>> 2ea22dc (completion of User password and Editing User details)
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
 * Servlet for displaying user profile page.
 * URL Mapping: {@code /profile}
 *
 * GET: checks session, sets user attributes, forwards to {@code profile.jsp}
 * Redirects to {@code /login} if user not authenticated.
=======
 * {@code UserProfileServlet} is responsible for handling the profile view of the user
 *
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
=======
 * Servlet responsible for the read-only user profile view.
 *
 * <p>Maps to {@code /profile}. Retrieves the authenticated {@link User}
 * from the HTTP session and forwards all display attributes to the
 * profile JSP. No DAO calls are made here — the session object is the
 * single source of truth for the currently logged-in user.</p>
 *
 * <p>Unauthenticated requests (no session or null user) are redirected
 * to {@code /login} rather than returning a 500 error.</p>
>>>>>>> 2ea22dc (completion of User password and Editing User details)
=======
 * Servlet for displaying user profile page.
 * URL Mapping: {@code /profile}
 *
 * GET: checks session, sets user attributes, forwards to {@code profile.jsp}
 * Redirects to {@code /login} if user not authenticated.
>>>>>>> 108eb2e (backend-completion)
 */
@WebServlet(name = "UserProfileServlet", urlPatterns = {"/profile"})
public class UserProfileServlet extends HttpServlet {

<<<<<<< HEAD
<<<<<<< HEAD
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
<<<<<<< HEAD
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user from session
        User user = (User) SessionUtil.getAttribute(request, "user");

        // Redirect to login if not authenticated
        if (user == null) {
=======
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
=======
    /** Path to the profile view JSP, relative to the web-app root. */
=======
    // Path to profile view JSP
>>>>>>> 108eb2e (backend-completion)
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
>>>>>>> 2ea22dc (completion of User password and Editing User details)

        // Get user from session
        User user = (User) SessionUtil.getAttribute(request, "user");

<<<<<<< HEAD
<<<<<<< HEAD
            // Checking for null
            if(user == null){
                System.out.println("NO User in Session");
                return;
            }else{
                request.setAttribute("user", user);
                request.setAttribute("userName", user.getUserName());
                request.setAttribute("email", user.getEmail());
                request.setAttribute("phoneNumber", user.getPhoneNumber());
                request.setAttribute("userRole", user.getUserRole());
                request.setAttribute("createdAt", user.getCreatedAt());
            }
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/profile/profile.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
            e.fillInStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading profile");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        User currentUser = (User) SessionUtil.getAttribute(request, "user");
        UserDAO userdao = new UserDAO();
        // 🔐 Authentication check
        if (currentUser == null) {
>>>>>>> 176d58a (User Profile Servlet Update user DAO)
=======
        // Guard: no active session or user not logged in → redirect to login
=======
        // Redirect to login if not authenticated
>>>>>>> 108eb2e (backend-completion)
        if (user == null) {
>>>>>>> 2ea22dc (completion of User password and Editing User details)
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        // Set user fields as request attributes for JSP
=======
        // Expose individual fields as request attributes for the JSP
>>>>>>> 2ea22dc (completion of User password and Editing User details)
=======
        // Set user fields as request attributes for JSP
>>>>>>> 108eb2e (backend-completion)
        request.setAttribute("user",        user);
        request.setAttribute("userName",    user.getUserName());
        request.setAttribute("email",       user.getEmail());
        request.setAttribute("phoneNumber", user.getPhoneNumber());
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
        try {
            // 📥 Collect form data
            String newUsername = request.getParameter("userName");
            String newEmail = request.getParameter("email");
            String newPhone = request.getParameter("phoneNumber");
            String newPassword = request.getParameter("newPassword"); // Optional
            String confirmPassword = request.getParameter("confirmPassword"); // Optional
=======
        // Defensive null-check: role may be null if old session pre-dates the getUser() fix
=======
>>>>>>> 108eb2e (backend-completion)
        request.setAttribute("userRole",
                user.getUserRole() != null ? user.getUserRole() : "Customer");
>>>>>>> 2ea22dc (completion of User password and Editing User details)

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
<<<<<<< HEAD
}
<<<<<<< HEAD

>>>>>>> 176d58a (User Profile Servlet Update user DAO)
=======
>>>>>>> 2ea22dc (completion of User password and Editing User details)
=======
}
>>>>>>> 108eb2e (backend-completion)
