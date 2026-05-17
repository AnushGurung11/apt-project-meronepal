<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <form action = "register" method = "POST">
        <div class="form-group">
          <label class="form-label">Username</label>
          <input type="text" name="username" placeholder="Enter your name" required />
        </div>

        <div class="form-group">
          <label class="form-label">Email Address</label>
          <input type="email" name="email" placeholder="you@example.com" required />
        </div>

        <div class="form-group">
          <label class="form-label">Phone Number</label>
          <input type="tel" name="phoneNumber" placeholder="+977 98XXXXXXXX" required />
        </div>

        <div class="form-group">
          <label class="form-label">Password</label>
          <div class="password-wrapper">
            <input type="password" name="password" id="regPass" placeholder="••••••••" required />
            <button type="button" class="toggle-password" onclick="togglePassword('regPass')">
              <span class="material-symbols-outlined">visibility</span>
            </button>
          </div>
          <div class="form-hint">Min. 8 characters</div>
        </div>

        <div class="form-group">
          <label class="form-label">Confirm Password</label>
          <div class="password-wrapper">
            <input type="password" name="confirmPassword" id="regConfirm" placeholder="••••••••" required />
            <button type="button" class="toggle-password" onclick="togglePassword('regConfirm')">
              <span class="material-symbols-outlined">visibility</span>
            </button>
          </div>
        </div>

          <div class="form-error" id="regError"></div>

          <div class="terms-row">
            <input type="checkbox" id="terms" name="terms" required />
            <label for="terms">I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>.</label>
          </div>

          <button type="submit" class="btn-submit">Create Account</button>
          <div class="success-msg" id="successMsg">Registration successful! Redirecting...</div>
          <div class="error-msg" id="errorMsg"></div>
        </form>

        <div class="form-divider">already have an account?</div>
        <a href="${pageContext.request.contextPath}/login" class="btn-signin">Sign In Instead</a>
      </div>
    </div>

    <script>
      // Toggle password visibility - shows/hides password text
      function togglePassword(fieldId) {
        const field = document.getElementById(fieldId);
        const icon = event.target.closest('.toggle-password').querySelector('.material-symbols-outlined');

        if (field.type === 'password') {
          field.type = 'text';  // Change to text to show password
          icon.textContent = 'visibility_off';  // Change icon to "eye closed"
        } else {
          field.type = 'password';  // Change back to password (hidden)
          icon.textContent = 'visibility';  // Change icon back to "eye open"
        }
      }

      // Form validation - runs when user clicks "Create Account" button
      document.querySelector('form').addEventListener('submit', function(e) {
        const pass = document.getElementById('regPass').value;
        const confirm = document.getElementById('regConfirm').value;
        const errorDiv = document.getElementById('regError');

        // Check if both passwords match
        if (pass !== confirm) {
          e.preventDefault();  // Stop form from submitting
          errorDiv.textContent = 'Passwords do not match.';
          errorDiv.style.display = 'block';
          return false;
        }

        // Check if password is at least 8 characters
        if (pass.length < 8) {
          e.preventDefault();  // Stop form from submitting
          errorDiv.textContent = 'Password must be at least 8 characters.';
          errorDiv.style.display = 'block';
          return false;
        }

        // If all checks pass, hide error message
        errorDiv.style.display = 'none';
      });
    </script>
  </body>
</html>
