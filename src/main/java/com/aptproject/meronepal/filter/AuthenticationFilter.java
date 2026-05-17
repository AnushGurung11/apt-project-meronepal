package com.aptproject.meronepal.filter;

import com.aptproject.meronepal.utility.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

//So web filter will run in all the paths given below
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/*"})
public class AuthenticationFilter implements Filter {
    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String DASHBOARD = "/dashboard";
    private static final String HOME = "/home";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();

        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")) {
            chain.doFilter(request, response);
            return;
        }

        Object userObj = SessionUtil.getAttribute(req, "user");
        boolean isLoggedIn = userObj != null;

        if (!isLoggedIn) {
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith("/packages")) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(req.getContextPath() + LOGIN);
            }
        } else {
            // Check if the logged-in user is an Admin
            boolean isAdmin = "ADMIN".equalsIgnoreCase(
                    (String) SessionUtil.getAttribute(req, "role")
            );

            boolean isRootPath = uri.equals(req.getContextPath())
                    || uri.equals(req.getContextPath() + "/");

            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || isRootPath) {
                // Redirect based on role
                if (isAdmin) {
                    res.sendRedirect(req.getContextPath() + DASHBOARD);
                } else {
                    res.sendRedirect(req.getContextPath() + HOME);
                }
            } else {
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {
    }

}

