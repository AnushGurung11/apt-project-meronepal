package com.aptproject.meronepal.contoller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet responsible for handling the About Us page.
 * URL Mapping: {@code /about}
 *
 * doGet method forwards the request to {@code about.jsp}
 * to render the static information page.
 */
@WebServlet(name = "AboutUsServlet", urlPatterns = {"/about"})
public class AboutUsServlet extends HttpServlet {

    /**
     * doGet — forwards request to about.jsp for display
     *
     * @param request  {@code HttpServletRequest} containing client request data
     * @param response {@code HttpServletResponse} for sending response back
     * @throws ServletException if servlet encounters an error during processing
     * @throws IOException      if an I/O error occurs during forward
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── Forward to about.jsp view ─────────────────────────────
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/about.jsp");
        rd.forward(request, response);
    }
}