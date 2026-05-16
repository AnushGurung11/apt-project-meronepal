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

@WebServlet(name = "BookingServlet", urlPatterns = {"/booking"})
public class BookingServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pull flash messages from session into request scope
        String message     = (String) SessionUtil.getAttribute(request, "message");
        String messageType = (String) SessionUtil.getAttribute(request, "messageType");
        if (message != null) {
            request.setAttribute("message", message);
            request.setAttribute("messageType", messageType);
            SessionUtil.removeAttribute(request, "message");
            SessionUtil.removeAttribute(request, "messageType");
        }

        int packageId = Integer.parseInt(request.getParameter("packageId"));
        Package selectedPackage = new PackageDAO().getPackageByIdWithServices(packageId);

        request.setAttribute("selectedPackage", selectedPackage);
        request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user           = (User) SessionUtil.getAttribute(request, "user");
        int packageId       = Integer.parseInt(request.getParameter("packageId"));
        String eventAddress = request.getParameter("eventAddress");
        String description  = request.getParameter("notes");
        String eventDate    = request.getParameter("eventDate");

        // ── Date validation ──────────────────────────────────────────
        LocalDate parsedDate;
        try {
            parsedDate = LocalDate.parse(eventDate); // expects "yyyy-MM-dd" from <input type="date">
        } catch (DateTimeParseException | NullPointerException e) {
            SessionUtil.setAttribute(request, "message", "Invalid date format. Please select a valid date.");
            SessionUtil.setAttribute(request, "messageType", "error");
            response.sendRedirect(request.getContextPath() + "/booking?packageId=" + packageId);
            return;
        }

        LocalDate minimumAllowedDate = LocalDate.now().plusDays(4); // strictly more than 3 days from today
        if (parsedDate.isBefore(minimumAllowedDate)) {
            SessionUtil.setAttribute(request, "message",
                    "Event date must be at least 4 days from today (earliest: " + minimumAllowedDate + ").");
            SessionUtil.setAttribute(request, "messageType", "error");
            response.sendRedirect(request.getContextPath() + "/booking?packageId=" + packageId);
            return;
        }
        // ────────────────────────────────────────────────────────────

        int bookingStatus = new BookingDAO().insertBooking(user, packageId, eventAddress, description, eventDate);

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