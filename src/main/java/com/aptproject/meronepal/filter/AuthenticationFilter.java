package com.aptproject.meronepal.filter;

import com.aptproject.meronepal.utility.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Filter for authentication and role-based access control.
 * URL Patterns: {@code /*} — applies to all requests
 *
 * Allows public access to {@code /login}, {@code /register}, {@code /packages}, and static assets.
 * Redirects unauthenticated users to {@code /login}.
 * Redirects authenticated users away from login/register to role-specific pages.
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/*"})
public class AuthenticationFilter implements Filter {

    // Public paths that don't require authentication
    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String DASHBOARD = "/dashboard";
    private static final String HOME = "/home";

    /**
     * init — called when filter is initialized by the container
     *
     * @param filterConfig {@code FilterConfig} containing filter initialization parameters
     * @throws ServletException if initialization fails
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // No initialization required
    }

    /**
     * doFilter — checks authentication and redirects based on user role
     *
     * @param request  {@code ServletRequest} from client (cast to {@code HttpServletRequest})
     * @param response {@code ServletResponse} to client (cast to {@code HttpServletResponse})
     * @param chain    {@code FilterChain} to pass request to next filter or target
     * @throws ServletException if servlet processing fails
     * @throws IOException      if redirect or I/O operation fails
     *
     * Flow:
     * 1. Skip filter for static assets ({@code .png}, {@code .jpg}, {@code .css})
     * 2. Check session for {@code user} attribute to determine login status
     * 3. If not logged in: allow access to public paths, redirect others to {@code /login}
     * 4. If logged in: check {@code role} attribute, redirect away from login/register
     *    to {@code /dashboard} for Admin or {@code /home} for regular users
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws ServletException, IOException {

        // Cast to HTTP-specific types for servlet operations
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();

        // Allow static assets to pass without authentication check
        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")) {
            chain.doFilter(request, response);
            return;
        }

        // Check if user is logged in via session
        Object userObj = SessionUtil.getAttribute(req, "user");
        boolean isLoggedIn = userObj != null;

        if (!isLoggedIn) {
            // Allow access to public pages, redirect others to login
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith("/packages")) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(req.getContextPath() + LOGIN);
            }
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
            } else {
                // Allow access to protected pages
                chain.doFilter(request, response);
            }
        }
    }

    /**
     * destroy — called when filter is taken out of service
     * No cleanup required for this filter.
     */
    @Override
    public void destroy() {
        // No resources to clean up
    }

}