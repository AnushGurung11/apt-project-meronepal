package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.UserDAO;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.PasswordUtil;
import com.aptproject.meronepal.utility.SessionUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * {@code UserProfileServlet} is responsible for handling the profile view of the user
 *
 */
@WebServlet(name = "UserProfileServlet", urlPatterns = {"/profile"})
public class UserProfileServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
            // Taking the user object from the session
            User user = (User) SessionUtil.getAttribute(request, "user");

            // Checking for null
            if(user == null){
                System.out.println("NO User in Session");
                return;
            }else{
                request.setAttribute("user", user);
                request.setAttribute("userName", user.getUserName());
                request.setAttribute("email", user.getEmail());
                request.setAttribute("phoneNumber", user.getPhoneNumber());
                request.setAttribute("userRole", user.getUserRole());
                request.setAttribute("createdAt", user.getCreatedAt());
            }
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/profile/profile.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
            e.fillInStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading profile");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        User currentUser = (User) SessionUtil.getAttribute(request, "user");
        UserDAO userdao = new UserDAO();
        // 🔐 Authentication check
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // 📥 Collect form data
            String newUsername = request.getParameter("userName");
            String newEmail = request.getParameter("email");
            String newPhone = request.getParameter("phoneNumber");
            String newPassword = request.getParameter("newPassword"); // Optional
            String confirmPassword = request.getParameter("confirmPassword"); // Optional

            // Basic validation
            if (newUsername == null || newUsername.trim().isEmpty() ||
                    newEmail == null || newEmail.trim().isEmpty()) {
                request.setAttribute("error", "Username and email are required");
                forwardWithError(request, response);
                return;
            }

            // Password validation (only if user is changing it)
            if (newPassword != null && !newPassword.isEmpty()) {
                if (newPassword.length() < 8) {
                    request.setAttribute("error", "New password must be at least 8 characters");
                    forwardWithError(request, response);
                    return;
                }
                if (!newPassword.equals(confirmPassword)) {
                    request.setAttribute("error", "New passwords do not match");
                    forwardWithError(request, response);
                    return;
                }
                // Optional: require current password for confirmation
                String currentPassword = request.getParameter("currentPassword");
                if (currentPassword == null || !PasswordUtil.checkPassword(currentPassword, currentUser.getPasswordHash())) {
                    request.setAttribute("error", "Current password is incorrect");
                    forwardWithError(request, response);
                    return;
                }
            }

            // Prepare updated user object
            User updatedUser = new User();
            updatedUser.setUserId(currentUser.getUserId()); // Critical: keep same ID
            updatedUser.setUserName(newUsername.trim());
            updatedUser.setEmail(newEmail.trim().toLowerCase());
            updatedUser.setPhoneNumber(newPhone);
            updatedUser.setUserRole(currentUser.getUserRole()); // Preserve role

            // Only set password if it's being changed
            if (newPassword != null && !newPassword.isEmpty()) {
                updatedUser.setPasswordHash(newPassword); // DAO will hash it
            } else {
                updatedUser.setPasswordHash(currentUser.getPasswordHash()); // Keep existing hash
            }

            // Execute update
            int result = userdao.updateUser(updatedUser);

            switch (result) {
                case 1 -> {
                    //  Success: update session and redirect
                    currentUser.setUserName(newUsername.trim());
                    currentUser.setEmail(newEmail.trim().toLowerCase());
                    currentUser.setPhoneNumber(newPhone);
                    // Don't update session password hash unless changed
                    if (newPassword != null && !newPassword.isEmpty()) {
                        currentUser.setPasswordHash(PasswordUtil.getHashPassword(newPassword));
                    }
                    SessionUtil.setAttribute(request, "user", currentUser);

                    request.setAttribute("success", "Profile updated successfully!");
                    request.getRequestDispatcher("WEB-INF/pages/profile/profile.jsp")
                            .forward(request, response);
                }
                case 2 -> {
                    request.setAttribute("error", "Username or email already exists");
                    forwardWithError(request, response);
                }
                case 4 -> {
                    // User not found - session invalid?
                    SessionUtil.removeAttribute(request, "user");
                    response.sendRedirect(request.getContextPath() + "/login");
                }
                default -> {
                    request.setAttribute("error", "Failed to update profile. Please try again.");
                    forwardWithError(request, response);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "System error: " + e.getMessage());
            forwardWithError(request, response);
        }
    }

    private void forwardWithError(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/pages/profile/edit-profile.jsp")
                .forward(request, response);
    }
}

