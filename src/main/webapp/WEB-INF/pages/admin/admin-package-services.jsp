<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" isErrorPage="false" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Package Services — Mero Nepal Production</title>

  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
  <link rel="icon" type="image/x-icon" href="../../../assets/img/favicon.ico" />

  <style>
    :root {
      --black:      #0a0a0a;
      --dark:       #111111;
      --surface:    #181818;
      --surface2:   #222222;
      --border:     #2a2a2a;
      --gold:       #c9a84c;
      --gold-light: #e2c07a;
      --gold-dim:   #c9a84c33;
      --white:      #f5f0e8;
      --muted:      #888880;
      --red:        #c0392b;
      --teal:       #1a6b6b;
      --teal-text:  #7ee8e8;
      --teal-border:#1e8080;
      --font-display:"Cormorant Garamond", Georgia, serif;
      --font-body:   "Outfit", sans-serif;
      --radius:  6px;
      --radius-lg: 12px;
      --transition: 0.3s cubic-bezier(0.4,0,0.2,1);
      --shadow: 0 8px 40px rgba(0,0,0,0.6);
    }
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }
    body {
      background: var(--black); color: var(--white);
      font-family: var(--font-body); font-size: 15px;
      line-height: 1.7; -webkit-font-smoothing: antialiased; overflow-x: hidden;
    }
    a { color: inherit; text-decoration: none; transition: color var(--transition); }
    button { cursor: pointer; border: none; background: none; font-family: var(--font-body); }

    /* ── Typography ───────────────────────── */
    h2 {
      font-family: var(--font-display); font-weight: 400;
      line-height: 1.15; letter-spacing: 0.01em;
      font-size: clamp(2rem, 4vw, 3.2rem);
    }
    h3 {
      font-family: var(--font-display); font-weight: 400;
      font-size: clamp(1.4rem, 2.5vw, 2rem); margin-bottom: 16px;
    }
    p { color: #b0aa9f; font-weight: 300; }

    /* ── Layout ───────────────────────────── */
    .dashboard-main { padding: 48px; }
    .page-header { margin-bottom: 40px; }
    .page-header h2 { margin-bottom: 6px; }
    .page-header p { font-size: 14px; }
    .section { margin-bottom: 56px; }

    /* ── Buttons ──────────────────────────── */
    .btn {
      display: inline-flex; align-items: center; gap: 8px;
      padding: 14px 32px; border-radius: var(--radius);
      font-size: 13px; font-weight: 500; letter-spacing: 0.08em;
      text-transform: uppercase; transition: all var(--transition);
      white-space: nowrap; cursor: pointer;
    }
    .btn-gold  { background: var(--gold);  color: var(--black); border: 1px solid var(--gold); }
    .btn-gold:hover  { background: var(--gold-light); border-color: var(--gold-light); transform: translateY(-1px); box-shadow: 0 4px 20px rgba(201,168,76,0.3); }
    .btn-ghost { border: 1px solid var(--border); color: var(--white); }
    .btn-ghost:hover { border-color: var(--gold); color: var(--gold); }
    .btn-teal  { background: var(--teal); color: var(--teal-text); border: 1px solid var(--teal-border); }
    .btn-teal:hover  { background: var(--teal-border); transform: translateY(-1px); }
    .btn-danger{ background: rgba(192,57,43,0.15); color: #e74c3c; border: 1px solid rgba(192,57,43,0.35); }
    .btn-danger:hover{ background: rgba(192,57,43,0.28); transform: translateY(-1px); }
    .btn-sm { padding: 7px 14px; font-size: 11px; letter-spacing: 0.06em; }

    /* ── Table ────────────────────────────── */
    .table-wrap {
      background: var(--surface); border: 1px solid var(--border);
      border-radius: var(--radius-lg); overflow: hidden; overflow-x: auto;
    }
    .data-table { width: 100%; border-collapse: collapse; }
    .data-table thead th {
      background: var(--surface2); padding: 14px 16px;
      font-size: 11px; font-weight: 500; letter-spacing: 0.12em;
      text-transform: uppercase; color: var(--muted);
      text-align: left; border-bottom: 1px solid var(--border); white-space: nowrap;
    }
    .data-table tbody td {
      padding: 14px 16px; font-size: 13px;
      border-bottom: 1px solid var(--border); color: #c8c2ba; vertical-align: middle;
    }
    .data-table tbody tr:last-child td { border-bottom: none; }
    .data-table tbody tr:hover td { background: rgba(255,255,255,0.02); }
    .actions { display: flex; gap: 6px; flex-wrap: wrap; align-items: center; }

    /* ── Badge ────────────────────────────── */
    .badge {
      display: inline-flex; align-items: center; gap: 5px;
      font-size: 11px; font-weight: 500; letter-spacing: 0.08em;
      text-transform: uppercase; padding: 4px 10px;
      border-radius: 20px; white-space: nowrap;
    }
    .badge::before { content: ""; display: block; width: 6px; height: 6px; border-radius: 50%; }
    .badge-photography { background: rgba(201,168,76,0.12); color: var(--gold); }
    .badge-photography::before { background: var(--gold); }
    .badge-videography  { background: rgba(90,200,250,0.12); color: #5ac8fa; }
    .badge-videography::before  { background: #5ac8fa; }
    .badge-editing      { background: rgba(52,199,89,0.12);  color: #34c759; }
    .badge-editing::before      { background: #34c759; }
    .badge-other        { background: rgba(200,200,200,0.1); color: var(--muted); }
    .badge-other::before        { background: var(--muted); }

    /* ── Toast ────────────────────────────── */
    .toast {
      position: fixed; top: 24px; right: 24px; z-index: 9999;
      padding: 14px 24px; border-radius: var(--radius);
      font-size: 13px; font-weight: 500; letter-spacing: 0.04em;
      box-shadow: var(--shadow); max-width: 360px;
      animation: slideIn 0.3s ease, fadeOut 0.4s ease 3.5s forwards;
    }
    .toast-success { background: #1a3a1a; border: 1px solid #34c759; color: #34c759; }
    .toast-error   { background: #3a1a1a; border: 1px solid #e74c3c; color: #e74c3c; }
    @keyframes slideIn { from { opacity:0; transform:translateX(40px); } to { opacity:1; transform:translateX(0); } }
    @keyframes fadeOut { from { opacity:1; } to { opacity:0; pointer-events:none; } }

    /* ── Confirm Modal ───────────────────── */
    .modal-overlay {
      display: none; position: fixed; inset: 0; z-index: 900;
      background: rgba(0,0,0,0.75); backdrop-filter: blur(4px);
      align-items: center; justify-content: center;
    }
    .modal-overlay.open { display: flex; }
    .modal-box {
      background: var(--surface); border: 1px solid var(--border);
      border-radius: var(--radius-lg); padding: 40px;
      min-width: 320px; max-width: 440px; width: 90%;
      box-shadow: var(--shadow); animation: popIn 0.2s ease;
    }
    @keyframes popIn { from { opacity:0; transform:scale(0.95); } to { opacity:1; transform:scale(1); } }
    .modal-box h3  { font-family: var(--font-display); font-size: 1.6rem; font-weight: 400; margin-bottom: 8px; color: var(--white); }
    .modal-box p   { font-size: 13px; margin-bottom: 28px; }
    .modal-actions { display: flex; gap: 12px; justify-content: flex-end; }

    /* ── Bottom CTA strip ────────────────── */
    .cta-strip {
      display: flex; gap: 16px; flex-wrap: wrap;
      padding: 32px 48px;
      border-top: 1px solid var(--border);
      background: var(--surface);
    }

    /* ── Sidebar ──────────────────────────── */
    .vertical-text {
      writing-mode: vertical-rl;
      text-orientation: mixed;
      transform: rotate(180deg);
    }

    /* ── Empty state ─────────────────────── */
    .empty-row td {
      text-align: center; padding: 48px 16px;
      color: var(--muted); font-style: italic;
    }

    @media (max-width: 768px) { .dashboard-main { padding: 24px 20px; } .cta-strip { padding: 24px 20px; } }
  </style>
</head>

<body>

  <%-- ── Toast notifications ───────────────────────────────────── --%>
  <c:choose>
    <c:when test="${param.success == 'serviceDeleted'}">
      <div class="toast toast-success">&#10003; Service deactivated successfully.</div>
    </c:when>
    <c:when test="${param.success == 'linkDeleted'}">
      <div class="toast toast-success">&#10003; Package-service link removed.</div>
    </c:when>
    <c:when test="${param.error == 'serviceNotFound'}">
      <div class="toast toast-error">&#10005; Service not found.</div>
    </c:when>
    <c:when test="${param.error == 'linkNotFound'}">
      <div class="toast toast-error">&#10005; Link not found.</div>
    </c:when>
    <c:when test="${param.error == 'invalidId'}">
      <div class="toast toast-error">&#10005; Invalid ID supplied.</div>
    </c:when>
  </c:choose>

  <%-- ── Background decorations ─────────────────────────────────── --%>
  <div class="fixed inset-0 opacity-20 z-0" style="background: radial-gradient(ellipse 80% 60% at 50% 0%, #c9a84c18 0%, transparent 70%);"></div>

  <%-- ══════════════════════════════════════════════════════════════
       MAIN GRID  (sidebar | content | right-rail)
  ══════════════════════════════════════════════════════════════ --%>
  <div class="relative z-10 grid md:grid-cols-[80px_1fr] min-h-screen">

    <%-- ── Left sidebar ─────────────────────────────────────── --%>
    <aside class="hidden md:flex flex-col justify-between items-center py-12 border-r sticky top-0 h-screen"
           style="border-color: var(--border)">
      <div style="font-size:1.4rem; font-weight:900;">M<span style="color:var(--gold)">.NP</span></div>
      <div class="vertical-text" style="font-size:10px; letter-spacing:.4em; text-transform:uppercase; color:var(--gold);">
        Mero Nepal Production — EST. 2020
      </div>
      <div style="width:8px;height:8px;border-radius:50%;background:var(--gold)"></div>
    </aside>

    <%-- ── Main content ─────────────────────────────────────── --%>
    <div class="flex flex-col">
      <main class="dashboard-main flex-1">

        <%-- Page header --%>
        <div class="page-header">
          <h2>Package &amp; Services</h2>
          <p>Manage all active services and the links between packages and services.</p>
        </div>

        <%-- ════════════════════════════════════════════════════
             SECTION 1 — ALL SERVICES
        ════════════════════════════════════════════════════ --%>
        <div class="section">
          <h3>All Services</h3>

          <div class="table-wrap">
            <table class="data-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Service Name</th>
                  <th>Type</th>
                  <th>Description</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <c:choose>
                  <c:when test="${empty services}">
                    <tr class="empty-row">
                      <td colspan="5">No active services found.</td>
                    </tr>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="svc" items="${services}">
                      <%-- Determine badge class from service type --%>
                      <c:set var="typeClass" value="badge-other" />
                      <c:if test="${svc.serviceType == 'Photography'}"><c:set var="typeClass" value="badge-photography"/></c:if>
                      <c:if test="${svc.serviceType == 'Videography'}"><c:set var="typeClass" value="badge-videography"/></c:if>
                      <c:if test="${svc.serviceType == 'Editing'}">    <c:set var="typeClass" value="badge-editing"/>    </c:if>
                      <tr>
                        <td style="color:var(--gold);font-family:var(--font-display);font-size:15px">#${svc.serviceId}</td>
                        <td style="font-weight:500;color:var(--white)">${svc.serviceName}</td>
                        <td>
                          <span class="badge ${typeClass}">
                            <c:choose>
                              <c:when test="${not empty svc.serviceType}">${svc.serviceType}</c:when>
                              <c:otherwise>—</c:otherwise>
                            </c:choose>
                          </span>
                        </td>
                        <td style="max-width:300px;color:var(--muted);font-size:12px">
                          <c:choose>
                            <c:when test="${not empty svc.description}">${svc.description}</c:when>
                            <c:otherwise>—</c:otherwise>
                          </c:choose>
                        </td>
                        <td>
                          <div class="actions">
                            <button class="btn btn-danger btn-sm"
                                    onclick="openDeleteModal('service', ${svc.serviceId}, '${svc.serviceName}')">
                              Delete
                            </button>
                          </div>
                        </td>
                      </tr>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
              </tbody>
            </table>
          </div>
        </div>
        <%-- /section 1 --%>

        <%-- ════════════════════════════════════════════════════
             SECTION 2 — PACKAGE–SERVICE LINKS
        ════════════════════════════════════════════════════ --%>
        <div class="section">
          <h3>Package — Service Links</h3>

          <div class="table-wrap">
            <table class="data-table">
              <thead>
                <tr>
                  <th>Link #</th>
                  <th>Package</th>
                  <th>Service</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <c:choose>
                  <c:when test="${empty packageServices}">
                    <tr class="empty-row">
                      <td colspan="4">No package-service links found.</td>
                    </tr>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="ps" items="${packageServices}">
                      <tr>
                        <td style="color:var(--gold);font-family:var(--font-display);font-size:15px">#${ps.packageServiceId}</td>
                        <td style="font-weight:500;color:var(--white)">${ps.packageName}</td>
                        <td>${ps.serviceName}</td>
                        <td>
                          <div class="actions">
                            <button class="btn btn-danger btn-sm"
                                    onclick="openDeleteModal('link', ${ps.packageServiceId}, '${ps.packageName} → ${ps.serviceName}')">
                              Remove Link
                            </button>
                          </div>
                        </td>
                      </tr>
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
              </tbody>
            </table>
          </div>
        </div>
        <%-- /section 2 --%>

      </main>

      <%-- ── Bottom CTA strip ───────────────────────────────── --%>
      <div class="cta-strip">
        <a href="${pageContext.request.contextPath}/admin/add-service" class="btn btn-gold">
          &#43;&nbsp; Add New Service
        </a>
        <a href="${pageContext.request.contextPath}/admin/create-package" class="btn btn-ghost">
          &#43;&nbsp; Create New Package
        </a>
      </div>

    </div><%-- /main content col --%>
  </div><%-- /grid --%>


  <%-- ══════════════════════════════════════════════════════════════
       CONFIRM DELETE MODAL
  ══════════════════════════════════════════════════════════════ --%>
  <div class="modal-overlay" id="deleteModal">
    <div class="modal-box">
      <h3 id="modal-title">Confirm Delete</h3>
      <p id="modal-body">Are you sure you want to delete this item? This action cannot be undone.</p>

      <form id="deleteForm" method="POST" action="${pageContext.request.contextPath}/admin/package-services">
        <input type="hidden" name="action"           id="formAction" />
        <input type="hidden" name="serviceId"        id="formServiceId" />
        <input type="hidden" name="packageServiceId" id="formPsId" />

        <div class="modal-actions">
          <button type="button" class="btn btn-ghost btn-sm" onclick="closeDeleteModal()">Cancel</button>
          <button type="submit" class="btn btn-danger btn-sm">Confirm Delete</button>
        </div>
      </form>
    </div>
  </div>


  <script>
    // ── Modal helpers ────────────────────────────────────────
    function openDeleteModal(type, id, label) {
      const modal     = document.getElementById('deleteModal');
      const title     = document.getElementById('modal-title');
      const body      = document.getElementById('modal-body');
      const action    = document.getElementById('formAction');
      const svcInput  = document.getElementById('formServiceId');
      const psInput   = document.getElementById('formPsId');

      // Reset hidden inputs
      svcInput.value = '';
      psInput.value  = '';

      if (type === 'service') {
        title.textContent  = 'Deactivate Service';
        body.textContent   = 'Deactivate "' + label + '"? It will no longer appear in packages or bookings.';
        action.value       = 'deleteService';
        svcInput.value     = id;
      } else {
        title.textContent  = 'Remove Package-Service Link';
        body.textContent   = 'Remove the link "' + label + '"? The service itself will not be deleted.';
        action.value       = 'deletePackageService';
        psInput.value      = id;
      }

      modal.classList.add('open');
    }

    function closeDeleteModal() {
      document.getElementById('deleteModal').classList.remove('open');
    }

    // Close on backdrop click
    document.getElementById('deleteModal').addEventListener('click', function(e) {
      if (e.target === this) closeDeleteModal();
    });

    // ── Auto-dismiss toast ───────────────────────────────────
    const toast = document.querySelector('.toast');
    if (toast) {
      setTimeout(() => toast.remove(), 4000);
    }
  </script>

</body>
</html>
