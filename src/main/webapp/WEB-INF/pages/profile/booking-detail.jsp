<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Booking Detail — Mero Nepal Production</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css" />

    <style>
      .hr {
        --color-bg: #0a0a0a;
        --color-surface: #131313;
        --color-surface-2: #201f1f;
        --color-border: rgba(255, 255, 255, 0.08);
        --color-text: #e6e6e6;
        --color-text-soft: rgba(229, 226, 225, 0.45);
        --color-gold: #c6a059;
        --color-gold-alt: #e6c364;
        --color-success: #4caf7d;
        --color-warning: #e6b64a;
        --color-danger: #e06060;
        --color-info: #6ab0e6;
        --font-sans: "Inter", sans-serif;
        --font-serif: "Playfair Display", serif;
        --space-xs: 0.5rem;
        --space-sm: 1rem;
        --space-md: 2rem;
        --space-lg: 4rem;
        --space-xl: 8rem;
        --radius: 8px;
        --radius-sm: 4px;
        --transition: 0.25s ease;
        --section-max: 960px;
        font-family: var(--font-sans);
        font-size: 16px;
        line-height: 1.7;
        -webkit-font-smoothing: antialiased;
        box-sizing: border-box;
        padding: 0;
        border: none;
        border-top: 1px solid var(--color-border);
        margin: var(--space-md) 0;
      }

      /* ── BOOKING DETAIL INTERNAL STYLES ── */
      :root {
        --color-bg: #0a0a0a;
        --color-surface: #131313;
        --color-surface-2: #201f1f;
        --color-border: rgba(255, 255, 255, 0.08);
        --color-text: #e6e6e6;
        --color-text-soft: rgba(229, 226, 225, 0.45);
        --color-gold: #c6a059;
        --color-gold-alt: #e6c364;
        --color-gold-dim: rgba(198, 160, 89, 0.15);
        --color-danger: #e06060;
        --color-danger-dim: rgba(224, 96, 96, 0.1);
        --color-success: #4caf7d;
        --color-success-dim: rgba(76, 175, 125, 0.12);
        --font-sans: "Inter", sans-serif;
        --font-serif: "Playfair Display", serif;
        --radius: 8px;
        --transition: 0.25s ease;
      }

      body {
        background: var(--color-bg);
        color: var(--color-text);
        font-family: var(--font-sans);
      }

      /* ── PAGE CONTENT ── */
      .detail-wrap {
        padding: 48px 32px 80px;
        max-width: 960px;
      }

      /* ── BREADCRUMB ── */
      .breadcrumb {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 12px;
        color: var(--color-text-soft);
        margin-bottom: 28px;
      }
      .breadcrumb a {
        color: var(--color-text-soft);
        text-decoration: none;
        transition: color var(--transition);
      }
      .breadcrumb a:hover {
        color: var(--color-gold);
      }

      /* ── PAGE HEADER ── */
      .page-header {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        margin-bottom: 36px;
        flex-wrap: wrap;
        gap: 12px;
      }
      .page-header h2 {
        font-family: var(--font-serif);
        font-size: clamp(1.5rem, 3vw, 2rem);
        font-weight: 400;
        margin-bottom: 4px;
      }
      .page-header p {
        font-size: 13px;
        color: var(--color-text-soft);
      }
      .ref-id {
        font-family: var(--font-serif);
        color: var(--color-gold);
      }

      /* ── BADGE ── */
      .badge {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        padding: 5px 14px;
        border-radius: 20px;
      }
      .badge::before {
        content: "";
        display: block;
        width: 6px;
        height: 6px;
        border-radius: 50%;
      }
      .badge-confirmed {
        background: rgba(76, 175, 125, 0.12);
        color: #4caf7d;
      }
      .badge-confirmed::before {
        background: #4caf7d;
      }
      .badge-paid {
        background: rgba(76, 175, 125, 0.12);
        color: #4caf7d;
      }
      .badge-paid::before {
        background: #4caf7d;
      }
      .badge-pending {
        background: rgba(198, 160, 89, 0.12);
        color: var(--color-gold);
      }
      .badge-pending::before {
        background: var(--color-gold);
      }

      /* ── DETAIL LAYOUT ── */
      .detail-layout {
        display: grid;
        grid-template-columns: 1fr 320px;
        gap: 28px;
        align-items: flex-start;
      }
      @media (max-width: 700px) {
        .detail-layout {
          grid-template-columns: 1fr;
        }
        .detail-wrap {
          padding: 32px 20px 60px;
        }
      }

      /* ── CARDS ── */
      .detail-card {
        background: var(--color-surface);
        border: 1px solid var(--color-border);
        border-radius: var(--radius);
        padding: 28px;
        transition: border-color var(--transition);
      }

      /* ── SECTION LABEL ── */
      .section-label {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        font-size: 10px;
        font-weight: 500;
        letter-spacing: 0.18em;
        text-transform: uppercase;
        color: var(--color-gold);
        margin-bottom: 16px;
      }
      .section-label::before {
        content: "";
        display: block;
        width: 20px;
        height: 1px;
        background: var(--color-gold);
      }

      /* ── PACKAGE INFO ── */
      .pkg-title {
        font-family: var(--font-serif);
        font-size: 1.35rem;
        font-weight: 400;
        margin-bottom: 8px;
      }
      .pkg-desc {
        font-size: 13px;
        color: var(--color-text-soft);
        line-height: 1.6;
      }
      .divider {
        height: 1px;
        background: var(--color-border);
        margin: 20px 0;
      }
      .tag-row {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
      }
      .pkg-tag {
        background: var(--color-gold-dim);
        color: var(--color-gold);
        padding: 5px 14px;
        border-radius: 20px;
        font-size: 12px;
      }

      /* ── SUMMARY ROWS ── */
      .summary-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 11px 0;
        border-bottom: 1px solid var(--color-border);
        font-size: 13px;
        gap: 16px;
      }
      .summary-row:last-child {
        border-bottom: none;
      }
      .summary-row .lbl {
        color: var(--color-text-soft);
        flex-shrink: 0;
      }
      .summary-row .val {
        color: var(--color-text);
        font-weight: 500;
        text-align: right;
      }

      /* ── PAYMENT AMOUNT ── */
      .pay-amount {
        font-family: var(--font-serif);
        font-size: 1.3rem;
        color: var(--color-gold);
      }

      /* ── ACTIONS BOX ── */
      .actions-box {
        background: var(--color-surface);
        border: 1px solid var(--color-border);
        border-radius: var(--radius);
        padding: 24px;
      }
      .actions-label {
        font-size: 10px;
        letter-spacing: 0.14em;
        text-transform: uppercase;
        color: var(--color-text-soft);
        margin-bottom: 16px;
      }
      .actions-stack {
        display: flex;
        flex-direction: column;
        gap: 10px;
      }

      /* ── BUTTONS ── */
      .btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        padding: 10px 20px;
        font-family: var(--font-sans);
        font-size: 12px;
        font-weight: 500;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        border-radius: var(--radius);
        cursor: pointer;
        text-decoration: none;
        transition: all var(--transition);
        width: 100%;
        border: none;
      }
      .btn-ghost {
        background: none;
        border: 1px solid var(--color-border);
        color: var(--color-text-soft);
      }
      .btn-ghost:hover {
        border-color: var(--color-gold);
        color: var(--color-gold);
      }
      .btn-danger {
        background: var(--color-danger);
        color: #fff;
      }
      .btn-danger:hover {
        opacity: 0.85;
      }

      /* ── MODAL ── */
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
        background: var(--color-surface);
        border: 1px solid var(--color-border);
        border-radius: var(--radius);
        padding: 36px;
        width: 100%;
        max-width: 460px;
        transform: translateY(20px);
        transition: transform var(--transition);
      }
      .modal-overlay.open .modal {
        transform: translateY(0);
      }
      .modal h3 {
        font-family: var(--font-serif);
        font-size: 1.4rem;
        font-weight: 400;
        margin-bottom: 8px;
      }
      .modal p {
        font-size: 13px;
        color: var(--color-text-soft);
        margin-bottom: 20px;
        line-height: 1.6;
      }
      .modal p strong {
        color: var(--color-text);
      }
      .modal-warning {
        background: var(--color-danger-dim);
        border: 1px solid rgba(224, 96, 96, 0.25);
        border-radius: var(--radius);
        padding: 13px 16px;
        font-size: 13px;
        color: var(--color-danger);
        margin-bottom: 24px;
      }
      .modal-footer {
        display: flex;
        gap: 12px;
        justify-content: flex-end;
      }
      .modal-footer .btn {
        width: auto;
        padding: 10px 22px;
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

    <%@ include file="/WEB-INF/pages/components/mobile-top-bar.jsp" %>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-drawer-profile.jsp" %>

    <!-- ── MAIN 3-COLUMN LAYOUT ── -->
    <div
      class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10"
    >
      <%@ include file="/WEB-INF/pages/components/left-rail-auth.jsp" %>

      <!-- ════════════════════════════════════════
           CENTER — BOOKING DETAIL CONTENT
           ════════════════════════════════════════ -->
      <main class="pt-14 md:pt-0">
        <div class="detail-wrap">
          <!-- Breadcrumb -->
          <div class="breadcrumb">
            <a href="my-bookings.jsp">My Bookings</a>
            <span>›</span>
            <span>#APT-2025-005</span>
          </div>

          <!-- Page Header -->
          <div class="page-header">
            <div>
              <h2>Booking Detail</h2>
              <p>Reference: <span class="ref-id">#APT-2025-005</span></p>
            </div>
            <span class="badge badge-confirmed">Confirmed</span>
          </div>

          <!-- Detail Layout -->
          <div class="detail-layout">
            <!-- LEFT: Package + Event Info -->
            <div style="display: flex; flex-direction: column; gap: 20px">
              <!-- Package Info -->
              <div class="detail-card">
                <div class="section-label">Package</div>
                <div class="pkg-title">Business / Product Package</div>
                <p class="pkg-desc">
                  Product shoot session, 20–30 edited images, studio setup. Best
                  for brands.
                </p>
                <div class="divider"></div>
                <div class="tag-row">
                  <span class="pkg-tag">📦 Product Photography</span>
                  <span class="pkg-tag">✂️ Professional Editing</span>
                </div>
              </div>

              <!-- Event Details -->
              <div class="detail-card">
                <div class="section-label">Event Details</div>
                <div class="summary-row">
                  <span class="lbl">Booking Date</span>
                  <span class="val">May 1, 2025</span>
                </div>
                <div class="summary-row">
                  <span class="lbl">Event Date</span>
                  <span class="val">May 20, 2025</span>
                </div>
                <div class="summary-row">
                  <span class="lbl">Location</span>
                  <span class="val">Kathmandu, Nepal</span>
                </div>
                <div class="summary-row">
                  <span class="lbl">Notes</span>
                  <span class="val">Brand product shoot for business.</span>
                </div>
              </div>
            </div>

            <!-- RIGHT: Payment + Actions -->
            <div style="display: flex; flex-direction: column; gap: 16px">
              <!-- Payment -->
              <div class="detail-card">
                <div class="section-label">Payment</div>
                <div class="summary-row">
                  <span class="lbl">Amount</span>
                  <span class="val pay-amount">NPR 15,000</span>
                </div>
                <div class="summary-row">
                  <span class="lbl">Method</span>
                  <span class="val">Card</span>
                </div>
                <div class="summary-row">
                  <span class="lbl">Status</span>
                  <span class="val"
                    ><span class="badge badge-paid">Paid</span></span
                  >
                </div>
                <div class="summary-row">
                  <span class="lbl">Date</span>
                  <span class="val">May 1, 2025</span>
                </div>
              </div>

              <!-- Actions -->
              <div class="actions-box">
                <div class="actions-label">Actions</div>
                <div class="actions-stack">
                  <a href="my-bookings.jsp" class="btn btn-ghost"
                    >← Back to Bookings</a
                  >
                  <button
                    class="btn btn-danger"
                    onclick="openModal('cancelModal')"
                  >
                    Cancel This Booking
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <%@ include file="/WEB-INF/pages/components/footer.jsp" %>
      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-profile.jsp" %>
    </div>
    <!-- end 3-col grid -->

    <!-- ── CANCEL MODAL ── -->
    <div class="modal-overlay" id="cancelModal">
      <div class="modal">
        <h3>Cancel Booking?</h3>
        <p>
          You are about to cancel
          <strong>Business / Product Package (#APT-2025-005)</strong>. This
          cannot be undone.
        </p>
        <div class="modal-warning">
          ⚠ Please review our cancellation policy. Refunds are processed within
          5–7 business days.
        </div>
        <div class="modal-footer">
          <button class="btn btn-ghost" onclick="closeModal('cancelModal')">
            Keep Booking
          </button>
          <button
            class="btn btn-danger"
            onclick="window.location.href = 'my-bookings.jsp'"
          >
            Confirm Cancellation
          </button>
        </div>
      </div>
    </div>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>

    <!-- ── MODAL SCRIPT ── -->
    <script>
      function openModal(id) {
        document.getElementById(id).classList.add("open");
      }
      function closeModal(id) {
        document.getElementById(id).classList.remove("open");
      }
      document.querySelectorAll(".modal-overlay").forEach((overlay) => {
        overlay.addEventListener("click", (e) => {
          if (e.target === overlay) overlay.classList.remove("open");
        });
      });
    </script>
  </body>
</html>
