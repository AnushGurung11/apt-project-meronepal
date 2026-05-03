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

@WebServlet(name = "PackageServlet", urlPatterns = {"/packages"})
public class PackageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Package> packages = null;
        String errorMessage = null;

        try {
            System.out.println("=== PackageServlet.doGet() called ===");

            // 1. Create DAO instance
            PackageDAO packageDAO = new PackageDAO();
            System.out.println("✓ PackageDAO created");

            // 2. Fetch all packages WITH their associated services
            packages = packageDAO.getAllPackagesWithServices();
            System.out.println("✓ getAllPackagesWithServices() called");

            if (packages == null) {
                packages = new ArrayList<>();
                errorMessage = "packageDAO.getAllPackagesWithServices() returned null";
                System.out.println("⚠ packages is null - creating empty list");
            } else {
                System.out.println("✓ Packages fetched: " + packages.size() + " packages");
                for (Package pkg : packages) {
                    System.out.println("  - " + pkg.getPackageName() + " (Services: " + pkg.getServices().size() + ")");
                }
            }

            // 3. Set data in request scope (accessible in JSP)
            request.setAttribute("packages", packages);
            System.out.println("✓ request.setAttribute('packages', " + packages.size() + ") - SET");

            // Verify attribute was set
            Object verify = request.getAttribute("packages");
            if (verify != null) {
                System.out.println("✓ Verified: getAttribute('packages') returns: " + verify.getClass().getName());
            } else {
                System.out.println("✗ ERROR: getAttribute('packages') is NULL");
            }

        } catch (Exception ex) {
            // Handle error
            errorMessage = "Failed to load packages: " + ex.getMessage();
            packages = new ArrayList<>();
            System.out.println("✗ EXCEPTION in PackageServlet: " + ex.getMessage());
            ex.printStackTrace();
            request.setAttribute("errorMessage", errorMessage);
        }

        // Always set packages even if empty
        if (packages != null) {
            request.setAttribute("packages", packages);
        }

        System.out.println("=== Forwarding to JSP ===");

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