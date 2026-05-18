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

<<<<<<< HEAD
<<<<<<< HEAD
=======
import javax.imageio.metadata.IIOInvalidTreeException;
>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
>>>>>>> 108eb2e (backend-completion)
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 108eb2e (backend-completion)
/**
 * Servlet for displaying and managing user's own bookings.
 * URL Mapping: {@code /my-booking}
 *
 * GET: checks session, fetches user's bookings, forwards to my-bookings.jsp
 * POST: handles booking cancellation with ownership verification
 */
<<<<<<< HEAD
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
=======
=======
>>>>>>> 108eb2e (backend-completion)
@WebServlet(name = "UserBookingDetailServlet", urlPatterns = {"/my-booking"})
public class UserBookingDetailServlet extends HttpServlet {

    // BookingDAO instance reused across requests
    private final BookingDAO bookingDAO = new BookingDAO();

<<<<<<< HEAD
>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
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
>>>>>>> 108eb2e (backend-completion)
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

<<<<<<< HEAD
<<<<<<< HEAD
        // Check if user is logged in via session
=======
        // 1. Session guard — redirect to login if no user
>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
        // Check if user is logged in via session
>>>>>>> 108eb2e (backend-completion)
        User currentUser = (User) SessionUtil.getAttribute(request, "user");
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
<<<<<<< HEAD
<<<<<<< HEAD
            // Fetch bookings for the logged-in user
            int userId = currentUser.getUserId();
            List<Booking> userBookings = bookingDAO.getBookingsByUserId(userId);

            // Always set the attribute so JSP can handle empty state
            request.setAttribute("userBookings", userBookings);

            // Set optional info message when no bookings found
=======
            // 2. Fetch bookings for this user
=======
            // Fetch bookings for the logged-in user
>>>>>>> 108eb2e (backend-completion)
            int userId = currentUser.getUserId();
            List<Booking> userBookings = bookingDAO.getBookingsByUserId(userId);

            // Always set the attribute so JSP can handle empty state
            request.setAttribute("userBookings", userBookings);

<<<<<<< HEAD
            // 4. Optional: set a message when list is empty
>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
            // Set optional info message when no bookings found
>>>>>>> 108eb2e (backend-completion)
            if (userBookings.isEmpty()) {
                request.setAttribute("infoMessage", "You have no bookings yet.");
                System.out.println("No bookings found for userId: " + userId);
            } else {
<<<<<<< HEAD
<<<<<<< HEAD
                // Log booking IDs for debugging
=======
>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
                // Log booking IDs for debugging
>>>>>>> 108eb2e (backend-completion)
                System.out.println("Bookings fetched for userId: " + userId);
                userBookings.forEach(b ->
                        System.out.println("  - bookingId: " + b.getBookingId())
                );
            }

<<<<<<< HEAD
<<<<<<< HEAD
            // Forward to user bookings view
            RequestDispatcher rd = request.getRequestDispatcher(
                    "/WEB-INF/pages/profile/my-bookings.jsp"
=======
            // 5. Forward to JSP
            RequestDispatcher rd = request.getRequestDispatcher(
                    "/WEB-INF/pages/profile/my-bookings.jsp"   // note leading /
>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
            // Forward to user bookings view
            RequestDispatcher rd = request.getRequestDispatcher(
                    "/WEB-INF/pages/profile/my-bookings.jsp"
>>>>>>> 108eb2e (backend-completion)
            );
            rd.forward(request, response);

        } catch (Exception e) {
<<<<<<< HEAD
<<<<<<< HEAD
            // Handle unexpected errors gracefully
=======
>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
            // Handle unexpected errors gracefully
>>>>>>> 108eb2e (backend-completion)
            System.err.println("UserBookingDetailServlet error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Something went wrong loading your bookings.");
        }
    }

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 108eb2e (backend-completion)
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
<<<<<<< HEAD
=======
>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
>>>>>>> 108eb2e (backend-completion)
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

<<<<<<< HEAD
<<<<<<< HEAD
        // Check if user is logged in via session
=======
        // Session guard
>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
        // Check if user is logged in via session
>>>>>>> 108eb2e (backend-completion)
        User currentUser = (User) SessionUtil.getAttribute(request, "user");
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 108eb2e (backend-completion)
        // Get action parameter from request
        String action = request.getParameter("action");

        // Route based on action type
<<<<<<< HEAD
=======
        String action = request.getParameter("action");

>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
>>>>>>> 108eb2e (backend-completion)
        switch (action != null ? action : "") {

            case "cancel" -> {
                try {
<<<<<<< HEAD
<<<<<<< HEAD
                    // Parse booking ID from request
                    int bookingId = Integer.parseInt(request.getParameter("bookingId"));

                    // Security check: verify booking belongs to logged-in user
=======
                    int bookingId = Integer.parseInt(request.getParameter("bookingId"));

                    // Security check — make sure this booking belongs to the logged-in user
                    // so a user can't cancel someone else's booking by changing the form value
>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
                    // Parse booking ID from request
                    int bookingId = Integer.parseInt(request.getParameter("bookingId"));

                    // Security check: verify booking belongs to logged-in user
>>>>>>> 108eb2e (backend-completion)
                    List<Booking> userBookings = bookingDAO.getBookingsByUserId(currentUser.getUserId());
                    boolean ownsBooking = userBookings.stream()
                            .anyMatch(b -> b.getBookingId() == bookingId);

                    if (!ownsBooking) {
                        System.err.println("User " + currentUser.getUserId()
                                + " tried to cancel booking " + bookingId + " — not their booking.");
                        response.sendRedirect(request.getContextPath() + "/my-booking");
                        return;
                    }

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 108eb2e (backend-completion)
                    // Attempt to cancel the booking
                    boolean success = bookingDAO.updateBookingStatus(bookingId, "Cancelled");

                    // Set feedback message in session
<<<<<<< HEAD
=======
                    boolean success = bookingDAO.updateBookingStatus(bookingId, "Cancelled");

>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
>>>>>>> 108eb2e (backend-completion)
                    if (success) {
                        request.getSession().setAttribute("statusMsg",
                                "Booking #APT-" + bookingId + " has been cancelled.");
                    } else {
                        request.getSession().setAttribute("statusMsg",
                                "Could not cancel booking. Please try again.");
                    }

                } catch (NumberFormatException e) {
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 108eb2e (backend-completion)
                    // Handle invalid booking ID format
                    System.err.println("Invalid bookingId in cancel request: " + e.getMessage());
                }

                // Redirect back to bookings page
<<<<<<< HEAD
=======
                    System.err.println("Invalid bookingId in cancel request: " + e.getMessage());
                }

>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
>>>>>>> 108eb2e (backend-completion)
                response.sendRedirect(request.getContextPath() + "/my-booking");
            }

            default -> {
<<<<<<< HEAD
<<<<<<< HEAD
                // Unknown action: just redirect back
=======
                // Unknown action — just send back to the bookings page
>>>>>>> 0ab4b98 (User my booking view and Cancelling)
=======
                // Unknown action: just redirect back
>>>>>>> 108eb2e (backend-completion)
                response.sendRedirect(request.getContextPath() + "/my-booking");
            }
        }
    }

}