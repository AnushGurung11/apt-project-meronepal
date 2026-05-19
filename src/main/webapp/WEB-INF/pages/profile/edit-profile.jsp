<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Profile — Mero Nepal Production</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Outfit:wght@300;400;500;600&display=swap"
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
      :root {
        --black:       #0a0a0a;
        --dark:        #111111;
        --surface:     #181818;
        --surface2:    #222222;
        --border:      #2a2a2a;
        --gold:        #c9a84c;
        --gold-light:  #e2c07a;
        --gold-dim:    #c9a84c33;
        --white:       #f5f0e8;
        --muted:       #888880;
        --red:         #c0392b;
        --red-dim:     rgba(192,57,43,0.12);
        --radius:      6px;
        --radius-lg:   12px;
        --transition:  0.3s cubic-bezier(0.4, 0, 0.2, 1);
        --font-display:"Cormorant Garamond", Georgia, serif;
        --font-body:   "Outfit", sans-serif;
      }

      *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
      html { scroll-behavior: smooth; }
      body {
        background: var(--black);
        color: var(--white);
        font-family: var(--font-body);
        font-size: 15px;
        line-height: 1.7;
        -webkit-font-smoothing: antialiased;
        overflow-x: hidden;
      }
      a { color: inherit; text-decoration: none; transition: color var(--transition); }
      button { cursor: pointer; border: none; background: none; font-family: var(--font-body); }

      h2, h3, h4 {
        font-family: var(--font-display);
        font-weight: 400;
        line-height: 1.15;
        letter-spacing: 0.01em;
      }
      h2 { font-size: clamp(2rem, 4vw, 3.2rem); }
      h3 { font-size: 1.3rem; }
      h4 { font-size: 1.25rem; }

      .profile-wrapper { padding: 48px 40px; }
      .page-header     { margin-bottom: 40px; }
      .page-header p   { color: #b0aa9f; font-size: 14px; font-weight: 300; }

      .profile-card {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        padding: 36px;
      }

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

      .divider { width: 60px; height: 1px; background: var(--gold); margin: 28px 0; }

      .profile-avatar {
        width: 64px; height: 64px; border-radius: 50%;
        background: var(--surface2); border: 2px solid var(--gold);
        display: flex; align-items: center; justify-content: center;
        font-family: var(--font-display); font-size: 1.8rem;
        color: var(--gold); flex-shrink: 0; text-transform: uppercase;
      }

      .form-group { margin-bottom: 24px; }
      .form-label {
        display: block;
        font-size: 11px; font-weight: 500;
        letter-spacing: 0.14em; text-transform: uppercase;
        color: var(--gold); margin-bottom: 10px;
      }
      .form-input {
        width: 100%;
        background: var(--surface2);
        border: 1px solid var(--border);
        border-radius: var(--radius);
        color: var(--white);
        font-family: var(--font-body); font-size: 14px;
        padding: 14px 16px;
        transition: border-color var(--transition), box-shadow var(--transition);
        outline: none;
        -webkit-appearance: none; appearance: none;
      }
      .form-input:focus {
        border-color: var(--gold);
        box-shadow: 0 0 0 3px var(--gold-dim);
      }
      .form-input::placeholder { color: var(--muted); }
      .form-input.input-error {
        border-color: var(--red);
        box-shadow: 0 0 0 3px var(--red-dim);
      }

      .form-hint {
        font-size: 11px; color: var(--muted);
        margin-top: 6px; letter-spacing: 0.03em;
      }

      .form-divider { height: 1px; background: var(--border); margin: 32px 0; }

      .btn {
        display: inline-flex; align-items: center; gap: 8px;
        padding: 14px 32px; border-radius: var(--radius);
        font-size: 13px; font-weight: 500; letter-spacing: 0.08em;
        text-transform: uppercase; transition: all var(--transition);
        white-space: nowrap; cursor: pointer; text-decoration: none;
        border: none; font-family: var(--font-body);
      }
      .btn-gold { background: var(--gold); color: #0a0a0a; }
      .btn-gold:hover {
        background: var(--gold-light);
        transform: translateY(-1px);
        box-shadow: 0 4px 20px rgba(201,168,76,0.3);
      }
      .btn-ghost {
        background: transparent;
        border: 1px solid var(--border);
        color: var(--muted);
      }
      .btn-ghost:hover { border-color: var(--gold); color: var(--gold); }

      .alert {
        padding: 14px 20px; border-radius: var(--radius);
        font-size: 13px; border-left: 3px solid; margin-bottom: 28px;
      }
      .alert-error   { background: var(--red-dim);       border-color: var(--red);  color: #e57373; }
      .alert-success { background: rgba(52,199,89,0.08); border-color: #34c759;     color: #34c759; }

      .btn-back {
        display: inline-flex; align-items: center; gap: 8px;
        font-size: 12px; font-weight: 500; letter-spacing: 0.1em;
        text-transform: uppercase; color: var(--muted);
        transition: color var(--transition); margin-bottom: 36px;
      }
      .btn-back:hover { color: var(--gold); }

      .summary-row {
        display: flex; justify-content: space-between; align-items: center;
        padding: 10px 0; border-bottom: 1px solid var(--border); font-size: 14px;
      }
      .summary-row:last-child { border-bottom: none; }
      .summary-row .label { color: var(--muted); }
      .summary-row .value { color: var(--white); font-weight: 500; }

      .badge {
        display: inline-flex; align-items: center; gap: 5px;
        font-size: 11px; font-weight: 500; letter-spacing: 0.08em;
        text-transform: uppercase; padding: 4px 12px; border-radius: 20px;
      }
      .badge::before { content: ""; display: block; width: 6px; height: 6px; border-radius: 50%; }
      .badge-confirmed { background: rgba(52,199,89,0.12); color: #34c759; }
      .badge-confirmed::before { background: #34c759; }

      .info-box {
        background: var(--gold-dim);
        border: 1px solid rgba(201,168,76,0.25);
        border-radius: var(--radius);
        padding: 14px 18px;
        font-size: 12px;
        color: #b0aa9f;
        margin-top: 24px;
        letter-spacing: 0.02em;
      }
      .info-box strong { color: var(--gold); }
      .info-box a { color: var(--gold); text-decoration: underline; }

      @media (max-width: 768px) {
        .profile-wrapper { padding: 24px 20px; }
      }
    </style>
  </head>

  <body>
    <!-- ── BACKGROUND GRID ── -->
    <div class="fixed inset-0 opacity-20 z-0 background-grid">
      <script>for (let i = 0; i < 96; i++) document.write('<div class="grid-cell"></div>');</script>
    </div>

    <!-- ── FILM GRAIN ── -->
    <div class="fixed inset-0 opacity-5 pointer-events-none grain-overlay"></div>

    <%@ include file="/WEB-INF/pages/components/mobile-top-bar.jsp" %>
    <%@ include file="/WEB-INF/pages/components/mobile-nav-drawer-profile.jsp" %>

    <!-- ── MAIN 3-COLUMN LAYOUT ── -->
    <div class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10">
      <%@ include file="/WEB-INF/pages/components/left-rail-auth.jsp" %>

      <main class="pt-14 md:pt-0">
        <div class="profile-wrapper">

          <a href="${pageContext.request.contextPath}/profile" class="btn-back">← Back to Profile</a>

          <div class="page-header">
            <div class="section-label">Account Settings</div>
            <h2>Edit Your Profile</h2>
            <p style="margin-top:8px;">Update your name, email address, and phone number below.</p>
          </div>

          <c:if test="${not empty error}">
            <div class="alert alert-error"><c:out value="${error}" /></div>
          </c:if>
          <c:if test="${not empty success}">
            <div class="alert alert-success"><c:out value="${success}" /></div>
          </c:if>

          <!-- Two-column layout: edit form (left) + identity card (right) -->
          <div class="grid md:grid-cols-[1fr_340px] gap-8 items-start">

            <!-- LEFT: EDIT FORM CARD -->
            <div class="profile-card">
              <div class="section-label">Personal Details</div>
              <h3 style="margin-bottom:8px;">Update Information</h3>
              <p style="font-size:13px;color:#b0aa9f;margin-bottom:32px;">
                All fields are required. Changes take effect immediately after saving.
              </p>

              <form action="${pageContext.request.contextPath}/profile/update"
                    method="post" id="editProfileForm" novalidate>

                <div class="form-group">
                  <label class="form-label" for="userName">Username</label>
                  <input
                    class="form-input ${not empty erUser ? 'input-error' : ''}"
                    type="text"
                    id="userName"
                    name="userName"
                    value="<c:out value='${userName}'/>"
                    placeholder="Your display name"
                    required
                    autocomplete="username" />
                  <c:choose>
                    <c:when test="${not empty erUser}">
                      <span class="form-hint" style="color:#e57373;"><c:out value="${erUser}"/></span>
                    </c:when>
                    <c:otherwise>
                      <span class="form-hint">This is how your name appears across the site.</span>
                    </c:otherwise>
                  </c:choose>
                </div>

                <div class="form-group">
                  <label class="form-label" for="email">Email Address</label>
                  <input
                    class="form-input ${not empty erMail ? 'input-error' : ''}"
                    type="email"
                    id="email"
                    name="email"
                    value="<c:out value='${email}'/>"
                    placeholder="you@example.com"
                    required
                    autocomplete="email" />
                  <c:choose>
                    <c:when test="${not empty erMail}">
                      <span class="form-hint" style="color:#e57373;"><c:out value="${erMail}"/></span>
                    </c:when>
                    <c:otherwise>
                      <span class="form-hint">We'll never share your email with anyone else.</span>
                    </c:otherwise>
                  </c:choose>
                </div>

                <div class="form-group">
                  <label class="form-label" for="phoneNumber">Phone Number</label>
                  <div style="position:relative;">
                    <span style="position:absolute; left:14px; top:50%; transform:translateY(-50%); font-size:13px; color:var(--muted); pointer-events:none; user-select:none;">+977</span>
                    <input
                      class="form-input ${not empty erNum ? 'input-error' : ''}"
                      type="tel"
                      id="phoneNumber"
                      name="phoneNumber"
                      value="<c:out value='${phoneNumber}'/>"
                      placeholder="98XXXXXXXX"
                      required
                      maxlength="10"
                      style="padding-left: 52px;"
                      autocomplete="tel-national" />
                  </div>
                  <c:choose>
                    <c:when test="${not empty erNum}">
                      <span class="form-hint" style="color:#e57373;"><c:out value="${erNum}"/></span>
                    </c:when>
                    <c:otherwise>
                      <span class="form-hint">10 digits, must start with 9. Example: 9800000000</span>
                    </c:otherwise>
                  </c:choose>
                </div>

                <div class="form-divider"></div>

                <div style="display:flex;gap:12px;flex-wrap:wrap;">
                  <button type="submit" class="btn btn-gold" style="flex:1;justify-content:center;">
                    Save Changes ✦
                  </button>
                  <a href="${pageContext.request.contextPath}/profile"
                     class="btn btn-ghost" style="flex:1;justify-content:center;">
                    Cancel
                  </a>
                </div>

                <p style="font-size:11px;color:var(--muted);text-align:center;margin-top:16px;letter-spacing:0.04em;">
                  Password changes are handled separately via the
                  <a href="${pageContext.request.contextPath}/profile/changePassword"
                     style="color:var(--gold);">Change Password</a> page.
                </p>
              </form>
            </div>

            <!-- RIGHT: IDENTITY SNAPSHOT CARD -->
            <div class="profile-card" style="position:sticky;top:32px;">

              <div style="display:flex;align-items:center;gap:16px;margin-bottom:28px;">
                <div class="profile-avatar">
                  ${fn:toUpperCase(fn:substring(userName, 0, 1))}
                </div>
                <div>
                  <h3 style="margin-bottom:4px;"><c:out value="${userName}"/></h3>
                  <span class="badge badge-confirmed">
                    <c:out value="${userRole}"/>
                  </span>
                </div>
              </div>

              <div class="divider"></div>

              <div class="section-label" style="margin-bottom:14px;">Current Details</div>

              <div class="summary-row">
                <span class="label">Username</span>
                <span class="value"><c:out value="${userName}"/></span>
              </div>

              <div class="summary-row">
                <span class="label">Email</span>
                <span class="value" style="font-size:12px;word-break:break-all;">
                  <c:out value="${email}"/>
                </span>
              </div>

              <div class="summary-row">
                <span class="label">Phone</span>
                <span class="value">
                  <c:choose>
                    <c:when test="${fn:startsWith(phoneNumber, '+977')}">
                      <c:out value="${phoneNumber}"/>
                    </c:when>
                    <c:otherwise>+977 <c:out value="${phoneNumber}"/></c:otherwise>
                  </c:choose>
                </span>
              </div>

              <div class="info-box" style="margin-top:28px;">
                <strong>Note:</strong> Your role and password cannot be changed from this page.
                Use the <a href="${pageContext.request.contextPath}/profile/changePassword">Change Password</a>
                page for password updates.
              </div>

            </div>
          </div>
        </div>

        <%@ include file="/WEB-INF/pages/components/footer.jsp" %>
      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-profile.jsp" %>
    </div>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>

    <script>
      /* ── Client-side field validation ── */
      document.getElementById("editProfileForm").addEventListener("submit", function (e) {
        const userName    = document.getElementById("userName");
        const email       = document.getElementById("email");
        const phoneNumber = document.getElementById("phoneNumber");

        let firstError = null;
        [userName, email, phoneNumber].forEach(el => el.classList.remove("input-error"));

        if (!userName.value.trim()) {
          userName.classList.add("input-error");
          firstError = firstError || userName;
        }

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!email.value.trim() || !emailRegex.test(email.value.trim())) {
          email.classList.add("input-error");
          firstError = firstError || email;
        }

        const phoneRegex = /^9\d{9}$/;
        if (!phoneNumber.value.trim() || !phoneRegex.test(phoneNumber.value.trim())) {
          phoneNumber.classList.add("input-error");
          firstError = firstError || phoneNumber;
        }

        if (firstError) {
          e.preventDefault();
          firstError.focus();

          let banner = document.querySelector(".client-error-banner");
          if (!banner) {
            banner = document.createElement("div");
            banner.className = "alert alert-error client-error-banner";
            this.prepend(banner);
          }
          banner.textContent = "Please correct the highlighted fields before saving.";
          banner.scrollIntoView({ behavior: "smooth", block: "center" });
        }
      });

      /* Phone: strip non-digits */
      document.getElementById("phoneNumber").addEventListener("input", function () {
        this.value = this.value.replace(/\D/g, "").slice(0, 10);
      });
    </script>
  </body>
</html>
