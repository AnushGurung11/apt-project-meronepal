<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard — Mero Nepal Production</title>

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

      /* ── Variables ───────────────────────────────────────────── */
      :root {
        --black: #0a0a0a;
        --dark: #111111;
        --surface: #181818;
        --surface2: #222222;
        --border: #2a2a2a;
        --gold: #c9a84c;
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

      /* ── Reset ───────────────────────────────────────────────── */
      *,
      *::before,
      *::after {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }
      html {
        scroll-behavior: smooth;
      }
      body {
        background: var(--black);
        color: var(--white);
        font-family: var(--font-body);
        font-size: 15px;
        line-height: 1.7;
        -webkit-font-smoothing: antialiased;
        overflow-x: hidden;
      }
      a {
        color: inherit;
        text-decoration: none;
        transition: color var(--transition);
      }

      /* ── Typography ──────────────────────────────────────────── */
      h2,
      h4 {
        font-family: var(--font-display);
        font-weight: 400;
        line-height: 1.15;
        letter-spacing: 0.01em;
      }
      h2 {
        font-size: clamp(2rem, 4vw, 3.2rem);
      }
      h4 {
        font-size: 1.25rem;
      }
      p {
        color: #b0aa9f;
        font-weight: 300;
      }

      /* ── Layout ──────────────────────────────────────────────── */
      .flex-between {
        display: flex;
        align-items: center;
        justify-content: space-between;
      }
      .grid-4 {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 24px;
      }

      /* ── Buttons ─────────────────────────────────────────────── */
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
      }
      .btn-ghost {
        border: 1px solid var(--border);
        color: var(--white);
      }
      .btn-ghost:hover {
        border-color: var(--gold);
        color: var(--gold);
      }
      .btn-sm {
        padding: 9px 20px;
        font-size: 12px;
      }
      .btn-full {
        width: 100%;
        justify-content: center;
      }

      /* ── Dashboard Layout ────────────────────────────────────── */
      .dashboard-layout {
        display: grid;
        grid-template-columns: 260px 1fr;
        min-height: 100vh;
        padding-top: 70px;
      }

      /* ── Sidebar ─────────────────────────────────────────────── */
      .sidebar {
        background: var(--dark);
        border-right: 1px solid var(--border);
        padding: 40px 0;
        position: sticky;
        top: 70px;
        height: calc(100vh - 70px);
        overflow-y: auto;
      }
      .sidebar-user {
        padding: 0 24px 32px;
        border-bottom: 1px solid var(--border);
        margin-bottom: 24px;
      }
      .sidebar-avatar {
        width: 52px;
        height: 52px;
        border-radius: 50%;
        background: var(--surface2);
        border: 2px solid var(--gold);
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: var(--font-display);
        font-size: 1.4rem;
        color: var(--gold);
        margin-bottom: 12px;
      }
      .sidebar-name {
        font-size: 15px;
        font-weight: 500;
        margin-bottom: 2px;
      }
      .sidebar-role {
        font-size: 11px;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        color: var(--gold);
      }
      .sidebar-nav {
        padding: 0 12px;
      }
      .sidebar-nav a {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 11px 14px;
        border-radius: var(--radius);
        font-size: 13px;
        color: var(--muted);
        margin-bottom: 4px;
        transition: all var(--transition);
      }
      .sidebar-nav a:hover,
      .sidebar-nav a.active {
        background: var(--gold-dim);
        color: var(--gold);
      }
      .sidebar-nav a .icon {
        font-size: 16px;
        width: 20px;
        text-align: center;
      }
      .sidebar-section-label {
        font-size: 10px;
        letter-spacing: 0.18em;
        text-transform: uppercase;
        color: var(--muted);
        padding: 20px 26px 8px;
      }

      /* ── Dashboard Main ──────────────────────────────────────── */
      .dashboard-main {
        padding: 48px;
      }

      .page-header {
        margin-bottom: 40px;
      }
      .page-header h2,
      .page-header h4 {
        margin-bottom: 6px;
      }
      .page-header p {
        font-size: 14px;
      }

      /* ── Stat Cards ──────────────────────────────────────────── */
      .stat-card {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        padding: 28px;
      }
      .stat-label {
        font-size: 11px;
        letter-spacing: 0.14em;
        text-transform: uppercase;
        color: var(--muted);
        margin-bottom: 12px;
      }
      .stat-value {
        font-family: var(--font-display);
        font-size: 2.2rem;
        color: var(--white);
        margin-bottom: 4px;
      }
      .stat-value .currency {
        font-size: 1.2rem;
        color: var(--gold);
        margin-right: 4px;
      }
      .stat-change {
        font-size: 12px;
        color: #34c759;
      }

      /* ── Table ───────────────────────────────────────────────── */
      .table-wrap {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        overflow: hidden;
      }
      .data-table {
        width: 100%;
        border-collapse: collapse;
      }
      .data-table thead th {
        background: var(--surface2);
        padding: 14px 20px;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        color: var(--muted);
        text-align: left;
        border-bottom: 1px solid var(--border);
        white-space: nowrap;
      }
      .data-table tbody td {
        padding: 16px 20px;
        font-size: 14px;
        border-bottom: 1px solid var(--border);
        color: #c8c2ba;
        vertical-align: middle;
      }
      .data-table tbody tr:last-child td {
        border-bottom: none;
      }
      .data-table tbody tr:hover td {
        background: rgba(255, 255, 255, 0.02);
      }

      /* ── Badges ──────────────────────────────────────────────── */
      .badge {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        padding: 4px 12px;
        border-radius: 20px;
      }
      .badge::before {
        content: "";
        display: block;
        width: 6px;
        height: 6px;
        border-radius: 50%;
      }
      .badge-pending {
        background: rgba(201, 168, 76, 0.12);
        color: var(--gold);
      }
      .badge-pending::before {
        background: var(--gold);
      }
      .badge-confirmed {
        background: rgba(52, 199, 89, 0.12);
        color: #34c759;
      }
      .badge-confirmed::before {
        background: #34c759;
      }
      .badge-completed {
        background: rgba(90, 200, 250, 0.12);
        color: #5ac8fa;
      }
      .badge-completed::before {
        background: #5ac8fa;
      }
      .badge-paid {
        background: rgba(52, 199, 89, 0.12);
        color: #34c759;
      }
      .badge-paid::before {
        background: #34c759;
      }
      .badge-unpaid {
        background: rgba(192, 57, 43, 0.12);
        color: #e74c3c;
      }
      .badge-unpaid::before {
        background: #e74c3c;
      }
      .badge-partial {
        background: rgba(255, 149, 0, 0.12);
        color: #ff9500;
      }
      .badge-partial::before {
        background: #ff9500;
      }
      .badge-cancelled {
        background: rgba(192, 57, 43, 0.12);
        color: #e74c3c;
      }
      .badge-cancelled::before {
        background: #e74c3c;
      }

      /* ── Empty State ─────────────────────────────────────────── */
      .empty-state {
        text-align: center;
        padding: 48px 24px;
        color: var(--muted);
        font-size: 13px;
        letter-spacing: 0.06em;
      }

      /* ── Responsive ──────────────────────────────────────────── */
      @media (max-width: 1024px) {
        .dashboard-layout {
          grid-template-columns: 220px 1fr;
        }
        .grid-4 {
          grid-template-columns: repeat(2, 1fr);
        }
      }
      @media (max-width: 768px) {
        .dashboard-layout {
          grid-template-columns: 1fr;
        }
        .sidebar {
          display: none;
        }
        .dashboard-main {
          padding: 24px 20px;
        }
        .grid-4 {
          grid-template-columns: 1fr;
        }
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
    <div
      class="fixed inset-0 opacity-5 pointer-events-none grain-overlay"
    ></div>

    <%@ include file="/WEB-INF/pages/components/mobile-top-bar.jsp" %> <%@
    include file="/WEB-INF/pages/components/mobile-nav-drawer-admin.jsp" %>

    <!-- ── MAIN 3-COLUMN LAYOUT ── -->
    <div
      class="relative z-10 grid md:grid-cols-[80px_1fr_280px] min-h-screen border-b border-white/10"
    >
      <%@ include file="/WEB-INF/pages/components/left-rail-auth.jsp" %>

      <!-- CENTER — MAIN CONTENT -->
      <main class="pt-14 md:pt-0">
        <!-- Dashboard (no sidebar, content fills center) -->
        <div class="dashboard-main">
          <div class="page-header">
            <h2>Dashboard</h2>
            <p>Welcome back, Admin. Here's the latest overview.</p>
          </div>

          <!-- Stats -->
          <div class="grid-4" style="margin-bottom: 40px">
            <div class="stat-card">
              <div class="stat-label">Total Users</div>
              <div class="stat-value">${userCount}</div>
              <div class="stat-change">Registered accounts</div>
            </div>

            <div class="stat-card">
              <div class="stat-label">Total Bookings</div>
              <div class="stat-value">${totalBookings}</div>
              <div class="stat-change">All time</div>
            </div>
          </div>

          <!-- Bookings by Package -->
          <div class="page-header flex-between" style="margin-bottom: 20px">
            <h4>Bookings by Package</h4>
            <a
              href="${pageContext.request.contextPath}/admin-booking"
              class="btn btn-ghost btn-sm"
              >View All →</a
            >
          </div>

          <div class="table-wrap" style="margin-bottom: 40px">
            <table class="data-table">
              <thead>
                <tr>
                  <th>Package ID</th>
                  <th>Package Name</th>
                  <th>Total Bookings</th>
                </tr>
              </thead>
              <tbody>
                <c:choose>
                  <c:when test="${not empty bookingsByPackage}">
                    <c:forEach var="row" items="${bookingsByPackage}">
                      <tr>
                        <td style="color: var(--gold); font-family: var(--font-display)">
                          #${row.packageId}
                        </td>
                        <td>${row.packageName}</td>
                        <td>${row.bookingCount}</td>
                      </tr>
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <tr>
                      <td colspan="3" class="empty-state">
                        No package booking data available.
                      </td>
                    </tr>
                  </c:otherwise>
                </c:choose>
              </tbody>
            </table>
          </div>

          <!-- Recent Bookings -->
          <div class="page-header flex-between" style="margin-bottom: 20px">
            <h4>Recent Bookings</h4>
            <a
              href="${pageContext.request.contextPath}/admin-booking"
              class="btn btn-ghost btn-sm"
              >View All →</a
            >
          </div>
          <div class="table-wrap">
            <table class="data-table">
              <thead>
                <tr>
                  <th>Ref</th>
                  <th>Customer</th>
                  <th>Package</th>
                  <th>Event Date</th>
                  <th>Status</th>
                  <th>Payment</th>
                </tr>
              </thead>
              <tbody>
                <c:choose>
                  <c:when test="${not empty recentBookings}">
                    <c:forEach var="booking" items="${recentBookings}">
                      <tr>
                        <td style="color: var(--gold); font-family: var(--font-display)">
                          #${booking.bookingId}
                        </td>
                        <td>${booking.userName}</td>
                        <td>${booking.packageName}</td>
                        <td>${booking.eventDate}</td>
                        <td>
                          <c:choose>
                            <c:when test="${booking.status == 'Completed'}">
                              <span class="badge badge-completed">Completed</span>
                            </c:when>
                            <c:when test="${booking.status == 'Confirmed'}">
                              <span class="badge badge-confirmed">Confirmed</span>
                            </c:when>
                            <c:when test="${booking.status == 'Pending'}">
                              <span class="badge badge-pending">Pending</span>
                            </c:when>
                            <c:when test="${booking.status == 'Cancelled'}">
                              <span class="badge badge-cancelled">Cancelled</span>
                            </c:when>
                            <c:otherwise>
                              <span class="badge badge-pending">${booking.status}</span>
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td>
                          <c:choose>
                            <c:when test="${booking.paymentStatus == 'Paid'}">
                              <span class="badge badge-paid">Paid</span>
                            </c:when>
                            <c:when test="${booking.paymentStatus == 'Partial'}">
                              <span class="badge badge-partial">Partial</span>
                            </c:when>
                            <c:when test="${booking.paymentStatus == 'Unpaid'}">
                              <span class="badge badge-unpaid">Unpaid</span>
                            </c:when>
                            <c:when test="${booking.paymentStatus == 'Refunded'}">
                              <span class="badge badge-cancelled">Refunded</span>
                            </c:when>
                            <c:otherwise>
                              <span class="badge badge-unpaid">${booking.paymentStatus}</span>
                            </c:otherwise>
                          </c:choose>
                        </td>
                      </tr>
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <tr>
                      <td colspan="6" class="empty-state">
                        No bookings found.
                      </td>
                    </tr>
                  </c:otherwise>
                </c:choose>
              </tbody>
            </table>
          </div>
        </div>

        <%@ include file="/WEB-INF/pages/components/footer-admin.jsp" %>
      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-admin.jsp" %>
    </div>
    <!-- end 3-col grid -->

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>
  </body>
</html>
