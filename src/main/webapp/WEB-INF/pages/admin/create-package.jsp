<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.aptproject.meronepal.model.Service" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Package | Admin</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 700px; margin: 40px auto; padding: 0 20px; }
        h2   { margin-bottom: 4px; }
        .breadcrumb { font-size: 13px; color: #888; margin-bottom: 24px; }
        .breadcrumb a { color: #555; text-decoration: none; }

        .card { background: #f9f9f9; border: 1px solid #ddd; border-radius: 8px; padding: 28px 32px; }

        label  { display: block; font-size: 14px; font-weight: 600; margin-bottom: 6px; color: #333; }
        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%; box-sizing: border-box;
            padding: 10px 12px; font-size: 14px;
            border: 1px solid #ccc; border-radius: 6px;
            margin-bottom: 18px;
        }
        textarea { resize: vertical; min-height: 80px; }

        /* ── Service checkbox grid ── */
        .services-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-bottom: 20px;
        }
        .service-card {
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            padding: 12px 14px;
            cursor: pointer;
            transition: border-color 0.15s, background 0.15s;
            display: flex;
            align-items: flex-start;
            gap: 10px;
        }
        .service-card:hover         { border-color: #93c5fd; background: #eff6ff; }
        .service-card.selected      { border-color: #2563eb; background: #eff6ff; }
        .service-card input[type="checkbox"] { margin-top: 2px; accent-color: #2563eb; }
        .service-card .svc-name     { font-weight: 600; font-size: 14px; color: #1e293b; }
        .service-card .svc-type     { font-size: 12px; color: #64748b; margin-top: 2px; }

        .no-services { color: #888; font-style: italic; margin-bottom: 18px; }

        button[type="submit"] {
            background: #16a34a; color: #fff; border: none;
            padding: 11px 28px; font-size: 15px; border-radius: 6px;
            cursor: pointer; width: 100%;
        }
        button[type="submit"]:hover { background: #15803d; }

        .alert         { padding: 12px 16px; border-radius: 6px; margin-bottom: 20px; font-size: 14px; }
        .alert-success { background: #dcfce7; color: #166534; border: 1px solid #bbf7d0; }
        .alert-error   { background: #fee2e2; color: #991b1b; border: 1px solid #fecaca; }
        .alert-partial { background: #fef9c3; color: #854d0e; border: 1px solid #fef08a; }

        .required { color: #e53e3e; }
        .section-label { font-weight: 700; font-size: 14px; color: #333; margin-bottom: 10px; }

        .select-hint { font-size: 12px; color: #6b7280; margin-bottom: 12px; }
    </style>
</head>
<body>

<h2>Create New Package</h2>
<p class="breadcrumb">
    <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a> &rsaquo; Create Package
</p>

<%-- ── Status banners (PRG redirect query params) ── --%>
<%
    String status    = request.getParameter("status");
    String pkgName   = request.getParameter("name");
    String pkgIdStr  = request.getParameter("packageId");

    if ("success".equals(status)) {
%>
    <div class="alert alert-success">
        &#10003; Package "<strong><%= pkgName %></strong>" was created successfully!
    </div>
<% } else if ("partial".equals(status)) { %>
    <div class="alert alert-partial">
        &#9888; Package (ID: <%= pkgIdStr %>) was created, but some service links failed.
        Please review the package and re-link missing services.
    </div>
<% } else if ("error".equals(status)) { %>
    <div class="alert alert-error">
        &#10007; Something went wrong. Please try again.
    </div>
<% } %>

<%-- ── Server-side validation error (forward) ── --%>
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
%>
    <div class="alert alert-error">&#10007; <%= errorMessage %></div>
<% } %>

<div class="card">
    <form method="post" action="${pageContext.request.contextPath}/admin/create-package"
          onsubmit="return validateForm()">

        <%-- Package Name --%>
        <label for="packageName">Package Name <span class="required">*</span></label>
        <input type="text" id="packageName" name="packageName"
               placeholder="e.g. Silver Wedding Package"
               maxlength="100" required />

        <%-- Description --%>
        <label for="description">Description</label>
        <textarea id="description" name="description"
                  placeholder="What does this package include?"></textarea>

        <%-- Price --%>
        <label for="price">Price (NPR) <span class="required">*</span></label>
        <input type="number" id="price" name="price"
               placeholder="e.g. 50000"
               min="1" step="0.01" required />

        <%-- Services selection --%>
        <div class="section-label">Select Services <span class="required">*</span></div>
        <p class="select-hint">Click to select one or more services to bundle into this package.</p>

        <%
            @SuppressWarnings("unchecked")
            List<Service> availableServices =
                    (List<Service>) request.getAttribute("availableServices");

            if (availableServices == null || availableServices.isEmpty()) {
        %>
            <p class="no-services">
                No active services found.
                <a href="${pageContext.request.contextPath}/admin/add-service">Add a service first</a>.
            </p>
        <%
            } else {
        %>
            <div class="services-grid" id="servicesGrid">
            <%
                for (Service svc : availableServices) {
            %>
                <label class="service-card"
                       id="card-<%= svc.getServiceId() %>"
                       onclick="toggleCard(<%= svc.getServiceId() %>)">
                    <input type="checkbox"
                           name="serviceIds"
                           value="<%= svc.getServiceId() %>"
                           id="svc-<%= svc.getServiceId() %>"
                           onclick="event.stopPropagation(); syncCard(<%= svc.getServiceId() %>)" />
                    <div>
                        <div class="svc-name"><%= svc.getServiceName() %></div>
                        <div class="svc-type">
                            <%= (svc.getServiceType() != null && !svc.getServiceType().isEmpty())
                                    ? svc.getServiceType() : "General" %>
                        </div>
                    </div>
                </label>
            <%
                }
            %>
            </div>
        <%
            }
        %>

        <button type="submit">Create Package</button>
    </form>
</div>

<script>
    // Toggle highlight when the whole card label is clicked
    function toggleCard(id) {
        const cb   = document.getElementById('svc-' + id);
        const card = document.getElementById('card-' + id);
        cb.checked = !cb.checked;
        card.classList.toggle('selected', cb.checked);
    }

    // Keep highlight in sync when the checkbox itself is directly clicked
    function syncCard(id) {
        const cb   = document.getElementById('svc-' + id);
        const card = document.getElementById('card-' + id);
        card.classList.toggle('selected', cb.checked);
    }

    // Prevent submit if no service is checked
    function validateForm() {
        const checked = document.querySelectorAll('input[name="serviceIds"]:checked');
        if (checked.length === 0) {
            alert('Please select at least one service for the package.');
            return false;
        }
        return true;
    }
</script>

</body>
</html>