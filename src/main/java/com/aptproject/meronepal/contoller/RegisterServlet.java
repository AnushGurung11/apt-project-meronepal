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

<<<<<<<HEAD @WebServlet(name="RegisterServlet",urlPatterns={"/register"})=======
//TODO use utils for user validation
// After completing the register then drop to the home jsp
// Work on the Login and also manage session
// After finishing login and also manage the booking related using User login session
// Validating Phone number field for string

// Servlet which handles registration
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
>>>>>>> bcaf82d (testing)
public class RegisterServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
        rd.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get data from the registration form
        String userName = request.getParameter("username");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");


        final boolean isValidName = !ValidationUtil.isNullOrEmpty(userName)
                && ValidationUtil.isAlphanumericStartingWithLetter(userName)
                && userName.length() > 5;
        String errorUser = isValidName ? "" : "Name not Proper! ";

        final boolean isValidMail = ValidationUtil.isValidEmail(email);
        String errorMail = isValidMail ? "" : "Mail not Proper! ";

        final boolean isValidNum = ValidationUtil.isValidPhone(phoneNumber);
        String errorNum = isValidNum ? "" : "Not a Proper Phone number !";

        final boolean isValidPass = ValidationUtil.isValidPassword(password);
        String errorPass = isValidPass ? "" : "Password not Proper! ";

        final boolean isValidCon = ValidationUtil.doPasswordsMatch(password, confirmPassword);
        String errorCon = isValidCon ? "" : "Password not matching! ";

        String error_ = errorUser + errorMail + errorPass + errorCon;
        request.setAttribute("error", error_);
        request.setAttribute("erUser", errorUser);
        request.setAttribute("erMail", errorMail);

        //if error in user data provide feedback to same page
        if (!error_.isBlank()) {
            RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
            rd.forward(request, response);
        }else {
            // if user details all good, hash it before storing it
            String hashedPassword = PasswordUtil.getHashPassword(password);

            //Create user entry on database users table
            final UserDAO userDAO = new UserDAO();
            int check = userDAO.insertUser(userName, email,  phoneNumber, hashedPassword);
            switch (check) {
                case 1:
                    //After successful login we will save the user to the session and redirect to the Home page
                    response.sendRedirect("Login.jsp");
                    break;
                //if check is 2 user already present display user already present error
                //send user present message to user in register page
                case 2:
                    request.setAttribute("error", "User/Email already present!");
                    RequestDispatcher rdisp = request.getRequestDispatcher("/register.jsp");
                    rdisp.forward(request, response);
                    break;
                default:
                    System.out.println("Server error: " + check + " :error code");
                    break;
            }
        }

    }
}