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
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 390bb54 (error page handeling and filter management)
 * - Public paths: /login, /register, /packages, /blog, /about, static assets
 * - Admin-only paths: /admin/*, /dashboard
 * - Redirects unauthenticated users to /login
 * - Redirects non-admin users away from admin paths to /home
<<<<<<< HEAD
=======
 * Allows public access to {@code /login}, {@code /register}, {@code /packages}, and static assets.
 * Redirects unauthenticated users to {@code /login}.
 * Redirects authenticated users away from login/register to role-specific pages.
>>>>>>> 108eb2e (backend-completion)
=======
>>>>>>> 390bb54 (error page handeling and filter management)
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/*"})
public class AuthenticationFilter implements Filter {

<<<<<<< HEAD
<<<<<<< HEAD
    // Public paths (no login required)
=======
    // Public paths that don't require authentication
>>>>>>> 108eb2e (backend-completion)
=======
    // Public paths (no login required)
>>>>>>> 390bb54 (error page handeling and filter management)
    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";
<<<<<<< HEAD

    // Admin-only paths (exact matches for non-/admin/* paths)
    private static final List<String> ADMIN_PATHS = List.of(
            "/admin/add-service",
            "/admin-booking",
            "/admin/create-package",
            "/dashboard",
            "/admin/package-services"
    );
=======
>>>>>>> e3c7318 (Admin redirect to dashboard)

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
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> e3c7318 (Admin redirect to dashboard)
=======

<<<<<<< HEAD
        // Cast to HTTP-specific types for servlet operations
>>>>>>> 108eb2e (backend-completion)
=======
>>>>>>> 390bb54 (error page handeling and filter management)
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        // Allow static assets without authentication
        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")
                || uri.endsWith(".js") || uri.endsWith(".gif")) {
=======
=======
        // Allow static assets to pass without authentication check
>>>>>>> 108eb2e (backend-completion)
        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")) {
>>>>>>> e3c7318 (Admin redirect to dashboard)
=======
        // Allow static assets without authentication
        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")
                || uri.endsWith(".js") || uri.endsWith(".gif")) {
>>>>>>> 390bb54 (error page handeling and filter management)
            chain.doFilter(request, response);
            return;
        }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 390bb54 (error page handeling and filter management)
        // Safe path extraction for matching
        String path = uri;
        if (uri.startsWith(contextPath)) {
            path = uri.substring(contextPath.length());
        }

        // Check if user is logged in
<<<<<<< HEAD
=======
>>>>>>> e3c7318 (Admin redirect to dashboard)
=======
        // Check if user is logged in via session
>>>>>>> 108eb2e (backend-completion)
=======
>>>>>>> 390bb54 (error page handeling and filter management)
        Object userObj = SessionUtil.getAttribute(req, "user");
        boolean isLoggedIn = userObj != null;

        if (!isLoggedIn) {
<<<<<<< HEAD
<<<<<<< HEAD
            // Not logged in: allow public paths, redirect others to login
            if (isPublicPath(path)) {
=======
            // Allow access to public pages, redirect others to login
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith("/packages")) {
>>>>>>> 108eb2e (backend-completion)
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(contextPath + LOGIN);
            }
<<<<<<< HEAD
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
=======
        } else {
            // Check if logged-in user has Admin role
            boolean isAdmin = "ADMIN".equalsIgnoreCase(
                    (String) SessionUtil.getAttribute(req, "role")
            );

            boolean isRootPath = uri.equals(req.getContextPath())
                    || uri.equals(req.getContextPath() + "/");

            // Redirect authenticated users away from login/register pages
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || isRootPath) {
                if (isAdmin) {
                    res.sendRedirect(req.getContextPath() + DASHBOARD);
                } else {
                    res.sendRedirect(req.getContextPath() + HOME);
                }
>>>>>>> e3c7318 (Admin redirect to dashboard)
            } else {
<<<<<<< HEAD
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
        if (path.startsWith("/admin/") || path.equals("/admin")) {
            return true;
        }
        // Check exact matches for specific admin paths (like /dashboard)
        for (String adminPath : ADMIN_PATHS) {
            if (path.equals(adminPath)) {
                return true;
=======
                // Allow access to protected pages
                chain.doFilter(request, response);
>>>>>>> 108eb2e (backend-completion)
=======
            // Not logged in: allow public paths, redirect others to login
            if (isPublicPath(path)) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(contextPath + LOGIN);
>>>>>>> 390bb54 (error page handeling and filter management)
            }
            return;
        }
<<<<<<< HEAD
        return false;
=======

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
>>>>>>> 390bb54 (error page handeling and filter management)
    }

    /**
     * Checks if the requested path is a public path (no auth required)
     */
<<<<<<< HEAD
    @Override
    public void destroy() {
<<<<<<< HEAD
        // No cleanup required
    }
=======
        // No resources to clean up
    }

>>>>>>> 108eb2e (backend-completion)
=======
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
>>>>>>> 390bb54 (error page handeling and filter management)
}