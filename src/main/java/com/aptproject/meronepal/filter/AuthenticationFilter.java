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
    private static final String BOOKING = "/booking";

    // Add a list of paths that don't require login
    private static final String[] PUBLIC_PATHS = {
            "/login", "/register", "/index.jsp", "/", "/home"  // add whatever should be public
    };

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
            System.out.println("Not logged in");
            if (uri.endsWith(LOGIN)) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(req.getContextPath() + LOGIN);
            }
        } else {
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.equals(req.getContextPath()) || uri.equals(req.getContextPath() + "/")) {
                res.sendRedirect(req.getContextPath() + HOME);
            } else {
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {
    }

}

