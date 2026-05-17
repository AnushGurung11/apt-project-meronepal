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

      /* ── Typography ──────────────────────────────────────────── */
      h2,
      h3,
      h4 {
        font-family: var(--font-display);
        font-weight: 400;
        line-height: 1.15;
        letter-spacing: 0.01em;
      }
      h2 {
        font-size: clamp(2rem, 4vw, 3.2rem);
      }
      h3 {
        font-size: clamp(1.4rem, 2.5vw, 2rem);
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

      /* ── Utilities ───────────────────────────────────────────── */
      .mt-8 {
        margin-top: 8px;
      }
      .mt-16 {
        margin-top: 16px;
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

      /* ── Breadcrumb ──────────────────────────────────────────── */
      .breadcrumb {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 12px;
        color: var(--muted);
        margin-bottom: 28px;
      }
      .breadcrumb a:hover {
        color: var(--gold);
      }
      .breadcrumb span {
        color: var(--muted);
      }

      /* ── Section Label ───────────────────────────────────────── */
      .section-label {
        display: inline-flex;
        align-items: center;
        gap: 10px;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 0.18em;
        text-transform: uppercase;
        color: var(--gold);
        margin-bottom: 20px;
      }
      .section-label::before {
        content: "";
        display: block;
        width: 28px;
        height: 1px;
        background: var(--gold);
      }

      /* ── Summary Rows ────────────────────────────────────────── */
      .summary-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 0;
        border-bottom: 1px solid var(--border);
        font-size: 14px;
      }
      .summary-row:last-child {
        border-bottom: none;
      }
      .summary-row .label {
        color: var(--muted);
      }
      .summary-row .value {
        color: var(--white);
        font-weight: 500;
      }

      /* ── Divider ─────────────────────────────────────────────── */
      .divider {
        width: 60px;
        height: 1px;
        background: var(--gold);
        margin: 24px 0;
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
      .btn-full {
        width: 100%;
        justify-content: center;
      }

      /* ── Form Elements ───────────────────────────────────────── */
      input,
      select,
      textarea {
        font-family: var(--font-body);
        font-size: 14px;
        background: var(--surface2);
        border: 1px solid var(--border);
        color: var(--white);
        border-radius: var(--radius);
        padding: 12px 16px;
        width: 100%;
        outline: none;
        transition: border-color var(--transition);
        resize: vertical;
      }
      input:focus,
      select:focus,
      textarea:focus {
        border-color: var(--gold);
      }
      input::placeholder,
      textarea::placeholder {
        color: var(--muted);
      }
      select option {
        background: var(--surface2);
      }

      .form-group {
        margin-bottom: 20px;
      }
      .form-label {
        display: block;
        font-size: 11px;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        color: var(--muted);
        margin-bottom: 8px;
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
      .badge-unpaid {
        background: rgba(192, 57, 43, 0.12);
        color: #e74c3c;
      }
      .badge-unpaid::before {
        background: #e74c3c;
      }
      .badge-cancelled {
        background: rgba(192, 57, 43, 0.12);
        color: #e74c3c;
      }
      .badge-cancelled::before {
        background: #e74c3c;
      }

      /* ── Alert ───────────────────────────────────────────────── */
      .alert {
        padding: 14px 20px;
        border-radius: var(--radius);
        font-size: 14px;
        border-left: 3px solid;
      }
      .alert-success {
        background: rgba(52, 199, 89, 0.1);
        border-color: #34c759;
        color: #34c759;
      }

      /* ── Modal ───────────────────────────────────────────────── */
      .modal-overlay {
        position: fixed;
        inset: 0;
        background: rgba(0, 0, 0, 0.75);
        backdrop-filter: blur(4px);
        z-index: 2000;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 24px;
        opacity: 0;
        pointer-events: none;
        transition: opacity var(--transition);
      }
      .modal-overlay.open {
        opacity: 1;
        pointer-events: all;
      }
      .modal {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        padding: 40px;
        width: 100%;
        max-width: 480px;
        transform: translateY(20px);
        transition: transform var(--transition);
      }
      .modal-overlay.open .modal {
        transform: translateY(0);
      }
      .modal-header {
        margin-bottom: 24px;
      }
      .modal-header h3 {
        margin-bottom: 8px;
      }
      .modal-footer {
        display: flex;
        gap: 12px;
        justify-content: flex-end;
        margin-top: 28px;
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
          <div class="breadcrumb">
            <a href="${pageContext.request.contextPath}/admin-booking"
              >Bookings</a
            >
            <span>›</span>
            <span>#APT-2025-006</span>
          </div>

          <div class="page-header flex-between">
            <div>
              <h2>Booking Detail</h2>
              <p>
                Reference:
                <span
                  style="color: var(--gold); font-family: var(--font-display)"
                  >#APT-2025-006</span
                >
              </p>
            </div>
            <span class="badge badge-pending" id="statusBadge">Pending</span>
          </div>

          <div
            style="
              display: grid;
              grid-template-columns: 1fr 340px;
              gap: 32px;
              align-items: flex-start;
            "
          >
            <div style="display: flex; flex-direction: column; gap: 24px">
              <!-- Customer -->
              <div
                style="
                  background: var(--surface);
                  border: 1px solid var(--border);
                  border-radius: var(--radius-lg);
                  padding: 32px;
                "
              >
                <div class="section-label">Customer</div>
                <div
                  style="
                    display: flex;
                    align-items: center;
                    gap: 16px;
                    margin-top: 8px;
                  "
                >
                  <div
                    style="
                      width: 48px;
                      height: 48px;
                      border-radius: 50%;
                      background: var(--surface2);
                      border: 1px solid var(--gold);
                      display: flex;
                      align-items: center;
                      justify-content: center;
                      font-family: var(--font-display);
                      font-size: 1.3rem;
                      color: var(--gold);
                    "
                  >
                    S
                  </div>
                  <div>
                    <h4 style="margin-bottom: 2px">Sudip Gautam</h4>
                    <div style="font-size: 13px; color: var(--muted)">
                      sudip.gautam@gmail.com &nbsp;·&nbsp; +977 9800000002
                    </div>
                  </div>
                </div>
              </div>

              <!-- Booking Info -->
              <div
                style="
                  background: var(--surface);
                  border: 1px solid var(--border);
                  border-radius: var(--radius-lg);
                  padding: 32px;
                "
              >
                <div class="section-label">Booking Info</div>
                <div class="summary-row">
                  <span class="label">Package</span
                  ><span class="value">Documentary Package</span>
                </div>
                <div class="summary-row">
                  <span class="label">Booking Date</span
                  ><span class="value">Jun 10, 2025</span>
                </div>
                <div class="summary-row">
                  <span class="label">Event Date</span
                  ><span class="value">Jul 4, 2025</span>
                </div>
                <div class="summary-row">
                  <span class="label">Location</span
                  ><span class="value">Patan, Nepal</span>
                </div>
                <div class="summary-row">
                  <span class="label">Notes</span
                  ><span class="value">Documentary storytelling project.</span>
                </div>
              </div>

              <!-- Payment -->
              <div
                style="
                  background: var(--surface);
                  border: 1px solid var(--border);
                  border-radius: var(--radius-lg);
                  padding: 32px;
                "
              >
                <div class="section-label">Payment</div>
                <div class="summary-row">
                  <span class="label">Amount</span
                  ><span
                    class="value"
                    style="
                      color: var(--gold);
                      font-family: var(--font-display);
                      font-size: 1.3rem;
                    "
                    >NPR 50,000</span
                  >
                </div>
                <div class="summary-row">
                  <span class="label">Method</span
                  ><span class="value" style="color: var(--muted)"
                    >Not set</span
                  >
                </div>
                <div class="summary-row">
                  <span class="label">Status</span
                  ><span class="value"
                    ><span class="badge badge-unpaid">Unpaid</span></span
                  >
                </div>
              </div>
            </div>

            <!-- Admin Actions -->
            <div
              style="
                background: var(--surface);
                border: 1px solid var(--border);
                border-radius: var(--radius-lg);
                padding: 28px;
              "
            >
              <div class="section-label">Admin Actions</div>

              <div class="form-group mt-16">
                <label class="form-label">Update Booking Status</label>
                <select id="statusSelect" onchange="previewStatus(this.value)">
                  <option value="Pending" selected>Pending</option>
                  <option value="Confirmed">Confirmed</option>
                  <option value="Completed">Completed</option>
                  <option value="Cancelled">Cancelled</option>
                </select>
              </div>
              <div class="form-group">
                <label class="form-label">Update Payment Status</label>
                <select id="paySelect">
                  <option value="Unpaid" selected>Unpaid</option>
                  <option value="Partial">Partial</option>
                  <option value="Paid">Paid</option>
                  <option value="Refunded">Refunded</option>
                </select>
              </div>
              <div class="form-group">
                <label class="form-label">Admin Note (internal)</label>
                <textarea
                  rows="3"
                  placeholder="Internal notes about this booking..."
                ></textarea>
              </div>
              <button class="btn btn-gold btn-full" onclick="saveChanges()">
                Save Changes
              </button>
              <div class="divider" style="margin: 20px 0"></div>
              <button
                class="btn btn-danger btn-full btn-sm"
                onclick="openModal('deleteModal')"
              >
                Delete Booking
              </button>
              <a
                href="${pageContext.request.contextPath}/admin-booking"
                class="btn btn-ghost btn-full btn-sm mt-8"
                >← Back to Bookings</a
              >

              <div
                class="alert alert-success mt-16"
                id="saveMsg"
                style="display: none"
              >
                Changes saved successfully.
              </div>
            </div>
          </div>
        </div>

        <!-- Delete Modal -->
        <div class="modal-overlay" id="deleteModal">
          <div class="modal">
            <div class="modal-header">
              <h3>Delete Booking?</h3>
              <p style="font-size: 14px; margin-top: 8px">
                This will permanently remove booking
                <strong>#APT-2025-006</strong> from the system. This cannot be
                undone.
              </p>
            </div>
            <div class="modal-footer">
              <button class="btn btn-ghost" onclick="closeModal('deleteModal')">
                Cancel
              </button>
              <button
                class="btn btn-danger"
                onclick="window.location.href = '../admin-bookings.jsp'"
              >
                Delete Permanently
              </button>
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
      const badgeClasses = {
        Pending: "badge-pending",
        Confirmed: "badge-confirmed",
        Completed: "badge-completed",
        Cancelled: "badge-cancelled",
      };
      function previewStatus(val) {
        const badge = document.getElementById("statusBadge");
        badge.className = "badge " + (badgeClasses[val] || "");
        badge.textContent = val;
      }
      function saveChanges() {
        previewStatus(document.getElementById("statusSelect").value);
        const msg = document.getElementById("saveMsg");
        msg.style.display = "block";
        setTimeout(() => (msg.style.display = "none"), 3000);
      }
    </script>
  </body>
</html>
