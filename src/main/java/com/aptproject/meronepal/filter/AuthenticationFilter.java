package com.aptproject.meronepal.filter;

import com.aptproject.meronepal.utility.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Filter for authentication and role-based access control.
 * URL Patterns: {@code /*} — applies to all requests
 *
 * - Public paths: /login, /register, /packages, /blog, /about, static assets
 * - Admin-only paths: /admin/*, /dashboard
 * - Redirects unauthenticated users to /login
 * - Redirects non-admin users away from admin paths to /home
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/*"})
public class AuthenticationFilter implements Filter {

    // Public paths (no login required)
    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";

    // Admin-only paths (exact matches for non-/admin/* paths)
    private static final List<String> ADMIN_PATHS = List.of(
            "/admin/add-service",
            "/admin-booking",
            "/admin/create-package",
            "/dashboard",
            "/admin/package-services"
    );

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // No initialization required
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();

        // Allow static assets without authentication
        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")
                || uri.endsWith(".js") || uri.endsWith(".gif")) {
            chain.doFilter(request, response);
            return;
        }

        // Safe path extraction for matching
        String path = uri;
        if (uri.startsWith(contextPath)) {
            path = uri.substring(contextPath.length());
        }

        // Check if user is logged in
        Object userObj = SessionUtil.getAttribute(req, "user");
        boolean isLoggedIn = userObj != null;

        if (!isLoggedIn) {
            // Not logged in: allow public paths, redirect others to login
            if (isPublicPath(path)) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(contextPath + LOGIN);
            }
            return;
        }

        // User is logged in - check role for admin paths
        String role = (String) SessionUtil.getAttribute(req, "role");
        boolean isAdmin = "ADMIN".equalsIgnoreCase(role);

        // Check if trying to access admin-only path
        if (isAdminPath(path) && !isAdmin) {
            // Non-admin trying to access admin area → redirect to home with error
            SessionUtil.setAttribute(req, "errorMessage", "Access denied. Admin privileges required.");
            res.sendRedirect(contextPath + HOME);
            return;
        }

        // Redirect logged-in users away from login/register pages
        if (path.equals(LOGIN) || path.equals(REGISTER) || path.equals("/") || path.isEmpty()) {
            if (isAdmin) {
                res.sendRedirect(contextPath + "/dashboard");
            } else {
                res.sendRedirect(contextPath + HOME);
            }
            return;
        }

        // All checks passed - allow request to proceed
        chain.doFilter(request, response);
    }

    /**
     * Checks if the requested path is a public path (no auth required)
     */
    private boolean isPublicPath(String path) {
        return path.equals(LOGIN)
                || path.equals(REGISTER)
                || path.equals("/packages")
                || path.equals("/blog")
                || path.equals("/about");
    }

    /**
     * Checks if the requested path is an admin-only path
     */
    private boolean isAdminPath(String path) {
        // Quick prefix check for /admin/* paths
        if (path.startsWith("/admin/")) {
            return true;
        }
        // Check exact matches for specific admin paths (like /dashboard)
        for (String adminPath : ADMIN_PATHS) {
            if (path.equals(adminPath)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void destroy() {
        // No cleanup required
    }
}