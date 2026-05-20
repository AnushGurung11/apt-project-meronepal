<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blog — Mero Nepal Production</title>

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
      h3 {
        font-size: clamp(1.4rem, 2.5vw, 2rem);
      }
      p {
        color: #b0aa9f;
        font-weight: 300;
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
      .btn-outline {
        border: 1px solid var(--gold);
        color: var(--gold);
      }
      .btn-outline:hover {
        background: var(--gold);
        color: var(--black);
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

      /* ── Blog Card ───────────────────────────────────────────── */
      .blog-card {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        overflow: hidden;
        transition: all var(--transition);
      }
      .blog-card:hover {
        border-color: var(--gold);
        transform: translateY(-4px);
        box-shadow: var(--shadow);
      }
      .blog-card-body {
        padding: 28px;
      }

      .blog-tag {
        display: inline-block;
        font-size: 10px;
        letter-spacing: 0.15em;
        text-transform: uppercase;
        color: var(--gold);
        border: 1px solid var(--gold-dim);
        padding: 4px 12px;
        border-radius: 20px;
        margin-bottom: 14px;
      }
      .blog-title {
        font-family: var(--font-display);
        font-size: 1.35rem;
        font-weight: 400;
        margin-bottom: 12px;
        line-height: 1.3;
        color: var(--white);
      }
      .blog-title a:hover {
        color: var(--gold);
      }

      .blog-meta {
        font-size: 12px;
        color: var(--muted);
      }

      /* ── Responsive ──────────────────────────────────────────── */
      @media (max-width: 768px) {
        .container {
          padding: 0 20px;
        }
        .section {
          padding: 70px 0;
        }
        .grid-3 {
          grid-template-columns: 1fr;
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

      <!-- ════════════════════════════════════════
           CENTER — YOUR PAGE CONTENT GOES HERE
           ════════════════════════════════════════ -->
      <main class="pt-14 md:pt-0">
        <section class="page-hero">
          <div class="container">
            <div class="section-label" style="justify-content: center">
              Stories &amp; Insights
            </div>
            <h1 style="font-size: 68.22px">
              The Mero Nepal Production Journal
            </h1>
            <div class="divider divider-center"></div>
            <p style="max-width: 460px; margin: 0 auto">
              Behind-the-scenes stories, photography tips, and moments from our
              favourite shoots.
            </p>
          </div>
        </section>

        <section class="section">
          <div class="container">
            <!-- Featured post -->
            <div
              style="
                background: var(--surface);
                border: 1px solid var(--border);
                border-radius: var(--radius-lg);
                overflow: hidden;
                margin-bottom: 60px;
                display: grid;
                grid-template-columns: 1fr 1fr;
              "
            >
              <div
                style="
                  background: linear-gradient(135deg, #1a1208, #0d0d0d);
                  min-height: 360px;
                  display: flex;
                  align-items: center;
                  justify-content: center;
                  font-size: 5rem;
                  border-right: 1px solid var(--border);
                "
              >
                <img
                  src="${pageContext.request.contextPath}/assets/img/blog/inside-arjun-priya-luxury-wedding.jpeg"
                  alt="Inside Arjun & Priya's Luxury Wedding"
                  style="width: 100%; height: 360px; object-fit: cover"
                />
              </div>
              <div style="padding: 48px">
                <span class="blog-tag">Wedding</span>
                <h2
                  style="
                    font-size: 1.8rem;
                    margin-bottom: 16px;
                    line-height: 1.3;
                  "
                >
                  <a
                    href="${pageContext.request.contextPath}/blog/1"
                    style="color: var(--white)"
                    >Inside Arjun &amp; Priya's Luxury Wedding — A Pokhara
                    Story</a
                  >
                </h2>
                <p style="font-size: 14px; margin-bottom: 24px">
                  A behind-the-scenes look at our most ambitious production to
                  date — a full-crew luxury wedding shoot set against the
                  Annapurna Range.
                </p>
                <div class="blog-meta" style="margin-bottom: 28px">
                  By Darshan Regmi &nbsp;·&nbsp; June 2025 &nbsp;·&nbsp; 6 min
                  read
                </div>
                <a
                  href="${pageContext.request.contextPath}/blog/1"
                  class="btn btn-outline"
                  >Read Story →</a
                >
              </div>
            </div>

            <!-- Blog grid -->
            <div class="grid-3">
              <div class="blog-card">
                <div
                  style="
                    height: 200px;
                    background: linear-gradient(135deg, #101418, #0a0a0a);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 3rem;
                    border-bottom: 1px solid var(--border);
                  "
                >
                  <img
                    src="${pageContext.request.contextPath}/assets/img/blog/drone-shots-wedding-films.jpeg"
                    alt="5 Drone Shots That Changed Our Wedding Films"
                    style="width: 100%; height: 100%; object-fit: cover"
                  />
                </div>
                <div class="blog-card-body">
                  <span class="blog-tag">Drone</span>
                  <h3 class="blog-title">
                    <a href="${pageContext.request.contextPath}/blog/2"
                      >5 Drone Shots That Changed Our Wedding Films</a
                    >
                  </h3>
                  <p style="font-size: 13px; margin-bottom: 16px">
                    The angles that make clients gasp — Bijaya shares the aerial
                    compositions that define our wedding cinematography.
                  </p>
                  <div class="blog-meta">
                    Bijaya Khanal &nbsp;·&nbsp; July 2025
                  </div>
                </div>
              </div>
              <div class="blog-card">
                <div
                  style="
                    height: 200px;
                    background: linear-gradient(135deg, #101810, #0a0a0a);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 3rem;
                    border-bottom: 1px solid var(--border);
                  "
                >
                  <img
                    src="${pageContext.request.contextPath}/assets/img/blog/pre-wedding-shoots-guide.jpeg"
                    alt="Pre-Wedding Shoots Guide"
                    style="width: 100%; height: 100%; object-fit: cover"
                  />
                </div>
                <div class="blog-card-body">
                  <span class="blog-tag">Pre-Wedding</span>
                  <h3 class="blog-title">
                    <a href="${pageContext.request.contextPath}/blog/3"
                      >Pre-Wedding Shoots: Our Guide to the Perfect Session</a
                    >
                  </h3>
                  <p style="font-size: 13px; margin-bottom: 16px">
                    What to wear, where to shoot, and how to feel natural in
                    front of the camera — everything couples need to know.
                  </p>
                  <div class="blog-meta">
                    Krish Shrestha &nbsp;·&nbsp; May 2025
                  </div>
                </div>
              </div>
              <div class="blog-card">
                <div
                  style="
                    height: 200px;
                    background: linear-gradient(135deg, #181410, #0a0a0a);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 3rem;
                    border-bottom: 1px solid var(--border);
                  "
                >
                  <img
                    src="${pageContext.request.contextPath}/assets/img/blog/product-photography-tips.jpeg"
                    alt="Product Photography Tips"
                    style="width: 100%; height: 100%; object-fit: cover"
                  />
                </div>
                <div class="blog-card-body">
                  <span class="blog-tag">Product</span>
                  <h3 class="blog-title">
                    <a href="${pageContext.request.contextPath}/blog/4"
                      >Why Product Photography Makes or Breaks Your Brand</a
                    >
                  </h3>
                  <p style="font-size: 13px; margin-bottom: 16px">
                    A deep dive into how intentional product photography
                    transforms conversions for Kathmandu-based brands.
                  </p>
                  <div class="blog-meta">
                    Darshan Regmi &nbsp;·&nbsp; April 2025
                  </div>
                </div>
              </div>
              <div class="blog-card">
                <div
                  style="
                    height: 200px;
                    background: linear-gradient(135deg, #141018, #0a0a0a);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 3rem;
                    border-bottom: 1px solid var(--border);
                  "
                >
                  <img
                    src="${pageContext.request.contextPath}/assets/img/blog/documenting-heritage-patan.jpeg"
                    alt="Documenting Heritage: Our Cultural Film in Patan"
                    style="width: 100%; height: 100%; object-fit: cover"
                  />
                </div>
                <div class="blog-card-body">
                  <span class="blog-tag">Documentary</span>
                  <h3 class="blog-title">
                    <a href="${pageContext.request.contextPath}/blog/5"
                      >Documenting Heritage: Our Cultural Film in Patan</a
                    >
                  </h3>
                  <p style="font-size: 13px; margin-bottom: 16px">
                    A reflection on our most personal project — a documentary
                    about artisan craftsmen in the old city of Patan, Nepal.
                  </p>
                  <div class="blog-meta">
                    Anush Gurung &nbsp;·&nbsp; July 2025
                  </div>
                </div>
              </div>
              <div class="blog-card">
                <div
                  style="
                    height: 200px;
                    background: linear-gradient(135deg, #101414, #0a0a0a);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 3rem;
                    border-bottom: 1px solid var(--border);
                  "
                >
                  <img
                    src="${pageContext.request.contextPath}/assets/img/blog/color-grading-wedding-films.jpeg"
                    alt="The Art of Color Grading in Wedding Films"
                    style="width: 100%; height: 100%; object-fit: cover"
                  />
                </div>
                <div class="blog-card-body">
                  <span class="blog-tag">Editing</span>
                  <h3 class="blog-title">
                    <a href="${pageContext.request.contextPath}/blog/6"
                      >The Art of Color Grading in Wedding Films</a
                    >
                  </h3>
                  <p style="font-size: 13px; margin-bottom: 16px">
                    How subtle color grading choices shape mood, memory, and
                    emotion in the final cut of a wedding film.
                  </p>
                  <div class="blog-meta">
                    Sudip Gautam &nbsp;·&nbsp; March 2025
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <%@ include file="/WEB-INF/pages/components/footer.jsp" %>
      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-public.jsp" %>
    </div>
    <!-- end 3-col grid -->

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>
  </body>
</html>
