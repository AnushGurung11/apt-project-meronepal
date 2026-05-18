package com.aptproject.meronepal.contoller;

<<<<<<< HEAD
import com.aptproject.meronepal.dao.PackageServiceDAO;
import com.aptproject.meronepal.dao.ServiceDAO;
import com.aptproject.meronepal.model.PackageService;
import com.aptproject.meronepal.model.Service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/package-services")
public class AdminPackageServicesServlet extends HttpServlet {

    private ServiceDAO serviceDAO;
    private PackageServiceDAO packageServiceDAO;

    @Override
    public void init() throws ServletException {
        serviceDAO        = new ServiceDAO();
        packageServiceDAO = new PackageServiceDAO();
    }

    // ---------------------------------------------------------------
    // GET — load all services & package-service links, forward to JSP
    // ---------------------------------------------------------------
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Service>        services        = serviceDAO.getAllServices();
        List<PackageService> packageServices = packageServiceDAO.getAllPackageServicesWithNames();

        request.setAttribute("services",        services);
        request.setAttribute("packageServices", packageServices);

        request.getRequestDispatcher(
                "/WEB-INF/pages/admin/admin-package-services.jsp"
        ).forward(request, response);
    }

    // ---------------------------------------------------------------
    // POST — delete a service or a package-service link
    // ---------------------------------------------------------------
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("deleteService".equals(action)) {
            // ── soft-delete a service ──────────────────────────────
            String rawId = request.getParameter("serviceId");
            if (rawId != null && !rawId.isBlank()) {
                try {
                    int serviceId = Integer.parseInt(rawId.trim());
                    int rows = serviceDAO.deleteService(serviceId);
                    if (rows > 0) {
                        response.sendRedirect(
                                request.getContextPath() +
                                        "/admin/package-services?success=serviceDeleted"
                        );
                    } else {
                        response.sendRedirect(
                                request.getContextPath() +
                                        "/admin/package-services?error=serviceNotFound"
                        );
                    }
                } catch (NumberFormatException e) {
                    response.sendRedirect(
                            request.getContextPath() +
                                    "/admin/package-services?error=invalidId"
                    );
                }
            } else {
                response.sendRedirect(
                        request.getContextPath() +
                                "/admin/package-services?error=missingId"
                );
            }

        } else if ("deletePackageService".equals(action)) {
            // ── hard-delete a package-service link ─────────────────
            String rawId = request.getParameter("packageServiceId");
            if (rawId != null && !rawId.isBlank()) {
                try {
                    int psId = Integer.parseInt(rawId.trim());
                    int rows = packageServiceDAO.deletePackageService(psId);
                    if (rows > 0) {
                        response.sendRedirect(
                                request.getContextPath() +
                                        "/admin/package-services?success=linkDeleted"
                        );
                    } else {
                        response.sendRedirect(
                                request.getContextPath() +
                                        "/admin/package-services?error=linkNotFound"
                        );
                    }
                } catch (NumberFormatException e) {
                    response.sendRedirect(
                            request.getContextPath() +
                                    "/admin/package-services?error=invalidId"
                    );
                }
            } else {
                response.sendRedirect(
                        request.getContextPath() +
                                "/admin/package-services?error=missingId"
                );
            }

        } else {
            // Unknown action → just reload the page
            response.sendRedirect(
                    request.getContextPath() + "/admin/package-services"
            );
        }
    }
=======
public class AdminPackageServicesServlet {
>>>>>>> 25e2045 (Logout)
}
