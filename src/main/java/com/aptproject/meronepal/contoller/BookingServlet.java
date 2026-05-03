package com.aptproject.meronepal.contoller;

import java.io.IOException;

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


//TODO doGet Will provide data of services and will provide to the booking page
//TODO doPost will take the Services selected and create a packageService
// User id and package service id in booking table as update
@WebServlet(name = "BookingServlet", urlPatterns = {"/booking"})
public class BookingServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int packageId = Integer.parseInt(request.getParameter("packageId"));
        Package selectedPackage = new PackageDAO().getPackageByIdWithServices(packageId);

        request.setAttribute("selectedPackage", selectedPackage);
        request.getRequestDispatcher("/WEB-INF/pages/booking.jsp")
                .forward(request, response);

    }

    @Override
    public  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        User user = (User) SessionUtil.getAttribute(request,"user");
        int packageId       = Integer.parseInt(request.getParameter("packageId"));
        String eventAddress = request.getParameter("eventAddress");
        String description  = request.getParameter("notes");
        String eventDate    = request.getParameter("eventDate");

        int bookingStatus = new BookingDAO().insertBooking(user, packageId, eventAddress, description, eventDate);

        if (bookingStatus == 1) {
            SessionUtil.setAttribute(request, "message", "Booking Created Successfully!");
            System.out.println("Booking Created");
            response.sendRedirect(request.getContextPath() + "/dashboard");
        } else {
            SessionUtil.setAttribute(request, "message", "Booking Failed!");
            response.sendRedirect(request.getContextPath() + "/booking?packageId=" + packageId);
        }
    }

}
