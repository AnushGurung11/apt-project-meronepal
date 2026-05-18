<%@ page contentType="text/html;charset=UTF-8" isErrorPage="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Page Not Found - 404</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        .error-code { font-size: 72px; color: #e74c3c; margin: 0; }
        .error-msg { font-size: 24px; color: #555; margin: 20px 0; }
        .home-link { color: #3498db; text-decoration: none; font-size: 18px; }
        .home-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1 class="error-code">404</h1>
    <p class="error-msg">Oops! The page you're looking for doesn't exist.</p>
    <a class="home-link" href="${pageContext.request.contextPath}/home">← Go back to Home</a>
</body>
</html>