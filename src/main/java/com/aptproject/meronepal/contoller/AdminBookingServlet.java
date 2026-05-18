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

@WebServlet(name = "AdminBookingServlet", urlPatterns = {"/admin-booking"})
public class AdminBookingServlet extends HttpServlet {

    // ----------------------------------------------------------------
    // GET — load all bookings and forward to JSP
    // ----------------------------------------------------------------
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> allBookings = bookingDAO.getAllBooking();

        request.setAttribute("allBookings", allBookings);

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
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action      = request.getParameter("action");
        String bookingIdStr = request.getParameter("bookingId");

        // Basic validation
        if (action == null || bookingIdStr == null) {
            request.setAttribute("errorMessage", "Invalid request parameters.");
            doGet(request, response);
            return;
        }

        int bookingId;
        try {
            bookingId = Integer.parseInt(bookingIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid booking ID.");
            doGet(request, response);
            return;
        }

        BookingDAO bookingDAO = new BookingDAO();

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

            default:
                request.setAttribute("errorMessage", "Unknown action: " + action);
        }

        // Always redirect back to GET (Post-Redirect-Get pattern) so a
        // page refresh does not re-submit the form.
        response.sendRedirect(request.getContextPath() + "/admin-booking"
                + (request.getAttribute("successMessage") != null
                ? "?success=1" : "?error=1"));
    }
}
