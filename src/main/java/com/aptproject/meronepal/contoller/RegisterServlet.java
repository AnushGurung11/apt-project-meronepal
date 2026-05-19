package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.UserDAO;
import com.aptproject.meronepal.utility.PasswordUtil;
import com.aptproject.meronepal.utility.ValidationUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet for handling user registration.
 * URL Mapping: {@code /register}
 *
 * GET: forwards to {@code register.jsp} to display registration form
 * POST: validates input, inserts user via {@code UserDAO}, handles errors
 *
 * Return codes from {@code insertUser}:
 * {@code 1} — success, redirects to {@code /login}
 * {@code 2} — duplicate username or email
 * {@code 3} or other — database error
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    /**
     * doGet — displays the registration form page
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Forward to registration form view
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp");
        rd.forward(request, response);
    }

    /**
     * doPost — validates registration input and creates new user
     *
     * @param request  {@code HttpServletRequest} containing form parameters
     * @param response {@code HttpServletResponse} for redirect or forward
     * @throws ServletException if servlet processing fails
     * @throws IOException      if redirect or I/O operation fails
     *
     * Expected params:
     * {@code username} — required, alphabetic, more than 3 chars
     * {@code phoneNumber} — must pass phone validation
     * {@code email} — must be valid email format
     * {@code password} — must meet complexity rules
     * {@code confirmPassword} — must match password
     *
     * Sets request attributes for errors and previous input values.
     * Redirects to {@code /login} on success, forwards back to form on error.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read form parameters
        String userName        = request.getParameter("username");
        String phoneNumber     = request.getParameter("phoneNumber");
        String email           = request.getParameter("email");
        String password        = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate each field using ValidationUtil
        final boolean isValidName = !ValidationUtil.isNullOrEmpty(userName)
                && ValidationUtil.isAlphabetic(userName)
                && userName.length() > 3;
        String errorUser = isValidName ? "" : "Name not proper (letters only, more than 3 chars). ";

        final boolean isValidMail = ValidationUtil.isValidEmail(email);
        String errorMail = isValidMail ? "" : "Email address is not valid. ";

        final boolean isValidNum = ValidationUtil.isValidPhone(phoneNumber);
        String errorNum = isValidNum ? "" : "Phone number is not valid. ";

        final boolean isValidPass = ValidationUtil.isValidPassword(password);
        String errorPass = isValidPass ? "" : "Password must have 1 uppercase, 1 number, 1 special character. ";

        final boolean isValidCon = ValidationUtil.doPasswordsMatch(password, confirmPassword);
        String errorCon = isValidCon ? "" : "Passwords do not match. ";

        // Combine all error messages
        String aggregatedErrors = errorUser + errorMail + errorNum + errorPass + errorCon;

        // Log validation failures to console for debugging
        if (!aggregatedErrors.isBlank()) {
            System.out.println("=== Registration Validation Failed ===");
            System.out.println("User    : " + userName);
            System.out.println("Email   : " + email);
            if (!errorUser.isEmpty()) System.out.println("  [ERR] Username  : " + errorUser);
            if (!errorMail.isEmpty()) System.out.println("  [ERR] Email     : " + errorMail);
            if (!errorNum.isEmpty())  System.out.println("  [ERR] Phone     : " + errorNum);
            if (!errorPass.isEmpty()) System.out.println("  [ERR] Password  : " + errorPass);
            if (!errorCon.isEmpty())  System.out.println("  [ERR] Confirm   : " + errorCon);
            System.out.println("======================================");
        }

        // Set error messages and previous input values for the view
        request.setAttribute("error",  aggregatedErrors);
        request.setAttribute("erUser", errorUser);
        request.setAttribute("erMail", errorMail);
        request.setAttribute("erNum",  errorNum);
        request.setAttribute("erPass", errorPass);
        request.setAttribute("erCon",  errorCon);

        // Re-populate form fields so user doesn't lose input
        request.setAttribute("prevUserName", userName);
        request.setAttribute("prevEmail",    email);
        request.setAttribute("prevPhone",    phoneNumber);

        // If validation failed, forward back to form
        if (!aggregatedErrors.isBlank()) {
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp");
            rd.forward(request, response);
            return;
        }

        // Validation passed: attempt to insert user into database
        UserDAO userDAO = new UserDAO();
        try {
            String hashedPassword = PasswordUtil.getHashPassword(password);
            int check = userDAO.insertUser(userName, email, phoneNumber, hashedPassword);

            System.out.println("=== Registration DB Result: " + check + " (user: " + userName + ") ===");

            // Handle result based on return code
            switch (check) {
                case 1:
                    // Success: redirect to login page
                    System.out.println("[OK] User registered successfully: " + email);
                    response.sendRedirect(request.getContextPath() + "/login");
                    break;

                case 2:
                    // Duplicate username or email
                    System.out.println("[WARN] Duplicate account attempt: " + email);
                    request.setAttribute("duplicateError",
                            "An account with this username or email already exists.");
                    RequestDispatcher rdDup = request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp");
                    rdDup.forward(request, response);
                    break;

                default:
                    // Unexpected database error
                    System.out.println("[ERR] DB insert returned unexpected code: " + check);
                    request.setAttribute("error",
                            "Registration failed due to a server error. Please try again.");
                    RequestDispatcher rdErr = request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp");
                    rdErr.forward(request, response);
                    break;
            }
        } catch (Exception e) {
            // Log any unexpected exceptions
            System.out.println(e.getLocalizedMessage());
        }
    }
}