package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.UserDAO;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.PasswordUtil;
import com.aptproject.meronepal.utility.SessionUtil;
import com.aptproject.meronepal.utility.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

<<<<<<< HEAD
/**
 * Servlet for handling user password change in profile.
 * URL Mapping: {@code /profile/changePassword}
 *
 * GET: forwards to {@code changePassword.jsp} form
 * POST: validates new password, updates via {@code UserDAO}, redirects to profile
 */
@WebServlet(name = "UserProfileChangePassword", urlPatterns = {"/profile/changePassword"})
public class UserProfileChangePassword extends HttpServlet {

    // Path to the password change JSP view
    private static final String PASSWORD_WINDOW_JSP = "/WEB-INF/pages/profile/changePassword.jsp";

    /**
     * doGet — displays the password change form
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Forward to password change form view
        request.getRequestDispatcher(PASSWORD_WINDOW_JSP).forward(request, response);
    }

    /**
     * doPost — validates and updates user password
     *
     * @param request  {@code HttpServletRequest} containing password params
     * @param response {@code HttpServletResponse} for redirect after processing
     * @throws ServletException if servlet processing fails
     * @throws IOException      if redirect or I/O operation fails
     *
     * Expected params:
     * {@code password} — new password, must meet complexity rules
     * {@code confirmPassword} — must match password
     *
     * Requires user in session. Sets {@code successMsg} on success,
     * {@code errorMessage} or field errors on failure.
     * Redirects to {@code /profile} on success, {@code /login} if no session.
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get logged-in user from session
        User currentUser = (User) SessionUtil.getAttribute(request, "user");

        if (currentUser != null) {
            int userID = currentUser.getUserId();
            UserDAO currentUserDAO = new UserDAO();

            // Read password fields from form
            String password        = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            // Validate password complexity
            final boolean isValidPass = ValidationUtil.isValidPassword(password);
            String errorPass = isValidPass ? "" : "Password must have 1 uppercase, 1 number, 1 special character. ";

            // Validate passwords match
            final boolean isValidCon = ValidationUtil.doPasswordsMatch(password, confirmPassword);
            String errorCon = isValidCon ? "" : "Passwords do not match. ";

            // Combine validation errors
            String aggregatedErrors = errorPass + errorCon;

            try {
                // If validation failed, show errors and return to form
                if (!aggregatedErrors.isBlank()) {
                    request.setAttribute("erPass", errorPass);
                    request.setAttribute("erCon",  errorCon);
                    System.out.println(errorCon + errorPass);
                    request.getRequestDispatcher(PASSWORD_WINDOW_JSP).forward(request, response);
                } else {
                    // Hash password and clear plain text from memory
                    String hashedPassword = PasswordUtil.getHashPassword(password);
                    password = null;
                    confirmPassword = null;

                    // Update password in database
                    int passwordUpdateStatus = currentUserDAO.updateUserPassword(userID, hashedPassword);

                    // Set success message and redirect to profile
                    request.getSession().setAttribute("successMsg", passwordUpdateStatus);
                    response.sendRedirect(request.getContextPath() + "/profile");
                }
            } catch (Exception e) {
                // Handle unexpected errors
=======
@WebServlet(name = "UserProfileUpdateServlet", urlPatterns = {"/profile/changePassword"})
public class UserProfileChangePassword extends HttpServlet {

    private static final String PASSWORD_WINDOW_JSP = "/WEB-INF/pages/profile/changePassword.jsp";

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        request.getRequestDispatcher(PASSWORD_WINDOW_JSP).forward(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User currentUser = (User) SessionUtil.getAttribute(request,"user");
        if (currentUser != null){
            int userID = currentUser.getUserId();
            UserDAO currentUserDAO = new UserDAO();

            String password        = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            final boolean isValidPass = ValidationUtil.isValidPassword(password);
            String errorPass = isValidPass ? "" : "Password must have 1 uppercase, 1 number, 1 special character. ";

            final boolean isValidCon = ValidationUtil.doPasswordsMatch(password, confirmPassword);
            String errorCon = isValidCon ? "" : "Passwords do not match. ";

            String aggregatedErrors =errorPass + errorCon;

            try{
                if (!aggregatedErrors.isBlank()){
                    request.setAttribute("erPass", errorPass);
                    request.setAttribute("erCon",  errorCon);
                    System.out.println(errorCon + errorPass);
                    request.getRequestDispatcher(PASSWORD_WINDOW_JSP).forward(request,response);
                }else{
                    String hashedPassword = PasswordUtil.getHashPassword(password);

                    //Cleaning memory
                    password = null;
                    confirmPassword = null;

                    int passwordUpdateStatus = currentUserDAO.updateUserPassword(userID, hashedPassword );

                    request.getSession().setAttribute("successMsg", passwordUpdateStatus);
                    response.sendRedirect(request.getContextPath() + "/profile");
                }
            }catch (Exception e){
>>>>>>> 2ea22dc (completion of User password and Editing User details)
                System.out.println(e.getLocalizedMessage());
                e.fillInStackTrace();
                request.setAttribute("errorMessage", "An error occurred. Please try again.");
                request.getRequestDispatcher(PASSWORD_WINDOW_JSP).forward(request, response);
            }
<<<<<<< HEAD
        } else {
            // No user in session: redirect to login
            System.out.println("Currently No user in session");
            request.setAttribute("NoUser", "No user in session");
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
=======
        }else{
            System.out.println("Currently No user in session");
            request.setAttribute("NoUser", "No user in session");
            response.sendRedirect(request.getContextPath() + "/login");

        }

    }
}
>>>>>>> 2ea22dc (completion of User password and Editing User details)
