package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.BookingDAO;
import com.aptproject.meronepal.dao.UserDAO;
import com.aptproject.meronepal.model.Booking;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Servlet for admin dashboard page.
 * URL Mapping: {@code /dashboard}
 *
 * doGet: fetches stats like total users, total bookings,
 * bookings by package, and recent bookings for display.
 */
@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/dashboard"})
public class AdminDashboardServlet extends HttpServlet {

    /**
     * doGet — gathers dashboard data and forwards to admin-dashboard.jsp
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     *
     * Sets these request attributes:
     * {@code userCount} — total registered users
     * {@code totalBookings} — total booking count
     * {@code bookingsByPackage} — list of bookings grouped by package
     * {@code recentBookings} — list of latest bookings
     *
     * On SQL error, sets empty/zero values and prints stack trace.
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Initialize DAOs for data access
        UserDAO userDAO       = new UserDAO();
        BookingDAO bookingDAO = new BookingDAO();

        try {
            // Get total user count
            int totalUsers = userDAO.getUserCount();
            request.setAttribute("userCount", totalUsers != -1 ? totalUsers : 0);

            // Get total booking count
            int totalBookings = bookingDAO.getTotalBookingCount();
            request.setAttribute("totalBookings", totalBookings != -1 ? totalBookings : 0);

            // Get bookings grouped by package
            ArrayList<Booking> bookingsByPackage = bookingDAO.getBookingCountByPackage();
            request.setAttribute("bookingsByPackage", bookingsByPackage);

            // Get recent bookings list
            ArrayList<Booking> recentBookings = bookingDAO.getRecentBookings();
            request.setAttribute("recentBookings", recentBookings);

        } catch (SQLException e) {
            // On database error, set safe default values
            request.setAttribute("userCount", 0);
            request.setAttribute("totalBookings", 0);
            request.setAttribute("bookingsByPackage", new ArrayList<>());
            request.setAttribute("recentBookings", new ArrayList<>());
            e.printStackTrace();
        }

        // Forward to admin dashboard view
        RequestDispatcher rd = request.getRequestDispatcher(
                "/WEB-INF/pages/admin/admin-dashboard.jsp");
        rd.forward(request, response);
    }
}