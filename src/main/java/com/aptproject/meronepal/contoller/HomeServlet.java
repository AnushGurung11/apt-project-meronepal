package com.aptproject.meronepal.contoller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet for handling the home page.
 * URL Mapping: {@code /home}
 *
 * GET: forwards request to {@code index.jsp} for rendering.
 * POST: currently unused.
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    /**
     * doGet — forwards request to home page (index.jsp)
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Forward to home page view
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

    /**
     * doPost — currently not implemented
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} for response
     * @throws ServletException if servlet processing fails
     * @throws IOException      if I/O error occurs
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // POST handling not implemented yet
        // request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request,response);
    }
}