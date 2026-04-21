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

//TODO use utils for user validation
// After completing the register then drop to the home jsp
// Work on the Login and also manage session
// After finishing login and also manage the booking related using User login session
// Validating Phone number field for string

// Servlet which handles registration
@WebServlet(name = "RegisterServlet", urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {

    // DAO object created to interact with database
    // Database bata data ko lagi banauna parne DAO
    private final UserDAO userDAO = new UserDAO();

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO get the parameter from the front end
        // TODO variable ma store gara
    }

}
