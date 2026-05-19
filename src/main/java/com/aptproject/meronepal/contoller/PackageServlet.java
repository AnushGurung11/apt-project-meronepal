package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.PackageDAO;
import com.aptproject.meronepal.model.Package;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet for displaying available packages.
 * URL Mapping: {@code /packages}
 *
 * GET: fetches all packages with their services and forwards to {@code packages.jsp}
 * Handles errors by setting empty list and error message for the view.
 */
@WebServlet(name = "PackageServlet", urlPatterns = {"/packages"})
public class PackageServlet extends HttpServlet {

    /**
     * doGet — loads packages and forwards to packages.jsp for display
     *
     * @param request  {@code HttpServletRequest} from client
     * @param response {@code HttpServletResponse} to forward to JSP
     * @throws ServletException if servlet processing fails
     * @throws IOException      if forward operation fails
     *
     * Sets request attributes:
     * {@code packages} — list of {@code Package} objects with associated services
     * {@code errorMessage} — set only if an exception occurs
     *
     * Includes debug logging to console for development.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Package> packages = null;
        String errorMessage = null;

        try {
            // Debug: log servlet entry
            System.out.println("PackageServlet.doGet() called");

            // Create DAO and fetch packages with services
            PackageDAO packageDAO = new PackageDAO();
            System.out.println("PackageDAO created");

            packages = packageDAO.getAllPackagesWithServices();
            System.out.println("getAllPackagesWithServices() called");

            // Handle null result safely
            if (packages == null) {
                packages = new ArrayList<>();
                errorMessage = "packageDAO.getAllPackagesWithServices() returned null";
                System.out.println("⚠ packages is null - creating empty list");
            } else {
                // Log package details for debugging
                System.out.println("✓ Packages fetched: " + packages.size() + " packages");
                for (Package pkg : packages) {
                    System.out.println("  - " + pkg.getPackageName() + " (Services: " + pkg.getServices().size() + ")");
                }
            }

            // Set packages attribute for JSP access
            request.setAttribute("packages", packages);
            System.out.println("request.setAttribute('packages', " + packages.size() + ") - SET");

            // Verify attribute was set correctly
            Object verify = request.getAttribute("packages");
            if (verify != null) {
                System.out.println("Verified: getAttribute('packages') returns: " + verify.getClass().getName());
            } else {
                System.out.println("ERROR: getAttribute('packages') is NULL");
            }

        } catch (Exception ex) {
            // Handle any errors: set safe defaults and log
            errorMessage = "Failed to load packages: " + ex.getMessage();
            packages = new ArrayList<>();
            System.out.println("EXCEPTION in PackageServlet: " + ex.getMessage());
            ex.printStackTrace();
            request.setAttribute("errorMessage", errorMessage);
        }

        // Ensure packages attribute is always set (even if empty)
        if (packages != null) {
            request.setAttribute("packages", packages);
        }

        // Forward to packages view
        System.out.println("Forwarding to JSP");

        try {
            request.getRequestDispatcher("/WEB-INF/pages/packages.jsp")
                    .forward(request, response);
            System.out.println("Forward successful");
        } catch (Exception ex) {
            System.out.println("Forward failed: " + ex.getMessage());
            ex.printStackTrace();
            throw new ServletException(ex);
        }
    }
}