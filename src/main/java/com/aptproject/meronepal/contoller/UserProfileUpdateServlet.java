package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.UserDAO;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.SessionUtil;
import com.aptproject.meronepal.utility.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet responsible for rendering and processing the user profile update form.
 *
 * <p>Maps to {@code /profile/update} and supports both HTTP GET and POST requests:
 * <ul>
 *   <li><b>GET</b>  — Renders the edit-profile JSP pre-filled with the current session user's data.</li>
 *   <li><b>POST</b> — Validates and processes the submitted form to update the user's
 *                     non-sensitive details (username, email, phone number). Password
 *                     changes are handled by a separate, dedicated endpoint.</li>
 * </ul>
 * </p>
 *
 * <p>All requests require a valid authenticated session. Unauthenticated requests
 * are redirected to {@code /login}.</p>
 *
 * <p>Validation is performed using {@link ValidationUtil}. On any validation failure,
 * the edit form is re-rendered with a descriptive error message. On success, the
 * session user object is refreshed and the user is forwarded to the profile view.</p>
 *
 * @see UserProfileServlet for the read-only profile view
 * @see ValidationUtil     for the validation rules applied to each field
 */
@WebServlet(name = "UserProfileUpdateServlet", urlPatterns = {"/profile/update"})
public class UserProfileUpdateServlet extends HttpServlet {

    /** Path to the edit-profile JSP, relative to the web application root. */
    private static final String EDIT_PROFILE_JSP = "WEB-INF/pages/profile/edit-profile.jsp";

    /** Path to the read-only profile view JSP. */
    private static final String PROFILE_JSP = "WEB-INF/pages/profile/profile.jsp";

    // -------------------------------------------------------------------------
    // GET — Render the edit-profile form
    // -------------------------------------------------------------------------

