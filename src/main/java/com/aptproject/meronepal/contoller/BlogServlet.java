package com.aptproject.meronepal.contoller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet for displaying the blog page.
 * URL Mapping: {@code /blog}
 *
 * doGet: forwards request to {@code blog.jsp} for rendering.
 */
@WebServlet(name = "BlogServlet", urlPatterns = {"/blog"})
public class BlogServlet extends HttpServlet {

    /**
     * doGet — forwards request to blog.jsp for display
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Forward to blog view page
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/blog.jsp");
        rd.forward(request, response);
    }
}