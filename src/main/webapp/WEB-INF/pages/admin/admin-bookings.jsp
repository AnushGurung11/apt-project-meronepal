<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" isErrorPage="false" %>
>>>>>>> 9d49e9f (Admin Booking View)
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bookings — Mero Nepal Production</title>

    <script src="https://cdn.tailwindcss.com"></script>
<<<<<<< HEAD
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
=======
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;900&family=Playfair+Display:ital,wght@0,400;1,400&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="../../../assets/img/favicon.ico" />
    <link rel="stylesheet" href="../../../assets/css/styles.css" />
>>>>>>> 9d49e9f (Admin Booking View)
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Outfit:wght@300;400;500;600&display=swap");

      :root {
        --black: #0a0a0a; --dark: #111111; --surface: #181818; --surface2: #222222;
        --border: #2a2a2a; --gold: #c9a84c; --gold-light: #e2c07a; --gold-dim: #c9a84c33;
        --white: #f5f0e8; --muted: #888880; --red: #c0392b;
        --font-display: "Cormorant Garamond", Georgia, serif;
        --font-body: "Outfit", sans-serif;
        --radius: 6px; --radius-lg: 12px;
        --transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
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

      input, select {
        font-family: var(--font-body); font-size: 14px;
        background: var(--surface2); border: 1px solid var(--border);
        color: var(--white); border-radius: var(--radius);
        padding: 12px 16px; outline: none; transition: border-color var(--transition);
      }
      input:focus, select:focus { border-color: var(--gold); }
      input::placeholder { color: var(--muted); }
      select option { background: var(--surface2); }

      h2 {
        font-family: var(--font-display); font-weight: 400;
        line-height: 1.15; letter-spacing: 0.01em;
        font-size: clamp(2rem, 4vw, 3.2rem);
      }
      p { color: #b0aa9f; font-weight: 300; }
      .flex-between { display: flex; align-items: center; justify-content: space-between; }

      .dashboard-main { padding: 48px; }
      .page-header { margin-bottom: 40px; }
      .page-header h2 { margin-bottom: 6px; }
      .page-header p { font-size: 14px; }

      .btn {
        display: inline-flex; align-items: center; gap: 8px;
        padding: 14px 32px; border-radius: var(--radius);
        font-size: 13px; font-weight: 500; letter-spacing: 0.08em;
        text-transform: uppercase; transition: all var(--transition);
        white-space: nowrap; cursor: pointer;
      }
<<<<<<< HEAD
      .btn-teal { background: #1a6b6b; color: #7ee8e8; border: 1px solid #1e8080; }
      .btn-teal:hover { background: #1e8080; transform: translateY(-1px); }
=======
      .btn-gold { background: var(--gold); color: var(--black); border: 1px solid var(--gold); }
      .btn-gold:hover { background: var(--gold-light); border-color: var(--gold-light); transform: translateY(-1px); box-shadow: 0 4px 20px rgba(201,168,76,0.3); }
      .btn-ghost { border: 1px solid var(--border); color: var(--white); }
      .btn-ghost:hover { border-color: var(--gold); color: var(--gold); }
      .btn-teal { background: #1a6b6b; color: #7ee8e8; border: 1px solid #1e8080; }
      .btn-teal:hover { background: #1e8080; transform: translateY(-1px); }
      .btn-sm { padding: 7px 14px; font-size: 11px; letter-spacing: 0.06em; }
>>>>>>> 9d49e9f (Admin Booking View)

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

      .badge {
        display: inline-flex; align-items: center; gap: 5px;
        font-size: 11px; font-weight: 500; letter-spacing: 0.08em;
        text-transform: uppercase; padding: 4px 10px;
        border-radius: 20px; white-space: nowrap;
      }
      .badge::before { content: ""; display: block; width: 6px; height: 6px; border-radius: 50%; }
      .badge-pending   { background: rgba(201,168,76,0.12); color: var(--gold); }
      .badge-confirmed { background: rgba(52,199,89,0.12);  color: #34c759; }
      .badge-completed { background: rgba(90,200,250,0.12); color: #5ac8fa; }
      .badge-cancelled { background: rgba(192,57,43,0.12);  color: #e74c3c; }
      .badge-paid      { background: rgba(52,199,89,0.12);  color: #34c759; }
      .badge-unpaid    { background: rgba(192,57,43,0.12);  color: #e74c3c; }
      .badge-partial   { background: rgba(255,149,0,0.12);  color: #ff9500; }
      .badge-refunded  { background: rgba(90,200,250,0.12); color: #5ac8fa; }
      .badge-pending::before   { background: var(--gold); }
      .badge-confirmed::before { background: #34c759; }
      .badge-completed::before { background: #5ac8fa; }
      .badge-cancelled::before { background: #e74c3c; }
      .badge-paid::before      { background: #34c759; }
      .badge-unpaid::before    { background: #e74c3c; }
      .badge-partial::before   { background: #ff9500; }
      .badge-refunded::before  { background: #5ac8fa; }

      .toast {
        position: fixed; top: 24px; right: 24px; z-index: 9999;
        padding: 14px 24px; border-radius: var(--radius);
        font-size: 13px; font-weight: 500; letter-spacing: 0.04em;
        box-shadow: var(--shadow); max-width: 360px;
        animation: slideIn 0.3s ease, fadeOut 0.4s ease 3.5s forwards;
      }
<<<<<<< HEAD
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
=======
>>>>>>> 9d49e9f (Admin Booking View)
      .toast-success { background: #1a3a1a; border: 1px solid #34c759; color: #34c759; }
      .toast-error   { background: #3a1a1a; border: 1px solid #e74c3c; color: #e74c3c; }
      @keyframes slideIn { from { opacity: 0; transform: translateX(40px); } to { opacity: 1; transform: translateX(0); } }
      @keyframes fadeOut { from { opacity: 1; } to { opacity: 0; pointer-events: none; } }
<<<<<<< HEAD

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
=======
>>>>>>> 9d49e9f (Admin Booking View)

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

      @media (max-width: 768px) { .dashboard-main { padding: 24px 20px; } }
    </style>
  </head>

  <body>
    <c:if test="${param.success == '1'}">
      <div class="toast toast-success" id="toast">&#10003; Status updated successfully.</div>
    </c:if>
    <c:if test="${param.error == '1'}">
      <div class="toast toast-error" id="toast">&#10005; Update failed. Please try again.</div>
    </c:if>

<<<<<<< HEAD
    <!-- ── BACKGROUND GRID ── -->
=======
>>>>>>> 9d49e9f (Admin Booking View)
    <div class="fixed inset-0 opacity-20 z-0 background-grid">
      <script>for(let i=0;i<96;i++) document.write('<div class="grid-cell"></div>');</script>
    </div>
    <div class="fixed inset-0 opacity-5 pointer-events-none grain-overlay"></div>

<<<<<<< HEAD
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
=======
    <div class="md:hidden fixed top-0 left-0 right-0 z-50 flex items-center justify-between px-6 h-14 bg-[#0a0a0a]" style="border-bottom:1px solid var(--border)">
      <div class="text-xl font-black">M<span style="color:var(--gold)">.NP</span></div>
      <button id="nav-toggle" class="flex flex-col gap-[5px] p-1" aria-label="Toggle menu">
        <span id="bar1" class="block w-6 h-px bg-white" style="transition:transform .25s,opacity .25s"></span>
        <span id="bar2" class="block w-6 h-px bg-white" style="transition:opacity .25s"></span>
        <span id="bar3" class="block w-4 h-px bg-white" style="transition:transform .25s"></span>
      </button>
    </div>

    <nav id="mobile-nav" class="md:hidden fixed inset-0 z-40 bg-[#0a0a0a] flex flex-col justify-center items-center gap-10"
         style="transform:translateX(100%);transition:transform .3s ease">
      <a href="admin-dashboard.jsp" class="text-3xl font-black uppercase tracking-widest">Dashboard</a>
      <a href="admin-bookings.jsp"  class="text-3xl font-black uppercase tracking-widest active">Bookings</a>
      <a href="admin-services.jsp"  class="text-3xl font-black uppercase tracking-widest">Services</a>
      <a href="../auth/login.jsp"   class="uppercase btn-secondary mt-4">Login</a>
      <a href="../../index.jsp"     class="uppercase btn-primary mt-4">Visit Site</a>
    </nav>

    <div class="relative z-10 grid md:grid-cols-[80px_1fr_280px] min-h-screen border-b border-white/10">

      <aside class="hidden md:flex flex-col justify-between items-center py-12 border-r border-white/10 sticky top-0 h-screen">
        <div class="text-2xl font-black">M<span style="color:var(--gold)">.NP</span></div>
        <div class="vertical-text text-[10px] tracking-[0.4em] uppercase" style="color:var(--gold)">Mero Nepal Production — EST. 2020</div>
        <div class="w-2 h-2 rounded-full" style="background:var(--gold)"></div>
      </aside>
>>>>>>> 9d49e9f (Admin Booking View)

      <main class="pt-14 md:pt-0">
        <div class="dashboard-main">
          <div class="page-header flex-between">
            <div>
              <h2>Manage Bookings</h2>
              <p>View, update status, and manage all customer bookings.</p>
            </div>
          </div>

          <div style="display:flex;gap:12px;margin-bottom:24px;flex-wrap:wrap">
            <select onchange="filterTable(this.value)" style="width:auto;padding:10px 16px;font-size:13px">
              <option value="all">All Statuses</option>
              <option value="Pending">Pending</option>
              <option value="Confirmed">Confirmed</option>
              <option value="Completed">Completed</option>
              <option value="Cancelled">Cancelled</option>
            </select>
            <input type="text" placeholder="Search customer or package..."
                   style="max-width:260px;padding:10px 16px;font-size:13px"
                   oninput="searchTable(this.value)" />
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

<<<<<<< HEAD
=======
                      <%-- Booking status → CSS class --%>
>>>>>>> 9d49e9f (Admin Booking View)
                      <c:set var="bClass" value="badge-pending" />
                      <c:if test="${b.status == 'Confirmed'}"><c:set var="bClass" value="badge-confirmed"/></c:if>
                      <c:if test="${b.status == 'Completed'}"><c:set var="bClass" value="badge-completed"/></c:if>
                      <c:if test="${b.status == 'Cancelled'}"><c:set var="bClass" value="badge-cancelled"/></c:if>

<<<<<<< HEAD
=======
                      <%-- Payment status + CSS class --%>
>>>>>>> 9d49e9f (Admin Booking View)
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
<<<<<<< HEAD

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
=======
        </div>

        <div class="footer">
          <div class="container">
            <div class="container2">
              <div class="mero-nepal">Mero Nepal Production</div>
              <div class="text">Cinematic photography and media production based in Nepal. We capture the moments that define your story.</div>
            </div>
            <div class="container5">
              <div>
                <div class="navigation">Navigation</div><br />
                <div class="list">
                  <div><a href="admin-dashboard.jsp">Dashboard</a></div>
                  <div><a href="admin-bookings.jsp">Bookings</a></div>
                  <div><a href="admin-services.jsp">Services</a></div>
                </div>
              </div>
              <div>
                <div class="legal">Other Actions</div><br />
                <div class="list">
                  <div><a href="../auth/login.jsp">Logout</a></div>
                  <div><a href="../../index.jsp">View Site</a></div>
>>>>>>> 9d49e9f (Admin Booking View)
                </div>
              </form>
            </div>
          </div>
<<<<<<< HEAD

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
=======
          <div class="horizontal-border2">
            <div class="_2024-mero-nepal-production-the-modern-auteur">
              &copy; <script>document.write(new Date().getFullYear());</script> Mero Nepal Production. All rights reserved.
>>>>>>> 9d49e9f (Admin Booking View)
            </div>
          </div>
        </div>
        <%@ include file="/WEB-INF/pages/components/footer-admin.jsp" %>
      </main>

<<<<<<< HEAD
      <%@ include file="/WEB-INF/pages/components/right-rail-admin.jsp" %>
=======
      <aside class="hidden md:flex flex-col justify-between p-12 border-l border-white/10 sticky top-0 h-screen">
        <nav class="space-y-6">
          <a href="admin-dashboard.jsp" class="block uppercase">Dashboard</a>
          <a href="admin-bookings.jsp"  class="block uppercase active">Bookings</a>
          <a href="admin-services.jsp"  class="block uppercase">Services</a>
          <div style="margin-top:16px;display:flex;flex-direction:column;gap:10px">
            <a href="../auth/login.jsp" class="uppercase btn-secondary">Logout</a>
            <a href="../../index.jsp"   class="uppercase btn-primary">Visit Site</a>
          </div>
        </nav>
      </aside>
>>>>>>> 9d49e9f (Admin Booking View)
    </div>

<<<<<<< HEAD
    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>

    <!-- ── PAGE SCRIPT ── -->
    <script>
=======
    <%-- Modal: Booking Status --%>
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

    <%-- Modal: Payment Status --%>
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

    <script>
      const toggle = document.getElementById("nav-toggle");
      const drawer = document.getElementById("mobile-nav");
      const bar1 = document.getElementById("bar1"), bar2 = document.getElementById("bar2"), bar3 = document.getElementById("bar3");
      let isOpen = false;
      toggle.addEventListener("click", () => {
        isOpen = !isOpen;
        drawer.style.transform = isOpen ? "translateX(0)" : "translateX(100%)";
        bar1.style.transform = isOpen ? "translateY(6px) rotate(45deg)" : "";
        bar2.style.opacity   = isOpen ? "0" : "1";
        bar3.style.transform = isOpen ? "translateY(-6px) rotate(-45deg)" : "";
        bar3.style.width     = isOpen ? "24px" : "";
      });
      drawer.querySelectorAll("a").forEach(a => a.addEventListener("click", () => {
        isOpen = false; drawer.style.transform = "translateX(100%)";
        bar1.style.transform = bar3.style.transform = ""; bar2.style.opacity = "1"; bar3.style.width = "";
      }));

>>>>>>> 9d49e9f (Admin Booking View)
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
