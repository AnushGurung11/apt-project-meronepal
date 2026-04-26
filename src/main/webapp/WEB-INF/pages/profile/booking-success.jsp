<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Booking — Mero Nepal Production</title>

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
      .hr {
        --color-bg: #0a0a0a;
        --color-surface: #131313;
        --color-surface-2: #201f1f;
        --color-border: rgba(255, 255, 255, 0.08);
        --color-text: #e6e6e6;
        --color-text-soft: rgba(229, 226, 225, 0.45);
        --color-gold: #c6a059;
        --color-gold-alt: #e6c364;
        --color-success: #4caf7d;
        --color-warning: #e6b64a;
        --color-danger: #e06060;
        --color-info: #6ab0e6;
        --font-sans: "Inter", sans-serif;
        --font-serif: "Playfair Display", serif;
        --space-xs: 0.5rem;
        --space-sm: 1rem;
        --space-md: 2rem;
        --space-lg: 4rem;
        --space-xl: 8rem;
        --radius: 8px;
        --radius-sm: 4px;
        --transition: 0.25s ease;
        --section-max: 960px;
        font-family: var(--font-sans);
        font-size: 16px;
        line-height: 1.7;
        -webkit-font-smoothing: antialiased;
        box-sizing: border-box;
        padding: 0;
        border: none;
        border-top: 1px solid var(--color-border);
        margin: var(--space-md) 0;
      }

      /* ── BOOKING PAGE INTERNAL STYLES ── */
      :root {
        --color-bg: #0a0a0a;
        --color-surface: #131313;
        --color-surface-2: #201f1f;
        --color-border: rgba(255, 255, 255, 0.08);
        --color-text: #e6e6e6;
        --color-text-soft: rgba(229, 226, 225, 0.45);
        --color-gold: #c6a059;
        --color-gold-alt: #e6c364;
        --color-success: #4caf7d;
        --color-danger: #e06060;
        --font-sans: "Inter", sans-serif;
        --font-serif: "Playfair Display", serif;
        --radius: 8px;
        --transition: 0.25s ease;
      }

      body {
        background: var(--color-bg);
        color: var(--color-text);
        font-family: var(--font-sans);
      }

      /* ── STEPPER ── */
      .booking-stepper {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0;
        padding: 48px 24px 40px;
      }
      .step-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 8px;
        position: relative;
      }
      .step-circle {
        width: 36px;
        height: 36px;
        border-radius: 50%;
        border: 1px solid rgba(255, 255, 255, 0.15);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 13px;
        font-weight: 500;
        color: var(--color-text-soft);
        background: var(--color-surface);
        transition: all var(--transition);
        z-index: 1;
      }
      .step-item.active .step-circle {
        border-color: var(--color-gold);
        color: var(--color-gold);
        box-shadow: 0 0 0 4px rgba(198, 160, 89, 0.15);
      }
      .step-item.done .step-circle {
        background: var(--color-gold);
        border-color: var(--color-gold);
        color: #0a0a0a;
      }
      .step-label {
        font-size: 10px;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        color: var(--color-text-soft);
        white-space: nowrap;
      }
      .step-item.active .step-label,
      .step-item.done .step-label {
        color: var(--color-gold);
      }
      .step-connector {
        width: 80px;
        height: 1px;
        background: rgba(255, 255, 255, 0.1);
        margin-bottom: 24px;
        flex-shrink: 0;
        transition: background var(--transition);
      }
      .step-connector.done {
        background: var(--color-gold);
      }

      /* ── SECTION HEADING ── */
      .booking-heading {
        text-align: center;
        padding: 0 24px 40px;
      }
      .booking-heading h2 {
        font-family: var(--font-serif);
        font-size: clamp(1.6rem, 3vw, 2.2rem);
        font-weight: 400;
        margin-bottom: 8px;
        color: var(--color-text);
      }
      .booking-heading p {
        font-size: 13px;
        color: var(--color-text-soft);
      }

      /* ── PACKAGE GRID ── */
      .packages-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
        gap: 16px;
        padding: 0 24px;
      }
      .pkg-card {
        border: 1px solid var(--color-border);
        border-radius: var(--radius);
        padding: 24px 20px;
        background: var(--color-surface);
        cursor: pointer;
        transition: all var(--transition);
        position: relative;
      }
      .pkg-card:hover {
        border-color: rgba(198, 160, 89, 0.4);
        background: #181612;
      }
      .pkg-card.selected {
        border-color: var(--color-gold);
        background: linear-gradient(
          135deg,
          var(--color-surface),
          rgba(198, 160, 89, 0.06)
        );
      }
      .pkg-card.featured::before {
        content: "Popular";
        position: absolute;
        top: -1px;
        right: 16px;
        background: var(--color-gold);
        color: #0a0a0a;
        font-size: 9px;
        font-weight: 600;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        padding: 3px 10px;
        border-radius: 0 0 4px 4px;
      }
      .pkg-name {
        font-size: 11px;
        letter-spacing: 0.14em;
        text-transform: uppercase;
        color: var(--color-text-soft);
        margin-bottom: 8px;
      }
      .pkg-price {
        font-family: var(--font-serif);
        font-size: 1.5rem;
        color: var(--color-gold);
        margin-bottom: 4px;
      }
      .pkg-desc {
        font-size: 12px;
        color: var(--color-text-soft);
        line-height: 1.5;
      }
      .pkg-check {
        display: none;
        position: absolute;
        top: 12px;
        left: 14px;
        width: 18px;
        height: 18px;
        border-radius: 50%;
        background: var(--color-gold);
        align-items: center;
        justify-content: center;
        font-size: 10px;
        color: #0a0a0a;
      }
      .pkg-card.selected .pkg-check {
        display: flex;
      }

      /* ── STEP ACTIONS ── */
      .step-actions {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 32px 24px 48px;
      }
      .step-actions.center {
        justify-content: center;
      }

      /* ── BUTTONS ── */
      .btn-gold {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 11px 28px;
        background: var(--color-gold);
        color: #0a0a0a;
        font-size: 12px;
        font-weight: 600;
        letter-spacing: 0.1em;
        text-transform: uppercase;
        border: none;
        border-radius: var(--radius);
        cursor: pointer;
        transition: all var(--transition);
      }
      .btn-gold:hover {
        background: var(--color-gold-alt);
        transform: translateY(-1px);
      }
      .btn-gold:disabled {
        opacity: 0.35;
        cursor: not-allowed;
        transform: none;
      }
      .btn-ghost {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 11px 24px;
        border: 1px solid var(--color-border);
        color: var(--color-text-soft);
        font-size: 12px;
        font-weight: 500;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        background: none;
        border-radius: var(--radius);
        cursor: pointer;
        transition: all var(--transition);
      }
      .btn-ghost:hover {
        border-color: var(--color-gold);
        color: var(--color-gold);
      }

      /* ── FORM ── */
      .booking-form {
        padding: 0 24px;
      }
      .form-layout {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 32px;
        align-items: flex-start;
      }
      @media (max-width: 640px) {
        .form-layout {
          grid-template-columns: 1fr;
        }
        .packages-grid {
          grid-template-columns: 1fr 1fr;
        }
        .step-connector {
          width: 40px;
        }
      }
      .form-group {
        margin-bottom: 20px;
      }
      .form-label {
        display: block;
        font-size: 10px;
        letter-spacing: 0.14em;
        text-transform: uppercase;
        color: var(--color-text-soft);
        margin-bottom: 8px;
      }
      .form-input {
        width: 100%;
        background: var(--color-surface-2);
        border: 1px solid var(--color-border);
        color: var(--color-text);
        border-radius: var(--radius);
        padding: 11px 14px;
        font-family: var(--font-sans);
        font-size: 14px;
        outline: none;
        transition: border-color var(--transition);
      }
      .form-input:focus {
        border-color: var(--color-gold);
      }
      .form-input::placeholder {
        color: var(--color-text-soft);
      }

      /* ── SUMMARY BOX ── */
      .summary-box {
        background: var(--color-surface);
        border: 1px solid var(--color-border);
        border-radius: var(--radius);
        padding: 24px;
      }
      .summary-label {
        font-size: 10px;
        letter-spacing: 0.16em;
        text-transform: uppercase;
        color: var(--color-gold);
        display: flex;
        align-items: center;
        gap: 8px;
        margin-bottom: 16px;
      }
      .summary-label::before {
        content: "";
        display: block;
        width: 20px;
        height: 1px;
        background: var(--color-gold);
      }
      .summary-pkg-name {
        font-family: var(--font-serif);
        font-size: 1.3rem;
        margin-bottom: 4px;
      }
      .summary-pkg-price {
        font-family: var(--font-serif);
        font-size: 1.7rem;
        color: var(--color-gold);
        margin-bottom: 16px;
      }
      .summary-divider {
        height: 1px;
        background: var(--color-border);
        margin: 16px 0;
      }
      .summary-note {
        font-size: 12px;
        color: var(--color-text-soft);
        line-height: 1.6;
      }

      /* ── SUMMARY ROWS ── */
      .summary-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 0;
        border-bottom: 1px solid var(--color-border);
        font-size: 13px;
      }
      .summary-row:last-child {
        border-bottom: none;
      }
      .summary-row .lbl {
        color: var(--color-text-soft);
      }
      .summary-row .val {
        color: var(--color-text);
        font-weight: 500;
      }
      .summary-row.total .lbl {
        color: var(--color-text);
        font-size: 14px;
      }
      .summary-row.total .val {
        font-family: var(--font-serif);
        font-size: 1.4rem;
        color: var(--color-gold);
      }

      /* ── WHAT'S NEXT BOX ── */
      .next-box {
        background: var(--color-surface);
        border: 1px solid var(--color-border);
        border-radius: var(--radius);
        padding: 24px;
      }
      .next-box h4 {
        font-size: 13px;
        font-weight: 600;
        letter-spacing: 0.06em;
        text-transform: uppercase;
        color: var(--color-text-soft);
        margin-bottom: 20px;
      }
      .next-step-item {
        display: flex;
        gap: 14px;
        align-items: flex-start;
        margin-bottom: 18px;
      }
      .next-step-item:last-child {
        margin-bottom: 0;
      }
      .next-num {
        width: 24px;
        height: 24px;
        border-radius: 50%;
        background: var(--color-gold);
        color: #0a0a0a;
        font-size: 10px;
        font-weight: 700;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
        margin-top: 2px;
      }
      .next-title {
        font-size: 13px;
        font-weight: 500;
        margin-bottom: 2px;
      }
      .next-desc {
        font-size: 12px;
        color: var(--color-text-soft);
        line-height: 1.5;
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

    <!-- ── MOBILE TOP BAR ── -->
    <div
      class="md:hidden fixed top-0 left-0 right-0 z-50 flex items-center justify-between px-6 h-14 bg-[#0a0a0a]"
      style="border-bottom: 1px solid var(--color-border)"
    >
      <div class="text-xl font-black"><a href="../../index.jsp">M.NP</a></div>
      <button
        id="nav-toggle"
        class="flex flex-col gap-[5px] p-1"
        aria-label="Toggle menu"
      >
        <span
          id="bar1"
          class="block w-6 h-px bg-white"
          style="
            transition:
              transform 0.25s,
              opacity 0.25s;
          "
        ></span>
        <span
          id="bar2"
          class="block w-6 h-px bg-white"
          style="transition: opacity 0.25s"
        ></span>
        <span
          id="bar3"
          class="block w-4 h-px bg-white"
          style="transition: transform 0.25s"
        ></span>
      </button>
    </div>

    <!-- ── MOBILE NAV DRAWER ── -->
    <nav
      id="mobile-nav"
      class="md:hidden fixed inset-0 z-40 bg-[#0a0a0a] flex flex-col justify-center items-center gap-10"
      style="transform: translateX(100%); transition: transform 0.3s ease"
    >
      <a
        href="../../index.jsp"
        class="text-3xl font-black uppercase tracking-widest"
        >Home</a
      >
      <a
        href="../../pages/packages.jsp"
        class="text-3xl font-black uppercase tracking-widest"
        >Package</a
      >
      <a
        href="../../pages/about.jsp"
        class="text-3xl font-black uppercase tracking-widest"
        >About</a
      >
      <a
        href="../../pages/blog.jsp"
        class="text-3xl font-black uppercase tracking-widest"
        >Blog</a
      >
      <a href="../../pages/login.jsp" class="uppercase btn-secondary mt-4"
        >Login</a
      >
      <a href="../../pages/packages.jsp" class="uppercase btn-primary mt-4"
        >Book Now</a
      >
    </nav>

    <!-- ── MAIN 3-COLUMN LAYOUT ── -->
    <div
      class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10"
    >
      <!-- LEFT RAIL (desktop only) -->
      <aside
        class="hidden md:flex flex-col justify-between items-center py-12 border-r border-white/10 sticky top-0 h-screen"
      >
        <div class="text-2xl font-black">
          <a href="../../index.jsp">M.NP</a>
        </div>
        <div
          class="vertical-text text-[10px] tracking-[0.4em] uppercase"
          style="color: var(--color-gold)"
        >
          Mero Nepal Production — EST. 2014
        </div>
        <div
          class="w-2 h-2 rounded-full"
          style="background: var(--color-gold)"
        ></div>
      </aside>

      <!-- ════════════════════════════════════════
           CENTER — BOOKING CONTENT
           ════════════════════════════════════════ -->
      <main class="pt-14 md:pt-0">
        <div
          class="flex-center grid place-items-center min-h-screen"
          style="
            min-height: 100vh;
            flex-direction: column;
            text-align: center;
            padding: 40px 20px;
          "
        >
          <div style="max-width: 520px">
            <div
              style="
                width: 80px;
                height: 80px;
                border-radius: 50%;
                background: rgba(52, 199, 89, 0.12);
                border: 2px solid #34c759;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 2rem;
                margin: 0 auto 32px;
              "
            >
              ✓
            </div>
            <div
              class="section-label"
              style="justify-content: center; margin-bottom: 16px"
            >
              Booking Confirmed
            </div>
            <h1 style="font-size: 2.8rem; margin-bottom: 16px">
              You're all set!
            </h1>
            <div class="divider divider-center"></div>
            <p style="margin-bottom: 8px">
              Your booking has been received and is under review. A confirmation
              email will be sent shortly.
            </p>
            <div
              style="
                background: var(--surface);
                border: 1px solid var(--border);
                border-radius: var(--radius-lg);
                padding: 28px;
                margin: 32px 0;
                text-align: left;
              "
            >
              <div class="summary-row">
                <span class="label">Booking Reference</span
                ><span
                  class="value"
                  style="
                    color: var(--gold);
                    font-family: var(--font-display);
                    font-size: 1.2rem;
                  "
                  >#APT-2025-008</span
                >
              </div>
              <div class="summary-row">
                <span class="label">Status</span
                ><span class="value"
                  ><span class="badge badge-pending">Pending</span></span
                >
              </div>
              <div class="summary-row">
                <span class="label">Team Contact</span
                ><span class="value">+977 9800000005</span>
              </div>
            </div>
            <div
              style="
                display: flex;
                gap: 16px;
                justify-content: center;
                flex-wrap: wrap;
              "
            >
              <a href="my-bookings.jsp" class="btn btn-gold"
                >View My Bookings</a
              >
              <a href="../index.jsp" class="btn btn-ghost">Back to Home</a>
            </div>
          </div>
        </div>
        <!-- ── FOOTER ── -->
        <div class="footer">
          <div class="container">
            <div class="container2">
              <div class="container3">
                <div class="mero-nepal">Mero Nepal Production</div>
              </div>
              <div class="container4">
                <div class="text">
                  <br />
                  Cinematic photography and media production based in Nepal. We
                  capture the moments that define your story.
                </div>
              </div>
            </div>

            <div class="container5">
              <div class="container6">
                <div class="heading-6">
                  <div class="navigation">NAVIGATION</div>
                </div>
                <br />
                <div class="list">
                  <div class="item">
                    <a href="../../index.jsp"><div>Home</div></a>
                  </div>
                  <div class="item">
                    <a href="../../pages/packages.jsp"><div>Packages</div></a>
                  </div>
                  <div class="item">
                    <a href="../../pages/about.jsp"><div>About</div></a>
                  </div>
                  <div class="item">
                    <a href="../../pages/blog.jsp"><div>Blog</div></a>
                  </div>
                </div>
              </div>

              <div class="container7">
                <div class="heading-6">
                  <div class="legal">Account</div>
                </div>
                <br />
                <div class="list">
                  <div class="item">
                    <a href="../../pages/login.jsp"><div>Login</div></a>
                  </div>
                  <div class="item">
                    <a href="../../pages/register.jsp"><div>Register</div></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="container8">
              <div class="heading-6">
                <div class="stay-inspired">Contact</div>
              </div>
              <div class="horizontal-border">
                <input
                  class="footer-input"
                  type="email"
                  placeholder="Email Address"
                />
                <button class="footer-btn">→</button>
              </div>
              <div class="container10">
                <a
                  href="mailto:hello@meronepal.com"
                  class="social-link"
                  aria-label="Email"
                  target="_blank"
                >
                  <span class="material-symbols-outlined social-icon"
                    >mail</span
                  >
                </a>
                <a
                  href="https://meronepal.com"
                  class="social-link"
                  aria-label="Website"
                  target="_blank"
                >
                  <span class="material-symbols-outlined social-icon"
                    >language</span
                  >
                </a>
                <a
                  href="https://instagram.com/yourpage"
                  class="social-link"
                  aria-label="Instagram"
                  target="_blank"
                >
                  <span class="material-symbols-outlined social-icon"
                    >photo_camera</span
                  >
                </a>
              </div>
            </div>
          </div>

          <div class="horizontal-border2">
            <div class="container3">
              <div class="_2024-mero-nepal-production-the-modern-auteur">
                ©
                <script>
                  document.write(new Date().getFullYear());
                </script>
                Mero Nepal Production. The Modern Auteur.
              </div>
            </div>
          </div>
        </div>
      </main>

      <!-- RIGHT RAIL (desktop only) -->
      <aside
        class="hidden md:flex flex-col justify-between p-12 border-l border-white/10 sticky top-0 h-screen"
      >
        <nav class="space-y-6">
          <a href="profile.jsp" class="block uppercase">My Profile</a>
          <a href="my-bookings.jsp" class="block uppercase">My Bookings</a>
          <a href="book.jsp" class="block uppercase btn-secondary active"
            >+ New Booking</a
          >
          <hr class="hr" />
          <br />
          <a href="../../pages/packages.jsp" class="block uppercase"
            >Packages</a
          >
          <a href="../../pages/blog.jsp" class="block uppercase">Blog</a>
          <a
            href="../../pages/auth/login.jsp"
            class="uppercase btn-secondary mt-4"
            >Logout</a
          >
        </nav>
      </aside>
    </div>
    <!-- end 3-col grid -->

    <!-- ── MOBILE NAV SCRIPT ── -->
    <script>
      const toggle = document.getElementById("nav-toggle");
      const drawer = document.getElementById("mobile-nav");
      const bar1 = document.getElementById("bar1");
      const bar2 = document.getElementById("bar2");
      const bar3 = document.getElementById("bar3");
      let isOpen = false;

      toggle.addEventListener("click", () => {
        isOpen = !isOpen;
        drawer.style.transform = isOpen ? "translateX(0)" : "translateX(100%)";
        bar1.style.transform = isOpen ? "translateY(6px) rotate(45deg)" : "";
        bar2.style.opacity = isOpen ? "0" : "1";
        bar3.style.transform = isOpen ? "translateY(-6px) rotate(-45deg)" : "";
        bar3.style.width = isOpen ? "24px" : "";
      });

      drawer.querySelectorAll("a").forEach((a) =>
        a.addEventListener("click", () => {
          isOpen = false;
          drawer.style.transform = "translateX(100%)";
          bar1.style.transform = bar3.style.transform = "";
          bar2.style.opacity = "1";
          bar3.style.width = "";
        }),
      );
    </script>

    <!-- ── BOOKING SCRIPT ── -->
    <script>
      let selectedPackage = { name: "", price: "" };

      function selectPackage(card, name, price) {
        document
          .querySelectorAll(".pkg-card")
          .forEach((c) => c.classList.remove("selected"));
        card.classList.add("selected");
        selectedPackage = { name, price };
        const btn = document.getElementById("step1Next");
        btn.disabled = false;
      }

      function goStep(n) {
        [1, 2, 3].forEach((i) => {
          document.getElementById("step" + i).style.display =
            i === n ? "block" : "none";
          const si = document.getElementById("si" + i);
          si.classList.remove("active", "done");
          if (i < n) si.classList.add("done");
          else if (i === n) si.classList.add("active");
          if (i < 3) {
            const sc = document.getElementById("sc" + i);
            sc.classList.toggle("done", i < n);
          }
        });
        if (n === 2) {
          document.getElementById("s2PackageName").textContent =
            selectedPackage.name;
          document.getElementById("s2PackagePrice").textContent =
            selectedPackage.price;
        }
        if (n === 3) {
          document.getElementById("s3Pkg").textContent = selectedPackage.name;
          document.getElementById("s3Date").textContent =
            document.getElementById("eventDate").value || "—";
          document.getElementById("s3Loc").textContent =
            document.getElementById("eventAddress").value || "—";
          document.getElementById("s3Price").textContent =
            selectedPackage.price;
        }
        window.scrollTo({ top: 0, behavior: "smooth" });
      }
    </script>
  </body>
</html>
