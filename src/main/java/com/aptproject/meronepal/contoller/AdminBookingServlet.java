package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.BookingDAO;
import com.aptproject.meronepal.dao.PaymentDAO;
import com.aptproject.meronepal.model.Booking;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Servlet for admin booking management.
 * URL Mapping: {@code /admin-booking}
 *
 * doGet: loads all bookings and forwards to admin-bookings.jsp
 * doPost: handles status updates for bookings and payments
 *
 * Supported actions in POST:
 * {@code updateBookingStatus} — changes booking state
 * {@code updatePaymentStatus} — changes payment state
 */
@WebServlet(name = "AdminBookingServlet", urlPatterns = {"/admin-booking"})
public class AdminBookingServlet extends HttpServlet {

    // ----------------------------------------------------------------
    // GET — load all bookings and forward to JSP
    // ----------------------------------------------------------------
<<<<<<< HEAD
    /**
     * doGet — fetches all bookings and displays them in admin view
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to render view
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward or I/O operation fails
     */
=======
>>>>>>> 9d49e9f (Admin Booking View)
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

<<<<<<< HEAD
        // ── Fetch all bookings from DAO ───────────────────────────
        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> allBookings = bookingDAO.getAllBooking();

        // ── Pass data to view ─────────────────────────────────────
        request.setAttribute("allBookings", allBookings);

        // ── Forward to admin bookings JSP ─────────────────────────
=======
        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> allBookings = bookingDAO.getAllBooking();

        request.setAttribute("allBookings", allBookings);

>>>>>>> 9d49e9f (Admin Booking View)
        RequestDispatcher rd = request.getRequestDispatcher(
                "/WEB-INF/pages/admin/admin-bookings.jsp");
        rd.forward(request, response);
    }

    // ----------------------------------------------------------------
    // POST — handle status update actions
    //
    //   action=updateBookingStatus  → bookingId + bookingStatus
    //   action=updatePaymentStatus  → bookingId + paymentStatus
    // ----------------------------------------------------------------
<<<<<<< HEAD
    /**
     * doPost — processes admin actions to update booking or payment status
     *
     * @param request  {@code HttpServletRequest} containing action params
     * @param response {@code HttpServletResponse} for redirect after update
     * @throws ServletException if servlet processing fails
     * @throws IOException      if redirect or I/O operation fails
     *
     * Expected params:
     * {@code action} — either "updateBookingStatus" or "updatePaymentStatus"
     * {@code bookingId} — integer ID of the booking to update
     * {@code bookingStatus} or {@code paymentStatus} — new status value
     *
     * After processing, redirects to {@code /admin-booking} with success/error flag
     * to prevent duplicate form submission (Post-Redirect-Get pattern)
     */
=======
>>>>>>> 9d49e9f (Admin Booking View)
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

<<<<<<< HEAD
        // ── Read and validate required parameters ─────────────────
=======
>>>>>>> 9d49e9f (Admin Booking View)
        String action      = request.getParameter("action");
        String bookingIdStr = request.getParameter("bookingId");

        // Basic validation
        if (action == null || bookingIdStr == null) {
            request.setAttribute("errorMessage", "Invalid request parameters.");
            doGet(request, response);
            return;
        }

<<<<<<< HEAD
        // ── Parse bookingId safely ────────────────────────────────
=======
>>>>>>> 9d49e9f (Admin Booking View)
        int bookingId;
        try {
            bookingId = Integer.parseInt(bookingIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid booking ID.");
            doGet(request, response);
            return;
        }

        BookingDAO bookingDAO = new BookingDAO();

<<<<<<< HEAD
        // ── Route based on action type ────────────────────────────
=======
>>>>>>> 9d49e9f (Admin Booking View)
        switch (action) {

            // ── Update Booking Status ────────────────────────────
            case "updateBookingStatus": {
                String newStatus = request.getParameter("bookingStatus");

                // updateBookingStatus already whitelists valid values internally
                boolean success = bookingDAO.updateBookingStatus(bookingId, newStatus);

                if (success) {
                    request.setAttribute("successMessage",
                            "Booking #" + bookingId + " status updated to " + newStatus);
                } else {
                    request.setAttribute("errorMessage",
                            "Failed to update booking #" + bookingId + " status.");
                }
                break;
            }

            // ── Update Payment Status ────────────────────────────
            case "updatePaymentStatus": {
                String newPaymentStatus = request.getParameter("paymentStatus");

                // Whitelist valid payment statuses (mirrors DB CHECK constraint)
                java.util.List<String> ALLOWED = java.util.List.of(
                        "Unpaid", "Partial", "Paid", "Refunded");

                if (!ALLOWED.contains(newPaymentStatus)) {
                    request.setAttribute("errorMessage",
                            "Invalid payment status: " + newPaymentStatus);
                    break;
                }

                PaymentDAO paymentDAO = new PaymentDAO();
                boolean success = paymentDAO.updatePaymentStatus(bookingId, newPaymentStatus);

                if (success) {
                    request.setAttribute("successMessage",
                            "Payment for booking #" + bookingId +
                                    " updated to  newPaymentStatus");
                } else {
                    request.setAttribute("errorMessage",
                            "Failed to update payment status for booking #" + bookingId + ".");
                }
                break;
            }

<<<<<<< HEAD
            // ── Handle unknown action ─────────────────────────────
=======
>>>>>>> 9d49e9f (Admin Booking View)
            default:
                request.setAttribute("errorMessage", "Unknown action: " + action);
        }

<<<<<<< HEAD
        // ── Redirect to GET to avoid duplicate submission ─────────
=======
>>>>>>> 9d49e9f (Admin Booking View)
        // Always redirect back to GET (Post-Redirect-Get pattern) so a
        // page refresh does not re-submit the form.
        response.sendRedirect(request.getContextPath() + "/admin-booking"
                + (request.getAttribute("successMessage") != null
                ? "?success=1" : "?error=1"));
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> 9d49e9f (Admin Booking View)
