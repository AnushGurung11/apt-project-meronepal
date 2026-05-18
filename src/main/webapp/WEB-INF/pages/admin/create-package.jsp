<<<<<<< HEAD
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Package — Mero Nepal Production</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;900&family=Playfair+Display:ital,wght@0,400;1,400&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
      rel="stylesheet"
    />
    <link
      rel="icon"
      type="image/x-icon"
      href="${pageContext.request.contextPath}/assets/img/favicon.ico"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/styles.css"
    />
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Outfit:wght@300;400;500;600&display=swap");

      :root {
        --black: #0a0a0a;
        --dark: #111111;
        --surface: #181818;
        --surface2: #222222;
        --border: #2a2a2a;
        --gold: #c9a84c;
        --gold-light: #e2c07a;
        --gold-dim: #c9a84c33;
        --white: #f5f0e8;
        --muted: #888880;
        --red: #c0392b;
        --font-display: "Cormorant Garamond", Georgia, serif;
        --font-body: "Outfit", sans-serif;
        --radius: 6px;
        --radius-lg: 12px;
        --transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        --shadow: 0 8px 40px rgba(0, 0, 0, 0.6);
      }

      *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
      html { scroll-behavior: smooth; }
      body {
        background: var(--black);
        color: var(--white);
        font-family: var(--font-body);
        font-size: 15px;
        line-height: 1.7;
        -webkit-font-smoothing: antialiased;
        overflow-x: hidden;
      }
      a { color: inherit; text-decoration: none; transition: color var(--transition); }
      button { cursor: pointer; border: none; background: none; font-family: var(--font-body); }

      h2 {
        font-family: var(--font-display);
        font-weight: 400;
        line-height: 1.15;
        letter-spacing: 0.01em;
        font-size: clamp(2rem, 4vw, 3.2rem);
      }
      p { color: #b0aa9f; font-weight: 300; }

      .dashboard-main { padding: 48px; }
      .page-header { margin-bottom: 40px; }
      .page-header h2 { margin-bottom: 6px; }
      .page-header p { font-size: 14px; }

      .breadcrumb {
        font-size: 12px;
        color: var(--muted);
        margin-bottom: 24px;
        letter-spacing: 0.08em;
        text-transform: uppercase;
      }
      .breadcrumb a { color: var(--muted); transition: color var(--transition); }
      .breadcrumb a:hover { color: var(--gold); }

      /* ── Form ── */
      .form-card {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        padding: 40px;
        max-width: 820px;
      }
      .form-group { margin-bottom: 24px; }
      .form-label {
        display: block;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 0.14em;
        text-transform: uppercase;
        color: var(--gold);
        margin-bottom: 10px;
      }
      .form-label .required { color: #e74c3c; margin-left: 2px; }
      .form-input,
      .form-textarea {
        width: 100%;
        background: var(--surface2);
        border: 1px solid var(--border);
        color: var(--white);
        border-radius: var(--radius);
        padding: 13px 16px;
        font-size: 14px;
        font-family: var(--font-body);
        outline: none;
        transition: border-color var(--transition);
      }
      .form-input:focus,
      .form-textarea:focus { border-color: var(--gold); }
      .form-input::placeholder,
      .form-textarea::placeholder { color: var(--muted); }
      .form-textarea {
        resize: vertical;
        min-height: 90px;
        line-height: 1.6;
      }
      .select-hint {
        font-size: 12px;
        color: var(--muted);
        margin-top: -4px;
        margin-bottom: 14px;
      }

      /* ── Service picker grid ── */
      .services-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 12px;
        margin-bottom: 8px;
      }
      .service-card {
        border: 1px solid var(--border);
        background: var(--surface2);
        border-radius: var(--radius);
        padding: 14px 16px;
        cursor: pointer;
        transition: border-color var(--transition), background var(--transition);
        display: flex;
        align-items: flex-start;
        gap: 12px;
      }
      .service-card:hover {
        border-color: rgba(201, 168, 76, 0.4);
        background: #1d1a14;
      }
      .service-card.selected {
        border-color: var(--gold);
        background: rgba(201, 168, 76, 0.08);
      }
      .service-card input[type="checkbox"] {
        margin-top: 3px;
        accent-color: var(--gold);
        flex-shrink: 0;
      }
      .svc-name {
        font-weight: 500;
        font-size: 14px;
        color: var(--white);
      }
      .svc-type {
        font-size: 11px;
        color: var(--muted);
        margin-top: 3px;
        letter-spacing: 0.08em;
        text-transform: uppercase;
      }
      .no-services {
        color: var(--muted);
        font-style: italic;
        padding: 14px 0;
      }
      .no-services a { color: var(--gold); }
      .no-services a:hover { text-decoration: underline; }

      /* ── Buttons ── */
      .btn {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 14px 32px;
        border-radius: var(--radius);
        font-size: 13px;
        font-weight: 500;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        transition: all var(--transition);
        white-space: nowrap;
        cursor: pointer;
      }
      .btn-gold {
        background: var(--gold);
        color: var(--black);
        border: 1px solid var(--gold);
      }
      .btn-gold:hover {
        background: var(--gold-light);
        border-color: var(--gold-light);
        transform: translateY(-1px);
        box-shadow: 0 4px 20px rgba(201, 168, 76, 0.3);
      }
      .btn-ghost {
        border: 1px solid var(--border);
        color: var(--white);
      }
      .btn-ghost:hover {
        border-color: var(--gold);
        color: var(--gold);
      }
      .btn-row {
        display: flex;
        gap: 12px;
        justify-content: flex-end;
        margin-top: 16px;
      }

      /* ── Alerts ── */
      .alert {
        padding: 14px 20px;
        border-radius: var(--radius);
        font-size: 13.5px;
        border-left: 3px solid;
        margin-bottom: 24px;
        max-width: 820px;
      }
      .alert-success { background: rgba(52,199,89,0.1); border-color: #34c759; color: #34c759; }
      .alert-error   { background: rgba(231,76,60,0.1); border-color: #e74c3c; color: #f08080; }
      .alert-partial { background: rgba(255,149,0,0.1); border-color: #ff9500; color: #ffb86c; }

      .section-label {
        display: block;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 0.14em;
        text-transform: uppercase;
        color: var(--gold);
        margin-bottom: 6px;
      }

      @media (max-width: 768px) {
        .dashboard-main { padding: 24px 20px; }
        .form-card { padding: 28px 22px; }
        .services-grid { grid-template-columns: 1fr; }
      }
    </style>
  </head>

  <body>
    <!-- ── BACKGROUND GRID ── -->
    <div class="fixed inset-0 opacity-20 z-0 background-grid">
      <script>
        for (let i = 0; i < 96; i++)
          document.write('<div class="grid-cell"></div>');
      </script>
    </div>

    <!-- ── FILM GRAIN ── -->
    <div class="fixed inset-0 opacity-5 pointer-events-none grain-overlay"></div>

    <%@ include file="/WEB-INF/pages/components/mobile-top-bar.jsp" %>
    <%@ include file="/WEB-INF/pages/components/mobile-nav-drawer-admin.jsp" %>

    <!-- ── MAIN 3-COLUMN LAYOUT ── -->
    <div class="relative z-10 grid md:grid-cols-[80px_1fr_280px] min-h-screen border-b border-white/10">
      <%@ include file="/WEB-INF/pages/components/left-rail-auth.jsp" %>

      <main class="pt-14 md:pt-0">
        <div class="dashboard-main">

          <div class="breadcrumb">
            <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            &rsaquo;
            <a href="${pageContext.request.contextPath}/admin/package-services">Packages</a>
            &rsaquo;
            Create Package
          </div>

          <div class="page-header">
            <h2>Create New Package</h2>
            <p>Bundle one or more active services into a sellable package.</p>
          </div>

          <c:if test="${param.status == 'success'}">
            <div class="alert alert-success">
              &#10003; Package "<strong>${param.name}</strong>" was created successfully.
            </div>
          </c:if>
          <c:if test="${param.status == 'partial'}">
            <div class="alert alert-partial">
              &#9888; Package (ID: ${param.packageId}) was created, but some service links failed. Please review and re-link missing services.
            </div>
          </c:if>
          <c:if test="${param.status == 'error'}">
            <div class="alert alert-error">
              &#10005; Something went wrong. Please try again.
            </div>
          </c:if>
          <c:if test="${not empty errorMessage}">
            <div class="alert alert-error">
              &#10005; ${errorMessage}
            </div>
          </c:if>

          <div class="form-card">
            <form method="post"
                  action="${pageContext.request.contextPath}/admin/create-package"
                  onsubmit="return validateForm()">

              <div class="form-group">
                <label class="form-label" for="packageName">
                  Package Name <span class="required">*</span>
                </label>
                <input type="text"
                       class="form-input"
                       id="packageName"
                       name="packageName"
                       placeholder="e.g. Silver Wedding Package"
                       value="${not empty prevPackageName ? prevPackageName : ''}"
                       maxlength="100"
                       required />
              </div>

              <div class="form-group">
                <label class="form-label" for="description">Description</label>
                <textarea class="form-textarea"
                          id="description"
                          name="description"
                          placeholder="What does this package include?">${not empty prevDescription ? prevDescription : ''}</textarea>
              </div>

              <div class="form-group">
                <label class="form-label" for="price">
                  Price (NPR) <span class="required">*</span>
                </label>
                <input type="number"
                       class="form-input"
                       id="price"
                       name="price"
                       placeholder="e.g. 50000"
                       value="${not empty prevPrice ? prevPrice : ''}"
                       min="1"
                       step="0.01"
                       required />
              </div>

              <div class="form-group">
                <span class="section-label">Select Services <span class="required">*</span></span>
                <p class="select-hint">Click to select one or more services to bundle into this package.</p>

                <c:choose>
                  <c:when test="${empty availableServices}">
                    <p class="no-services">
                      No active services found.
                      <a href="${pageContext.request.contextPath}/admin/add-service">Add a service first</a>.
                    </p>
                  </c:when>
                  <c:otherwise>
                    <div class="services-grid" id="servicesGrid">
                      <c:forEach var="svc" items="${availableServices}">
                        <label class="service-card"
                               id="card-${svc.serviceId}"
                               onclick="toggleCard(${svc.serviceId})">
                          <input type="checkbox"
                                 name="serviceIds"
                                 value="${svc.serviceId}"
                                 id="svc-${svc.serviceId}"
                                 onclick="event.stopPropagation(); syncCard(${svc.serviceId});" />
                          <div>
                            <div class="svc-name">${svc.serviceName}</div>
                            <div class="svc-type">
                              <c:choose>
                                <c:when test="${not empty svc.serviceType}">${svc.serviceType}</c:when>
                                <c:otherwise>General</c:otherwise>
                              </c:choose>
                            </div>
                          </div>
                        </label>
                      </c:forEach>
                    </div>
                  </c:otherwise>
                </c:choose>
              </div>

              <div class="btn-row">
                <a href="${pageContext.request.contextPath}/admin/package-services" class="btn btn-ghost">Cancel</a>
                <button type="submit" class="btn btn-gold">Create Package</button>
              </div>
            </form>
          </div>
        </div>

        <%@ include file="/WEB-INF/pages/components/footer-admin.jsp" %>
      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-admin.jsp" %>
    </div>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>

    <script>
      function toggleCard(id) {
=======
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
>>>>>>> 108eb2e (backend-completion)
        const cb   = document.getElementById('svc-' + id);
        const card = document.getElementById('card-' + id);
        cb.checked = !cb.checked;
        card.classList.toggle('selected', cb.checked);
<<<<<<< HEAD
      }
      function syncCard(id) {
        const cb   = document.getElementById('svc-' + id);
        const card = document.getElementById('card-' + id);
        card.classList.toggle('selected', cb.checked);
      }
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
=======
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
>>>>>>> 108eb2e (backend-completion)
