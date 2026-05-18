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
 * Servlet for updating user profile details.
 * URL Mapping: {@code /profile/update}
 *
 * GET: shows edit form with current user data
 * POST: validates and updates username, email, phone
 * Redirects to {@code /login} if user not authenticated
 */
@WebServlet(name = "UserProfileUpdateServlet", urlPatterns = {"/profile/update"})
public class UserProfileUpdateServlet extends HttpServlet {

    // Path to edit profile form JSP
    private static final String EDIT_PROFILE_JSP = "/WEB-INF/pages/profile/edit-profile.jsp";
    // Path to read-only profile view JSP
    private static final String PROFILE_JSP = "/WEB-INF/pages/profile/profile.jsp";

    /**
     * doGet — displays edit profile form with current user data
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user from session
        User currentUser = (User) SessionUtil.getAttribute(request, "user");

        // Redirect to login if not authenticated
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Pre-fill form with existing user data
        request.setAttribute("user",        currentUser);
        request.setAttribute("userName",    currentUser.getUserName());
        request.setAttribute("email",       currentUser.getEmail());
        request.setAttribute("phoneNumber", currentUser.getPhoneNumber());

        request.getRequestDispatcher(EDIT_PROFILE_JSP).forward(request, response);
    }

    /**
     * doPost — validates and updates user profile fields
     *
     * @param request  {@code HttpServletRequest} containing form parameters
     * @param response {@code HttpServletResponse} for redirect or forward
     * @throws ServletException if servlet processing fails
     * @throws IOException      if redirect or I/O operation fails
     *
     * Expected params:
     * {@code userName} — required, not empty
     * {@code email} — required, valid email format
     * {@code phoneNumber} — required, 10 digits starting with 9
     *
     * DAO return codes:
     * {@code 1} — success, updates session and forwards to profile
     * {@code 2} — duplicate username or email
     * {@code 4} — user not found, invalidates session
     * other — general error, shows message on form
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user from session
        User currentUser = (User) SessionUtil.getAttribute(request, "user");

        // Redirect to login if not authenticated
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Read form parameters
        String newUsername = request.getParameter("userName");
        String newEmail    = request.getParameter("email");
        String newPhone    = request.getParameter("phoneNumber");

        // Validate username
        if (ValidationUtil.isNullOrEmpty(newUsername)) {
            forwardWithError(request, response, currentUser, "Username is required.");
            return;
        }

        // Validate email
        if (ValidationUtil.isNullOrEmpty(newEmail) || !ValidationUtil.isValidEmail(newEmail)) {
            forwardWithError(request, response, currentUser, "Please enter a valid email address.");
            return;
        }

        // Validate phone number (Nepali mobile format)
        if (ValidationUtil.isNullOrEmpty(newPhone) || !ValidationUtil.isValidPhone(newPhone)) {
            forwardWithError(request, response, currentUser,
                    "Phone number must be 10 digits and start with 9.");
            return;
        }

        // Build updated user object with preserved fields
        User updatedUser = new User();
        updatedUser.setUserId(currentUser.getUserId());
        updatedUser.setUserName(newUsername.trim());
        updatedUser.setEmail(newEmail.trim().toLowerCase());
        updatedUser.setPhoneNumber(newPhone.trim());
        updatedUser.setUserRole(currentUser.getUserRole());
        updatedUser.setPasswordHash(currentUser.getPasswordHash());

        // Update user via DAO
        UserDAO userDAO = new UserDAO();
        int result = userDAO.updateUser(updatedUser);

        // Handle result based on return code
        switch (result) {
            case 1: {
                // Success: update session and forward to profile
                currentUser.setUserName(newUsername.trim());
                currentUser.setEmail(newEmail.trim().toLowerCase());
                currentUser.setPhoneNumber(newPhone.trim());
                SessionUtil.setAttribute(request, "user", currentUser);

                request.setAttribute("user",        currentUser);
                request.setAttribute("userName",    currentUser.getUserName());
                request.setAttribute("email",       currentUser.getEmail());
                request.setAttribute("phoneNumber", currentUser.getPhoneNumber());
                request.setAttribute("userRole",    currentUser.getUserRole());
                request.setAttribute("success",     "Profile updated successfully!");

                request.getRequestDispatcher(PROFILE_JSP).forward(request, response);
            }
            case 2 :
                // Duplicate username or email
                    forwardWithError(request, response, currentUser,
                            "That username or email is already taken by another account.");

            case 4: {
                // User not found: invalidate session and redirect to login
                SessionUtil.invalidateSession(request);
                response.sendRedirect(request.getContextPath() + "/login");
            }
            default :
                // General error or DB failure
                    forwardWithError(request, response, currentUser,
                            "Failed to update profile. Please try again later.");
        }
    }

    /**
     * Forwards back to edit form with error message and preserved input
     *
     * @param request     {@code HttpServletRequest} to set error attributes
     * @param response    {@code HttpServletResponse} to forward to JSP
     * @param currentUser {@code User} from session for re-filling form
     * @param errorMsg    error message to display
     * @throws ServletException if forward fails
     * @throws IOException      if forward fails
     */
    private void forwardWithError(HttpServletRequest request,
                                  HttpServletResponse response,
                                  User currentUser,
                                  String errorMsg)
            throws ServletException, IOException {

        request.setAttribute("error",       errorMsg);
        request.setAttribute("user",        currentUser);

        // Re-populate form with submitted values or fallback to session data
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