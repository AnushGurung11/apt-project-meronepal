package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.UserDAO;
import com.aptproject.meronepal.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.regex.Pattern;

// Servlet which handles registration
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    // DAO object created to interact with database
    //Database bata data ko lagi banauna parne DAO
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get data from the registration form
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Remove unnessary spaces between inputs
        if (firstName != null) firstName = firstName.trim();
        if (lastName != null) lastName = lastName.trim();
        if (email != null) email = email.trim();
        if (password != null) password = password.trim();
        if (confirmPassword != null) confirmPassword = confirmPassword.trim();

        // Fields haru empty xa vaney fill out garne response
        if (firstName == null || firstName.isEmpty() ||
            lastName == null || lastName.isEmpty() ||
            email == null || email.isEmpty() ||
            password == null || password.isEmpty() ||
            confirmPassword == null || confirmPassword.isEmpty()) {

            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }

        // Email to format milexaki nai 
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        if (!Pattern.matches(emailRegex, email)) {
            request.setAttribute("error", "Invalid email format.");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }

        // Password verification duitai password milexaki nai herne
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Password and confirm password do not match.");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }

        // Email pailai use vaxa ki nai validate garne
        if (userDAO.emailExists(email)) {
            request.setAttribute("error", "Email already registered.");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }

        // Naya user banayera data halne
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(password);

        // Default role as customer and status will be active
        user.setUserRole("Customer");
        user.setStatus("Active");

        // Resgistered xa vaney database ma entry garne
        boolean isRegistered = userDAO.registerUser(user);

        if (isRegistered) {
            // Create session after successful registration
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);
            session.setAttribute("userRole", user.getUserRole());

            // Redirect user to home page
            response.sendRedirect(request.getContextPath() + "/Login");
        } else {
            // Show error if registration fails
            request.setAttribute("error", "Registration failed. Please try again.");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        }
    }
}