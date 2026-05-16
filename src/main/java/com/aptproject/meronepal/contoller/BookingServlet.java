package com.aptproject.meronepal.contoller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

import com.aptproject.meronepal.dao.BookingDAO;
import com.aptproject.meronepal.dao.PackageDAO;
import com.aptproject.meronepal.model.Package;
import com.aptproject.meronepal.model.User;
import com.aptproject.meronepal.utility.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

<<<<<<< HEAD
/**
 * Servlet for handling booking flow.
 * URL Mapping: {@code /booking}
 *
 * GET: shows booking form for a selected package with flash messages
 * POST: validates event date, creates booking, redirects with success/error
 */
@WebServlet(name = "BookingServlet", urlPatterns = {"/booking"})
public class BookingServlet extends HttpServlet {

    /**
     * doGet — displays booking form for a package
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     *
     * Expects {@code packageId} param. Loads package details and any
     * flash messages from session, then forwards to {@code booking.jsp}.
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Move flash messages from session to request scope for display
=======
@WebServlet(name = "BookingServlet", urlPatterns = {"/booking"})
public class BookingServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pull flash messages from session into request scope
>>>>>>> 2ea22dc (completion of User password and Editing User details)
        String message     = (String) SessionUtil.getAttribute(request, "message");
        String messageType = (String) SessionUtil.getAttribute(request, "messageType");
        if (message != null) {
            request.setAttribute("message", message);
            request.setAttribute("messageType", messageType);
            SessionUtil.removeAttribute(request, "message");
            SessionUtil.removeAttribute(request, "messageType");
        }

<<<<<<< HEAD
        // Load package details with associated services
=======
>>>>>>> 2ea22dc (completion of User password and Editing User details)
        int packageId = Integer.parseInt(request.getParameter("packageId"));
        Package selectedPackage = new PackageDAO().getPackageByIdWithServices(packageId);

        request.setAttribute("selectedPackage", selectedPackage);
        request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);
    }

    /**
     * doPost — processes booking submission with date validation
     *
     * @param request  {@code HttpServletRequest} containing form data
     * @param response {@code HttpServletResponse} for redirect after processing
     * @throws ServletException if servlet processing fails
     * @throws IOException      if redirect or I/O operation fails
     *
     * Expected params:
     * {@code packageId} — ID of package being booked
     * {@code eventAddress} — location for the event
     * {@code notes} — optional description
     * {@code eventDate} — must be at least 4 days from today
     *
     * Uses session for user auth and flash messages.
     * Redirects to {@code /profile} on success, back to form on error.
     */
    @Override
<<<<<<< HEAD
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get logged-in user from session
=======
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
>>>>>>> 2ea22dc (completion of User password and Editing User details)
        User user           = (User) SessionUtil.getAttribute(request, "user");
        int packageId       = Integer.parseInt(request.getParameter("packageId"));
        String eventAddress = request.getParameter("eventAddress");
        String description  = request.getParameter("notes");
        String eventDate    = request.getParameter("eventDate");

<<<<<<< HEAD
        // Validate event date format and value
        LocalDate parsedDate;
        try {
            parsedDate = LocalDate.parse(eventDate);
=======
        // ── Date validation ──────────────────────────────────────────
        LocalDate parsedDate;
        try {
            parsedDate = LocalDate.parse(eventDate); // expects "yyyy-MM-dd" from <input type="date">
>>>>>>> 2ea22dc (completion of User password and Editing User details)
        } catch (DateTimeParseException | NullPointerException e) {
            SessionUtil.setAttribute(request, "message", "Invalid date format. Please select a valid date.");
            SessionUtil.setAttribute(request, "messageType", "error");
            response.sendRedirect(request.getContextPath() + "/booking?packageId=" + packageId);
            return;
        }

<<<<<<< HEAD
        // Ensure date is at least 4 days in the future
        LocalDate minimumAllowedDate = LocalDate.now().plusDays(4);
=======
        LocalDate minimumAllowedDate = LocalDate.now().plusDays(4); // strictly more than 3 days from today
>>>>>>> 2ea22dc (completion of User password and Editing User details)
        if (parsedDate.isBefore(minimumAllowedDate)) {
            SessionUtil.setAttribute(request, "message",
                    "Event date must be at least 4 days from today (earliest: " + minimumAllowedDate + ").");
            SessionUtil.setAttribute(request, "messageType", "error");
            response.sendRedirect(request.getContextPath() + "/booking?packageId=" + packageId);
            return;
        }
<<<<<<< HEAD

        // Insert booking record via DAO
=======
        // ────────────────────────────────────────────────────────────

>>>>>>> 2ea22dc (completion of User password and Editing User details)
        int bookingStatus = new BookingDAO().insertBooking(user, packageId, eventAddress, description, eventDate);

        // Redirect based on result
        if (bookingStatus == 1) {
            SessionUtil.setAttribute(request, "message", "Booking Created Successfully!");
            SessionUtil.setAttribute(request, "messageType", "success");
            response.sendRedirect(request.getContextPath() + "/profile");
        } else {
            SessionUtil.setAttribute(request, "message", "Booking failed. Please try again.");
            SessionUtil.setAttribute(request, "messageType", "error");
            response.sendRedirect(request.getContextPath() + "/booking?packageId=" + packageId);
        }
    }
}