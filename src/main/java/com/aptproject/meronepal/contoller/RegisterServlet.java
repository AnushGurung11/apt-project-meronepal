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
 * On successful register, redirects to {@code /login}
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    /**
     * doGet — renders register.jsp
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp");
        rd.forward(request, response);
    }

    /**
     * doPost — validates input, inserts user, handles all error cases
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── Read parameters ───────────────────────────────────────
        String userName        = request.getParameter("username");
        String phoneNumber     = request.getParameter("phoneNumber");
        String email           = request.getParameter("email");
        String password        = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // ── Validate each field ───────────────────────────────────
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

        // ── Aggregate errors ──────────────────────────────────────
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
        } catch (Exception e){
            System.out.println(e.getLocalizedMessage());
        }
    }
}
