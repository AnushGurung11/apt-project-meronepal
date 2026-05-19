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
      .btn-teal { background: #1a6b6b; color: #7ee8e8; border: 1px solid #1e8080; }
      .btn-teal:hover { background: #1e8080; transform: translateY(-1px); }

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
      .badge-cancelled { background: rgba(192,57,43,0.12); color: #e74c3c; }
      .badge-cancelled::before { background: #e74c3c; }
      .badge-refunded  { background: rgba(90,200,250,0.12); color: #5ac8fa; }
      .badge-refunded::before  { background: #5ac8fa; }

      /* ── Toast ───────────────────────────────────────────────── */
      .toast {
        position: fixed; top: 24px; right: 24px; z-index: 9999;
        padding: 14px 24px; border-radius: var(--radius);
        font-size: 13px; font-weight: 500; letter-spacing: 0.04em;
        box-shadow: var(--shadow); max-width: 360px;
        animation: slideIn 0.3s ease, fadeOut 0.4s ease 3.5s forwards;
      }
      .toast-success { background: #1a3a1a; border: 1px solid #34c759; color: #34c759; }
      .toast-error   { background: #3a1a1a; border: 1px solid #e74c3c; color: #e74c3c; }
      @keyframes slideIn { from { opacity: 0; transform: translateX(40px); } to { opacity: 1; transform: translateX(0); } }
      @keyframes fadeOut { from { opacity: 1; } to { opacity: 0; pointer-events: none; } }

      /* ── Modal ───────────────────────────────────────────────── */
      .modal-overlay {
        display: none; position: fixed; inset: 0; z-index: 900;
        background: rgba(0,0,0,0.75); backdrop-filter: blur(4px);
        align-items: center; justify-content: center;
      }
      .modal-overlay.open { display: flex; }
      .modal-box {
        background: var(--surface); border: 1px solid var(--border);
        border-radius: var(--radius-lg); padding: 40px;
        min-width: 320px; max-width: 460px; width: 90%;
        box-shadow: var(--shadow); animation: popIn 0.2s ease;
      }
      @keyframes popIn { from { opacity: 0; transform: scale(0.95); } to { opacity: 1; transform: scale(1); } }
      .modal-box h3 { font-family: var(--font-display); font-size: 1.6rem; font-weight: 400; margin-bottom: 8px; color: var(--white); }
      .modal-box p { font-size: 13px; margin-bottom: 28px; }
      .modal-select-row { display: flex; flex-direction: column; gap: 8px; margin-bottom: 28px; }
      .modal-select-row label { font-size: 11px; letter-spacing: 0.1em; text-transform: uppercase; color: var(--muted); }
      .modal-select-row select { width: 100%; padding: 12px 16px; font-size: 14px; }
      .modal-actions { display: flex; gap: 12px; justify-content: flex-end; }

      /* ── Responsive ──────────────────────────────────────────── */
      @media (max-width: 768px) {
        .dashboard-main {
          padding: 24px 20px;
        }
      }
    </style>
  </head>

  <body>
    <c:if test="${param.success == '1'}">
      <div class="toast toast-success" id="toast">&#10003; Status updated successfully.</div>
    </c:if>
    <c:if test="${param.error == '1'}">
      <div class="toast toast-error" id="toast">&#10005; Update failed. Please try again.</div>
    </c:if>

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
                  <th>Services</th>
                  <th>Event Date</th>
                  <th>Booking Status</th>
                  <th>Payment Status</th>
                  <th>Amount</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody id="bookingBody">
                <c:choose>
                  <c:when test="${empty allBookings}">
                    <tr>
                      <td colspan="9" style="text-align:center;padding:40px;color:var(--muted)">No bookings found.</td>
                    </tr>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="b" items="${allBookings}">

                      <c:set var="bClass" value="badge-pending" />
                      <c:if test="${b.status == 'Confirmed'}"><c:set var="bClass" value="badge-confirmed"/></c:if>
                      <c:if test="${b.status == 'Completed'}"><c:set var="bClass" value="badge-completed"/></c:if>
                      <c:if test="${b.status == 'Cancelled'}"><c:set var="bClass" value="badge-cancelled"/></c:if>

                      <c:set var="pStat" value="${not empty b.paymentStatus ? b.paymentStatus : 'Unpaid'}"/>
                      <c:set var="pClass" value="badge-unpaid"/>
                      <c:if test="${pStat == 'Partial'}"> <c:set var="pClass" value="badge-partial"/>  </c:if>
                      <c:if test="${pStat == 'Paid'}">    <c:set var="pClass" value="badge-paid"/>     </c:if>
                      <c:if test="${pStat == 'Refunded'}"><c:set var="pClass" value="badge-refunded"/> </c:if>

                      <tr data-status="${b.status}">
                        <td style="color:var(--gold);font-family:var(--font-display);font-size:15px">#${b.bookingId}</td>

                        <td>
                          <div style="font-weight:500;color:var(--white)">${b.userName}</div>
                          <div style="font-size:11px;color:var(--muted)">${b.email}</div>
                          <div style="font-size:11px;color:var(--muted)">${b.phoneNumber}</div>
                        </td>

                        <td>${b.packageName}</td>

                        <td style="font-size:12px;color:var(--muted);max-width:160px">
                          <c:choose>
                            <c:when test="${not empty b.services}">${b.services}</c:when>
                            <c:otherwise>—</c:otherwise>
                          </c:choose>
                        </td>

                        <td style="white-space:nowrap">
                          <c:choose>
                            <c:when test="${not empty b.eventDate}">${b.eventDate}</c:when>
                            <c:otherwise>—</c:otherwise>
                          </c:choose>
                        </td>

                        <td><span class="badge ${bClass}">${b.status}</span></td>
                        <td><span class="badge ${pClass}">${pStat}</span></td>

                        <td style="white-space:nowrap">
                          <c:choose>
                            <c:when test="${not empty b.amount}">NPR ${b.amount}</c:when>
                            <c:otherwise>—</c:otherwise>
                          </c:choose>
                        </td>

                        <td>
                          <div class="actions">
                            <button class="btn btn-ghost btn-sm"
                                    onclick="openBookingModal(${b.bookingId}, '${b.status}')">
                              Booking Status
                            </button>
                            <button class="btn btn-teal btn-sm"
                                    onclick="openPaymentModal(${b.bookingId}, '${pStat}')">
                              Payment Status
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

          <!-- Modal: Booking Status -->
          <div class="modal-overlay" id="bookingModal">
            <div class="modal-box">
              <h3>Update Booking Status</h3>
              <p>Select a new status for booking <strong id="bModalRef" style="color:var(--gold)"></strong>.</p>
              <form method="post" action="${pageContext.request.contextPath}/admin-booking">
                <input type="hidden" name="action"    value="updateBookingStatus" />
                <input type="hidden" name="bookingId" id="bModalBookingId" />
                <div class="modal-select-row">
                  <label for="bModalStatus">New Status</label>
                  <select name="bookingStatus" id="bModalStatus">
                    <option value="Pending">Pending</option>
                    <option value="Confirmed">Confirmed</option>
                    <option value="Completed">Completed</option>
                    <option value="Cancelled">Cancelled</option>
                  </select>
                </div>
                <div class="modal-actions">
                  <button type="button" class="btn btn-ghost btn-sm" onclick="closeModal('bookingModal')">Cancel</button>
                  <button type="submit" class="btn btn-gold btn-sm">Save</button>
                </div>
              </form>
            </div>
          </div>

          <!-- Modal: Payment Status -->
          <div class="modal-overlay" id="paymentModal">
            <div class="modal-box">
              <h3>Update Payment Status</h3>
              <p>Select a new payment status for booking <strong id="pModalRef" style="color:var(--gold)"></strong>.</p>
              <form method="post" action="${pageContext.request.contextPath}/admin-booking">
                <input type="hidden" name="action"    value="updatePaymentStatus" />
                <input type="hidden" name="bookingId" id="pModalBookingId" />
                <div class="modal-select-row">
                  <label for="pModalStatus">New Payment Status</label>
                  <select name="paymentStatus" id="pModalStatus">
                    <option value="Unpaid">Unpaid</option>
                    <option value="Partial">Partial</option>
                    <option value="Paid">Paid</option>
                    <option value="Refunded">Refunded</option>
                  </select>
                </div>
                <div class="modal-actions">
                  <button type="button" class="btn btn-ghost btn-sm" onclick="closeModal('paymentModal')">Cancel</button>
                  <button type="submit" class="btn btn-teal btn-sm">Save</button>
                </div>
              </form>
            </div>
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
        document.querySelectorAll("#bookingBody tr").forEach(row => {
          row.style.display = (status === "all" || row.dataset.status === status) ? "" : "none";
        });
      }
      function searchTable(val) {
        document.querySelectorAll("#bookingBody tr").forEach(row => {
          row.style.display = row.textContent.toLowerCase().includes(val.toLowerCase()) ? "" : "none";
        });
      }

      function openBookingModal(bookingId, currentStatus) {
        document.getElementById("bModalBookingId").value = bookingId;
        document.getElementById("bModalRef").textContent = "#" + bookingId;
        const sel = document.getElementById("bModalStatus");
        for (let opt of sel.options) opt.selected = (opt.value === currentStatus);
        document.getElementById("bookingModal").classList.add("open");
      }
      function openPaymentModal(bookingId, currentPayStatus) {
        document.getElementById("pModalBookingId").value = bookingId;
        document.getElementById("pModalRef").textContent = "#" + bookingId;
        const sel = document.getElementById("pModalStatus");
        for (let opt of sel.options) opt.selected = (opt.value === currentPayStatus);
        document.getElementById("paymentModal").classList.add("open");
      }
      function closeModal(id) { document.getElementById(id).classList.remove("open"); }
      document.querySelectorAll(".modal-overlay").forEach(o => {
        o.addEventListener("click", e => { if (e.target === o) o.classList.remove("open"); });
      });

      const toast = document.getElementById("toast");
      if (toast) setTimeout(() => toast.remove(), 4000);
    </script>
  </body>
</html>
