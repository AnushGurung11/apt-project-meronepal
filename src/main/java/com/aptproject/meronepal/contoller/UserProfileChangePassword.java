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
                System.out.println(e.getLocalizedMessage());
                e.fillInStackTrace();
                request.setAttribute("errorMessage", "An error occurred. Please try again.");
                request.getRequestDispatcher(PASSWORD_WINDOW_JSP).forward(request, response);
            }
        }else{
            System.out.println("Currently No user in session");
            request.setAttribute("NoUser", "No user in session");
            response.sendRedirect(request.getContextPath() + "/login");

        }

    }
}
