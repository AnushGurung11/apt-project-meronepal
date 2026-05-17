<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8"  isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Services — Mero Nepal Production</title>

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
      h3 {
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
      .badge-confirmed {
        background: rgba(52, 199, 89, 0.12);
        color: #34c759;
      }
      .badge-confirmed::before {
        background: #34c759;
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

    <%@ include file="/WEB-INF/pages/components/mobile-top-bar.jsp" %>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-drawer-admin.jsp" %>

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
              <h2>Manage Services</h2>
              <p>Create, update, or remove the services offered by APT.</p>
            </div>
            <button class="btn btn-gold btn-sm" onclick="openModal('addModal')">
              + Add Service
            </button>
          </div>

          <div class="table-wrap">
            <table class="data-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Service Name</th>
                  <th>Type</th>
                  <th>Description</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody id="servicesBody">
                <tr>
                  <td style="color: var(--muted)">1</td>
                  <td>Wedding Photography &amp; Videography</td>
                  <td>
                    <span
                      style="
                        font-size: 11px;
                        color: var(--gold);
                        text-transform: uppercase;
                        letter-spacing: 0.1em;
                      "
                      >Media</span
                    >
                  </td>
                  <td
                    style="
                      max-width: 220px;
                      color: var(--muted);
                      font-size: 13px;
                    "
                  >
                    Complete wedding photography and videography coverage
                  </td>
                  <td><span class="badge badge-confirmed">Active</span></td>
                  <td class="actions">
                    <button
                      class="btn btn-ghost btn-sm"
                      onclick="
                        openEdit(
                          this,
                          'Wedding Photography &amp; Videography',
                          'Media',
                          'Complete wedding photography and videography coverage',
                        )
                      "
                    >
                      Edit
                    </button>
                    <button
                      class="btn btn-danger btn-sm"
                      onclick="deleteRow(this)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
                <tr>
                  <td style="color: var(--muted)">2</td>
                  <td>Pre-Wedding &amp; Engagement Shoots</td>
                  <td>
                    <span
                      style="
                        font-size: 11px;
                        color: var(--gold);
                        text-transform: uppercase;
                        letter-spacing: 0.1em;
                      "
                      >Media</span
                    >
                  </td>
                  <td
                    style="
                      max-width: 220px;
                      color: var(--muted);
                      font-size: 13px;
                    "
                  >
                    Pre-wedding and engagement shoot sessions for couples
                  </td>
                  <td><span class="badge badge-confirmed">Active</span></td>
                  <td class="actions">
                    <button
                      class="btn btn-ghost btn-sm"
                      onclick="
                        openEdit(
                          this,
                          'Pre-Wedding & Engagement Shoots',
                          'Media',
                          'Pre-wedding and engagement shoot sessions for couples',
                        )
                      "
                    >
                      Edit
                    </button>
                    <button
                      class="btn btn-danger btn-sm"
                      onclick="deleteRow(this)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
                <tr>
                  <td style="color: var(--muted)">3</td>
                  <td>Event Coverage</td>
                  <td>
                    <span
                      style="
                        font-size: 11px;
                        color: var(--gold);
                        text-transform: uppercase;
                        letter-spacing: 0.1em;
                      "
                      >Media</span
                    >
                  </td>
                  <td
                    style="
                      max-width: 220px;
                      color: var(--muted);
                      font-size: 13px;
                    "
                  >
                    Coverage for birthdays, corporate events, and parties
                  </td>
                  <td><span class="badge badge-confirmed">Active</span></td>
                  <td class="actions">
                    <button
                      class="btn btn-ghost btn-sm"
                      onclick="
                        openEdit(
                          this,
                          'Event Coverage',
                          'Media',
                          'Coverage for birthdays, corporate events, and parties',
                        )
                      "
                    >
                      Edit
                    </button>
                    <button
                      class="btn btn-danger btn-sm"
                      onclick="deleteRow(this)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
                <tr>
                  <td style="color: var(--muted)">4</td>
                  <td>Portrait &amp; Model Photoshoots</td>
                  <td>
                    <span
                      style="
                        font-size: 11px;
                        color: var(--gold);
                        text-transform: uppercase;
                        letter-spacing: 0.1em;
                      "
                      >Photography</span
                    >
                  </td>
                  <td
                    style="
                      max-width: 220px;
                      color: var(--muted);
                      font-size: 13px;
                    "
                  >
                    Professional portrait and model photoshoots
                  </td>
                  <td><span class="badge badge-confirmed">Active</span></td>
                  <td class="actions">
                    <button
                      class="btn btn-ghost btn-sm"
                      onclick="openEdit(this)"
                    >
                      Edit
                    </button>
                    <button
                      class="btn btn-danger btn-sm"
                      onclick="deleteRow(this)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
                <tr>
                  <td style="color: var(--muted)">5</td>
                  <td>Product Photography</td>
                  <td>
                    <span
                      style="
                        font-size: 11px;
                        color: var(--gold);
                        text-transform: uppercase;
                        letter-spacing: 0.1em;
                      "
                      >Business</span
                    >
                  </td>
                  <td
                    style="
                      max-width: 220px;
                      color: var(--muted);
                      font-size: 13px;
                    "
                  >
                    Product photography for brands and business promotion
                  </td>
                  <td><span class="badge badge-confirmed">Active</span></td>
                  <td class="actions">
                    <button
                      class="btn btn-ghost btn-sm"
                      onclick="openEdit(this)"
                    >
                      Edit
                    </button>
                    <button
                      class="btn btn-danger btn-sm"
                      onclick="deleteRow(this)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
                <tr>
                  <td style="color: var(--muted)">6</td>
                  <td>Documentary Production</td>
                  <td>
                    <span
                      style="
                        font-size: 11px;
                        color: var(--gold);
                        text-transform: uppercase;
                        letter-spacing: 0.1em;
                      "
                      >Production</span
                    >
                  </td>
                  <td
                    style="
                      max-width: 220px;
                      color: var(--muted);
                      font-size: 13px;
                    "
                  >
                    Storytelling, interviews, and cultural documentary
                    production
                  </td>
                  <td><span class="badge badge-confirmed">Active</span></td>
                  <td class="actions">
                    <button
                      class="btn btn-ghost btn-sm"
                      onclick="openEdit(this)"
                    >
                      Edit
                    </button>
                    <button
                      class="btn btn-danger btn-sm"
                      onclick="deleteRow(this)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
                <tr>
                  <td style="color: var(--muted)">7</td>
                  <td>Music Video Production</td>
                  <td>
                    <span
                      style="
                        font-size: 11px;
                        color: var(--gold);
                        text-transform: uppercase;
                        letter-spacing: 0.1em;
                      "
                      >Production</span
                    >
                  </td>
                  <td
                    style="
                      max-width: 220px;
                      color: var(--muted);
                      font-size: 13px;
                    "
                  >
                    Cinematic music video production with creative direction
                  </td>
                  <td><span class="badge badge-confirmed">Active</span></td>
                  <td class="actions">
                    <button
                      class="btn btn-ghost btn-sm"
                      onclick="openEdit(this)"
                    >
                      Edit
                    </button>
                    <button
                      class="btn btn-danger btn-sm"
                      onclick="deleteRow(this)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
                <tr>
                  <td style="color: var(--muted)">8</td>
                  <td>Drone &amp; Cinematic Videography</td>
                  <td>
                    <span
                      style="
                        font-size: 11px;
                        color: var(--gold);
                        text-transform: uppercase;
                        letter-spacing: 0.1em;
                      "
                      >Media</span
                    >
                  </td>
                  <td
                    style="
                      max-width: 220px;
                      color: var(--muted);
                      font-size: 13px;
                    "
                  >
                    Drone shoots and cinematic videography coverage
                  </td>
                  <td><span class="badge badge-confirmed">Active</span></td>
                  <td class="actions">
                    <button
                      class="btn btn-ghost btn-sm"
                      onclick="openEdit(this)"
                    >
                      Edit
                    </button>
                    <button
                      class="btn btn-danger btn-sm"
                      onclick="deleteRow(this)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
                <tr>
                  <td style="color: var(--muted)">9</td>
                  <td>Professional Photo &amp; Video Editing</td>
                  <td>
                    <span
                      style="
                        font-size: 11px;
                        color: var(--gold);
                        text-transform: uppercase;
                        letter-spacing: 0.1em;
                      "
                      >Editing</span
                    >
                  </td>
                  <td
                    style="
                      max-width: 220px;
                      color: var(--muted);
                      font-size: 13px;
                    "
                  >
                    Professional editing service for photos and videos
                  </td>
                  <td><span class="badge badge-confirmed">Active</span></td>
                  <td class="actions">
                    <button
                      class="btn btn-ghost btn-sm"
                      onclick="openEdit(this)"
                    >
                      Edit
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

          <!-- Add Service Modal -->
          <div class="modal-overlay" id="addModal">
            <div class="modal">
              <div class="modal-header">
                <h3>Add New Service</h3>
                <p style="font-size: 14px; margin-top: 4px">
                  Add a new service to the APT catalogue.
                </p>
              </div>
              <div class="form-group">
                <label class="form-label">Service Name</label>
                <input
                  type="text"
                  id="newName"
                  placeholder="e.g. 360° Photo Booth"
                />
              </div>
              <div class="form-group">
                <label class="form-label">Service Type</label>
                <select id="newType">
                  <option value="Media">Media</option>
                  <option value="Photography">Photography</option>
                  <option value="Production">Production</option>
                  <option value="Business">Business</option>
                  <option value="Editing">Editing</option>
                </select>
              </div>
              <div class="form-group">
                <label class="form-label">Description</label>
                <textarea
                  id="newDesc"
                  rows="3"
                  placeholder="Short description of the service..."
                ></textarea>
              </div>
              <div class="modal-footer">
                <button class="btn btn-ghost" onclick="closeModal('addModal')">
                  Cancel
                </button>
                <button class="btn btn-gold" onclick="addService()">
                  Add Service
                </button>
              </div>
            </div>
          </div>

          <!-- Edit Service Modal -->
          <div class="modal-overlay" id="editModal">
            <div class="modal">
              <div class="modal-header">
                <h3>Edit Service</h3>
              </div>
              <div class="form-group">
                <label class="form-label">Service Name</label>
                <input type="text" id="editName" />
              </div>
              <div class="form-group">
                <label class="form-label">Service Type</label>
                <select id="editType">
                  <option value="Media">Media</option>
                  <option value="Photography">Photography</option>
                  <option value="Production">Production</option>
                  <option value="Business">Business</option>
                  <option value="Editing">Editing</option>
                </select>
              </div>
              <div class="form-group">
                <label class="form-label">Description</label>
                <textarea id="editDesc" rows="3"></textarea>
              </div>
              <div class="modal-footer">
                <button class="btn btn-ghost" onclick="closeModal('editModal')">
                  Cancel
                </button>
                <button class="btn btn-gold" onclick="saveEdit()">
                  Save Changes
                </button>
              </div>
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

      document.addEventListener("keydown", (e) => {
        if (e.key === "Escape") {
          document
            .querySelectorAll(".modal-overlay.open")
            .forEach((m) => m.classList.remove("open"));
        }
      });

      let editRow = null;
      let counter = 10;

      function deleteRow(btn) {
        if (confirm("Delete this service?")) btn.closest("tr").remove();
      }

      function openEdit(btn, name, type, desc) {
        editRow = btn.closest("tr");
        document.getElementById("editName").value = name || "";
        document.getElementById("editType").value = type || "Media";
        document.getElementById("editDesc").value = desc || "";
        openModal("editModal");
      }

      function saveEdit() {
        if (!editRow) return;
        const cells = editRow.querySelectorAll("td");
        cells[1].textContent = document.getElementById("editName").value;
        cells[2].innerHTML = `<span style="font-size:11px;color:var(--gold);text-transform:uppercase;letter-spacing:0.1em;">${document.getElementById("editType").value}</span>`;
        cells[3].textContent = document.getElementById("editDesc").value;
        closeModal("editModal");
      }

      function addService() {
        const name = document.getElementById("newName").value.trim();
        const type = document.getElementById("newType").value;
        const desc = document.getElementById("newDesc").value.trim();
        if (!name) return;
        const tbody = document.getElementById("servicesBody");
        const tr = document.createElement("tr");
        tr.innerHTML = `
      <td style="color:var(--muted);">${counter++}</td>
      <td>${name}</td>
      <td><span style="font-size:11px;color:var(--gold);text-transform:uppercase;letter-spacing:0.1em;">${type}</span></td>
      <td style="max-width:220px;color:var(--muted);font-size:13px;">${desc}</td>
      <td><span class="badge badge-confirmed">Active</span></td>
      <td class="actions">
        <button class="btn btn-ghost btn-sm" onclick="openEdit(this,'${name}','${type}','${desc}')">Edit</button>
        <button class="btn btn-danger btn-sm" onclick="deleteRow(this)">Delete</button>
      </td>`;
        tbody.appendChild(tr);
        document.getElementById("newName").value = "";
        document.getElementById("newDesc").value = "";
        closeModal("addModal");
      }
    </script>
  </body>
</html>
