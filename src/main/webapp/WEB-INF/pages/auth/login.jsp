<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login — Mero Nepal Production</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;900&family=Playfair+Display:ital,wght@0,400;1,400&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
      rel="stylesheet"
    />
<<<<<<< HEAD
    <link
      rel="icon"
      type="image/x-icon"
      href="${pageContext.request.contextPath}/assets/img/favicon.ico"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css" />
=======
    <link rel="icon" type="image/x-icon" href="../../../assets/img/favicon.ico" />
    <link rel="stylesheet" href="../../../assets/css/styles.css" />

>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
    <style>
      /* ── Login Page — Internal Styles ───────────────────────── */
      html {
        scroll-behavior: smooth;
        background-color: #111111;
      }

      /* ── Split Layout ────────────────────────────────────────── */
      .auth-page {
        min-height: 100vh;
        display: grid;
        grid-template-columns: 1fr 1fr;
      }

      /* Left visual panel */
      .auth-visual {
        position: relative;
        background-image: url("https://images.unsplash.com/photo-1606216794074-735e91aa2c92?w=1200&q=80");
        background-size: cover;
        background-position: center;
        overflow: hidden;
      }
      .auth-visual::before {
        content: "";
        position: absolute;
        inset: 0;
        background: linear-gradient(
          135deg,
          rgba(10, 10, 10, 0.55) 0%,
          rgba(201, 168, 76, 0.08) 100%
        );
      }
      .auth-visual::after {
        content: '"Every frame tells a story."';
        position: absolute;
        bottom: 48px;
        left: 48px;
        right: 48px;
        font-family: "Cormorant Garamond", Georgia, serif;
        font-style: italic;
        font-size: 1.5rem;
        color: rgba(245, 240, 232, 0.85);
        line-height: 1.5;
        border-left: 3px solid #c9a84c;
        padding-left: 20px;
      }

      /* Right form panel */
      .auth-form-side {
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 60px 72px;
        background: #111111;
        overflow-y: auto;
      }

      /* Logo */
      .auth-logo {
        font-family: "Cormorant Garamond", Georgia, serif;
        font-size: 2rem;
        font-weight: 600;
        color: #f5f0e8;
        text-decoration: none;
        letter-spacing: 0.04em;
        margin-bottom: 52px;
        display: block;
      }
      .auth-logo span { color: #c9a84c; }

      /* Heading block */
      .auth-title {
        font-family: "Cormorant Garamond", Georgia, serif;
        font-size: 2.4rem;
        font-weight: 400;
        color: #f5f0e8;
        margin-bottom: 8px;
        line-height: 1.15;
      }
      .auth-sub {
        font-size: 14px;
        color: #888880;
        margin-bottom: 36px;
        font-weight: 300;
      }

      /* Form fields */
      .form-group { margin-bottom: 20px; }
      .form-label {
        display: block;
        font-size: 11px;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        color: #888880;
        margin-bottom: 8px;
      }
      .form-group input {
        width: 100%;
        background: #222222;
        border: 1px solid #2a2a2a;
        color: #f5f0e8;
        border-radius: 6px;
        padding: 13px 16px;
        font-size: 14px;
        font-family: "Outfit", sans-serif;
        outline: none;
        transition: border-color 0.3s ease;
        box-sizing: border-box;
      }
      .form-group input:focus { border-color: #c9a84c; }
      .form-group input::placeholder { color: #555550; }

      /* Input error state */
      .form-group input.input-error { border-color: #e74c3c; }

<<<<<<< HEAD
      /* Password wrapper with eye icon */
=======
      /* Password wrapper */
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
      .password-wrapper {
        position: relative;
        display: flex;
        align-items: center;
      }
      .password-wrapper input { width: 100%; }
      .toggle-password {
        position: absolute;
        right: 12px;
        cursor: pointer;
        color: #888880;
        font-size: 20px;
        transition: color 0.3s ease;
        user-select: none;
        border: none;
        background: none;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      .toggle-password:hover { color: #c9a84c; }

      /* Forgot password row */
      .login-forgot {
        display: flex;
        justify-content: flex-end;
        margin-bottom: 24px;
      }
      .login-forgot a {
        font-size: 13px;
        color: #c9a84c;
        text-decoration: none;
        transition: opacity 0.2s;
      }
      .login-forgot a:hover { opacity: 0.75; }

      /* Submit button */
      .btn-submit {
        width: 100%;
        padding: 14px;
        background: #c9a84c;
        color: #0a0a0a;
        border: none;
        border-radius: 6px;
        font-family: "Outfit", sans-serif;
        font-size: 13px;
        font-weight: 600;
        letter-spacing: 0.1em;
        text-transform: uppercase;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
      }
      .btn-submit:hover {
        background: #e2c07a;
        transform: translateY(-1px);
        box-shadow: 0 4px 20px rgba(201, 168, 76, 0.3);
      }
      .btn-submit:active { transform: translateY(0); }
      /* Shake animation on error */
      .btn-submit.shake {
        animation: shake 0.4s cubic-bezier(0.36, 0.07, 0.19, 0.97) both;
      }
<<<<<<< HEAD
      /* Shake animation on error */
      .btn-submit.shake {
        animation: shake 0.4s cubic-bezier(0.36, 0.07, 0.19, 0.97) both;
      }
=======
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
      @keyframes shake {
        10%, 90% { transform: translateX(-2px); }
        20%, 80% { transform: translateX(4px); }
        30%, 50%, 70% { transform: translateX(-4px); }
        40%, 60% { transform: translateX(4px); }
<<<<<<< HEAD
      }

      /* Error message */
      .form-error {
        font-size: 12px;
        color: #e74c3c;
        margin-top: 6px;
        display: none;
=======
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
      }

      /* Inline error banner */
      .error-banner {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 12px 16px;
        margin-bottom: 20px;
        border-radius: 6px;
        background: rgba(231, 76, 60, 0.1);
        border: 1px solid rgba(231, 76, 60, 0.35);
        border-left: 3px solid #e74c3c;
        animation: bannerIn 0.3s ease forwards;
      }
      @keyframes bannerIn {
        from { opacity: 0; transform: translateY(-6px); }
        to   { opacity: 1; transform: translateY(0); }
      }
      .error-banner-icon { font-size: 18px; color: #e74c3c; flex-shrink: 0; }
      .error-banner-msg { flex: 1; font-size: 13.5px; color: #f08080; line-height: 1.4; }
      .error-banner-close {
        background: none; border: none; color: #666660;
        cursor: pointer; font-size: 14px; padding: 0;
        flex-shrink: 0; transition: color 0.2s; line-height: 1;
      }
      .error-banner-close:hover { color: #f5f0e8; }

      /* Divider */
      .form-divider {
        display: flex;
        align-items: center;
        gap: 16px;
        color: #555550;
        font-size: 12px;
        margin: 28px 0;
      }
      .form-divider::before,
      .form-divider::after {
        content: "";
        flex: 1;
        height: 1px;
        background: #2a2a2a;
      }

      /* Register link */
      .auth-switch {
        text-align: center;
        font-size: 14px;
        color: #888880;
      }
      .auth-switch a {
        color: #c9a84c;
        text-decoration: none;
        font-weight: 500;
      }
      .auth-switch a:hover { text-decoration: underline; }

      /* ── Inline error banner ─────────────────────────────────── */
      .error-banner {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 12px 16px;
        margin-bottom: 20px;
        border-radius: 6px;
        background: rgba(231, 76, 60, 0.1);
        border: 1px solid rgba(231, 76, 60, 0.35);
        border-left: 3px solid #e74c3c;
        animation: bannerIn 0.3s ease forwards;
      }
      @keyframes bannerIn {
        from { opacity: 0; transform: translateY(-6px); }
        to   { opacity: 1; transform: translateY(0); }
      }
      .error-banner-icon {
        font-size: 18px;
        color: #e74c3c;
        flex-shrink: 0;
      }
      .error-banner-msg {
        flex: 1;
        font-size: 13.5px;
        color: #f08080;
        line-height: 1.4;
      }
      .error-banner-close {
        background: none;
        border: none;
        color: #666660;
        cursor: pointer;
        font-size: 14px;
        padding: 0;
        flex-shrink: 0;
        transition: color 0.2s;
        line-height: 1;
      }
      .error-banner-close:hover { color: #f5f0e8; }

      /* Booking redirect alert */
      .alert-info {
        padding: 12px 18px;
        border-radius: 6px;
        font-size: 14px;
        margin-bottom: 20px;
        background: rgba(201, 168, 76, 0.1);
        border-left: 3px solid #c9a84c;
        color: #c9a84c;
      }

      /* ── Responsive ──────────────────────────────────────────── */
      @media (max-width: 900px) {
        .auth-page { grid-template-columns: 1fr; }
        .auth-visual { display: none; }
        .auth-form-side { padding: 48px 32px; }
      }
      @media (max-width: 480px) {
        .auth-form-side { padding: 36px 20px; }
        .auth-title { font-size: 2rem; }
      }
    </style>
  </head>
  <body>

    <div class="auth-page">
      <div class="auth-visual"></div>
      <div class="auth-form-side">
<<<<<<< HEAD
        <a href="${pageContext.request.contextPath}/home" class="auth-logo"
          >Mero Nepal Production<span>.</span></a
        >
        <h2 class="auth-title">Welcome Back</h2>
        <p class="auth-sub">Sign in to manage your bookings and profile.</p>

=======

        <a href="home" class="auth-logo">Mero Nepal Production<span>.</span></a>

        <h2 class="auth-title">Welcome Back</h2>
        <p class="auth-sub">Sign in to manage your bookings and profile.</p>

        <%-- ── Inline error banner (primary, always visible) ── --%>
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
        <c:if test="${not empty error}">
          <div class="error-banner" id="inlineError" role="alert">
            <span class="material-symbols-outlined error-banner-icon">error</span>
            <span class="error-banner-msg">${error}</span>
            <button class="error-banner-close" onclick="this.closest('.error-banner').remove()" aria-label="Dismiss">✕</button>
          </div>
        </c:if>

<<<<<<< HEAD
=======
        <!-- Booking redirect alert — shown only when ?redirect=booking -->
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
        <c:if test="${param.redirect eq 'booking'}">
          <div class="alert-info">
            Please log in or register to book a package.
          </div>
        </c:if>

        <form action="login" method="POST" id="loginForm">
<<<<<<< HEAD
          <div class="form-group">
            <label class="form-label" for="loginEmail">Email</label>
            <input
              type="email"
              placeholder="your@example.com"
=======
          <!-- FIX: field name changed from "username" to "email"
               so it matches request.getParameter("email") in LoginServlet -->
          <div class="form-group">
            <label class="form-label" for="loginEmail">Email Address</label>
            <input
              type="email"
              placeholder="you@example.com"
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
              id="loginEmail"
              name="email"
              required
              autocomplete="email"
            />
          </div>

          <div class="form-group">
            <label class="form-label" for="loginPassword">Password</label>
            <div class="password-wrapper">
              <input
                type="password"
                placeholder="••••••••"
                id="loginPassword"
                name="password"
                required
                autocomplete="current-password"
              />
<<<<<<< HEAD
              <button type="button" class="toggle-password" onclick="togglePassword('loginPassword', this)" aria-label="Toggle password visibility">
=======
              <button
                type="button"
                class="toggle-password"
                onclick="togglePassword('loginPassword', this)"
                aria-label="Toggle password visibility"
              >
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
                <span class="material-symbols-outlined">visibility</span>
              </button>
            </div>
          </div>

          <div class="login-forgot">
            <a href="#">Forgot password?</a>
          </div>
<<<<<<< HEAD
=======

>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
          <button type="submit" class="btn-submit" id="submitBtn">Sign In</button>
        </form>

        <div class="form-divider">or</div>
        <p class="auth-switch">
          Don't have an account? <a href="${pageContext.request.contextPath}/register">Create one →</a>
        </p>
      </div>
    </div>

    <script>
<<<<<<< HEAD
      // On page load — highlight inputs and shake button if error
      document.addEventListener('DOMContentLoaded', function () {
        const hasError = document.getElementById('inlineError');
        if (hasError) {
          document.getElementById('loginEmail').classList.add('input-error');
          document.getElementById('loginPassword').classList.add('input-error');

=======
      /* ─────────────────────────────────────────────────────────
       * On page load — highlight inputs and shake button if error
       * ───────────────────────────────────────────────────────── */
      document.addEventListener('DOMContentLoaded', function () {
        const hasError = document.getElementById('inlineError');
        if (hasError) {
          // Highlight the input fields
          document.getElementById('loginEmail').classList.add('input-error');
          document.getElementById('loginPassword').classList.add('input-error');

          // Shake the submit button for tactile feedback
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
          const btn = document.getElementById('submitBtn');
          btn.classList.add('shake');
          btn.addEventListener('animationend', () => btn.classList.remove('shake'), { once: true });
        }
      });

<<<<<<< HEAD
      // Toggle password visibility - shows/hides password text
=======
      /* ─────────────────────────────────────────────────────────
       * Toggle password visibility
       * ───────────────────────────────────────────────────────── */
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
      function togglePassword(fieldId, btn) {
        const field = document.getElementById(fieldId);
        const icon  = btn.querySelector('.material-symbols-outlined');
        if (field.type === 'password') {
          field.type      = 'text';
          icon.textContent = 'visibility_off';
        } else {
          field.type      = 'password';
          icon.textContent = 'visibility';
        }
      }

<<<<<<< HEAD
      // Clear input-error highlight when user starts retyping
=======
      /* ─────────────────────────────────────────────────────────
       * Clear input-error highlight when user starts retyping
       * ───────────────────────────────────────────────────────── */
>>>>>>> 87f3a87 (Adding Error Handeling in Register and login)
      ['loginEmail', 'loginPassword'].forEach(function (id) {
        document.getElementById(id).addEventListener('input', function () {
          this.classList.remove('input-error');
        });
      });
    </script>

  </body>
</html>
