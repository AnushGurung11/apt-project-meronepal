package com.aptproject.meronepal.contoller;

import java.io.IOException;

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
    //
    @Override
    public  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //TODO Request, User, Package Service
        //TODO variable ma store garne
        //TODO Print the variable
        //TODO variable lai DAO of Object banau ne
        //TODO Booking DAO of ko Object ma variable pass.
        // Return value aanushar sout garne.

    }

}
