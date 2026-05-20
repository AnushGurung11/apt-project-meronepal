<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About Us — Mero Nepal Production</title>

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
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/styles.css"
    />
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
      img {
        max-width: 100%;
        display: block;
      }
      a {
        color: inherit;
        text-decoration: none;
        transition: color var(--transition);
      }
      ul {
        list-style: none;
      }
      button {
        cursor: pointer;
        border: none;
        background: none;
        font-family: var(--font-body);
      }

      /* ── Typography ──────────────────────────────────────────── */
      h1,
      h2,
      h3,
      h4,
      h5 {
        font-family: var(--font-display);
        font-weight: 400;
        line-height: 1.15;
        letter-spacing: 0.01em;
      }
      h1 {
        font-size: clamp(2.8rem, 6vw, 5.5rem);
      }
      h2 {
        font-size: clamp(2rem, 4vw, 3.2rem);
      }
      h4 {
        font-size: 1.25rem;
      }
      p {
        color: #b0aa9f;
        font-weight: 300;
      }

      .text-center {
        text-align: center;
      }

      /* ── Layout ──────────────────────────────────────────────── */
      .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 32px;
      }
      .section {
        padding: 100px 0;
      }
      .section-sm {
        padding: 60px 0;
      }

      .grid-2 {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 40px;
      }
      .grid-3 {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 32px;
      }

      /* ── Section Label ───────────────────────────────────────── */
      .section-label {
        display: inline-flex;
        align-items: center;
        gap: 10px;
        font-size: 11px;
        font-family: var(--font-body);
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

      /* ── Divider ─────────────────────────────────────────────── */
      .divider {
        width: 60px;
        height: 1px;
        background: var(--gold);
        margin: 24px 0;
      }
      .divider-center {
        margin: 24px auto;
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
      }
      .btn-gold {
        background: var(--gold);
        color: var(--black);
      }
      .btn-gold:hover {
        background: var(--gold-light);
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
      .btn-sm {
        padding: 9px 20px;
        font-size: 12px;
      }

      /* ── Navbar ──────────────────────────────────────────────── */
      .navbar {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 1000;
        padding: 22px 0;
        transition: all var(--transition);
        border-bottom: 1px solid transparent;
      }
      .navbar.scrolled {
        background: rgba(10, 10, 10, 0.95);
        backdrop-filter: blur(12px);
        padding: 14px 0;
        border-bottom-color: var(--border);
      }
      .nav-inner {
        display: flex;
        align-items: center;
        justify-content: space-between;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 32px;
      }
      .nav-logo {
        font-family: var(--font-display);
        font-size: 1.6rem;
        font-weight: 600;
        color: var(--white);
        letter-spacing: 0.04em;
      }
      .nav-logo span {
        color: var(--gold);
      }
      .nav-links {
        display: flex;
        align-items: center;
        gap: 36px;
      }
      .nav-links a {
        font-size: 13px;
        font-weight: 400;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        color: #aaa;
        position: relative;
        padding-bottom: 3px;
      }
      .nav-links a::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 0;
        height: 1px;
        background: var(--gold);
        transition: width var(--transition);
      }
      .nav-links a:hover,
      .nav-links a.active {
        color: var(--white);
      }
      .nav-links a:hover::after,
      .nav-links a.active::after {
        width: 100%;
      }
      .nav-actions {
        display: flex;
        align-items: center;
        gap: 16px;
      }
      .hamburger {
        display: none;
        flex-direction: column;
        gap: 5px;
        padding: 4px;
      }
      .hamburger span {
        display: block;
        width: 22px;
        height: 1.5px;
        background: var(--white);
        transition: all var(--transition);
      }

      /* ── Page Hero ───────────────────────────────────────────── */
      .page-hero {
        padding: 160px 0 80px;
        background: linear-gradient(
          to bottom,
          rgba(201, 168, 76, 0.04) 0%,
          transparent 100%
        );
        border-bottom: 1px solid var(--border);
        text-align: center;
      }

      /* ── Team Card ───────────────────────────────────────────── */
      .team-card {
        text-align: center;
        padding: 40px 28px;
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        transition: all var(--transition);
      }
      .team-card:hover {
        border-color: var(--gold);
        transform: translateY(-4px);
      }
      .team-avatar {
        width: 90px;
        height: 90px;
        border-radius: 50%;
        background: var(--surface2);
        border: 2px solid var(--border);
        margin: 0 auto 20px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: var(--font-display);
        font-size: 2rem;
        color: var(--gold);
        overflow: hidden;
      }
      .team-avatar img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
      .team-role {
        font-size: 11px;
        letter-spacing: 0.15em;
        text-transform: uppercase;
        color: var(--gold);
        margin: 4px 0 12px;
      }
      .team-card {
        cursor: pointer;
      }

      /* ── Team Modal ─────────────────────────────────────────── */
      .team-modal {
        position: fixed;
        inset: 0;
        background: rgba(0, 0, 0, 0.78);
        backdrop-filter: blur(6px);
        z-index: 100;
        display: none;
        align-items: center;
        justify-content: center;
        padding: 24px;
        opacity: 0;
        transition: opacity 0.25s ease;
      }
      .team-modal.is-open {
        display: flex;
        opacity: 1;
      }
      .team-modal-dialog {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        width: 100%;
        max-width: 920px;
        max-height: 88vh;
        overflow: hidden;
        display: grid;
        grid-template-columns: 340px 1fr;
        position: relative;
        box-shadow: 0 24px 60px rgba(0, 0, 0, 0.6);
        animation: modalIn 0.3s ease;
      }
      @keyframes modalIn {
        from {
          transform: translateY(20px);
          opacity: 0;
        }
        to {
          transform: translateY(0);
          opacity: 1;
        }
      }
      .team-modal-close {
        position: absolute;
        top: 16px;
        right: 18px;
        width: 34px;
        height: 34px;
        border-radius: 50%;
        background: rgba(10, 10, 10, 0.6);
        color: var(--white);
        border: 1px solid var(--border);
        font-size: 18px;
        line-height: 1;
        cursor: pointer;
        z-index: 2;
        transition: all var(--transition);
      }
      .team-modal-close:hover {
        border-color: var(--gold);
        color: var(--gold);
      }
      .team-modal-left {
        background: var(--surface2);
        padding: 36px 28px;
        text-align: center;
        border-right: 1px solid var(--border);
        display: flex;
        flex-direction: column;
        align-items: center;
        overflow-y: auto;
      }
      .team-modal-photo {
        width: 180px;
        height: 180px;
        border-radius: 50%;
        overflow: hidden;
        border: 2px solid var(--gold);
        margin-bottom: 22px;
      }
      .team-modal-photo img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
      }
      .team-modal-name {
        font-family: var(--font-display);
        font-size: 1.7rem;
        color: var(--white);
        line-height: 1.2;
      }
      .team-modal-role {
        font-size: 11px;
        letter-spacing: 0.15em;
        text-transform: uppercase;
        color: var(--gold);
        margin-top: 6px;
        margin-bottom: 22px;
      }
      .team-modal-socials {
        display: flex;
        gap: 10px;
        justify-content: center;
        flex-wrap: wrap;
      }
      .team-modal-socials a {
        width: 38px;
        height: 38px;
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        color: var(--muted);
        transition: all var(--transition);
        text-transform: lowercase;
      }
      .team-modal-socials a:hover {
        border-color: var(--gold);
        color: var(--gold);
      }
      .team-modal-right {
        padding: 40px 36px;
        overflow-y: auto;
      }
      .team-modal-right h3 {
        font-family: var(--font-display);
        font-size: 1.4rem;
        color: var(--white);
        margin-bottom: 12px;
      }
      .team-modal-right h3:not(:first-child) {
        margin-top: 28px;
      }
      .team-modal-right p {
        font-size: 14px;
        line-height: 1.7;
        color: #b0aa9f;
      }
      .team-modal-skills {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
      }
      .team-modal-skills span {
        font-size: 11px;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        color: var(--gold);
        border: 1px solid var(--gold-dim);
        padding: 6px 12px;
        border-radius: 20px;
      }
      .team-modal-stats {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 12px;
        margin-top: 8px;
      }
      .team-modal-stats div {
        background: var(--surface2);
        border: 1px solid var(--border);
        border-radius: var(--radius);
        padding: 14px 10px;
        text-align: center;
      }
      .team-modal-stats strong {
        display: block;
        font-family: var(--font-display);
        font-size: 1.5rem;
        color: var(--gold);
        font-weight: 400;
      }
      .team-modal-stats small {
        font-size: 10px;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        color: var(--muted);
      }
      .team-modal-tagline {
        font-family: var(--font-display);
        font-style: italic;
        font-size: 1.15rem;
        color: var(--gold);
        border-left: 2px solid var(--gold);
        padding-left: 14px;
        margin-bottom: 8px;
        line-height: 1.4;
      }
      .team-modal-work {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        flex-direction: column;
        gap: 10px;
      }
      .team-modal-work li {
        background: var(--surface2);
        border: 1px solid var(--border);
        border-radius: var(--radius);
        padding: 12px 14px;
        font-size: 13px;
        color: #b0aa9f;
        display: flex;
        flex-direction: column;
        gap: 2px;
      }
      .team-modal-work li strong {
        font-family: var(--font-display);
        font-weight: 400;
        color: var(--white);
        font-size: 14px;
      }
      .team-modal-work li small {
        font-size: 10px;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        color: var(--gold);
      }

      @media (max-width: 768px) {
        .team-modal-dialog {
          grid-template-columns: 1fr;
          max-height: 92vh;
        }
        .team-modal-left {
          border-right: none;
          border-bottom: 1px solid var(--border);
          padding: 28px 20px;
        }
        .team-modal-photo {
          width: 140px;
          height: 140px;
        }
        .team-modal-right {
          padding: 28px 22px;
        }
      }

      /* ── Footer ──────────────────────────────────────────────── */
      .footer {
        background: var(--dark);
        border-top: 1px solid var(--border);
        padding: 80px 0 40px;
      }
      .footer-bottom {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-top: 32px;
        border-top: 1px solid var(--border);
        font-size: 12px;
        color: var(--muted);
      }

      /* ── Utilities ───────────────────────────────────────────── */
      .mb-48 {
        margin-bottom: 48px;
      }

      /* ── Animations ──────────────────────────────────────────── */
      @keyframes fadeUp {
        from {
          opacity: 0;
          transform: translateY(30px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }
      .animate-fade-up {
        animation: fadeUp 0.7s var(--transition) both;
      }
      .delay-1 {
        animation-delay: 0.1s;
      }
      .delay-2 {
        animation-delay: 0.2s;
      }
      .delay-3 {
        animation-delay: 0.35s;
      }

      /* ── Responsive ──────────────────────────────────────────── */
      @media (max-width: 768px) {
        .container {
          padding: 0 20px;
        }
        .section {
          padding: 70px 0;
        }
        .grid-2,
        .grid-3 {
          grid-template-columns: 1fr;
        }
        .nav-links,
        .nav-actions .btn:not(.btn-sm) {
          display: none;
        }
        .hamburger {
          display: flex;
        }
      }

      @media (max-width: 480px) {
        .btn {
          padding: 12px 22px;
          font-size: 12px;
        }
        h1 {
          font-size: 2.4rem;
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

    <%@ include file="/WEB-INF/pages/components/mobile-top-bar.jsp" %> <%@
    include file="/WEB-INF/pages/components/mobile-nav-drawer-public.jsp" %>

    <!-- ── MAIN 3-COLUMN LAYOUT ── -->
    <div
      class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10"
    >
      <%@ include file="/WEB-INF/pages/components/left-rail.jsp" %>

      <main class="pt-14 md:pt-0">
        <section class="page-hero">
          <div class="container">
            <div class="section-label" style="justify-content: center">
              Our Story
            </div>
            <h1 style="font-size: 68.22px">Mero Nepal Production Team</h1>
            <div class="divider divider-center"></div>
            <p style="max-width: 520px; margin: 0 auto">
              We are a collective of visual storytellers based in Nepal, united
              by one mission — to capture life's most meaningful moments with
              cinematic intention.
            </p>
          </div>
        </section>

        <!-- About Narrative -->
        <section class="section-sm">
          <div class="container">
            <div class="grid-2" style="align-items: center; gap: 80px">
              <div>
                <div class="section-label">Who We Are</div>
                <h2 style="font-size: 45.48px">
                  Cinematic Stories,<br /><em>Human at Heart</em>
                </h2>
                <div class="divider"></div>
                <p style="margin-bottom: 16px">
                  Mero Nepal Production was born from a shared love of
                  storytelling through a lens. Founded in Kathmandu, our team
                  has grown from a small photography duo to a full creative
                  production house covering Nepal and beyond.
                </p>
                <p>
                  Every event we cover, every frame we capture, and every film
                  we produce is a testament to our belief that visual stories
                  deserve to be told with artistry and care.
                </p>
              </div>
              <div
                style="
                  background: var(--surface);
                  border: 1px solid var(--border);
                  border-radius: var(--radius-lg);
                  padding: 48px;
                  text-align: center;
                "
              >
                <div
                  style="
                    font-family: var(--font-display);
                    font-size: 4rem;
                    color: var(--gold);
                    margin-bottom: 12px;
                  "
                >
                  "
                </div>
                <p
                  style="
                    font-family: var(--font-display);
                    font-style: italic;
                    font-size: 1.3rem;
                    color: var(--white);
                    line-height: 1.7;
                  "
                >
                  "Every photograph is a certificate of presence."
                </p>
                <div
                  style="
                    font-size: 12px;
                    color: var(--muted);
                    margin-top: 20px;
                    letter-spacing: 0.1em;
                    text-transform: uppercase;
                  "
                >
                  — Susan Sontag
                </div>
              </div>
            </div>
          </div>
        </section>

        <!-- Team -->
        <section
          class="section"
          style="
            background: var(--surface);
            border-top: 1px solid var(--border);
            border-bottom: 1px solid var(--border);
          "
        >
          <div class="container">
            <div class="text-center mb-48">
              <div class="section-label" style="justify-content: center">
                The People
              </div>
              <h2 style="font-size: 45.48px">Meet Our Team</h2>
              <div class="divider divider-center"></div>
            </div>
            <div class="grid-3">
              <div class="team-card" data-member="darshan">
                <div class="team-avatar">
                  <img
                    src="${pageContext.request.contextPath}/assets/img/profile/darshan.jpg"
                    alt="Darshan Regmi"
                  />
                </div>
                <h4>Darshan Regmi</h4>
                <div class="team-role">Lead Photographer</div>
                <p style="font-size: 13px; margin-bottom: 20px">
                  Darshan leads all photography operations. With 5+ years in
                  wedding and event photography, he brings precision and warmth
                  to every shoot.
                </p>
                <div style="display: flex; gap: 10px; justify-content: center">
                  <a
                    href="#"
                    style="
                      width: 32px;
                      height: 32px;
                      background: var(--surface2);
                      border: 1px solid var(--border);
                      border-radius: 50%;
                      display: flex;
                      align-items: center;
                      justify-content: center;
                      font-size: 13px;
                      color: var(--muted);
                      transition: all 0.3s;
                    "
                    onmouseover="
                      this.style.borderColor = 'var(--gold)';
                      this.style.color = 'var(--gold)';
                    "
                    onmouseout="
                      this.style.borderColor = 'var(--border)';
                      this.style.color = 'var(--muted)';
                    "
                    >in</a
                  >
                  <a
                    href="#"
                    style="
                      width: 32px;
                      height: 32px;
                      background: var(--surface2);
                      border: 1px solid var(--border);
                      border-radius: 50%;
                      display: flex;
                      align-items: center;
                      justify-content: center;
                      font-size: 13px;
                      color: var(--muted);
                      transition: all 0.3s;
                    "
                    onmouseover="
                      this.style.borderColor = 'var(--gold)';
                      this.style.color = 'var(--gold)';
                    "
                    onmouseout="
                      this.style.borderColor = 'var(--border)';
                      this.style.color = 'var(--muted)';
                    "
                    >ig</a
                  >
                </div>
              </div>
              <div class="team-card" data-member="anush">
                <div class="team-avatar">
                  <img
                    src="${pageContext.request.contextPath}/assets/img/profile/anush.jpg"
                    alt="Anush Gurung"
                  />
                </div>
                <h4>Anush Gurung</h4>
                <div class="team-role">Cinematographer</div>
                <p style="font-size: 13px; margin-bottom: 20px">
                  Anush specializes in cinematic videography and
                  post-production. His work spans music videos, documentaries,
                  and drone cinematography.
                </p>
                <div style="display: flex; gap: 10px; justify-content: center">
                  <a
                    href="#"
                    style="
                      width: 32px;
                      height: 32px;
                      background: var(--surface2);
                      border: 1px solid var(--border);
                      border-radius: 50%;
                      display: flex;
                      align-items: center;
                      justify-content: center;
                      font-size: 13px;
                      color: var(--muted);
                      transition: all 0.3s;
                    "
                    onmouseover="
                      this.style.borderColor = 'var(--gold)';
                      this.style.color = 'var(--gold)';
                    "
                    onmouseout="
                      this.style.borderColor = 'var(--border)';
                      this.style.color = 'var(--muted)';
                    "
                    >in</a
                  >
                  <a
                    href="#"
                    style="
                      width: 32px;
                      height: 32px;
                      background: var(--surface2);
                      border: 1px solid var(--border);
                      border-radius: 50%;
                      display: flex;
                      align-items: center;
                      justify-content: center;
                      font-size: 13px;
                      color: var(--muted);
                      transition: all 0.3s;
                    "
                    onmouseover="
                      this.style.borderColor = 'var(--gold)';
                      this.style.color = 'var(--gold)';
                    "
                    onmouseout="
                      this.style.borderColor = 'var(--border)';
                      this.style.color = 'var(--muted)';
                    "
                    >ig</a
                  >
                </div>
              </div>
              <div class="team-card" data-member="krish">
                <div class="team-avatar">
                  <img
                    src="${pageContext.request.contextPath}/assets/img/profile/krish.jpg"
                    alt="Krish Shrestha"
                  />
                </div>
                <h4>Krish Shrestha</h4>
                <div class="team-role">Portrait Photographer</div>
                <p style="font-size: 13px; margin-bottom: 20px">
                  Krish handles portrait sessions, product photography, and
                  editorial shoots. His eye for light and composition sets him
                  apart.
                </p>
                <div style="display: flex; gap: 10px; justify-content: center">
                  <a
                    href="#"
                    style="
                      width: 32px;
                      height: 32px;
                      background: var(--surface2);
                      border: 1px solid var(--border);
                      border-radius: 50%;
                      display: flex;
                      align-items: center;
                      justify-content: center;
                      font-size: 13px;
                      color: var(--muted);
                      transition: all 0.3s;
                    "
                    onmouseover="
                      this.style.borderColor = 'var(--gold)';
                      this.style.color = 'var(--gold)';
                    "
                    onmouseout="
                      this.style.borderColor = 'var(--border)';
                      this.style.color = 'var(--muted)';
                    "
                    >in</a
                  >
                  <a
                    href="#"
                    style="
                      width: 32px;
                      height: 32px;
                      background: var(--surface2);
                      border: 1px solid var(--border);
                      border-radius: 50%;
                      display: flex;
                      align-items: center;
                      justify-content: center;
                      font-size: 13px;
                      color: var(--muted);
                      transition: all 0.3s;
                    "
                    onmouseover="
                      this.style.borderColor = 'var(--gold)';
                      this.style.color = 'var(--gold)';
                    "
                    onmouseout="
                      this.style.borderColor = 'var(--border)';
                      this.style.color = 'var(--muted)';
                    "
                    >ig</a
                  >
                </div>
              </div>
              <div class="team-card" data-member="sudip">
                <div class="team-avatar">
                  <img
                    src="${pageContext.request.contextPath}/assets/img/profile/sudip.jpg"
                    alt="Sudip Gautam"
                  />
                </div>
                <h4>Sudip Gautam</h4>
                <div class="team-role">Video Editor</div>
                <p style="font-size: 13px; margin-bottom: 20px">
                  Sudip handles all post-production video editing, color
                  grading, and sound design. Every film that leaves APT bears
                  his polished touch.
                </p>
                <div style="display: flex; gap: 10px; justify-content: center">
                  <a
                    href="#"
                    style="
                      width: 32px;
                      height: 32px;
                      background: var(--surface2);
                      border: 1px solid var(--border);
                      border-radius: 50%;
                      display: flex;
                      align-items: center;
                      justify-content: center;
                      font-size: 13px;
                      color: var(--muted);
                    "
                    >in</a
                  >
                </div>
              </div>
              <div class="team-card" data-member="bijaya">
                <div class="team-avatar">
                  <img
                    src="${pageContext.request.contextPath}/assets/img/profile/bijaya.jpg"
                    alt="Bijaya Khanal"
                  />
                </div>
                <h4>Bijaya Khanal</h4>
                <div class="team-role">Drone Operator</div>
                <p style="font-size: 13px; margin-bottom: 20px">
                  Bijaya is our certified drone pilot and aerial
                  cinematographer. He brings breathtaking aerial perspectives to
                  every production.
                </p>
                <div style="display: flex; gap: 10px; justify-content: center">
                  <a
                    href="#"
                    style="
                      width: 32px;
                      height: 32px;
                      background: var(--surface2);
                      border: 1px solid var(--border);
                      border-radius: 50%;
                      display: flex;
                      align-items: center;
                      justify-content: center;
                      font-size: 13px;
                      color: var(--muted);
                    "
                    >ig</a
                  >
                </div>
              </div>
              <div class="team-card" data-member="arjun">
                <div class="team-avatar">
                  <img
                    src="${pageContext.request.contextPath}/assets/img/profile/arjun.jpg"
                    alt="Arjun Bastola"
                  />
                </div>
                <h4>Arjun Bastola</h4>
                <div class="team-role">Second Photographer</div>
                <p style="font-size: 13px; margin-bottom: 20px">
                  Arjun works second-camera on large events and weddings. His
                  candid style adds spontaneity and emotion to every collection.
                </p>
                <div style="display: flex; gap: 10px; justify-content: center">
                  <a
                    href="#"
                    style="
                      width: 32px;
                      height: 32px;
                      background: var(--surface2);
                      border: 1px solid var(--border);
                      border-radius: 50%;
                      display: flex;
                      align-items: center;
                      justify-content: center;
                      font-size: 13px;
                      color: var(--muted);
                    "
                    >ig</a
                  >
                </div>
              </div>
            </div>
          </div>
        </section>

        <%@ include file="/WEB-INF/pages/components/footer.jsp" %>
      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-public.jsp" %>
    </div>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>

    <!-- ── TEAM MODAL ── -->
    <div
      class="team-modal"
      id="teamModal"
      role="dialog"
      aria-modal="true"
      aria-hidden="true"
    >
      <div class="team-modal-dialog" id="teamModalDialog">
        <button class="team-modal-close" id="teamModalClose" aria-label="Close">
          ×
        </button>
        <div class="team-modal-left">
          <div class="team-modal-photo">
            <img id="tmPhoto" src="" alt="" />
          </div>
          <div class="team-modal-name" id="tmName"></div>
          <div class="team-modal-role" id="tmRole"></div>
          <div class="team-modal-socials" id="tmSocials"></div>
        </div>
        <div class="team-modal-right">
          <div class="team-modal-tagline" id="tmTagline"></div>
          <h3>About Me</h3>
          <p id="tmBio"></p>
          <h3>Skills &amp; Tools</h3>
          <div class="team-modal-skills" id="tmSkills"></div>
          <h3>By the Numbers</h3>
          <div class="team-modal-stats" id="tmStats"></div>
        </div>
      </div>
    </div>

    <script>
      // ── Hard-coded team data (each card opens a personal portfolio) ──
      const TEAM_DATA = {
        darshan: {
          name: "Darshan Regmi",
          role: "Full Stack & Mobile Developer · Poet",
          image:
            "${pageContext.request.contextPath}/assets/img/profile/darshan.jpg",
          tagline: "Half my life is code. The other half is verse.",
          bio: "I'm a full stack and mobile developer based in Kathmandu, working primarily across Next.js, TypeScript, React Native and Node. I build production web apps by day and ship small mobile side-projects in the evenings. When I'm not at a keyboard I write poetry — Nepali and English, mostly about quiet places — and publish it on my poetry site.",
          skills: [
            "Next.js",
            "TypeScript",
            "React",
            "React Native",
            "Node.js",
            "Tailwind CSS",
            "PostgreSQL",
            "REST APIs",
            "Mobile App Development",
            "Poetry",
          ],
          stats: [
            { value: "5+", label: "Years Coding" },
            { value: "15+", label: "Shipped Apps" },
            { value: "200+", label: "Poems Written" },
          ],
          social: [
            { label: "ig", href: "https://instagram.com/_darshan_regmi" },
            { label: "in", href: "https://linkedin.com/in/darshan-regmi" },
            { label: "site", href: "https://darshanregmi.com.np" },
            { label: "poetry", href: "https://poetry.darshanregmi.com.np" },
          ],
        },
        anush: {
          name: "Anush Gurung",
          role: "Full Stack Developer",
          image:
            "${pageContext.request.contextPath}/assets/img/profile/anush.jpg",
          tagline:
            "I like systems that are boring on the outside and elegant on the inside.",
          bio: "I'm a full stack developer working primarily with Spring Boot on the backend and React on the frontend. I focus on building reliable APIs, clean component architectures, and the kind of dev experience that means you can come back to a codebase six months later and still know what's going on.",
          skills: [
            "Spring Boot",
            "Java",
            "React",
            "REST APIs",
            "PostgreSQL",
            "MySQL",
            "JPA / Hibernate",
            "Docker",
            "Git",
          ],
          stats: [
            { value: "5+", label: "Years" },
            { value: "30+", label: "Projects" },
            { value: "100K+", label: "Lines Shipped" },
          ],
          social: [
            { label: "site", href: "https://anushgurung.com.np" },
            { label: "ig", href: "https://instagram.com" },
            { label: "in", href: "https://linkedin.com" },
          ],
        },
        krish: {
          name: "Krish Shrestha",
          role: "UI / UX Designer",
          image:
            "${pageContext.request.contextPath}/assets/img/profile/krish.jpg",
          tagline: "Good design is what you stop noticing.",
          bio: "I'm a UI/UX designer focused on product interfaces and brand systems. I spend most of my day in Figma, prototyping flows, building design systems, and making sure every screen earns its place in the journey. I also work in Canva for marketing collateral and explore new ideas with Stitch.",
          skills: [
            "UI Design",
            "UX Design",
            "Figma",
            "Canva",
            "Stitch",
            "Wireframing",
            "Prototyping",
            "Design Systems",
            "User Research",
          ],
          stats: [
            { value: "3+", label: "Years" },
            { value: "40+", label: "Products Designed" },
            { value: "200+", label: "Screens Shipped" },
          ],
          social: [
            { label: "ig", href: "https://instagram.com" },
            { label: "in", href: "https://linkedin.com" },
          ],
        },
        sudip: {
          name: "Sudip Gautam",
          role: "Guitarist",
          image:
            "${pageContext.request.contextPath}/assets/img/profile/sudip.jpg",
          tagline: "Six strings, one life.",
          bio: "I'm a guitarist based in Kathmandu. I play across genres — fingerstyle, acoustic blues, and a little bit of progressive rock — and I've been performing live for the last seven years. I gig at local venues, record session work for indie artists, and teach a small group of students whenever my schedule allows.",
          skills: [
            "Acoustic Guitar",
            "Electric Guitar",
            "Fingerstyle",
            "Composition",
            "Music Theory",
            "Live Performance",
            "Session Recording",
            "Guitar Teaching",
          ],
          stats: [
            { value: "7+", label: "Years Playing" },
            { value: "150+", label: "Live Shows" },
            { value: "20+", label: "Tracks Recorded" },
          ],
          social: [
            { label: "ig", href: "https://instagram.com" },
            { label: "yt", href: "https://youtube.com" },
          ],
        },
        bijaya: {
          name: "Bijaya Khanal",
          role: "UI / UX Designer",
          image:
            "${pageContext.request.contextPath}/assets/img/profile/bijaya.jpg",
          tagline: "Every pixel should know why it exists.",
          bio: "I'm a UI/UX designer with a soft spot for mobile-first product design. I'm most at home in Figma, sketching flows, iterating on prototypes, and turning messy product briefs into clean, testable interfaces. I care a lot about accessibility and the small interaction details most people only notice when they're missing.",
          skills: [
            "UI Design",
            "UX Design",
            "Figma",
            "Prototyping",
            "Mobile Design",
            "Accessibility",
            "Design Tokens",
            "User Flows",
          ],
          stats: [
            { value: "4+", label: "Years" },
            { value: "35+", label: "Products" },
            { value: "300+", label: "Screens Shipped" },
          ],
          social: [
            { label: "ig", href: "https://instagram.com" },
            { label: "in", href: "https://linkedin.com" },
          ],
        },
        arjun: {
          name: "Arjun Bastola",
          role: "Professional Photographer",
          image:
            "${pageContext.request.contextPath}/assets/img/profile/arjun.jpg",
          tagline: "I shoot the moments people forget were happening.",
          bio: "I'm a professional photographer based in Bhaktapur. I work across weddings, events, editorial, and personal documentary projects. My style leans candid and documentary — I'd rather catch the in-between moments than stage the obvious ones — and I shoot mostly on Fujifilm with the occasional roll of film when the day allows.",
          skills: [
            "Wedding Photography",
            "Event Photography",
            "Editorial",
            "Candid",
            "Documentary Style",
            "Adobe Lightroom",
            "Adobe Photoshop",
            "Fujifilm X-T5",
            "35mm Film",
          ],
          stats: [
            { value: "5+", label: "Years" },
            { value: "100+", label: "Weddings" },
            { value: "50K+", label: "Frames Shot" },
          ],
          social: [
            { label: "ig", href: "https://instagram.com" },
            { label: "in", href: "https://linkedin.com" },
          ],
        },
      };

      (function () {
        const modal = document.getElementById("teamModal");
        const dialog = document.getElementById("teamModalDialog");
        const closeBtn = document.getElementById("teamModalClose");

        const tmPhoto = document.getElementById("tmPhoto");
        const tmName = document.getElementById("tmName");
        const tmRole = document.getElementById("tmRole");
        const tmTagline = document.getElementById("tmTagline");
        const tmBio = document.getElementById("tmBio");
        const tmSkills = document.getElementById("tmSkills");
        const tmStats = document.getElementById("tmStats");
        const tmSocials = document.getElementById("tmSocials");

        function escapeHtml(str) {
          return String(str).replace(/[&<>"']/g, function (c) {
            return {
              "&": "&amp;",
              "<": "&lt;",
              ">": "&gt;",
              '"': "&quot;",
              "'": "&#39;",
            }[c];
          });
        }

        function openModal(key) {
          const data = TEAM_DATA[key];
          if (!data) return;

          tmPhoto.src = data.image;
          tmPhoto.alt = data.name;
          tmName.textContent = data.name;
          tmRole.textContent = data.role;
          tmTagline.textContent = data.tagline || "";
          tmBio.textContent = data.bio;

          tmSkills.innerHTML = data.skills
            .map(function (s) {
              return "<span>" + escapeHtml(s) + "</span>";
            })
            .join("");

          tmStats.innerHTML = data.stats
            .map(function (s) {
              return (
                "<div><strong>" +
                escapeHtml(s.value) +
                "</strong><small>" +
                escapeHtml(s.label) +
                "</small></div>"
              );
            })
            .join("");

          tmSocials.innerHTML = data.social
            .map(function (s) {
              return (
                '<a href="' +
                escapeHtml(s.href) +
                '" target="_blank" rel="noopener">' +
                escapeHtml(s.label) +
                "</a>"
              );
            })
            .join("");

          modal.classList.add("is-open");
          modal.setAttribute("aria-hidden", "false");
          document.body.style.overflow = "hidden";
        }

        function closeModal() {
          modal.classList.remove("is-open");
          modal.setAttribute("aria-hidden", "true");
          document.body.style.overflow = "";
        }

        document
          .querySelectorAll(".team-card[data-member]")
          .forEach(function (card) {
            card.addEventListener("click", function (e) {
              // Don't open the modal if a social link inside the card was clicked
              if (e.target.closest("a")) return;
              openModal(card.getAttribute("data-member"));
            });
          });

        closeBtn.addEventListener("click", closeModal);

        modal.addEventListener("click", function (e) {
          if (!dialog.contains(e.target)) closeModal();
        });

        document.addEventListener("keydown", function (e) {
          if (e.key === "Escape" && modal.classList.contains("is-open"))
            closeModal();
        });
      })();
    </script>
  </body>
</html>
