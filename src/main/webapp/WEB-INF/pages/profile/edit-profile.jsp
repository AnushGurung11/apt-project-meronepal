<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Profile — Mero Nepal Production</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico" />
    <link rel="stylesheet"              href="${pageContext.request.contextPath}/assets/css/styles.css" />

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
      img { max-width: 100%; display: block; }
      a   { color: inherit; text-decoration: none; transition: color var(--transition); }
      ul  { list-style: none; }
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

      /* ── Layout helpers ── */
      .profile-wrapper { padding: 48px 40px; }
      .page-header     { margin-bottom: 40px; }
      .page-header p   { color: #b0aa9f; font-size: 14px; font-weight: 300; }

      /* ── Card ── */
      .profile-card {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        padding: 36px;
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

      /* ── Avatar ── */
      .profile-avatar {
        width: 64px; height: 64px; border-radius: 50%;
        background: var(--surface2); border: 2px solid var(--gold);
        display: flex; align-items: center; justify-content: center;
        font-family: var(--font-display); font-size: 1.8rem;
        color: var(--gold); flex-shrink: 0; text-transform: uppercase;
      }

      /* ── Form ── */
      .form-group   { margin-bottom: 24px; }
      .form-label   {
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
      .form-input.input-error  {
        border-color: var(--red);
        box-shadow: 0 0 0 3px var(--red-dim);
      }

      .form-hint {
        font-size: 11px; color: var(--muted);
        margin-top: 6px; letter-spacing: 0.03em;
      }

      .form-divider { height: 1px; background: var(--border); margin: 32px 0; }

      /* ── Buttons ── */
      .btn {
        display: inline-flex; align-items: center; gap: 8px;
        padding: 14px 32px; border-radius: var(--radius);
        font-size: 13px; font-weight: 500; letter-spacing: 0.08em;
        text-transform: uppercase; transition: all var(--transition);
        white-space: nowrap; cursor: pointer; text-decoration: none;
        border: none; font-family: var(--font-body);
      }
      .btn-gold  { background: var(--gold); color: #0a0a0a; }
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
      .btn-full { width: 100%; justify-content: center; }

      /* ── Alerts ── */
      .alert {
        padding: 14px 20px; border-radius: var(--radius);
        font-size: 13px; border-left: 3px solid; margin-bottom: 28px;
      }
      .alert-error   { background: var(--red-dim);           border-color: var(--red);  color: #e57373; }
      .alert-success { background: rgba(52,199,89,0.08);     border-color: #34c759;     color: #34c759; }

      /* ── Back link ── */
      .btn-back {
        display: inline-flex; align-items: center; gap: 8px;
        font-size: 12px; font-weight: 500; letter-spacing: 0.1em;
        text-transform: uppercase; color: var(--muted);
        transition: color var(--transition); margin-bottom: 36px;
      }
      .btn-back:hover { color: var(--gold); }

      /* ── Summary row ── */
      .summary-row {
        display: flex; justify-content: space-between; align-items: center;
        padding: 10px 0; border-bottom: 1px solid var(--border); font-size: 14px;
      }
      .summary-row:last-child { border-bottom: none; }
      .summary-row .label { color: var(--muted); }
      .summary-row .value { color: var(--white); font-weight: 500; }

      /* ── Badge ── */
      .badge {
        display: inline-flex; align-items: center; gap: 5px;
        font-size: 11px; font-weight: 500; letter-spacing: 0.08em;
        text-transform: uppercase; padding: 4px 12px; border-radius: 20px;
      }
      .badge::before { content: ""; display: block; width: 6px; height: 6px; border-radius: 50%; }
      .badge-confirmed { background: rgba(52,199,89,0.12); color: #34c759; }
      .badge-confirmed::before { background: #34c759; }

      /* ── Read-only info box ── */
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

      /* ── HR divider ── */
      .hr {
        border: none; border-top: 1px solid rgba(255,255,255,0.08); margin: 2rem 0;
      }

      /* ── Responsive ── */
      @media (max-width: 768px) {
        .profile-wrapper { padding: 24px 20px; }
      }
    </style>
  </head>

  <body>
    <!-- BACKGROUND GRID -->
    <div class="fixed inset-0 opacity-20 z-0 background-grid">
      <script>for(let i=0;i<96;i++)document.write('<div class="grid-cell"></div>');</script>
    </div>
    <div class="fixed inset-0 opacity-5 pointer-events-none grain-overlay"></div>

    <!-- MOBILE TOP BAR -->
    <div class="md:hidden fixed top-0 left-0 right-0 z-50 flex items-center justify-between px-6 h-14 bg-[#0a0a0a]"
         style="border-bottom:1px solid rgba(255,255,255,0.08)">
      <div class="text-xl font-black"><a href="${pageContext.request.contextPath}/home">M.NP</a></div>
      <button id="nav-toggle" class="flex flex-col gap-[5px] p-1" aria-label="Toggle menu">
        <span id="bar1" class="block w-6 h-px bg-white" style="transition:transform 0.25s,opacity 0.25s;"></span>
        <span id="bar2" class="block w-6 h-px bg-white" style="transition:opacity 0.25s"></span>
        <span id="bar3" class="block w-4 h-px bg-white" style="transition:transform 0.25s"></span>
      </button>
    </div>

    <!-- MOBILE NAV DRAWER -->
    <nav id="mobile-nav" class="md:hidden fixed inset-0 z-40 bg-[#0a0a0a] flex flex-col justify-center items-center gap-10"
         style="transform:translateX(100%);transition:transform 0.3s ease">
      <a href="${pageContext.request.contextPath}/home"     class="text-3xl font-black uppercase tracking-widest">Home</a>
      <a href="${pageContext.request.contextPath}/packages" class="text-3xl font-black uppercase tracking-widest">Bookings</a>
      <a href="${pageContext.request.contextPath}/about"    class="text-3xl font-black uppercase tracking-widest">About</a>
      <a href="${pageContext.request.contextPath}/blog"     class="text-3xl font-black uppercase tracking-widest">Blog</a>
    </nav>

    <!-- MAIN 3-COLUMN LAYOUT -->
    <div class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10">

      <!-- LEFT RAIL -->
      <aside class="hidden md:flex flex-col justify-between items-center py-12 border-r border-white/10 sticky top-0 h-screen">
        <div class="text-2xl font-black"><a href="${pageContext.request.contextPath}/home">M.NP</a></div>
        <div class="vertical-text text-[10px] tracking-[0.4em] uppercase" style="color:var(--gold)">
          Mero Nepal Production — EST. 2014
        </div>
        <div class="w-2 h-2 rounded-full" style="background:var(--gold)"></div>
      </aside>

      <!-- CENTER — EDIT PROFILE CONTENT -->
      <main class="pt-14 md:pt-0">
        <div class="profile-wrapper">

          <!-- Back link -->
          <a href="${pageContext.request.contextPath}/profile" class="btn-back">← Back to Profile</a>

          <!-- Page header -->
          <div class="page-header">
            <div class="section-label">Account Settings</div>
            <h2>Edit Your Profile</h2>
            <p style="margin-top:8px;">Update your name, email address, and phone number below.</p>
          </div>

          <%-- ── Flash / validation messages ── --%>
          <c:if test="${not empty error}">
            <div class="alert alert-error">
              <c:out value="${error}" />
            </div>
          </c:if>
          <c:if test="${not empty success}">
            <div class="alert alert-success">
              <c:out value="${success}" />
            </div>
          </c:if>

          <%-- ══════════════════════════════════════════════════════════
               Two-column layout: edit form (left) + identity card (right)
          ══════════════════════════════════════════════════════════ --%>
          <div class="grid md:grid-cols-[1fr_340px] gap-8 items-start">

            <%-- ─── LEFT: EDIT FORM CARD ─── --%>
            <div class="profile-card">
              <div class="section-label">Personal Details</div>
              <h3 style="margin-bottom:8px;">Update Information</h3>
              <p style="font-size:13px;color:#b0aa9f;margin-bottom:32px;">
                All fields are required. Changes take effect immediately after saving.
              </p>

              <%--
                ACTION PATH — set the form action to your servlet URL pattern.
                e.g. action="${pageContext.request.contextPath}/profile/update"
              --%>
              <form action="" method="post" id="editProfileForm" novalidate>

                <%-- Username --%>
                <div class="form-group">
                  <label class="form-label" for="userName">Username</label>
                  <input
                    class="form-input ${not empty error and empty userName ? 'input-error' : ''}"
                    type="text"
                    id="userName"
                    name="userName"
                    value="<c:out value='${userName}'/>"
                    placeholder="Your display name"
                    required
                    autocomplete="username"
                  />
                  <span class="form-hint">This is how your name appears across the site.</span>
                </div>

                <%-- Email --%>
                <div class="form-group">
                  <label class="form-label" for="email">Email Address</label>
                  <input
                    class="form-input"
                    type="email"
                    id="email"
                    name="email"
                    value="<c:out value='${email}'/>"
                    placeholder="you@example.com"
                    required
                    autocomplete="email"
                  />
                  <span class="form-hint">We'll never share your email with anyone else.</span>
                </div>

                <%-- Phone Number --%>
                <div class="form-group">
                  <label class="form-label" for="phoneNumber">Phone Number</label>
                  <div style="position:relative;">
                    <span style="
                      position:absolute; left:14px; top:50%; transform:translateY(-50%);
                      font-size:13px; color:var(--muted); pointer-events:none; user-select:none;
                    ">+977</span>
                    <input
                      class="form-input"
                      type="tel"
                      id="phoneNumber"
                      name="phoneNumber"
                      value="<c:out value='${phoneNumber}'/>"
                      placeholder="98XXXXXXXX"
                      required
                      maxlength="10"
                      style="padding-left: 52px;"
                      autocomplete="tel-national"
                    />
                  </div>
                  <span class="form-hint">10 digits, must start with 9. Example: 9800000000</span>
                </div>

                <div class="form-divider"></div>

                <%-- Action buttons --%>
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
                  Password changes are handled separately via the Change Password page.
                </p>

              </form>
            </div>
            <%-- /edit form card --%>

            <%-- ─── RIGHT: IDENTITY SNAPSHOT CARD ─── --%>
            <div class="profile-card" style="position:sticky;top:32px;">

              <%-- Avatar + name + role --%>
              <div style="display:flex;align-items:center;gap:16px;margin-bottom:28px;">
                <div class="profile-avatar">
                  ${fn:toUpperCase(fn:substring(userName, 0, 1))}
                </div>
                <div>
                  <h3 style="margin-bottom:4px;"><c:out value="${userName}"/></h3>
                  <span class="badge badge-confirmed">
                    <c:out value="${user.userRole}"/>
                  </span>
                </div>
              </div>

              <div class="divider"></div>

              <%-- Current values at a glance --%>
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

              <%-- Info note --%>
              <div class="info-box" style="margin-top:28px;">
                <strong>Note:</strong> Your role and password cannot be changed from this page.
                Use the <a href="${pageContext.request.contextPath}/profile/change-password"
                           style="color:var(--gold);text-decoration:underline;">Change Password</a> page for password updates.
              </div>

            </div>
            <%-- /identity card --%>

          </div>
          <%-- /two-column grid --%>

        </div>
        <%-- /profile-wrapper --%>

        <!-- FOOTER -->
        <div class="footer">
          <div class="container">
            <div class="container2">
              <div class="container3"><div class="mero-nepal">Mero Nepal Production</div></div>
              <div class="container4">
                <div class="text"><br />Cinematic photography and media production based in Nepal. We capture the moments that define your story.</div>
              </div>
            </div>
            <div class="container5">
              <div class="container6">
                <div class="heading-6"><div class="navigation">NAVIGATION</div></div><br />
                <div class="list">
                  <div class="item"><a href="${pageContext.request.contextPath}/home"><div>Home</div></a></div>
                  <div class="item"><a href="${pageContext.request.contextPath}/packages"><div>Packages</div></a></div>
                  <div class="item"><a href="${pageContext.request.contextPath}/about"><div>About</div></a></div>
                  <div class="item"><a href="${pageContext.request.contextPath}/blog"><div>Blog</div></a></div>
                </div>
              </div>
              <div class="container7">
                <div class="heading-6"><div class="legal">Account</div></div><br />
                <div class="list">
                  <div class="item"><a href="${pageContext.request.contextPath}/profile"><div>My Profile</div></a></div>
                  <div class="item"><a href="${pageContext.request.contextPath}/logout"><div>Logout</div></a></div>
                </div>
              </div>
            </div>
            <div class="container8">
              <div class="heading-6"><div class="stay-inspired">Contact</div></div>
              <div class="horizontal-border">
                <input class="footer-input" type="email" placeholder="Email Address" />
                <button class="footer-btn">→</button>
              </div>
              <div class="container10">
                <a href="mailto:hello@meronepal.com" class="social-link" aria-label="Email" target="_blank">
                  <span class="material-symbols-outlined social-icon">mail</span>
                </a>
                <a href="https://meronepal.com" class="social-link" aria-label="Website" target="_blank">
                  <span class="material-symbols-outlined social-icon">language</span>
                </a>
                <a href="https://instagram.com/yourpage" class="social-link" aria-label="Instagram" target="_blank">
                  <span class="material-symbols-outlined social-icon">photo_camera</span>
                </a>
              </div>
            </div>
          </div>
          <div class="horizontal-border2">
            <div class="container3">
              <div class="_2024-mero-nepal-production-the-modern-auteur">
                © <script>document.write(new Date().getFullYear());</script>
                Mero Nepal Production. The Modern Auteur.
              </div>
            </div>
          </div>
        </div>
        <%-- /footer --%>

      </main>
      <%-- /main --%>

      <!-- RIGHT RAIL -->
      <aside class="hidden md:flex flex-col justify-between p-12 border-l border-white/10 sticky top-0 h-screen">
        <nav class="space-y-6">
          <a href="${pageContext.request.contextPath}/profile"         class="block uppercase active">My Profile</a>
          <a href="${pageContext.request.contextPath}/packages"        class="block uppercase">Bookings</a>
          <hr class="hr" />
          <a href="${pageContext.request.contextPath}/about"           class="block uppercase">About</a>
          <a href="${pageContext.request.contextPath}/blog"            class="block uppercase">Blog</a>
          <a href="${pageContext.request.contextPath}/logout"          class="uppercase btn-secondary mt-4">Logout</a>
        </nav>
      </aside>

    </div>
    <%-- /3-col grid --%>

    <!-- SCRIPTS -->
    <script>
      /* ── Mobile nav toggle ── */
      const toggle = document.getElementById("nav-toggle");
      const drawer = document.getElementById("mobile-nav");
      const bar1   = document.getElementById("bar1");
      const bar2   = document.getElementById("bar2");
      const bar3   = document.getElementById("bar3");
      let isOpen   = false;

      toggle.addEventListener("click", () => {
        isOpen = !isOpen;
        drawer.style.transform = isOpen ? "translateX(0)" : "translateX(100%)";
        bar1.style.transform   = isOpen ? "translateY(6px) rotate(45deg)" : "";
        bar2.style.opacity     = isOpen ? "0" : "1";
        bar3.style.transform   = isOpen ? "translateY(-6px) rotate(-45deg)" : "";
        bar3.style.width       = isOpen ? "24px" : "";
      });
      drawer.querySelectorAll("a").forEach(a =>
        a.addEventListener("click", () => {
          isOpen = false;
          drawer.style.transform     = "translateX(100%)";
          bar1.style.transform = bar3.style.transform = "";
          bar2.style.opacity   = "1";
          bar3.style.width     = "";
        })
      );

      /* ── Client-side field validation (belt-and-suspenders) ── */
      document.getElementById("editProfileForm").addEventListener("submit", function (e) {
        const userName    = document.getElementById("userName");
        const email       = document.getElementById("email");
        const phoneNumber = document.getElementById("phoneNumber");

        let firstError = null;

        /* Reset previous error states */
        [userName, email, phoneNumber].forEach(el => el.classList.remove("input-error"));

        /* Username: not empty */
        if (!userName.value.trim()) {
          userName.classList.add("input-error");
          firstError = firstError || userName;
        }

        /* Email: basic regex */
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!email.value.trim() || !emailRegex.test(email.value.trim())) {
          email.classList.add("input-error");
          firstError = firstError || email;
        }

        /* Phone: exactly 10 digits, starts with 9 */
        const phoneRegex = /^9\d{9}$/;
        if (!phoneNumber.value.trim() || !phoneRegex.test(phoneNumber.value.trim())) {
          phoneNumber.classList.add("input-error");
          firstError = firstError || phoneNumber;
        }

        if (firstError) {
          e.preventDefault();
          firstError.focus();

          /* Inject or update client-side error banner */
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

      /* Phone: strip non-digits on input to keep it clean */
      document.getElementById("phoneNumber").addEventListener("input", function () {
        this.value = this.value.replace(/\D/g, "").slice(0, 10);
      });
    </script>
  </body>
</html>
