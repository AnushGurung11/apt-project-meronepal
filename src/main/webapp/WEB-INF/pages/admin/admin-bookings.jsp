<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bookings — Mero Nepal Production</title>

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
      button {
        cursor: pointer;
        border: none;
        background: none;
        font-family: var(--font-body);
      }

      /* ── Form elements (filter + search) ────────────────────── */
      input,
      select {
        font-family: var(--font-body);
        font-size: 14px;
        background: var(--surface2);
        border: 1px solid var(--border);
        color: var(--white);
        border-radius: var(--radius);
        padding: 12px 16px;
        outline: none;
        transition: border-color var(--transition);
      }
      input:focus,
      select:focus {
        border-color: var(--gold);
      }
      input::placeholder {
        color: var(--muted);
      }
      select option {
        background: var(--surface2);
      }

      /* ── Typography ──────────────────────────────────────────── */
      h2 {
        font-family: var(--font-display);
        font-weight: 400;
        line-height: 1.15;
        letter-spacing: 0.01em;
        font-size: clamp(2rem, 4vw, 3.2rem);
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

      /* ── Dashboard Main ──────────────────────────────────────── */
      .dashboard-main {
        padding: 48px;
      }
      .page-header {
        margin-bottom: 40px;
      }
      .page-header h2 {
        margin-bottom: 6px;
      }
      .page-header p {
        font-size: 14px;
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
        color: var(--black);
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
      .btn-danger {
        background: var(--red);
        color: #fff;
        border: 1px solid var(--red);
      }
      .btn-danger:hover {
        opacity: 0.85;
        transform: translateY(-1px);
      }
      .btn-sm {
        padding: 9px 20px;
        font-size: 12px;
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
      .data-table .actions {
        display: flex;
        gap: 8px;
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
      .badge-pending::before {
        background: var(--gold);
      }
      .badge-confirmed::before {
        background: #34c759;
      }
      .badge-completed::before {
        background: #5ac8fa;
      }
      .badge-paid::before {
        background: #34c759;
      }
      .badge-unpaid::before {
        background: #e74c3c;
      }
      .badge-partial::before {
        background: #ff9500;
      }

      .badge-pending {
        background: rgba(201, 168, 76, 0.12);
        color: var(--gold);
      }
      .badge-confirmed {
        background: rgba(52, 199, 89, 0.12);
        color: #34c759;
      }
      .badge-completed {
        background: rgba(90, 200, 250, 0.12);
        color: #5ac8fa;
      }
      .badge-paid {
        background: rgba(52, 199, 89, 0.12);
        color: #34c759;
      }
      .badge-unpaid {
        background: rgba(192, 57, 43, 0.12);
        color: #e74c3c;
      }
      .badge-partial {
        background: rgba(255, 149, 0, 0.12);
        color: #ff9500;
      }

      /* ── Responsive ──────────────────────────────────────────── */
      @media (max-width: 768px) {
        .dashboard-main {
          padding: 24px 20px;
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
        <div class="dashboard-main">
          <div class="page-header flex-between">
            <div>
              <h2>Manage Bookings</h2>
              <p>View, update status, and manage all customer bookings.</p>
            </div>
          </div>

          <!-- Filters -->
          <div
            style="
              display: flex;
              gap: 12px;
              margin-bottom: 24px;
              flex-wrap: wrap;
            "
          >
            <select
              onchange="filterTable(this.value)"
              style="width: auto; padding: 10px 16px; font-size: 13px"
            >
              <option value="all">All Statuses</option>
              <option value="Pending">Pending</option>
              <option value="Confirmed">Confirmed</option>
              <option value="Completed">Completed</option>
              <option value="Cancelled">Cancelled</option>
            </select>
            <input
              type="text"
              placeholder="Search customer or package..."
              style="max-width: 260px; padding: 10px 16px; font-size: 13px"
              oninput="searchTable(this.value)"
            />
          </div>

          <div class="table-wrap">
            <table class="data-table" id="bookingTable">
              <thead>
                <tr>
                  <th>Ref</th>
                  <th>Customer</th>
                  <th>Package</th>
                  <th>Event Date</th>
                  <th>Status</th>
                  <th>Payment</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody id="bookingBody">
                <tr data-status="Completed">
                  <td
                    style="color: var(--gold); font-family: var(--font-display)"
                  >
                    #001
                  </td>
                  <td>Krish Shrestha</td>
                  <td>Basic Package</td>
                  <td>Feb 15, 2025</td>
                  <td><span class="badge badge-completed">Completed</span></td>
                  <td>
                    <span class="badge badge-paid">Paid — NPR 10,000</span>
                  </td>
                  <td class="actions">
                    <a href="bookings/1.jsp" class="btn btn-ghost btn-sm"
                      >View</a
                    >
                  </td>
                </tr>
                <tr data-status="Completed">
                  <td
                    style="color: var(--gold); font-family: var(--font-display)"
                  >
                    #002
                  </td>
                  <td>Sudip Gautam</td>
                  <td>Premium Package</td>
                  <td>Mar 20, 2025</td>
                  <td><span class="badge badge-completed">Completed</span></td>
                  <td>
                    <span class="badge badge-paid">Paid — NPR 35,000</span>
                  </td>
                  <td class="actions">
                    <a href="bookings/1.jsp" class="btn btn-ghost btn-sm"
                      >View</a
                    >
                  </td>
                </tr>
                <tr data-status="Completed">
                  <td
                    style="color: var(--gold); font-family: var(--font-display)"
                  >
                    #003
                  </td>
                  <td>Bijaya Khanal</td>
                  <td>Standard Package</td>
                  <td>Apr 10, 2025</td>
                  <td><span class="badge badge-completed">Completed</span></td>
                  <td>
                    <span class="badge badge-paid">Paid — NPR 20,000</span>
                  </td>
                  <td class="actions">
                    <a href="bookings/1.jsp" class="btn btn-ghost btn-sm"
                      >View</a
                    >
                  </td>
                </tr>
                <tr data-status="Confirmed">
                  <td
                    style="color: var(--gold); font-family: var(--font-display)"
                  >
                    #004
                  </td>
                  <td>Arjun Bastola</td>
                  <td>Luxury Package</td>
                  <td>Jun 1, 2025</td>
                  <td><span class="badge badge-confirmed">Confirmed</span></td>
                  <td>
                    <span class="badge badge-partial"
                      >Partial — NPR 30,000</span
                    >
                  </td>
                  <td class="actions">
                    <a href="bookings/1.jsp" class="btn btn-ghost btn-sm"
                      >View</a
                    >
                    <button
                      class="btn btn-danger btn-sm"
                      onclick="deleteRow(this)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
                <tr data-status="Confirmed">
                  <td
                    style="color: var(--gold); font-family: var(--font-display)"
                  >
                    #005
                  </td>
                  <td>Krish Shrestha</td>
                  <td>Business Package</td>
                  <td>May 20, 2025</td>
                  <td><span class="badge badge-confirmed">Confirmed</span></td>
                  <td>
                    <span class="badge badge-paid">Paid — NPR 15,000</span>
                  </td>
                  <td class="actions">
                    <a href="bookings/1.jsp" class="btn btn-ghost btn-sm"
                      >View</a
                    >
                    <button
                      class="btn btn-danger btn-sm"
                      onclick="deleteRow(this)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
                <tr data-status="Pending">
                  <td
                    style="color: var(--gold); font-family: var(--font-display)"
                  >
                    #006
                  </td>
                  <td>Sudip Gautam</td>
                  <td>Documentary Package</td>
                  <td>Jul 4, 2025</td>
                  <td><span class="badge badge-pending">Pending</span></td>
                  <td><span class="badge badge-unpaid">Unpaid</span></td>
                  <td class="actions">
                    <a href="bookings/1.jsp" class="btn btn-ghost btn-sm"
                      >View</a
                    >
                    <button
                      class="btn btn-gold btn-sm"
                      onclick="confirmBooking(this)"
                    >
                      Confirm
                    </button>
                    <button
                      class="btn btn-danger btn-sm"
                      onclick="deleteRow(this)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
                <tr data-status="Pending">
                  <td
                    style="color: var(--gold); font-family: var(--font-display)"
                  >
                    #007
                  </td>
                  <td>Bijaya Khanal</td>
                  <td>Music Video Package</td>
                  <td>Aug 12, 2025</td>
                  <td><span class="badge badge-pending">Pending</span></td>
                  <td><span class="badge badge-unpaid">Unpaid</span></td>
                  <td class="actions">
                    <a href="bookings/1.jsp" class="btn btn-ghost btn-sm"
                      >View</a
                    >
                    <button
                      class="btn btn-gold btn-sm"
                      onclick="confirmBooking(this)"
                    >
                      Confirm
                    </button>
                    <button
                      class="btn btn-danger btn-sm"
                      onclick="deleteRow(this)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
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

    <!-- ── PAGE SCRIPT ── -->
    <script>
      function filterTable(status) {
        const rows = document.querySelectorAll("#bookingBody tr");
        rows.forEach((row) => {
          row.style.display =
            status === "all" || row.dataset.status === status ? "" : "none";
        });
      }
      function searchTable(val) {
        const rows = document.querySelectorAll("#bookingBody tr");
        rows.forEach((row) => {
          row.style.display = row.textContent
            .toLowerCase()
            .includes(val.toLowerCase())
            ? ""
            : "none";
        });
      }
      function deleteRow(btn) {
        if (confirm("Delete this booking?")) btn.closest("tr").remove();
      }
      function confirmBooking(btn) {
        const row = btn.closest("tr");
        row.querySelector(".badge-pending").className = "badge badge-confirmed";
        row.querySelector(".badge-confirmed").textContent = "Confirmed";
        row.dataset.status = "Confirmed";
        btn.remove();
      }
    </script>
  </body>
</html>
