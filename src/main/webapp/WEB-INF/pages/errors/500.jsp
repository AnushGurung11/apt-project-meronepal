<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>500 — Server Error · Mero Nepal Production</title>

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
        --red-dim:     rgba(192,57,43,0.10);
        --radius:      6px;
        --radius-lg:   12px;
        --transition:  0.3s cubic-bezier(0.4, 0, 0.2, 1);
        --shadow:      0 8px 40px rgba(0, 0, 0, 0.6);
        --font-display:"Cormorant Garamond", Georgia, serif;
        --font-body:   "Outfit", sans-serif;
        --font-mono:   "JetBrains Mono", "SF Mono", Menlo, Consolas, monospace;
      }

      *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
      html, body { height: 100%; }
      body {
        background: var(--black);
        color: var(--white);
        font-family: var(--font-body);
        line-height: 1.7;
        -webkit-font-smoothing: antialiased;
        overflow-x: hidden;
      }
      a { color: inherit; text-decoration: none; transition: color var(--transition); }
      button { cursor: pointer; border: none; background: none; font-family: var(--font-body); }

      /* ── Wrapper ── */
      .err-shell {
        position: relative;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 80px 24px 40px;
        text-align: center;
        overflow: hidden;
      }

      /* ── Atmospheric red-tint glow ── */
      .err-shell::before {
        content: "";
        position: absolute;
        top: -200px; left: 50%;
        width: 700px; height: 700px;
        transform: translateX(-50%);
        background: radial-gradient(ellipse at center, rgba(192,57,43,0.10), transparent 65%);
        pointer-events: none;
      }

      /* ── Top brand ── */
      .err-brand {
        position: absolute;
        top: 32px; left: 32px;
        font-family: var(--font-display);
        font-size: 1.4rem;
        font-weight: 600;
        letter-spacing: 0.04em;
        color: var(--white);
        z-index: 2;
      }
      .err-brand span { color: var(--gold); }

      /* ── Section label ── */
      .err-label {
        display: inline-flex;
        align-items: center;
        gap: 10px;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 0.22em;
        text-transform: uppercase;
        color: #e57373;
        margin-bottom: 24px;
        z-index: 1;
      }
      .err-label::before,
      .err-label::after {
        content: "";
        display: block;
        width: 28px;
        height: 1px;
        background: #e57373;
      }

      /* ── Massive 500 number ── */
      .err-code {
        font-family: var(--font-display);
        font-weight: 400;
        font-size: clamp(8rem, 22vw, 18rem);
        line-height: 0.9;
        letter-spacing: -0.02em;
        color: var(--white);
        margin-bottom: 8px;
        position: relative;
        z-index: 1;
        background: linear-gradient(180deg, var(--white) 0%, rgba(245,240,232,0.18) 100%);
        -webkit-background-clip: text;
        background-clip: text;
        -webkit-text-fill-color: transparent;
      }
      .err-code em {
        font-style: italic;
        color: var(--gold);
        -webkit-text-fill-color: var(--gold);
        background: none;
      }

      /* ── Title + caption ── */
      .err-title {
        font-family: var(--font-display);
        font-weight: 400;
        font-size: clamp(1.8rem, 3.5vw, 2.6rem);
        line-height: 1.2;
        margin-bottom: 14px;
        max-width: 680px;
        z-index: 1;
      }
      .err-title em { font-style: italic; color: var(--gold); }

      .err-divider {
        width: 60px;
        height: 1px;
        background: var(--gold);
        margin: 18px auto 22px;
      }

      .err-text {
        font-size: 14px;
        color: #b0aa9f;
        max-width: 520px;
        margin-bottom: 36px;
        z-index: 1;
        font-weight: 300;
      }

      /* ── Dev-only error detail card ── */
      .err-detail {
        background: var(--surface);
        border: 1px solid var(--border);
        border-left: 3px solid #e57373;
        border-radius: var(--radius);
        padding: 18px 22px;
        max-width: 720px;
        width: 100%;
        margin: 0 auto 36px;
        text-align: left;
        font-family: var(--font-mono);
        font-size: 12px;
        line-height: 1.6;
        color: #c8c2ba;
        z-index: 1;
        overflow-x: auto;
      }
      .err-detail .det-label {
        font-family: var(--font-body);
        font-size: 10px;
        font-weight: 500;
        letter-spacing: 0.18em;
        text-transform: uppercase;
        color: #e57373;
        display: block;
        margin-bottom: 4px;
      }
      .err-detail .det-row + .det-row { margin-top: 12px; }
      .err-detail code { color: var(--gold); word-break: break-all; }

      /* ── Buttons ── */
      .btn-row {
        display: flex;
        gap: 14px;
        flex-wrap: wrap;
        justify-content: center;
        z-index: 1;
      }
      .btn {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 14px 30px;
        border-radius: var(--radius);
        font-size: 12px;
        font-weight: 500;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        transition: all var(--transition);
        white-space: nowrap;
        cursor: pointer;
        text-decoration: none;
        border: 1px solid transparent;
      }
      .btn-gold {
        background: var(--gold);
        color: var(--black);
        border-color: var(--gold);
      }
      .btn-gold:hover {
        background: var(--gold-light);
        border-color: var(--gold-light);
        transform: translateY(-1px);
        box-shadow: 0 4px 20px rgba(201,168,76,0.3);
      }
      .btn-ghost {
        background: transparent;
        border-color: var(--border);
        color: var(--muted);
      }
      .btn-ghost:hover {
        border-color: var(--gold);
        color: var(--gold);
      }

      /* ── Helpful links ── */
      .err-links {
        display: flex;
        gap: 28px;
        margin-top: 56px;
        flex-wrap: wrap;
        justify-content: center;
        z-index: 1;
      }
      .err-links a {
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 0.16em;
        text-transform: uppercase;
        color: var(--muted);
        position: relative;
        padding-bottom: 4px;
        transition: color var(--transition);
      }
      .err-links a::after {
        content: "";
        position: absolute;
        bottom: 0; left: 0;
        width: 0; height: 1px;
        background: var(--gold);
        transition: width var(--transition);
      }
      .err-links a:hover { color: var(--white); }
      .err-links a:hover::after { width: 100%; }

      /* ── Bottom signature ── */
      .err-footer {
        position: absolute;
        bottom: 28px; left: 50%;
        transform: translateX(-50%);
        font-size: 10px;
        letter-spacing: 0.3em;
        text-transform: uppercase;
        color: var(--muted);
        z-index: 1;
      }
      .err-footer span { color: var(--gold); }

      /* ── Responsive ── */
      @media (max-width: 640px) {
        .err-brand { top: 20px; left: 20px; font-size: 1.2rem; }
        .err-shell { padding: 70px 18px 60px; }
        .err-links { gap: 18px; margin-top: 40px; }
        .err-footer { bottom: 20px; font-size: 9px; }
        .err-detail { padding: 14px 16px; font-size: 11px; }
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

    <div class="err-shell">
      <a href="${pageContext.request.contextPath}/home" class="err-brand">
        Mero Nepal<span>.</span>
      </a>

      <div class="err-label">Error 500</div>

      <h1 class="err-code">5<em>0</em>0</h1>

      <h2 class="err-title">
        Something <em>went dark</em> on our end.
      </h2>

      <div class="err-divider"></div>

      <p class="err-text">
        An unexpected error interrupted your request. Our team has been notified and is on the case.
        Please try again in a moment, or head back to safer ground.
      </p>

      <%-- Dev-only stack details: only renders when -Denv=development is set on the JVM --%>
      <% if ("development".equals(System.getProperty("env")) && exception != null) { %>
        <div class="err-detail">
          <div class="det-row">
            <span class="det-label">Exception</span>
            <code><%= exception.getClass().getName() %></code>
          </div>
          <div class="det-row">
            <span class="det-label">Message</span>
            <code><%= exception.getMessage() != null ? exception.getMessage() : "(no message)" %></code>
          </div>
        </div>
      <% } %>

      <div class="btn-row">
        <a href="${pageContext.request.contextPath}/home" class="btn btn-gold">
          Return Home →
        </a>
        <a href="javascript:history.back()" class="btn btn-ghost">
          Try Again
        </a>
      </div>

      <nav class="err-links">
        <a href="${pageContext.request.contextPath}/home">Home</a>
        <a href="${pageContext.request.contextPath}/packages">Packages</a>
        <a href="${pageContext.request.contextPath}/about">About</a>
        <a href="${pageContext.request.contextPath}/blog">Blog</a>
        <a href="mailto:hello@meronepal.com">Report Issue</a>
      </nav>

      <div class="err-footer">
        Mero Nepal Production <span>—</span> EST. 2014
      </div>
    </div>
  </body>
</html>
