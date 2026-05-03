package com.aptproject.meronepal.contoller;

import com.aptproject.meronepal.dao.PackageDAO;
import com.aptproject.meronepal.model.Package;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * TEST SERVLET - Visit http://localhost:8080/courseworkapt/packages-test
 * This servlet outputs JSON showing exactly what's happening
 */
@WebServlet(name = "PackageTestServlet", urlPatterns = {"/packages-test"})
public class PackageTestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("{");
        out.println("  \"status\": \"testing\",");
        out.println("  \"timestamp\": \"" + System.currentTimeMillis() + "\",");

        try {
            out.println("  \"step1_dao_creation\": \"Creating PackageDAO...\",");
            PackageDAO packageDAO = new PackageDAO();
            out.println("  \"step1_result\": \"SUCCESS\",");

            out.println("  \"step2_fetch_packages\": \"Calling getAllPackagesWithServices()...\",");
            List<Package> packages = packageDAO.getAllPackagesWithServices();
            out.println("  \"step2_result\": \"SUCCESS\",");
            out.println("  \"packages_count\": " + (packages == null ? "null" : packages.size()) + ",");

            if (packages != null && !packages.isEmpty()) {
                out.println("  \"packages_data\": [");
                for (int i = 0; i < packages.size(); i++) {
                    Package pkg = packages.get(i);
                    out.println("    {");
                    out.println("      \"id\": " + pkg.getPackageId() + ",");
                    out.println("      \"name\": \"" + escapeJson(pkg.getPackageName()) + "\",");
                    out.println("      \"price\": " + pkg.getPrice() + ",");
                    out.println("      \"services_count\": " + pkg.getServices().size() + ",");
                    out.println("      \"services\": [");

                    List<?> services = pkg.getServices();
                    for (int j = 0; j < services.size(); j++) {
                        com.aptproject.meronepal.model.Service svc =
                                (com.aptproject.meronepal.model.Service) services.get(j);
                        out.println("        {");
                        out.println("          \"id\": " + svc.getServiceId() + ",");
                        out.println("          \"name\": \"" + escapeJson(svc.getServiceName()) + "\"");
                        out.println("        }" + (j < services.size() - 1 ? "," : ""));
                    }

                    out.println("      ]");
                    out.println("    }" + (i < packages.size() - 1 ? "," : ""));
                }
                out.println("  ],");
            }

            out.println("  \"final_status\": \"SUCCESS\",");
            out.println("  \"notes\": \"If packages_count is 0 or null, check database. If packages_count > 0, data is loading correctly. Problem is in request.setAttribute() or JSP.\",");
            out.println("  \"next_step\": \"If packages_count > 0, replace PackageServlet with PackageServlet-Fixed.java\"");

        } catch (Exception ex) {
            out.println("  \"error\": \"" + escapeJson(ex.getMessage()) + "\",");
            out.println("  \"exception_class\": \"" + ex.getClass().getName() + "\",");
            out.println("  \"stacktrace\": \"" + escapeJson(getStackTrace(ex)) + "\"");
            ex.printStackTrace();
        }

        out.println("}");
        out.flush();
    }

    private String escapeJson(String str) {
        if (str == null) return "";
        return str.replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }

    private String getStackTrace(Exception ex) {
        StringBuilder sb = new StringBuilder();
        for (StackTraceElement element : ex.getStackTrace()) {
            sb.append(element.toString()).append(" | ");
        }
        return sb.toString();
    }
}
