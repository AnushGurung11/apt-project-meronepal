<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
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
    <link
      rel="icon"
      type="image/x-icon"
      href="../../../assets/img/favicon.ico"
    />
    <link rel="stylesheet" href="../../../assets/css/styles.css" />
    <style>
      /* ── Login Page — Internal Styles ───────────────────────── */
      html {
        scroll-behavior: smooth;
        background-color: #111111;
      }
      /* Split layout */
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
      /* Decorative quote on the visual panel */
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
      .auth-logo span {
        color: #c9a84c;
      }

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
      .form-group {
        margin-bottom: 20px;
      }
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
      .form-group input:focus {
        border-color: #c9a84c;
      }
      .form-group input::placeholder {
        color: #555550;
      }

      /* Password wrapper with eye icon */
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
      .login-forgot a:hover {
        opacity: 0.75;
      }

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

      /* Error message */
      .form-error {
        font-size: 12px;
        color: #e74c3c;
        margin-top: 6px;
        display: none;
      }

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
      .auth-switch a:hover {
        text-decoration: underline;
      }

      /* Alert */
      .alert-info {
        padding: 12px 18px;
        border-radius: 6px;
        font-size: 14px;
        margin-bottom: 20px;
        background: rgba(201, 168, 76, 0.1);
        border-left: 3px solid #c9a84c;
        color: #c9a84c;
      }

      /* ── Responsive ──────────────────────────────────────── */
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
      @media (max-width: 480px) {
        .auth-form-side {
          padding: 36px 20px;
        }
        .auth-title {
          font-size: 2rem;
        }
      }
    </style>
  </head>
  <body>
    <div class="auth-page">
      <div class="auth-visual"></div>
      <div class="auth-form-side">
        <a href="home" class="auth-logo"
          >Mero Nepal Production<span>.</span></a
        >
        <h2 class="auth-title">Welcome Back</h2>
        <p class="auth-sub">Sign in to manage your bookings and profile.</p>

        <div class="alert-info" id="bookingAlert" style="display: none">
          Please log in or register to book a package.
        </div>

        <form action="login" method="POST">
          <div class="form-group">
            <label class="form-label">User Name</label>
            <input
              type="text"
              placeholder="Enter your username"
              id="loginUsername"
              name="username"
              required
            />
          </div>
          <div class="form-group">
            <label class="form-label">Password</label>
            <div class="password-wrapper">
              <input
                type="password"
                placeholder="••••••••"
                id="loginPassword"
                name="password"
                required
              />
              <button type="button" class="toggle-password" onclick="togglePassword('loginPassword')">
                <span class="material-symbols-outlined">visibility</span>
              </button>
            </div>
          </div>

          <div class="login-forgot">
            <a href="#">Forgot password?</a>
          </div>
          <button type="submit" class="btn-submit">Sign In</button>
        </form>

        <div class="form-divider">or</div>
        <p class="auth-switch">
          Don't have an account? <a href="register">Create one →</a>
        </p>
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
    </script>

  </body>
</html>
