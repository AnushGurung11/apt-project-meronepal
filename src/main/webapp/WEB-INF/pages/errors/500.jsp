<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Server Error - 500</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        .error-code { font-size: 72px; color: #e74c3c; margin: 0; }
        .error-msg { font-size: 24px; color: #555; margin: 20px 0; }
        .error-detail { font-size: 14px; color: #999; margin: 30px 0; max-width: 600px; margin-left: auto; margin-right: auto; }
        .home-link { color: #3498db; text-decoration: none; font-size: 18px; }
        .home-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1 class="error-code">500</h1>
    <p class="error-msg">Something went wrong on our end.</p>

    <%-- Show error details only in development --%>
    <% if ("development".equals(System.getProperty("env"))) { %>
        <div class="error-detail">
            <strong>Error:</strong> <%= exception.getMessage() %><br>
            <strong>Type:</strong> <%= exception.getClass().getName() %>
        </div>
    <% } %>

    <a class="home-link" href="${pageContext.request.contextPath}/home">← Go back to Home</a>
</body>
</html>