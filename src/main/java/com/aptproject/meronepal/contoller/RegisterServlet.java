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
 * doPost method gets parameters form the request
 * Validates the entered values, if all good checks for sends to the user DAO
 * returns 1: No duplicate users and successful insertion of user
 * returns 2: For duplicate user, which already exist and denies the user input
 *
 * on successful register will redirect to {@code /login}
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    // Creating a USer DAO object
    private final UserDAO userDAO = new UserDAO();

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     *
     * @code /register
     * redirects to register.jsp page
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //On get request, redirects to register.jsp page
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp");
        rd.forward(request, response);
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     *
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Getting parameters for the request
        String userName = request.getParameter("username");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");


        // Validating name checking for nul, empty and length
        final boolean isValidName = !ValidationUtil.isNullOrEmpty(userName)
                && ValidationUtil.isAlphabetic(userName)
                && userName.length() > 3;
        String errorUser = isValidName ? "" : "Name not Proper! ";

        // Email Regex pattern checking
        final boolean isValidMail = ValidationUtil.isValidEmail(email);
        String errorMail = isValidMail ? "" : "Mail not Proper! ";

        // Num format checking
        final boolean isValidNum = ValidationUtil.isValidPhone(phoneNumber);
        String errorNum = isValidNum ? "" : "Not a Proper Phone number !";

        // Checking for Password format, Must contain 1 capital letter, 1 special character and 1 number
        final boolean isValidPass = ValidationUtil.isValidPassword(password);
        String errorPass = isValidPass ? "" : "Password not Proper! ";

        // Checking for the similarity of the password
        final boolean isValidCon = ValidationUtil.doPasswordsMatch(password, confirmPassword);
        String errorCon = isValidCon ? "" : "Password not matching! ";


        // Aggregating all the errors
        String aggregatedErrors = errorUser + errorMail + errorNum + errorPass + errorCon;

        // Expose individual error messages for the view layer
        request.setAttribute("error",  aggregatedErrors);
        request.setAttribute("erUser", errorUser);
        request.setAttribute("erMail", errorMail);
        request.setAttribute("erNum",  errorNum);
        request.setAttribute("erPass", errorPass);
        request.setAttribute("erCon",  errorCon);

        // If the there are errors, then send the throw the error message and redirect to the register page
        if (!aggregatedErrors.isBlank()) {
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp");
            rd.forward(request, response);
        }else{

            String hashedPassword = PasswordUtil.getHashPassword(password);
            int check = userDAO.insertUser(userName, email,  phoneNumber, hashedPassword);
            switch (check) {
                case 1:
                    // User successfully created — proceed to login
                    response.sendRedirect(request.getContextPath() + "/login");
                    break;
                case 2:
                    // Duplicate username or email detected — inform the view so it
                    // can display a "Go to Login" prompt for the existing account
                    request.setAttribute("duplicateError","An account with this username or email already exists.");
                    RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp");
                    rd.forward(request, response);
                default:
                    // Unexpected DB error — forward with a generic message
                    request.setAttribute("error", "Registration failed due to a server error. Please try again.");
                    RequestDispatcher rdErr = request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp");
                    rdErr.forward(request, response);
                    break;
            }
        }

    }
}