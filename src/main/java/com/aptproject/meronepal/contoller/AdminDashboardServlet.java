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

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/dashboard"})
public class AdminDashboardServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO userDAO       = new UserDAO();
        BookingDAO bookingDAO = new BookingDAO();

        try {
            // 1. Total Users
            int totalUsers = userDAO.getUserCount();
            request.setAttribute("userCount", totalUsers != -1 ? totalUsers : 0);

            // 2. Total Bookings
            int totalBookings = bookingDAO.getTotalBookingCount();
            request.setAttribute("totalBookings", totalBookings != -1 ? totalBookings : 0);

            // 3. Bookings Grouped by Package
            ArrayList<Booking> bookingsByPackage = bookingDAO.getBookingCountByPackage();
            request.setAttribute("bookingsByPackage", bookingsByPackage);

            // 4. Recent Bookings
            ArrayList<Booking> recentBookings = bookingDAO.getRecentBookings();
            request.setAttribute("recentBookings", recentBookings);

        } catch (SQLException e) {
            request.setAttribute("userCount", 0);
            request.setAttribute("totalBookings", 0);
            request.setAttribute("bookingsByPackage", new ArrayList<>());
            request.setAttribute("recentBookings", new ArrayList<>());
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher(
                "/WEB-INF/pages/admin/admin-dashboard.jsp");
        rd.forward(request, response);
    }
}