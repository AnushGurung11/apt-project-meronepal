package com.aptproject.meronepal.contoller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// User DAO bata User count
// Booking Dao Bata Total Booking
// Booking DAO Bata Total Booking count grouped by Package id
// Request ma set attribute
// JSP ma Load
// Filter Ma filter garne
@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/dashboard"})
public class AdminDashboardServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        RequestDispatcher rd = request.getRequestDispatcher(
                "/WEB-INF/pages/admin/admin-dashboard.jsp");
        rd.forward(request, response);
    }
}
