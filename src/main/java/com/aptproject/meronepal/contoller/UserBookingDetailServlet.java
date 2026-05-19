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

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Servlet for displaying and managing user's own bookings.
 * URL Mapping: {@code /my-booking}
 *
 * GET: checks session, fetches user's bookings, forwards to my-bookings.jsp
 * POST: handles booking cancellation with ownership verification
 */
@WebServlet(name = "UserBookingDetailServlet", urlPatterns = {"/my-booking"})
public class UserBookingDetailServlet extends HttpServlet {

    // BookingDAO instance reused across requests
    private final BookingDAO bookingDAO = new BookingDAO();

    /**
     * doGet — displays logged-in user's booking history
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if redirect or forward operation fails
     *
     * Redirects to {@code /login} if user not in session.
     * Sets request attributes:
     * {@code userBookings} — list of {@code Booking} for the user
     * {@code infoMessage} — optional message when no bookings exist
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if user is logged in via session
        User currentUser = (User) SessionUtil.getAttribute(request, "user");
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Fetch bookings for the logged-in user
            int userId = currentUser.getUserId();
            List<Booking> userBookings = bookingDAO.getBookingsByUserId(userId);

            // Always set the attribute so JSP can handle empty state
            request.setAttribute("userBookings", userBookings);

            // Set optional info message when no bookings found
            if (userBookings.isEmpty()) {
                request.setAttribute("infoMessage", "You have no bookings yet.");
                System.out.println("No bookings found for userId: " + userId);
            } else {
                // Log booking IDs for debugging
                System.out.println("Bookings fetched for userId: " + userId);
                userBookings.forEach(b ->
                        System.out.println("  - bookingId: " + b.getBookingId())
                );
            }

            // Forward to user bookings view
            RequestDispatcher rd = request.getRequestDispatcher(
                    "/WEB-INF/pages/profile/my-bookings.jsp"
            );
            rd.forward(request, response);

        } catch (Exception e) {
            // Handle unexpected errors gracefully
            System.err.println("UserBookingDetailServlet error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Something went wrong loading your bookings.");
        }
    }

    /**
     * doPost — handles booking actions like cancellation
     *
     * @param request  {@code HttpServletRequest} containing action params
     * @param response {@code HttpServletResponse} for redirect after processing
     * @throws ServletException if servlet processing fails
     * @throws IOException      if redirect or I/O operation fails
     *
     * Expected params:
     * {@code action} — currently supports {@code "cancel"}
     * {@code bookingId} — required when action is cancel
     *
     * Verifies booking ownership before allowing cancellation.
     * Sets session attribute {@code statusMsg} for user feedback.
     * Always redirects back to {@code /my-booking}.
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if user is logged in via session
        User currentUser = (User) SessionUtil.getAttribute(request, "user");
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get action parameter from request
        String action = request.getParameter("action");

        // Route based on action type
        switch (action != null ? action : "") {

            case "cancel" -> {
                try {
                    // Parse booking ID from request
                    int bookingId = Integer.parseInt(request.getParameter("bookingId"));

                    // Security check: verify booking belongs to logged-in user
                    List<Booking> userBookings = bookingDAO.getBookingsByUserId(currentUser.getUserId());
                    boolean ownsBooking = userBookings.stream()
                            .anyMatch(b -> b.getBookingId() == bookingId);

                    if (!ownsBooking) {
                        System.err.println("User " + currentUser.getUserId()
                                + " tried to cancel booking " + bookingId + " — not their booking.");
                        response.sendRedirect(request.getContextPath() + "/my-booking");
                        return;
                    }

                    // Attempt to cancel the booking
                    boolean success = bookingDAO.updateBookingStatus(bookingId, "Cancelled");

                    // Set feedback message in session
                    if (success) {
                        request.getSession().setAttribute("statusMsg",
                                "Booking #APT-" + bookingId + " has been cancelled.");
                    } else {
                        request.getSession().setAttribute("statusMsg",
                                "Could not cancel booking. Please try again.");
                    }

                } catch (NumberFormatException e) {
                    // Handle invalid booking ID format
                    System.err.println("Invalid bookingId in cancel request: " + e.getMessage());
                }

                // Redirect back to bookings page
                response.sendRedirect(request.getContextPath() + "/my-booking");
            }

            default -> {
                // Unknown action: just redirect back
                response.sendRedirect(request.getContextPath() + "/my-booking");
            }
        }
    }

}