    /**
     * Handles GET requests to {@code /profile/update}.
     *
     * <p>Retrieves the {@link User} from the current session and forwards all
     * editable field values as request attributes so the JSP can pre-fill the form.</p>
     *
     * @param request  the {@link HttpServletRequest} containing the client session
     * @param response the {@link HttpServletResponse} used to redirect or forward
     * @throws ServletException if the RequestDispatcher encounters a servlet error
     * @throws IOException      if an I/O error occurs during forwarding or redirecting
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User currentUser = (User) SessionUtil.getAttribute(request, "user");

        // Guard: redirect unauthenticated users to login
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Pre-fill the form with existing user data
        request.setAttribute("user",        currentUser);
        request.setAttribute("userName",    currentUser.getUserName());
        request.setAttribute("email",       currentUser.getEmail());
        request.setAttribute("phoneNumber", currentUser.getPhoneNumber());

        request.getRequestDispatcher(EDIT_PROFILE_JSP).forward(request, response);
    }

    // -------------------------------------------------------------------------
    // POST — Validate and persist profile updates
    // -------------------------------------------------------------------------

    /**
     * Handles POST requests to {@code /profile/update}.
     *
     * <p>Validates the submitted form fields using {@link ValidationUtil}, then
     * delegates persistence to {@link UserDAO#updateUser(User)}. The following
     * fields are updated:</p>
     * <ul>
     *   <li>Username — must not be null/empty</li>
     *   <li>Email    — must match a valid email regex pattern</li>
     *   <li>Phone    — must be exactly 10 digits and start with {@code 9}</li>
     * </ul>
     *
     * <p>Password and user role are intentionally excluded from this endpoint
     * to keep sensitive operations isolated.</p>
     *
     * <p>Return codes from {@link UserDAO#updateUser(User)}:</p>
     * <ul>
     *   <li>{@code 1} — Success: session is refreshed and user is forwarded to the profile view.</li>
     *   <li>{@code 2} — Conflict: username or email already belongs to another account.</li>
     *   <li>{@code 4} — Invalid user ID or user not found: session is invalidated and
     *                   user is redirected to login.</li>
     *   <li>{@code 0} or {@code 3} — General failure or DB error: error message is shown on the form.</li>
     * </ul>
     *
     * @param request  the {@link HttpServletRequest} containing form parameters
     * @param response the {@link HttpServletResponse} used to redirect or forward
     * @throws ServletException if the RequestDispatcher encounters a servlet error
     * @throws IOException      if an I/O error occurs during forwarding or redirecting
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User currentUser = (User) SessionUtil.getAttribute(request, "user");

        // Guard: redirect unauthenticated users to login
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // --- 1. Collect raw form parameters ---
        String newUsername = request.getParameter("userName");
        String newEmail    = request.getParameter("email");
        String newPhone    = request.getParameter("phoneNumber");

        // --- 2. Field-level validation via ValidationUtil ---

        // Username: must not be null or blank
        if (ValidationUtil.isNullOrEmpty(newUsername)) {
            forwardWithError(request, response, currentUser, "Username is required.");
            return;
        }

        // Email: must not be blank and must match the email regex
        if (ValidationUtil.isNullOrEmpty(newEmail) || !ValidationUtil.isValidEmail(newEmail)) {
            forwardWithError(request, response, currentUser, "Please enter a valid email address.");
            return;
        }

        // Phone: must be exactly 10 digits starting with 9 (Nepali mobile format)
        if (ValidationUtil.isNullOrEmpty(newPhone) || !ValidationUtil.isValidPhone(newPhone)) {
            forwardWithError(request, response, currentUser,
                    "Phone number must be 10 digits and start with 9.");
            return;
        }

        // --- 3. Build the updated User object ---
        User updatedUser = new User();
        updatedUser.setUserId(currentUser.getUserId());          // Must preserve the primary key
        updatedUser.setUserName(newUsername.trim());
        updatedUser.setEmail(newEmail.trim().toLowerCase());
        updatedUser.setPhoneNumber(newPhone.trim());
        updatedUser.setUserRole(currentUser.getUserRole());      // Role is not user-editable here
        updatedUser.setPasswordHash(currentUser.getPasswordHash()); // Password unchanged in this flow

        // --- 4. Delegate to DAO ---
        UserDAO userDAO = new UserDAO();
        int result = userDAO.updateUser(updatedUser);

        switch (result) {
            case 1 -> {
                // Success: sync the in-memory session object to reflect changes
                currentUser.setUserName(newUsername.trim());
                currentUser.setEmail(newEmail.trim().toLowerCase());
                currentUser.setPhoneNumber(newPhone.trim());
                SessionUtil.setAttribute(request, "user", currentUser);

                // Re-expose updated attributes and forward to the read-only profile view
                request.setAttribute("user",        currentUser);
                request.setAttribute("userName",    currentUser.getUserName());
                request.setAttribute("email",       currentUser.getEmail());
                request.setAttribute("phoneNumber", currentUser.getPhoneNumber());
                request.setAttribute("userRole",    currentUser.getUserRole());
                request.setAttribute("createdAt",   currentUser.getCreatedAt());
                request.setAttribute("success",     "Profile updated successfully!");

                request.getRequestDispatcher(PROFILE_JSP).forward(request, response);
            }
            case 2 ->
                // Conflict: another account already uses this username or email
                    forwardWithError(request, response, currentUser,
                            "That username or email is already taken by another account.");

            case 4 -> {
                // User ID not found — session is stale; force re-login
                SessionUtil.invalidateSession(request);
                response.sendRedirect(request.getContextPath() + "/login");
            }
            default ->
                // Covers case 0 (no rows affected) and case 3 (SQL error)
                    forwardWithError(request, response, currentUser,
                            "Failed to update profile. Please try again later.");
        }
    }

    // -------------------------------------------------------------------------
    // Private helpers
    // -------------------------------------------------------------------------

    /**
     * Re-renders the edit-profile form with a descriptive error message.
     *
     * <p>Existing field values are re-populated from the provided {@link User}
     * so the user does not lose their input context.</p>
     *
     * @param request     the current {@link HttpServletRequest}
     * @param response    the current {@link HttpServletResponse}
     * @param currentUser the session user whose values are used to re-fill the form
     * @param errorMsg    the human-readable error message to display on the form
     * @throws ServletException if the RequestDispatcher encounters a servlet error
     * @throws IOException      if an I/O error occurs during forwarding
     */
    private void forwardWithError(HttpServletRequest request,
                                  HttpServletResponse response,
                                  User currentUser,
                                  String errorMsg)
            throws ServletException, IOException {

        request.setAttribute("error",       errorMsg);
        request.setAttribute("user",        currentUser);

        // Re-populate submitted values so the user doesn't lose their input;
        // fall back to the session values if the parameter was null/blank.
        String submittedUsername = request.getParameter("userName");
        String submittedEmail    = request.getParameter("email");
        String submittedPhone    = request.getParameter("phoneNumber");

        request.setAttribute("userName",
                (submittedUsername != null) ? submittedUsername : currentUser.getUserName());
        request.setAttribute("email",
                (submittedEmail != null)    ? submittedEmail    : currentUser.getEmail());
        request.setAttribute("phoneNumber",
                (submittedPhone != null)    ? submittedPhone    : currentUser.getPhoneNumber());

        request.getRequestDispatcher(EDIT_PROFILE_JSP).forward(request, response);
    }
}
