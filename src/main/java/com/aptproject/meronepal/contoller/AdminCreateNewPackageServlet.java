package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.PackageDAO;
import com.aptproject.meronepal.dao.PackageServiceDAO;
import com.aptproject.meronepal.dao.ServiceDAO;
import com.aptproject.meronepal.model.Service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

/**
 * Servlet for admin to create new travel packages.
 * URL Mapping: {@code /admin/create-package}
 *
 * GET: loads all active services and forwards to {@code create-package.jsp}
 * POST: validates input, inserts package, links selected services
 *
 * Redirects with {@code status=success}, {@code status=partial}, or error handling
 */
@WebServlet("/admin/create-package")
public class AdminCreateNewPackageServlet extends HttpServlet {

    private PackageDAO        packageDAO;
    private PackageServiceDAO packageServiceDAO;
    private ServiceDAO        serviceDAO;

    @Override
    public void init() {
        packageDAO        = new PackageDAO();
        packageServiceDAO = new PackageServiceDAO();
        serviceDAO        = new ServiceDAO();
    }

    /**
     * doGet — loads available services and shows create-package form
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Load all active services for the admin to select from
        List<Service> availableServices = serviceDAO.getAllServices();
        request.setAttribute("availableServices", availableServices);

        // Forward to the form page
        request.getRequestDispatcher("/WEB-INF/pages/admin/create-package.jsp")
                .forward(request, response);
    }

    /**
     * doPost — handles package creation with selected services
     *
     * @param request  {@code HttpServletRequest} containing form parameters
     * @param response {@code HttpServletResponse} for redirect after processing
     * @throws ServletException if servlet processing fails
     * @throws IOException      if redirect or I/O operation fails
     *
     * Expected params:
     * {@code packageName} — required
     * {@code description} — optional
     * {@code price} — required, must be positive number
     * {@code serviceIds} — multi-value from checkboxes, at least one required
     *
     * @return redirects to GET with {@code ?status=success}, {@code ?status=partial}, or error
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read form fields
        String   packageName    = request.getParameter("packageName");
        String   description    = request.getParameter("description");
        String   priceStr       = request.getParameter("price");
        String[] serviceIdStrs  = request.getParameterValues("serviceIds");

        // Validate required fields
        if (packageName == null || packageName.trim().isEmpty()) {
            forwardWithError(request, response, "Package name is required.");
            return;
        }
        if (priceStr == null || priceStr.trim().isEmpty()) {
            forwardWithError(request, response, "Price is required.");
            return;
        }
        if (serviceIdStrs == null || serviceIdStrs.length == 0) {
            forwardWithError(request, response,
                    "Please select at least one service for the package.");
            return;
        }

        // Validate and parse price as positive BigDecimal
        BigDecimal price;
        try {
            price = new BigDecimal(priceStr.trim());
            if (price.compareTo(BigDecimal.ZERO) <= 0) {
                throw new NumberFormatException("Price must be positive");
            }
        } catch (NumberFormatException e) {
            forwardWithError(request, response, "Price must be a valid positive number.");
            return;
        }

        // Insert package record, get new package_id
        int newPackageId = packageDAO.insertPackage(
                packageName.trim(),
                description != null ? description.trim() : "",
                price
        );

        if (newPackageId == -1) {
            forwardWithError(request, response,
                    "Database error: could not create package. Please try again.");
            return;
        }

        // Link each selected service to the new package
        int linkFailures = 0;
        for (String idStr : serviceIdStrs) {
            try {
                int serviceId = Integer.parseInt(idStr);
                int rows = packageServiceDAO.insertPackageService(newPackageId, serviceId);
                if (rows == 0) {
                    linkFailures++;
                }
            } catch (NumberFormatException ignored) {
                linkFailures++;
            }
        }

        // Redirect with result status
        if (linkFailures == 0) {
            response.sendRedirect(request.getContextPath()
                    + "/admin/create-package?status=success&name="
                    + java.net.URLEncoder.encode(packageName.trim(), "UTF-8"));
        } else {
            // Package created but some service links failed
            response.sendRedirect(request.getContextPath()
                    + "/admin/create-package?status=partial&packageId=" + newPackageId);
        }
    }

    /**
     * Reloads services and forwards back to form with error message
     *
     * @param request  {@code HttpServletRequest} to set error attributes
     * @param response {@code HttpServletResponse} to forward to JSP
     * @param message  error message to display
     * @throws ServletException if forward fails
     * @throws IOException      if forward fails
     */
    private void forwardWithError(HttpServletRequest request,
                                  HttpServletResponse response,
                                  String message)
            throws ServletException, IOException {

        request.setAttribute("errorMessage", message);
        request.setAttribute("availableServices", serviceDAO.getAllServices());
        request.getRequestDispatcher("/WEB-INF/pages/admin/create-package.jsp")
                .forward(request, response);
    }
}