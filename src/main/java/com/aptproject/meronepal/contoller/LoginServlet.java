package com.aptproject.meronepal.contoller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //TODO Request bata chine filed haru aaunu paryo (User name , Email, Password)
        //TODO Variable ma store garne.
        //TODO Authentication
        //TODO Using User DAO/getuser function bata herne.
        //TODO User xa vane, User ko Object return hunxa natra null return hunxa
        // TODO Yho User lai session ma rakhne
        // TODO Aaba login vai sake ko hunxa ra success vaye ma Redirect to dashbaord.
    }
}
