package com.aptproject.meronepal.filter;

import com.aptproject.meronepal.utility.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/*"})
public class AuthenticationFilter implements Filter {
    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String DASHBOARD = "/dash board";
    private static final String BOOKING = "/Booking";
    private static final String  PAYMENT = "/payment";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
// Initialization logic, if required
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                             FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        //All Static file links are also request, allow them

        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")) {
            chain.doFilter(request, response);
            return;
        }
        boolean isLoggedIn = SessionUtil.getAttribute(req, "user") != null;
        if (!isLoggedIn) {
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(req.getContextPath() + LOGIN);
            }
        } else {
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
                res.sendRedirect(req.getContextPath() + DASHBOARD);
            } else {
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {
// Cleanup logic, if required
    }

}

