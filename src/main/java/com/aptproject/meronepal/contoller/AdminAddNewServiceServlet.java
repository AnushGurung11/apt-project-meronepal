package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.ServiceDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet for admin to add new services.
 * URL Mapping: {@code /admin/add-service}
 *
 * GET: forwards to {@code add-service.jsp} to display the form
 * POST: validates input, inserts service via {@code ServiceDAO},
 *       then redirects with {@code status=success} or {@code status=error}
 *
 * Uses Post-Redirect-Get pattern to prevent duplicate submissions.
 */
@WebServlet("/admin/add-service")
public class AdminAddNewServiceServlet extends HttpServlet {

    /** DAO instance for service database operations */
    private ServiceDAO serviceDAO;

    /**
     * init — initializes {@code ServiceDAO} once when servlet starts
     */
    @Override
    public void init() {
        serviceDAO = new ServiceDAO();
    }

    // ── GET: forward to the form JSP ─────────────────────────────────────────
    /**
     * doGet — displays the add-service form page
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     *
     * Note: Any success/error message from POST redirect arrives via query params,
     * which the JSP handles directly — no extra attribute setting needed here.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // If the page was reached after a redirect, the message will already be
        // on the query string — the JSP picks it up via param, nothing extra needed.
        request.getRequestDispatcher("/WEB-INF/pages/admin/add-service.jsp")
                .forward(request, response);
    }

    // ── POST: validate → insert → redirect ───────────────────────────────────
    /**
     * doPost — handles form submission to add a new service
     *
     * @param request  {@code HttpServletRequest} containing form parameters
     * @param response {@code HttpServletResponse} for redirect after processing
     * @throws ServletException if servlet processing fails
     * @throws IOException      if redirect or I/O operation fails
     *
     * Expected params:
     * {@code serviceName} — required, trimmed before insert
     * {@code serviceType} — optional, trimmed if present
     * {@code description} — optional, trimmed if present
     *
     * @return redirects to GET with {@code ?status=success&name=...} or {@code ?status=error}
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── 1. Read form parameters ───────────────────────────────────────
        String serviceName = request.getParameter("serviceName");
        String serviceType = request.getParameter("serviceType");
        String description = request.getParameter("description");

        // ── 2. Basic server-side validation ───────────────────────────────
        if (serviceName == null || serviceName.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Service name is required.");
            request.getRequestDispatcher("/WEB-INF/pages/admin/add-service.jsp")
                    .forward(request, response);
            return;
        }

        // Trim inputs to clean whitespace before DB insert
        serviceName = serviceName.trim();
        serviceType = (serviceType != null) ? serviceType.trim() : "";
        description = (description != null) ? description.trim() : "";

        // ── 3. Attempt insert via DAO ─────────────────────────────────────
        int rowsAffected = serviceDAO.insertService(serviceName, serviceType, description);

        // ── 4. Redirect with status flag (PRG pattern) ────────────────────
        // Redirect back to GET with a status flag to avoid double-submit on refresh
        if (rowsAffected > 0) {
            response.sendRedirect(request.getContextPath()
                    + "/admin/add-service?status=success&name=" + serviceName);
        } else {
            response.sendRedirect(request.getContextPath()
                    + "/admin/add-service?status=error");
        }
    }
}