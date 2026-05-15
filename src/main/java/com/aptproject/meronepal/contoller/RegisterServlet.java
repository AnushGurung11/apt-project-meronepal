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
<<<<<<< HEAD
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
=======
 * Servlet responsible for handling user registration.
 * URL Mapping register {@code /register}
 * doGet will redirect to the register.jsp page
 *
 * doPost method gets parameters from the request,
 * validates them, and delegates to UserDAO.
 * returns 1: successful insertion
 * returns 2: duplicate user/email
 * returns 3: DB/query error
 *
<<<<<<< HEAD
 * on successful register will redirect to {@code /login}
>>>>>>> 63b34cd (Java docs on Registeration process)
=======
 * On successful register, redirects to {@code /login}
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

<<<<<<< HEAD
<<<<<<< HEAD
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
=======
    // Creating a USer DAO object
    private final UserDAO userDAO = new UserDAO();

=======
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
    /**
     * doGet — renders register.jsp
     */
    @Override
<<<<<<< HEAD
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //On get request, redirects to register.jsp page
>>>>>>> 63b34cd (Java docs on Registeration process)
=======
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp");
        rd.forward(request, response);
    }

    /**
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     *
>>>>>>> 63b34cd (Java docs on Registeration process)
=======
     * doPost — validates input, inserts user, handles all error cases
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

<<<<<<< HEAD
<<<<<<< HEAD
        // Read form parameters
=======
        // ── Read parameters ───────────────────────────────────────
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
        String userName        = request.getParameter("username");
        String phoneNumber     = request.getParameter("phoneNumber");
        String email           = request.getParameter("email");
        String password        = request.getParameter("password");
<<<<<<< HEAD
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate each field using ValidationUtil
        final boolean isValidName = !ValidationUtil.isNullOrEmpty(userName)
                && ValidationUtil.isAlphabetic(userName)
                && userName.length() > 3;
        String errorUser = isValidName ? "" : "Name not proper (letters only, more than 3 chars). ";
=======
        // Getting parameters for the request
        String userName = request.getParameter("username");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
=======
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
        String confirmPassword = request.getParameter("confirmPassword");

        // ── Validate each field ───────────────────────────────────
        final boolean isValidName = !ValidationUtil.isNullOrEmpty(userName)
                && ValidationUtil.isAlphabetic(userName)
                && userName.length() > 3;
<<<<<<< HEAD
        String errorUser = isValidName ? "" : "Name not Proper! ";
>>>>>>> 63b34cd (Java docs on Registeration process)
=======
        String errorUser = isValidName ? "" : "Name not proper (letters only, more than 3 chars). ";
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)

        final boolean isValidMail = ValidationUtil.isValidEmail(email);
        String errorMail = isValidMail ? "" : "Email address is not valid. ";

        final boolean isValidNum = ValidationUtil.isValidPhone(phoneNumber);
        String errorNum = isValidNum ? "" : "Phone number is not valid. ";

        final boolean isValidPass = ValidationUtil.isValidPassword(password);
        String errorPass = isValidPass ? "" : "Password must have 1 uppercase, 1 number, 1 special character. ";

        final boolean isValidCon = ValidationUtil.doPasswordsMatch(password, confirmPassword);
        String errorCon = isValidCon ? "" : "Passwords do not match. ";

<<<<<<< HEAD
<<<<<<< HEAD
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
=======

        // Aggregating all the errors
=======
        // ── Aggregate errors ──────────────────────────────────────
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
        String aggregatedErrors = errorUser + errorMail + errorNum + errorPass + errorCon;

        // ── Log validation result to console ─────────────────────
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

        // ── Expose individual errors to the view ─────────────────
        request.setAttribute("error",  aggregatedErrors);
        request.setAttribute("erUser", errorUser);
        request.setAttribute("erMail", errorMail);
        request.setAttribute("erNum",  errorNum);
        request.setAttribute("erPass", errorPass);
        request.setAttribute("erCon",  errorCon);

        // Also re-populate fields so the user doesn't lose their input
        request.setAttribute("prevUserName", userName);
        request.setAttribute("prevEmail",    email);
        request.setAttribute("prevPhone",    phoneNumber);

        // ── Forward back if validation failed ─────────────────────
        if (!aggregatedErrors.isBlank()) {
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp");
            rd.forward(request, response);
            return;
        }

        // ── Attempt DB insertion ───────────────────────────────────
        // FIX: create UserDAO per-request so the connection is always fresh
        UserDAO userDAO = new UserDAO();
        try {
            String hashedPassword = PasswordUtil.getHashPassword(password);
            int check = userDAO.insertUser(userName, email, phoneNumber, hashedPassword);

            System.out.println("=== Registration DB Result: " + check + " (user: " + userName + ") ===");

            switch (check) {
                case 1:
                    // Success — redirect to login
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
                    // Unexpected DB error
                    System.out.println("[ERR] DB insert returned unexpected code: " + check);
                    request.setAttribute("error",
                            "Registration failed due to a server error. Please try again.");
                    RequestDispatcher rdErr = request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp");
                    rdErr.forward(request, response);
                    break;
            }
<<<<<<< HEAD
>>>>>>> 63b34cd (Java docs on Registeration process)
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
=======
        } catch (Exception e){
            System.out.println(e.getLocalizedMessage());
        }
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
    }
}
