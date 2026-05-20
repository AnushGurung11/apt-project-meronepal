<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Bookings — Mero Nepal Production</title>

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
      href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Outfit:wght@300;400;500;600&display=swap"
      rel="stylesheet"
    />
    <link
      rel="icon"
      type="image/x-icon"
      href="${pageContext.request.contextPath}/assets/img/favicon.ico"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css" />

    <style>
      /* ── Variables ── */
      :root {
        --surface: #181818;
        --surface2: #222222;
        --border: #2a2a2a;
        --gold: #c9a84c;
        --gold-light: #e2c07a;
        --gold-dim: #c9a84c33;
        --white: #f5f0e8;
        --muted: #888880;
        --red: #c0392b;
        --red-dim: rgba(192,57,43,0.12);
        --radius: 6px;
        --radius-lg: 12px;
        --transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        --font-display: "Cormorant Garamond", Georgia, serif;
        --font-body: "Outfit", sans-serif;
      }

      /* ── Typography ── */
      .bk-h2 {
        font-family: var(--font-display);
        font-weight: 400;
        font-size: clamp(2rem, 4vw, 3.2rem);
        line-height: 1.15;
        letter-spacing: 0.01em;
      }
      .bk-h3 {
        font-family: var(--font-display);
        font-weight: 400;
        font-size: clamp(1.4rem, 2.5vw, 2rem);
        line-height: 1.15;
      }
      .bk-h4 {
        font-family: var(--font-display);
        font-weight: 400;
        font-size: 1.25rem;
        line-height: 1.15;
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
        text-decoration: none;
        border: none;
        font-family: var(--font-body);
      }
      .btn-gold {
        background: var(--gold);
        color: #0a0a0a;
      }
      .btn-gold:hover {
        background: var(--gold-light);
        transform: translateY(-1px);
        box-shadow: 0 4px 20px rgba(201, 168, 76, 0.3);
      }
      .btn-ghost {
        border: 1px solid var(--border);
        color: var(--white);
        background: none;
      }
      .btn-ghost:hover {
        border-color: var(--gold);
        color: var(--gold);
      }
      .btn-danger {
        background: var(--red);
        color: #fff;
      }
      .btn-danger:hover {
        opacity: 0.85;
      }
      .btn-sm {
        padding: 9px 20px;
        font-size: 12px;
      }

      /* ── Section label ── */
      .section-label {
        display: inline-flex;
        align-items: center;
        gap: 10px;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 0.18em;
        text-transform: uppercase;
        color: var(--gold);
        margin-bottom: 12px;
      }
      .section-label::before {
        content: "";
        display: block;
        width: 28px;
        height: 1px;
        background: var(--gold);
      }

      /* ── Alerts ── */
      .alert {
        padding: 14px 20px;
        border-radius: var(--radius);
        font-size: 13px;
        border-left: 3px solid;
        margin-bottom: 28px;
      }
      .alert-info    { background: rgba(201,168,76,0.08); border-color: var(--gold);  color: var(--gold); }
      .alert-success { background: rgba(52,199,89,0.08);  border-color: #34c759;      color: #34c759; }
      .alert-error   { background: var(--red-dim);         border-color: var(--red);   color: #e57373; }

      /* ── Empty state ── */
      .bk-empty {
        text-align: center;
        padding: 80px 40px;
        border: 1px dashed var(--border);
        border-radius: var(--radius-lg);
      }
      .bk-empty-icon {
        font-size: 48px;
        margin-bottom: 16px;
        opacity: 0.3;
      }
      .bk-empty h3 {
        font-family: var(--font-display);
        font-weight: 400;
        font-size: 1.6rem;
        margin-bottom: 8px;
      }
      .bk-empty p { color: var(--muted); font-size: 14px; margin-bottom: 28px; }

      /* ── Services strip ── */
      .bk-services {
        font-size: 12px;
        color: var(--muted);
        margin-bottom: 20px;
        padding: 10px 14px;
        background: var(--surface2);
        border-radius: var(--radius);
        border-left: 2px solid var(--gold-dim);
      }
      .bk-services span { color: var(--gold); font-weight: 500; }

      /* ── Modal warning ── */
      .modal-warning {
        background: rgba(192,57,43,0.1);
        border: 1px solid rgba(192,57,43,0.3);
        border-radius: var(--radius);
        padding: 14px 18px;
        font-size: 13px;
        color: #e74c3c;
      }

      /* ── Bookings wrapper ── */
      .bk-wrapper {
        padding: 48px 40px;
      }

      /* ── Page header ── */
      .bk-page-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 16px;
        margin-bottom: 40px;
      }
      .bk-page-header p {
        color: #b0aa9f;
        font-size: 14px;
        font-weight: 300;
        margin-top: 4px;
      }

      /* ── Booking card ── */
      .bk-card {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        padding: 28px;
      }
      .bk-card-head {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 12px;
        margin-bottom: 16px;
      }
      .bk-card-id {
        font-size: 12px;
        color: var(--muted);
        margin-bottom: 4px;
      }
      .bk-card-title {
        font-family: var(--font-display);
        font-weight: 400;
        font-size: 1.1rem;
      }
      .bk-meta {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 16px;
        margin-bottom: 20px;
      }
      .bk-meta-label {
        font-size: 10px;
        text-transform: uppercase;
        letter-spacing: 0.12em;
        color: var(--muted);
        margin-bottom: 4px;
      }
      .bk-meta-value {
        font-size: 14px;
        color: var(--white);
      }
      .bk-actions {
        display: flex;
        gap: 12px;
        flex-wrap: wrap;
        align-items: center;
      }

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

      /* ── Badges ── */
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
        white-space: nowrap;
      }
      .badge::before {
        content: "";
        display: block;
        width: 6px;
        height: 6px;
        border-radius: 50%;
      }
      .badge-completed {
        background: rgba(90, 200, 250, 0.12);
        color: #5ac8fa;
      }
      .badge-completed::before {
        background: #5ac8fa;
      }
      .badge-confirmed {
        background: rgba(52, 199, 89, 0.12);
        color: #34c759;
      }
      .badge-confirmed::before {
        background: #34c759;
      }
      .badge-cancelled {
        background: rgba(192, 57, 43, 0.12);
        color: #e74c3c;
      }
      .badge-cancelled::before {
        background: #e74c3c;
      }
      .badge-paid {
        background: rgba(52, 199, 89, 0.12);
        color: #34c759;
      }
      .badge-paid::before {
        background: #34c759;
      }
      .badge-pending   { background: rgba(201,168,76,0.12);  color: var(--gold); }
      .badge-pending::before   { background: var(--gold); }
      .badge-unpaid    { background: rgba(201,168,76,0.12);  color: var(--gold); }
      .badge-unpaid::before    { background: var(--gold); }
      .badge-partial   { background: rgba(90,200,250,0.12);  color: #5ac8fa; }
      .badge-partial::before   { background: #5ac8fa; }
      .badge-refunded  { background: rgba(192,57,43,0.12);   color: #e74c3c; }
      .badge-refunded::before  { background: #e74c3c; }

      /* ── Modal ── */
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
        margin-bottom: 20px;
      }
      .modal-header h3 {
        font-family: var(--font-display);
        font-weight: 400;
        font-size: 1.6rem;
        color: var(--white);
        margin-bottom: 8px;
      }
      .modal-header p {
        font-size: 14px;
        color: #b0aa9f;
      }
      .modal-footer {
        display: flex;
        gap: 12px;
        justify-content: flex-end;
        margin-top: 28px;
      }

      /* ── Utilities ── */
      .gap-stack {
        display: flex;
        flex-direction: column;
        gap: 16px;
      }

      /* ── Responsive ── */
      @media (max-width: 768px) {
        .bk-wrapper {
          padding: 24px 20px;
        }
        .bk-meta {
          grid-template-columns: 1fr 1fr;
        }
      }
      @media (max-width: 480px) {
        .bk-meta {
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

    <%@ include file="/WEB-INF/pages/components/mobile-top-bar.jsp" %>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-drawer-profile.jsp" %>

    <!-- ── MAIN 3-COLUMN LAYOUT ── -->
    <div
      class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10"
    >
      <%@ include file="/WEB-INF/pages/components/left-rail-auth.jsp" %>

      <!-- CENTER — BOOKINGS CONTENT -->
      <main class="pt-14 md:pt-0">
        <!-- ─── MY BOOKINGS ─── -->
        <div class="bk-wrapper">
          <div class="bk-page-header">
            <div>
              <div class="section-label">Account</div>
              <h2 class="bk-h2">My Bookings</h2>
              <p>Track all your bookings and their current status.</p>
            </div>
            <a href="${pageContext.request.contextPath}/packages" class="btn btn-gold btn-sm">+ New Booking</a>
          </div>

          <c:if test="${not empty sessionScope.statusMsg}">
            <div class="alert alert-success">
              <c:out value="${sessionScope.statusMsg}" />
            </div>
            <c:remove var="statusMsg" scope="session" />
          </c:if>
          <c:if test="${not empty error}">
            <div class="alert alert-error">
              <c:out value="${error}" />
            </div>
          </c:if>
          <c:if test="${not empty infoMessage}">
            <div class="alert alert-info">
              <c:out value="${infoMessage}" />
            </div>
          </c:if>

          <c:choose>
            <c:when test="${empty userBookings}">
              <div class="bk-empty">
                <div class="bk-empty-icon">📋</div>
                <h3>No Bookings Yet</h3>
                <p>You haven't made any bookings. Start by choosing a package.</p>
                <a href="${pageContext.request.contextPath}/packages" class="btn btn-gold">
                  Browse Packages
                </a>
              </div>
            </c:when>

            <c:otherwise>
              <div class="gap-stack">
                <c:forEach var="booking" items="${userBookings}">

                  <div class="bk-card" id="booking-${booking.bookingId}">

                    <div class="bk-card-head">
                      <div>
                        <div class="bk-card-id">Booking #APT-${booking.bookingId}</div>
                        <div class="bk-card-title">
                          <c:out value="${booking.packageName}" />
                        </div>
                      </div>

                      <c:choose>
                        <c:when test="${booking.status == 'Pending'}">
                          <span class="badge badge-pending">Pending</span>
                        </c:when>
                        <c:when test="${booking.status == 'Confirmed'}">
                          <span class="badge badge-confirmed">Confirmed</span>
                        </c:when>
                        <c:when test="${booking.status == 'Completed'}">
                          <span class="badge badge-completed">Completed</span>
                        </c:when>
                        <c:when test="${booking.status == 'Cancelled'}">
                          <span class="badge badge-cancelled">Cancelled</span>
                        </c:when>
                        <c:otherwise>
                          <span class="badge badge-pending"><c:out value="${booking.status}" /></span>
                        </c:otherwise>
                      </c:choose>
                    </div>

                    <div class="bk-meta">
                      <div>
                        <div class="bk-meta-label">Event Date</div>
                        <div class="bk-meta-value">
                          <c:out value="${booking.eventDate}" default="—" />
                        </div>
                      </div>
                      <div>
                        <div class="bk-meta-label">Location</div>
                        <div class="bk-meta-value">
                          <c:out value="${booking.eventAddress}" default="—" />
                        </div>
                      </div>
                      <div>
                        <div class="bk-meta-label">Amount</div>
                        <div class="bk-meta-value" style="color:var(--gold)">
                          <c:choose>
                            <c:when test="${not empty booking.amount}">
                              NPR <c:out value="${booking.amount}" />
                            </c:when>
                            <c:otherwise>—</c:otherwise>
                          </c:choose>
                        </div>
                      </div>
                    </div>

                    <c:if test="${not empty booking.services}">
                      <div class="bk-services">
                        <span>Services:</span>
                        <c:out value="${booking.services}" />
                      </div>
                    </c:if>

                    <div class="bk-actions">
                      <c:choose>
                        <c:when test="${booking.paymentStatus == 'Paid'}">
                          <span class="badge badge-paid">Paid</span>
                        </c:when>
                        <c:when test="${booking.paymentStatus == 'Partial'}">
                          <span class="badge badge-partial">Partial</span>
                        </c:when>
                        <c:when test="${booking.paymentStatus == 'Refunded'}">
                          <span class="badge badge-refunded">Refunded</span>
                        </c:when>
                        <c:otherwise>
                          <span class="badge badge-unpaid">Unpaid</span>
                        </c:otherwise>
                      </c:choose>

                      <c:if test="${booking.status == 'Pending' || booking.status == 'Confirmed'}">
                        <button class="btn btn-danger btn-sm"
                                onclick="openCancelModal(${booking.bookingId}, '${fn:escapeXml(booking.packageName)}')">
                          Cancel Booking
                        </button>
                      </c:if>

                    </div>

                  </div>

                </c:forEach>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
        <!-- /bk-wrapper -->
        <!-- ─── END MY BOOKINGS ─── -->

        <%@ include file="/WEB-INF/pages/components/footer.jsp" %>
      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-profile.jsp" %>
    </div>
    <!-- /3-col grid -->

    <!-- ── CANCEL MODAL ── -->
    <div class="modal-overlay" id="cancelModal">
      <div class="modal">
        <div class="modal-header">
          <h3>Cancel Booking?</h3>
          <p>Are you sure you want to cancel <strong id="modal-pkg-name"></strong>? This action cannot be undone.</p>
        </div>
        <div class="modal-warning">
          ⚠ Cancellation may be subject to our refund policy. Please contact us within 48 hours of your event date for a full refund.
        </div>
        <div class="modal-footer">
          <button class="btn btn-ghost btn-sm" onclick="closeModal('cancelModal')">Keep Booking</button>
          <form id="cancel-form"
                action="${pageContext.request.contextPath}/my-booking"
                method="post">
              <input type="hidden" name="bookingId" id="modal-booking-id" value="" />
              <input type="hidden" name="action"    value="cancel" />
              <button type="submit" class="btn btn-danger btn-sm">Yes, Cancel</button>
          </form>
        </div>
      </div>
    </div>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>

    <!-- ── MODAL SCRIPT ── -->
    <script>
      function openModal(id)  { document.getElementById(id).classList.add("open"); }
      function closeModal(id) { document.getElementById(id).classList.remove("open"); }

      // Populate modal with the correct booking before opening
      function openCancelModal(bookingId, packageName) {
        document.getElementById("modal-booking-id").value = bookingId;
        document.getElementById("modal-pkg-name").textContent = packageName + " (#APT-" + bookingId + ")";
        openModal("cancelModal");
      }

      // Close modal on overlay click
      document
        .getElementById("cancelModal")
        .addEventListener("click", function (e) {
          if (e.target === this) closeModal("cancelModal");
        });
    </script>
  </body>
</html>
