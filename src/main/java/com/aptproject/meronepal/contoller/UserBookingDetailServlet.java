package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.BookingDAO;
import com.aptproject.meronepal.model.Booking;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.SessionUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.imageio.metadata.IIOInvalidTreeException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserBookingDetailServlet", urlPatterns = {"/my-booking"})
public class UserBookingDetailServlet extends HttpServlet {

    // Instantiate once, reused across requests
    private final BookingDAO bookingDAO = new BookingDAO();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Session guard — redirect to login if no user
        User currentUser = (User) SessionUtil.getAttribute(request, "user");
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // 2. Fetch bookings for this user
            int userId = currentUser.getUserId();
            List<Booking> userBookings = bookingDAO.getBookingsByUserId(userId);

            // 3. Always set the attribute — JSP handles empty list with <c:if>
            request.setAttribute("userBookings", userBookings);

            // 4. Optional: set a message when list is empty
            if (userBookings.isEmpty()) {
                request.setAttribute("infoMessage", "You have no bookings yet.");
                System.out.println("No bookings found for userId: " + userId);
            } else {
                System.out.println("Bookings fetched for userId: " + userId);
                userBookings.forEach(b ->
                        System.out.println("  - bookingId: " + b.getBookingId())
                );
            }

            // 5. Forward to JSP
            RequestDispatcher rd = request.getRequestDispatcher(
                    "/WEB-INF/pages/profile/my-bookings.jsp"   // note leading /
            );
            rd.forward(request, response);

        } catch (Exception e) {
            System.err.println("UserBookingDetailServlet error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Something went wrong loading your bookings.");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session guard
        User currentUser = (User) SessionUtil.getAttribute(request, "user");
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        switch (action != null ? action : "") {

            case "cancel" -> {
                try {
                    int bookingId = Integer.parseInt(request.getParameter("bookingId"));

                    // Security check — make sure this booking belongs to the logged-in user
                    // so a user can't cancel someone else's booking by changing the form value
                    List<Booking> userBookings = bookingDAO.getBookingsByUserId(currentUser.getUserId());
                    boolean ownsBooking = userBookings.stream()
                            .anyMatch(b -> b.getBookingId() == bookingId);

                    if (!ownsBooking) {
                        System.err.println("User " + currentUser.getUserId()
                                + " tried to cancel booking " + bookingId + " — not their booking.");
                        response.sendRedirect(request.getContextPath() + "/my-booking");
                        return;
                    }

                    boolean success = bookingDAO.updateBookingStatus(bookingId, "Cancelled");

                    if (success) {
                        request.getSession().setAttribute("statusMsg",
                                "Booking #APT-" + bookingId + " has been cancelled.");
                    } else {
                        request.getSession().setAttribute("statusMsg",
                                "Could not cancel booking. Please try again.");
                    }

                } catch (NumberFormatException e) {
                    System.err.println("Invalid bookingId in cancel request: " + e.getMessage());
                }

                response.sendRedirect(request.getContextPath() + "/my-booking");
            }

            default -> {
                // Unknown action — just send back to the bookings page
                response.sendRedirect(request.getContextPath() + "/my-booking");
            }
        }
    }

}