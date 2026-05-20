package com.aptproject.meronepal.contoller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet for displaying the blog index and individual blog detail pages.
 * URL Mapping: {@code /blog} and {@code /blog/*}
 *
 * doGet: forwards {@code /blog} to {@code blog.jsp}, and {@code /blog/{id}}
 * to {@code blog/{id}.jsp} for individual posts.
 */
@WebServlet(name = "BlogServlet", urlPatterns = {"/blog", "/blog/*"})
public class BlogServlet extends HttpServlet {

    // Number of blog detail pages currently published under WEB-INF/pages/blog/
    private static final int BLOG_COUNT = 6;

    /**
     * doGet — routes to the blog index or a single blog detail page
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo();

        // No path info or bare "/" -> blog index
        if (pathInfo == null || pathInfo.equals("/")) {
            request.getRequestDispatcher("/WEB-INF/pages/blog.jsp")
                    .forward(request, response);
            return;
        }

        // Strip leading slash, expect a numeric blog id
        String idPart = pathInfo.substring(1);
        try {
            int id = Integer.parseInt(idPart);
            if (id < 1 || id > BLOG_COUNT) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            request.getRequestDispatcher("/WEB-INF/pages/blog/" + id + ".jsp")
                    .forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}