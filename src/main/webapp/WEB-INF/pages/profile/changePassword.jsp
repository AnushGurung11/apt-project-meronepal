<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Change Password — Mero Nepal Production</title>

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
        padding: 14px 48px 14px 16px;
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
      .form-hint.hint-error { color: #e57373; }

      .form-divider { height: 1px; background: var(--border); margin: 32px 0; }

      .password-wrap { position: relative; }
      .toggle-btn {
        position: absolute;
        right: 14px; top: 50%; transform: translateY(-50%);
        background: none; border: none; cursor: pointer;
        color: var(--muted);
        display: flex; align-items: center; padding: 0;
        transition: color var(--transition); line-height: 1;
      }
      .toggle-btn:hover { color: var(--gold); }
      .toggle-btn .material-symbols-outlined {
        font-size: 18px; user-select: none;
      }

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

      .strength-track {
        height: 3px; background: var(--border);
        border-radius: 2px; margin-top: 10px; overflow: hidden;
      }
      .strength-fill {
        height: 100%; border-radius: 2px; width: 0%;
        transition: width 0.35s ease, background 0.35s ease;
      }
      .strength-label {
        font-size: 10px; letter-spacing: 0.1em; text-transform: uppercase;
        color: var(--muted); margin-top: 5px;
      }

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

      .req-list {
        list-style: none;
        display: flex; flex-direction: column; gap: 6px;
        margin-top: 16px;
      }
      .req-list li {
        display: flex; align-items: center; gap: 8px;
        font-size: 12px; color: var(--muted);
        transition: color 0.25s;
      }
      .req-list li .dot {
        width: 6px; height: 6px; border-radius: 50%;
        background: var(--border); flex-shrink: 0;
        transition: background 0.25s;
      }
      .req-list li.met { color: #34c759; }
      .req-list li.met .dot { background: #34c759; }

      .modal-overlay {
        display: none; position: fixed; inset: 0;
        background: rgba(0,0,0,0.72);
        z-index: 200;
        align-items: center; justify-content: center;
        backdrop-filter: blur(4px);
      }
      .modal-overlay.active { display: flex; }
      .modal-box {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        padding: 40px 36px;
        max-width: 400px; width: calc(100% - 40px);
        text-align: center;
      }
      .modal-icon {
        width: 48px; height: 48px; border-radius: 50%;
        background: var(--gold-dim);
        border: 1px solid rgba(201,168,76,0.3);
        display: flex; align-items: center; justify-content: center;
        margin: 0 auto 20px;
        color: var(--gold); font-size: 22px;
      }
      .modal-title {
        font-family: var(--font-display);
        font-size: 1.4rem; font-weight: 400;
        margin-bottom: 10px;
      }
      .modal-body {
        font-size: 13px; color: #b0aa9f;
        margin-bottom: 28px; line-height: 1.6;
      }
      .modal-actions { display: flex; gap: 12px; }
      .modal-actions .btn { flex: 1; justify-content: center; }

      @media (max-width: 768px) {
        .profile-wrapper { padding: 24px 20px; }
        .modal-box { padding: 28px 20px; }
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

    <!-- ── CONFIRM MODAL ── -->
    <div id="confirmModal" class="modal-overlay" role="dialog" aria-modal="true" aria-labelledby="modalTitle">
      <div class="modal-box">
        <div class="modal-icon">
          <span class="material-symbols-outlined" style="font-size:22px;">lock_reset</span>
        </div>
        <div class="modal-title" id="modalTitle">Confirm Password Change</div>
        <p class="modal-body">
          Are you sure you want to update your password?<br/>
          You will continue to stay logged in.
        </p>
        <div class="modal-actions">
          <button type="button" id="modalCancel" class="btn btn-ghost">Cancel</button>
          <button type="button" id="modalConfirm" class="btn btn-gold">Yes, Update ✦</button>
        </div>
      </div>
    </div>

    <!-- ── MAIN 3-COLUMN LAYOUT ── -->
    <div class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10">
      <%@ include file="/WEB-INF/pages/components/left-rail-auth.jsp" %>

      <main class="pt-14 md:pt-0">
        <div class="profile-wrapper">

          <a href="${pageContext.request.contextPath}/profile" class="btn-back">← Back to Profile</a>

          <div class="page-header">
            <div class="section-label">Account Security</div>
            <h2>Change Password</h2>
            <p style="margin-top:8px;">Enter a new password below. Make it strong and keep it safe.</p>
          </div>

          <c:if test="${not empty erPass or not empty erCon}">
            <div class="alert alert-error">
              <c:if test="${not empty erPass}"><c:out value="${erPass}"/></c:if>
              <c:if test="${not empty erCon}"><c:out value="${erCon}"/></c:if>
            </div>
          </c:if>
          <c:if test="${not empty errorMessage}">
            <div class="alert alert-error"><c:out value="${errorMessage}"/></div>
          </c:if>
          <c:if test="${not empty success}">
            <div class="alert alert-success"><c:out value="${success}"/></div>
          </c:if>

          <div class="grid md:grid-cols-[1fr_300px] gap-8 items-start">

            <!-- LEFT: FORM CARD -->
            <div class="profile-card">
              <div class="section-label">New Password</div>
              <h3 style="margin-bottom:8px;">Set a New Password</h3>
              <p style="font-size:13px;color:#b0aa9f;margin-bottom:32px;">
                Both fields are required. Changes take effect immediately.
              </p>

              <form action="${pageContext.request.contextPath}/profile/changePassword"
                    method="post" id="changePasswordForm" novalidate>

                <div class="form-group">
                  <label class="form-label" for="password">New Password</label>
                  <div class="password-wrap">
                    <input
                      class="form-input ${not empty erPass ? 'input-error' : ''}"
                      type="password"
                      id="password"
                      name="password"
                      placeholder="Enter new password"
                      required
                      autocomplete="new-password" />
                    <button type="button" class="toggle-btn" data-target="password" aria-label="Toggle password visibility">
                      <span class="material-symbols-outlined">visibility</span>
                    </button>
                  </div>
                  <div class="strength-track">
                    <div class="strength-fill" id="strengthFill"></div>
                  </div>
                  <div class="strength-label" id="strengthLabel">—</div>
                  <c:if test="${not empty erPass}">
                    <span class="form-hint hint-error"><c:out value="${erPass}"/></span>
                  </c:if>
                </div>

                <div class="form-group">
                  <label class="form-label" for="confirmPassword">Confirm Password</label>
                  <div class="password-wrap">
                    <input
                      class="form-input ${not empty erCon ? 'input-error' : ''}"
                      type="password"
                      id="confirmPassword"
                      name="confirmPassword"
                      placeholder="Re-enter new password"
                      required
                      autocomplete="new-password" />
                    <button type="button" class="toggle-btn" data-target="confirmPassword" aria-label="Toggle confirm password visibility">
                      <span class="material-symbols-outlined">visibility</span>
                    </button>
                  </div>
                  <span class="form-hint" id="matchHint"></span>
                  <c:if test="${not empty erCon}">
                    <span class="form-hint hint-error"><c:out value="${erCon}"/></span>
                  </c:if>
                </div>

                <div class="form-divider"></div>

                <div style="display:flex;gap:12px;flex-wrap:wrap;">
                  <button type="submit" class="btn btn-gold" style="flex:1;justify-content:center;">
                    Update Password ✦
                  </button>
                  <a href="${pageContext.request.contextPath}/profile"
                     class="btn btn-ghost" style="flex:1;justify-content:center;">
                    Cancel
                  </a>
                </div>

                <p style="font-size:11px;color:var(--muted);text-align:center;margin-top:16px;letter-spacing:0.04em;">
                  Other profile details are managed on the
                  <a href="${pageContext.request.contextPath}/profile/update" style="color:var(--gold);">Edit Profile</a> page.
                </p>
              </form>
            </div>

            <!-- RIGHT: REQUIREMENTS CARD -->
            <div class="profile-card" style="position:sticky;top:32px;">
              <div class="section-label" style="margin-bottom:14px;">Requirements</div>
              <h3 style="margin-bottom:8px;">Password Rules</h3>
              <p style="font-size:13px;color:#b0aa9f;margin-bottom:4px;">
                Your password must meet all of the following:
              </p>

              <ul class="req-list" id="reqList">
                <li id="req-length"  data-rule="length"><span class="dot"></span> At least 8 characters</li>
                <li id="req-upper"   data-rule="upper"><span class="dot"></span> One uppercase letter</li>
                <li id="req-number"  data-rule="number"><span class="dot"></span> One number</li>
                <li id="req-special" data-rule="special"><span class="dot"></span> One special character</li>
                <li id="req-match"   data-rule="match"><span class="dot"></span> Passwords match</li>
              </ul>

              <div class="info-box">
                <strong>Tip:</strong> Never reuse old passwords, and avoid personal info like your name or birthday.
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
      /* ── Password visibility toggles ── */
      document.querySelectorAll(".toggle-btn").forEach(btn => {
        btn.addEventListener("click", function () {
          const target = document.getElementById(this.dataset.target);
          const icon   = this.querySelector(".material-symbols-outlined");
          if (target.type === "password") {
            target.type = "text";
            icon.textContent = "visibility_off";
          } else {
            target.type = "password";
            icon.textContent = "visibility";
          }
        });
      });

      /* ── Live requirement checklist + strength bar ── */
      const passwordInput = document.getElementById("password");
      const confirmInput  = document.getElementById("confirmPassword");
      const strengthFill  = document.getElementById("strengthFill");
      const strengthLabel = document.getElementById("strengthLabel");
      const matchHint     = document.getElementById("matchHint");

      const rules = {
        length:  v => v.length >= 8,
        upper:   v => /[A-Z]/.test(v),
        number:  v => /[0-9]/.test(v),
        special: v => /[^A-Za-z0-9]/.test(v),
      };

      const strengthConfig = [
        { label: "—",      color: "transparent", pct: 0   },
        { label: "Weak",   color: "#c0392b",      pct: 25  },
        { label: "Fair",   color: "#e67e22",      pct: 50  },
        { label: "Good",   color: "#f1c40f",      pct: 75  },
        { label: "Strong", color: "#34c759",      pct: 100 },
      ];

      function updateRequirements() {
        const val     = passwordInput.value;
        const confVal = confirmInput.value;
        let score     = 0;

        Object.entries(rules).forEach(([rule, fn]) => {
          const li  = document.getElementById("req-" + rule);
          const met = fn(val);
          li.classList.toggle("met", met);
          if (met) score++;
        });

        const matchLi = document.getElementById("req-match");
        const matched = val.length > 0 && val === confVal;
        matchLi.classList.toggle("met", matched);

        const cfg = strengthConfig[score] || strengthConfig[0];
        strengthFill.style.width      = cfg.pct + "%";
        strengthFill.style.background = cfg.color;
        strengthLabel.textContent     = val.length === 0 ? "—" : cfg.label;

        if (confVal.length === 0) {
          matchHint.textContent  = "";
          matchHint.style.color  = "";
        } else if (matched) {
          matchHint.textContent  = "✓ Passwords match";
          matchHint.style.color  = "#34c759";
        } else {
          matchHint.textContent  = "✗ Passwords do not match";
          matchHint.style.color  = "#e57373";
        }
      }

      passwordInput.addEventListener("input", updateRequirements);
      confirmInput.addEventListener("input",  updateRequirements);

      /* ── Client-side validation ── */
      function clientValidate() {
        const val     = passwordInput.value.trim();
        const confVal = confirmInput.value.trim();
        let firstError = null;

        passwordInput.classList.remove("input-error");
        confirmInput.classList.remove("input-error");

        const allRulesMet = Object.values(rules).every(fn => fn(val));
        if (!val || !allRulesMet) {
          passwordInput.classList.add("input-error");
          firstError = passwordInput;
        }
        if (!confVal || val !== confVal) {
          confirmInput.classList.add("input-error");
          firstError = firstError || confirmInput;
        }

        if (firstError) {
          firstError.focus();
          let banner = document.querySelector(".client-error-banner");
          if (!banner) {
            banner = document.createElement("div");
            banner.className = "alert alert-error client-error-banner";
            document.getElementById("changePasswordForm").prepend(banner);
          }
          banner.textContent = "Please fix the highlighted fields before continuing.";
          banner.scrollIntoView({ behavior: "smooth", block: "center" });
          return false;
        }
        return true;
      }

      /* ── Confirm modal ── */
      const modal        = document.getElementById("confirmModal");
      const modalCancel  = document.getElementById("modalCancel");
      const modalConfirm = document.getElementById("modalConfirm");
      const form         = document.getElementById("changePasswordForm");

      form.addEventListener("submit", function (e) {
        e.preventDefault();
        if (clientValidate()) modal.classList.add("active");
      });
      modalCancel.addEventListener("click", () => modal.classList.remove("active"));
      modalConfirm.addEventListener("click", () => {
        modal.classList.remove("active");
        form.submit();
      });
      modal.addEventListener("click", function (e) {
        if (e.target === this) this.classList.remove("active");
      });
      document.addEventListener("keydown", e => {
        if (e.key === "Escape") modal.classList.remove("active");
      });
    </script>
  </body>
</html>
