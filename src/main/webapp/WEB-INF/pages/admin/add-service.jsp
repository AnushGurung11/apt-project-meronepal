<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Service | Admin</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 40px auto; padding: 0 20px; }
        h2   { margin-bottom: 4px; }
        .breadcrumb { font-size: 13px; color: #888; margin-bottom: 24px; }
        .breadcrumb a { color: #555; text-decoration: none; }

        .card { background: #f9f9f9; border: 1px solid #ddd; border-radius: 8px; padding: 28px 32px; }

        label  { display: block; font-size: 14px; font-weight: 600; margin-bottom: 6px; color: #333; }
        input[type="text"],
        select,
        textarea {
            width: 100%; box-sizing: border-box;
            padding: 10px 12px; font-size: 14px;
            border: 1px solid #ccc; border-radius: 6px;
            margin-bottom: 18px;
        }
        textarea { resize: vertical; min-height: 90px; }

        button[type="submit"] {
            background: #2563eb; color: #fff; border: none;
            padding: 11px 28px; font-size: 15px; border-radius: 6px;
            cursor: pointer; width: 100%;
        }
        button[type="submit"]:hover { background: #1d4ed8; }

        .alert          { padding: 12px 16px; border-radius: 6px; margin-bottom: 20px; font-size: 14px; }
        .alert-success  { background: #dcfce7; color: #166534; border: 1px solid #bbf7d0; }
        .alert-error    { background: #fee2e2; color: #991b1b; border: 1px solid #fecaca; }
        .alert-partial  { background: #fef9c3; color: #854d0e; border: 1px solid #fef08a; }

        .required { color: #e53e3e; }
    </style>
</head>
<body>

<h2>Add New Service</h2>
<p class="breadcrumb">
    <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a> &rsaquo; Add Service
</p>

<%-- ── Status messages from redirect query params (PRG pattern) ── --%>
<%
    String status = request.getParameter("status");
    String name   = request.getParameter("name");

    if ("success".equals(status)) {
%>
    <div class="alert alert-success">
        &#10003; Service "<strong><%= name %></strong>" was added successfully.
    </div>
<% } else if ("error".equals(status)) { %>
    <div class="alert alert-error">
        &#10007; Something went wrong. The service could not be saved. Please try again.
    </div>
<% } %>

<%-- ── Server-side validation error (forward, not redirect) ── --%>
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
%>
    <div class="alert alert-error">&#10007; <%= errorMessage %></div>
<% } %>

<div class="card">
    <form method="post" action="${pageContext.request.contextPath}/admin/add-service">

        <label for="serviceName">Service Name <span class="required">*</span></label>
        <input type="text" id="serviceName" name="serviceName"
               placeholder="e.g. Photography, Catering, DJ"
               maxlength="100" required />

        <label for="serviceType">Service Type</label>
        <select id="serviceType" name="serviceType">
            <option value="">-- Select Type --</option>
            <option value="Photography">Photography</option>
            <option value="Catering">Catering</option>
            <option value="Decoration">Decoration</option>
            <option value="Music">Music</option>
            <option value="Transport">Transport</option>
            <option value="Venue">Venue</option>
            <option value="Other">Other</option>
        </select>

        <label for="description">Description</label>
        <textarea id="description" name="description"
                  placeholder="Brief description of what this service includes..."></textarea>

        <button type="submit">Add Service</button>
    </form>
</div>

</body>
</html>