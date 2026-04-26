<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
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
      href="../../../assets/img/favicon.ico"
    />
    <link rel="stylesheet" href="../../../assets/css/styles.css" />
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

    <!-- ── MOBILE TOP BAR ── -->
    <div
      class="md:hidden fixed top-0 left-0 right-0 z-50 flex items-center justify-between px-6 h-14 bg-[#0a0a0a]"
      style="border-bottom: 1px solid var(--border)"
    >
      <div class="text-xl font-black">
        M<span style="color: var(--gold)">.NP</span>
      </div>
      <button
        id="nav-toggle"
        class="flex flex-col gap-[5px] p-1"
        aria-label="Toggle menu"
      >
        <span
          id="bar1"
          class="block w-6 h-px bg-white"
          style="
            transition:
              transform 0.25s,
              opacity 0.25s;
          "
        ></span>
        <span
          id="bar2"
          class="block w-6 h-px bg-white"
          style="transition: opacity 0.25s"
        ></span>
        <span
          id="bar3"
          class="block w-4 h-px bg-white"
          style="transition: transform 0.25s"
        ></span>
      </button>
    </div>

    <!-- ── MOBILE NAV DRAWER ── -->
    <nav
      id="mobile-nav"
      class="md:hidden fixed inset-0 z-40 bg-[#0a0a0a] flex flex-col justify-center items-center gap-10"
      style="transform: translateX(100%); transition: transform 0.3s ease"
    >
      <a
        href="admin-dashboard.jsp"
        class="text-3xl font-black uppercase tracking-widest"
        >Dashboard</a
      >
      <a
        href="admin-bookings.jsp"
        class="text-3xl font-black uppercase tracking-widest active"
        >Bookings</a
      >
      <a
        href="admin-services.jsp"
        class="text-3xl font-black uppercase tracking-widest"
        >Services</a
      >
      <a href="../auth/login.jsp" class="uppercase btn-secondary mt-4">Login</a>
      <a href="../../index.jsp" class="uppercase btn-primary mt-4"
        >Visit Site</a
      >
    </nav>

    <!-- ── MAIN 3-COLUMN LAYOUT ── -->
    <div
      class="relative z-10 grid md:grid-cols-[80px_1fr_280px] min-h-screen border-b border-white/10"
    >
      <!-- LEFT RAIL -->
      <aside
        class="hidden md:flex flex-col justify-between items-center py-12 border-r border-white/10 sticky top-0 h-screen"
      >
        <div class="text-2xl font-black">
          M<span style="color: var(--gold)">.NP</span>
        </div>
        <div
          class="vertical-text text-[10px] tracking-[0.4em] uppercase"
          style="color: var(--gold)"
        >
          Mero Nepal Production — EST. 2020
        </div>
        <div class="w-2 h-2 rounded-full" style="background: var(--gold)"></div>
      </aside>

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
        <!-- FOOTER -->
        <div class="footer">
          <div class="container">
            <div class="container2">
              <div class="mero-nepal">Mero Nepal Production</div>
              <div class="text">
                Cinematic photography and media production based in Nepal. We
                capture the moments that define your story.
              </div>
            </div>
            <div class="container5">
              <div>
                <div class="navigation">Navigation</div>
                <br />
                <div class="list">
                  <div><a href="admin-dashboard.jsp">Dashboard</a></div>
                  <div><a href="admin-bookings.jsp">Bookings</a></div>
                  <div><a href="admin-services.jsp">Services</a></div>
                </div>
              </div>
              <div>
                <div class="legal">Other Actions</div>
                <br />
                <div class="list">
                  <div><a href="../auth/login.jsp">Logout</a></div>
                  <div><a href="../../index.jsp">View Site</a></div>
                </div>
              </div>
            </div>
          </div>
          <div class="horizontal-border2">
            <div class="_2024-mero-nepal-production-the-modern-auteur">
              ©
              <script>
                document.write(new Date().getFullYear());
              </script>
              Mero Nepal Production. All rights reserved.
            </div>
          </div>
        </div>
      </main>

      <!-- RIGHT RAIL -->
      <aside
        class="hidden md:flex flex-col justify-between p-12 border-l border-white/10 sticky top-0 h-screen"
      >
        <nav class="space-y-6">
          <a href="admin-dashboard.jsp" class="block uppercase">Dashboard</a>
          <a href="admin-bookings.jsp" class="block uppercase active"
            >Bookings</a
          >
          <a href="admin-services.jsp" class="block uppercase">Services</a>
          <div
            style="
              margin-top: 16px;
              display: flex;
              flex-direction: column;
              gap: 10px;
            "
          >
            <a href="../auth/login.jsp" class="uppercase btn-secondary"
              >Logout</a
            >
            <a href="../../index.jsp" class="uppercase btn-primary"
              >Visit Site</a
            >
          </div>
        </nav>
      </aside>
    </div>
    <!-- end 3-col grid -->

    <!-- ── MOBILE NAV SCRIPT ── -->
    <script>
      const toggle = document.getElementById("nav-toggle");
      const drawer = document.getElementById("mobile-nav");
      const bar1 = document.getElementById("bar1");
      const bar2 = document.getElementById("bar2");
      const bar3 = document.getElementById("bar3");
      let isOpen = false;

      toggle.addEventListener("click", () => {
        isOpen = !isOpen;
        drawer.style.transform = isOpen ? "translateX(0)" : "translateX(100%)";
        bar1.style.transform = isOpen ? "translateY(6px) rotate(45deg)" : "";
        bar2.style.opacity = isOpen ? "0" : "1";
        bar3.style.transform = isOpen ? "translateY(-6px) rotate(-45deg)" : "";
        bar3.style.width = isOpen ? "24px" : "";
      });

      drawer.querySelectorAll("a").forEach((a) =>
        a.addEventListener("click", () => {
          isOpen = false;
          drawer.style.transform = "translateX(100%)";
          bar1.style.transform = bar3.style.transform = "";
          bar2.style.opacity = "1";
          bar3.style.width = "";
        }),
      );

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
