<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register — Mero Nepal Production</title>

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
      html {
        scroll-behavior: smooth;
        background-color: #111111;
      }
      .auth-page {
        min-height: 100vh;
        display: grid;
        grid-template-columns: 1fr 1fr;
      }
      .auth-visual {
        position: relative;
        background-image: url("https://images.unsplash.com/photo-1465495976277-4387d4b0b4c6?w=1200&q=80");
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
          rgba(10, 10, 10, 0.6) 0%,
          rgba(201, 168, 76, 0.06) 100%
        );
      }
      .auth-visual::after {
        content: '"Your story begins with a single frame."';
        position: absolute;
        bottom: 48px;
        left: 48px;
        right: 48px;
        font-family: "Cormorant Garamond", Georgia, serif;
        font-style: italic;
        font-size: 1.4rem;
        color: rgba(245, 240, 232, 0.85);
        line-height: 1.5;
        border-left: 3px solid #c9a84c;
        padding-left: 20px;
      }
      .auth-form-side {
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 52px 72px;
        background: #111111;
        overflow-y: auto;
      }
      .auth-logo {
        font-family: "Cormorant Garamond", Georgia, serif;
        font-size: 2rem;
        font-weight: 600;
        color: #f5f0e8;
        text-decoration: none;
        letter-spacing: 0.04em;
        margin-bottom: 40px;
        display: block;
      }
      .auth-logo span {
        color: #c9a84c;
      }
      .auth-title {
        font-family: "Cormorant Garamond", Georgia, serif;
        font-size: 2.2rem;
        font-weight: 400;
        color: #f5f0e8;
        margin-bottom: 6px;
        line-height: 1.15;
      }
      .auth-sub {
        font-size: 14px;
        color: #888880;
        margin-bottom: 32px;
        font-weight: 300;
      }
      .form-group {
        margin-bottom: 18px;
      }
      .form-label {
        display: block;
        font-size: 11px;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        color: #888880;
        margin-bottom: 7px;
      }
      .form-group input[type="text"],
      .form-group input[type="email"],
      .form-group input[type="password"],
      .form-group input[type="tel"] {
        width: 100%;
        background: #1e1e1e;
        border: 1px solid #2a2a2a;
        color: #f5f0e8;
        border-radius: 6px;
        padding: 12px 16px;
        font-size: 14px;
        font-family: "Outfit", sans-serif;
        outline: none;
        transition:
          border-color 0.3s ease,
          background 0.3s ease;
        box-sizing: border-box;
      }
      .form-group input:focus {
        border-color: #c9a84c;
        background: #222222;
      }
      .form-group input::placeholder {
        color: #444440;
      }

      /* Error state on input */
      .form-group input.input-error { border-color: #e74c3c !important; }

      /* Per-field error text shown below input */
      .field-error {
        display: flex;
        align-items: center;
        gap: 5px;
        font-size: 12px;
        color: #e74c3c;
        margin-top: 5px;
        animation: errIn 0.25s ease forwards;
      }
      .field-error .material-symbols-outlined { font-size: 14px; }
      @keyframes errIn {
        from { opacity: 0; transform: translateY(-4px); }
        to   { opacity: 1; transform: translateY(0); }
      }

      /* Duplicate / server error banner */
      .error-banner {
        display: flex; align-items: center; gap: 10px;
        padding: 12px 16px; margin-bottom: 20px;
        border-radius: 6px;
        background: rgba(231,76,60,0.1);
        border: 1px solid rgba(231,76,60,0.35);
        border-left: 3px solid #e74c3c;
        animation: errIn 0.3s ease forwards;
      }
      .error-banner .material-symbols-outlined { font-size: 18px; color: #e74c3c; flex-shrink: 0; }
      .error-banner-msg { flex: 1; font-size: 13.5px; color: #f08080; line-height: 1.4; }
      .error-banner-login { font-size: 13px; color: #c9a84c; text-decoration: none; white-space: nowrap; }
      .error-banner-login:hover { text-decoration: underline; }
      .error-banner-close {
        background: none; border: none; color: #666660;
        cursor: pointer; font-size: 14px; padding: 0;
        flex-shrink: 0; transition: color 0.2s; line-height: 1;
      }
      .error-banner-close:hover { color: #f5f0e8; }

      .form-hint {
        font-size: 11px;
        color: #555550;
        margin-top: 5px;
      }
      .password-wrapper {
        position: relative;
        display: flex;
        align-items: center;
      }
      .password-wrapper input {
        width: 100%;
      }
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
      .toggle-password:hover {
        color: #c9a84c;
      }
      .form-error {
        font-size: 12px;
        color: #e74c3c;
        margin-top: 5px;
        margin-bottom: 4px;
        display: none;
      }
      .terms-row {
        display: flex;
        align-items: flex-start;
        gap: 10px;
        margin-bottom: 28px;
        margin-top: 4px;
      }
      .terms-row input[type="checkbox"] {
        width: 16px;
        height: 16px;
        margin-top: 2px;
        accent-color: #c9a84c;
        flex-shrink: 0;
        cursor: pointer;
      }
      .terms-row label {
        font-size: 13px;
        color: #888880;
        cursor: pointer;
        line-height: 1.5;
      }
      .terms-row label a {
        color: #c9a84c;
        text-decoration: none;
      }
      .terms-row label a:hover {
        text-decoration: underline;
      }
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
        transition:
          background 0.3s ease,
          transform 0.2s ease,
          box-shadow 0.3s ease;
      }
      .btn-submit:hover {
        background: #e2c07a;
        transform: translateY(-1px);
        box-shadow: 0 4px 20px rgba(201, 168, 76, 0.3);
      }
      .btn-submit:active {
        transform: translateY(0);
      }
      .btn-submit.shake { animation: shake 0.4s cubic-bezier(0.36,0.07,0.19,0.97) both; }
      @keyframes shake {
        10%, 90% { transform: translateX(-2px); }
        20%, 80% { transform: translateX(4px); }
        30%, 50%, 70% { transform: translateX(-4px); }
        40%, 60% { transform: translateX(4px); }
      }
      .form-divider {
        display: flex;
        align-items: center;
        gap: 16px;
        color: #555550;
        font-size: 12px;
        margin: 24px 0;
      }
      .form-divider::before,
      .form-divider::after {
        content: "";
        flex: 1;
        height: 1px;
        background: #2a2a2a;
      }
      .btn-signin {
        display: block;
        width: 100%;
        padding: 13px;
        background: transparent;
        border: 1px solid #2a2a2a;
        color: #f5f0e8;
        border-radius: 6px;
        font-family: "Outfit", sans-serif;
        font-size: 13px;
        font-weight: 500;
        letter-spacing: 0.06em;
        text-transform: uppercase;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        transition:
          border-color 0.3s ease,
          color 0.3s ease;
        box-sizing: border-box;
      }
      .btn-signin:hover {
        border-color: #c9a84c;
        color: #c9a84c;
      }
      .success-msg {
        display: none;
        margin-top: 16px;
        padding: 12px;
        background: #1a3a1a;
        color: #2ecc71;
        border-radius: 6px;
        text-align: center;
        font-size: 13px;
      }
      .error-msg {
        display: none;
        margin-top: 16px;
        padding: 12px;
        background: #3a1a1a;
        color: #e74c3c;
        border-radius: 6px;
        text-align: center;
        font-size: 13px;
      }
      @media (max-width: 900px) {
        .auth-page {
          grid-template-columns: 1fr;
        }
        .auth-visual {
          display: none;
        }
        .auth-form-side {
          padding: 48px 32px;
        }
      }
      @media (max-width: 600px) {
        .auth-form-side {
          padding: 36px 20px;
        }
        .auth-title {
          font-size: 1.8rem;
        }
      }
    </style>
  </head>
  <body>
    <div class="auth-page">
      <div class="auth-visual"></div>
      <div class="auth-form-side">
        <a href="${pageContext.request.contextPath}/home" class="auth-logo">Mero Nepal Production<span>.</span></a>
        <h2 class="auth-title">Create Account</h2>
        <p class="auth-sub">Join Mero Nepal Production to book packages and track your sessions.</p>
        <c:if test="${not empty duplicateError}">
          <div class="error-banner" role="alert">
            <span class="material-symbols-outlined">error</span>
            <span class="error-banner-msg">${duplicateError}</span>
            <a href="login" class="error-banner-login">Sign in →</a>
            <button class="error-banner-close" onclick="this.closest('.error-banner').remove()" aria-label="Dismiss">✕</button>
          </div>
        </c:if>

        <c:if test="${not empty error and empty duplicateError}">
          <div class="error-banner" role="alert">
            <span class="material-symbols-outlined">error</span>
            <span class="error-banner-msg">${error}</span>
            <button class="error-banner-close" onclick="this.closest('.error-banner').remove()" aria-label="Dismiss">✕</button>
          </div>
        </c:if>

        <form action="register" method="POST" id="registerForm">

          <div class="form-group">
            <label class="form-label">Username</label>
            <input type="text" name="username"
                   placeholder="Enter your name"
                   value="${not empty prevUserName ? prevUserName : ''}"
                   class="${not empty erUser ? 'input-error' : ''}"
                   required />
            <c:if test="${not empty erUser}">
              <div class="field-error">
                <span class="material-symbols-outlined">error</span>${erUser}
              </div>
            </c:if>
          </div>

          <div class="form-group">
            <label class="form-label">Email Address</label>
            <input type="email" name="email"
                   placeholder="you@example.com"
                   value="${not empty prevEmail ? prevEmail : ''}"
                   class="${not empty erMail ? 'input-error' : ''}"
                   required />
            <c:if test="${not empty erMail}">
              <div class="field-error">
                <span class="material-symbols-outlined">error</span>${erMail}
              </div>
            </c:if>
          </div>

          <div class="form-group">
            <label class="form-label">Phone Number</label>
            <input type="tel" name="phoneNumber"
                   placeholder="+977 98XXXXXXXX"
                   value="${not empty prevPhone ? prevPhone : ''}"
                   class="${not empty erNum ? 'input-error' : ''}"
                   required />
            <c:if test="${not empty erNum}">
              <div class="field-error">
                <span class="material-symbols-outlined">error</span>${erNum}
              </div>
            </c:if>
          </div>

          <div class="form-group">
            <label class="form-label">Password</label>
            <div class="password-wrapper">
              <input type="password" name="password" id="regPass"
                     placeholder="••••••••"
                     class="${not empty erPass ? 'input-error' : ''}"
                     required />
              <button type="button" class="toggle-password" onclick="togglePassword('regPass', this)" aria-label="Toggle password visibility">
                <span class="material-symbols-outlined">visibility</span>
              </button>
            </div>
            <c:if test="${not empty erPass}">
              <div class="field-error">
                <span class="material-symbols-outlined">error</span>${erPass}
              </div>
            </c:if>
            <c:if test="${empty erPass}">
              <div class="form-hint">Min. 8 chars, 1 uppercase, 1 number, 1 special character.</div>
            </c:if>
          </div>

          <div class="form-group">
            <label class="form-label">Confirm Password</label>
            <div class="password-wrapper">
              <input type="password" name="confirmPassword" id="regConfirm"
                     placeholder="••••••••"
                     class="${not empty erCon ? 'input-error' : ''}"
                     required />
              <button type="button" class="toggle-password" onclick="togglePassword('regConfirm', this)" aria-label="Toggle password visibility">
                <span class="material-symbols-outlined">visibility</span>
              </button>
            </div>
            <c:if test="${not empty erCon}">
              <div class="field-error">
                <span class="material-symbols-outlined">error</span>${erCon}
              </div>
            </c:if>
          </div>

          <div class="terms-row">
            <input type="checkbox" id="terms" name="terms" required />
            <label for="terms">I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>.</label>
          </div>

          <button type="submit" class="btn-submit" id="submitBtn">Create Account</button>
        </form>

        <div class="form-divider">already have an account?</div>
        <a href="${pageContext.request.contextPath}/login" class="btn-signin">Sign In Instead</a>
      </div>
    </div>

    <script>
      // Toggle password visibility
      function togglePassword(fieldId, btn) {
        const field = document.getElementById(fieldId);
        const icon  = btn.querySelector('.material-symbols-outlined');
        if (field.type === 'password') {
          field.type = 'text';
          icon.textContent = 'visibility_off';
        } else {
          field.type = 'password';
          icon.textContent = 'visibility';
        }
      }

      // Client-side quick check before submit
      document.getElementById('registerForm').addEventListener('submit', function (e) {
        const pass    = document.getElementById('regPass').value;
        const confirm = document.getElementById('regConfirm').value;
        if (pass !== confirm) {
          e.preventDefault();
          document.getElementById('regConfirm').classList.add('input-error');
          document.getElementById('regConfirm').focus();
          return false;
        }
      });

      // Shake submit button if server returned any errors
      document.addEventListener('DOMContentLoaded', function () {
        const hasFieldError = document.querySelector('.field-error');
        const hasBanner     = document.querySelector('.error-banner');
        if (hasFieldError || hasBanner) {
          const btn = document.getElementById('submitBtn');
          btn.classList.add('shake');
          btn.addEventListener('animationend', () => btn.classList.remove('shake'), { once: true });
        }
      });

      // Clear red border when user starts retyping
      document.querySelectorAll('.input-error').forEach(function (el) {
        el.addEventListener('input', function () {
          this.classList.remove('input-error');
        }, { once: true });
      });
    </script>
  </body>
</html>
