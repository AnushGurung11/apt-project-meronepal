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
    private static final String BOOKING = "/booking";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                             FilterChain chain) throws ServletException, IOException {
        // Creating an obj of request and response
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        // Getting the current URL of page
        String uri = req.getRequestURI();

        //All Static file links are also request, allow them
        // The Url contains any image or css, then allow the user to see
        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")) {
            chain.doFilter(request, response);
            return;
        }

        // Main logic for checking the actual login status of the user

        // takes the status if the user is in session or not
        boolean isLoggedIn = SessionUtil.getAttribute(req, "user") != null;
        if (!isLoggedIn) {
            // if the user is already in login or register page start again if refreshed
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
                chain.doFilter(request, response);
            } else {
                // if is not logged in then send back to the login page
                res.sendRedirect(req.getContextPath() + LOGIN);
            }
        } else {
            // is the session has a user

            // If they want to access login and register jsp then throw them in dashboard
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
                res.sendRedirect(req.getContextPath() + DASHBOARD);
            } else {
                // if not then send them back to the top of filter
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {
    }

}

