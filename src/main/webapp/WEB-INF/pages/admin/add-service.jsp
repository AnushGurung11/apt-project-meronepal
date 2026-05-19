<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add New Service — Mero Nepal Production</title>

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
        max-width: 640px;
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
      .form-textarea,
      .form-select {
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
      .form-textarea:focus,
      .form-select:focus { border-color: var(--gold); }
      .form-input::placeholder,
      .form-textarea::placeholder { color: var(--muted); }
      .form-textarea {
        resize: vertical;
        min-height: 100px;
        line-height: 1.6;
      }

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
        margin-top: 8px;
      }

      /* ── Alerts ── */
      .alert {
        padding: 14px 20px;
        border-radius: var(--radius);
        font-size: 13.5px;
        border-left: 3px solid;
        margin-bottom: 24px;
        max-width: 640px;
      }
      .alert-success { background: rgba(52,199,89,0.1); border-color: #34c759; color: #34c759; }
      .alert-error   { background: rgba(231,76,60,0.1); border-color: #e74c3c; color: #f08080; }

      @media (max-width: 768px) {
        .dashboard-main { padding: 24px 20px; }
        .form-card { padding: 28px 22px; }
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
            <a href="${pageContext.request.contextPath}/admin-services">Services</a>
            &rsaquo;
            Add Service
          </div>

          <div class="page-header">
            <h2>Add New Service</h2>
            <p>Create a new service that can be bundled into packages.</p>
          </div>

          <c:if test="${param.status == 'success'}">
            <div class="alert alert-success">
              &#10003; Service "<strong>${param.name}</strong>" was added successfully.
            </div>
          </c:if>
          <c:if test="${param.status == 'error'}">
            <div class="alert alert-error">
              &#10005; Something went wrong. The service could not be saved. Please try again.
            </div>
          </c:if>
          <c:if test="${not empty errorMessage}">
            <div class="alert alert-error">
              &#10005; ${errorMessage}
            </div>
          </c:if>

          <div class="form-card">
            <form method="post" action="${pageContext.request.contextPath}/admin/add-service">

              <div class="form-group">
                <label class="form-label" for="serviceName">
                  Service Name <span class="required">*</span>
                </label>
                <input type="text"
                       class="form-input"
                       id="serviceName"
                       name="serviceName"
                       placeholder="e.g. Photography, Catering, DJ"
                       value="${not empty prevServiceName ? prevServiceName : ''}"
                       maxlength="100"
                       required />
              </div>

              <div class="form-group">
                <label class="form-label" for="serviceType">Service Type</label>
                <select class="form-select" id="serviceType" name="serviceType">
                  <option value="">-- Select Type --</option>
                  <option value="Photography" ${prevServiceType == 'Photography' ? 'selected' : ''}>Photography</option>
                  <option value="Videography" ${prevServiceType == 'Videography' ? 'selected' : ''}>Videography</option>
                  <option value="Editing"     ${prevServiceType == 'Editing'     ? 'selected' : ''}>Editing</option>
                  <option value="Catering"    ${prevServiceType == 'Catering'    ? 'selected' : ''}>Catering</option>
                  <option value="Decoration"  ${prevServiceType == 'Decoration'  ? 'selected' : ''}>Decoration</option>
                  <option value="Music"       ${prevServiceType == 'Music'       ? 'selected' : ''}>Music</option>
                  <option value="Transport"   ${prevServiceType == 'Transport'   ? 'selected' : ''}>Transport</option>
                  <option value="Venue"       ${prevServiceType == 'Venue'       ? 'selected' : ''}>Venue</option>
                  <option value="Other"       ${prevServiceType == 'Other'       ? 'selected' : ''}>Other</option>
                </select>
              </div>

              <div class="form-group">
                <label class="form-label" for="description">Description</label>
                <textarea class="form-textarea"
                          id="description"
                          name="description"
                          placeholder="Brief description of what this service includes...">${not empty prevDescription ? prevDescription : ''}</textarea>
              </div>

              <div class="btn-row">
                <a href="${pageContext.request.contextPath}/admin-services" class="btn btn-ghost">Cancel</a>
                <button type="submit" class="btn btn-gold">Add Service</button>
              </div>
            </form>
          </div>
        </div>

        <%@ include file="/WEB-INF/pages/components/footer-admin.jsp" %>
      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-admin.jsp" %>
    </div>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>
  </body>
</html>
