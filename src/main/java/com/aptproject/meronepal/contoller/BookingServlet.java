package com.aptproject.meronepal.contoller;

import java.io.IOException;

import com.aptproject.meronepal.dao.BookingDAO;
import com.aptproject.meronepal.dao.PackageServiceDAO;
import com.aptproject.meronepal.dao.UserDAO;
import com.aptproject.meronepal.model.PackageService;
import com.aptproject.meronepal.model.User;
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


    }
    /**
     *
     * username
     * packageService
     * eventAddress
     * eventDate
    */
    @Override
    public  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //TODO Request, User, Package Service
        //TODO variable ma store garne
        // TODO Have validation for the User and Package Service
        //TODO Print the variable
        //TODO variable lai DAO of Object banau ne
        //TODO Booking DAO of ko Object ma variable pass.
        // Return value aanushar sout garne.

        String username = request.getParameter("username");
        int packageService = Integer.parseInt(request.getParameter("packageService"));
        String eventAddress = request.getParameter("eventAddress");
        String description = request.getParameter("description");
        String eventDate = request.getParameter("eventDate");
        //User object created using the username
        User userBooking = new UserDAO().getUser(username);

        //PackageService model is created from the package Service id provided
        PackageService packageService1 = new PackageServiceDAO().getPackageService(packageService);

        int bookingStatus = new BookingDAO().insertBooking(userBooking,packageService1,eventAddress,description,eventDate);

        if (bookingStatus == 0){
            System.out.println("No Booking Created");
        } else if (bookingStatus == 1) {
            System.out.println("Booking Created");
        }


    }

}
