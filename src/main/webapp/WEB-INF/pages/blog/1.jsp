<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PAGE TITLE — Mero Nepal Production</title>

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
      @import url("https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Outfit:wght@300;400;500;600&display=swap");

      /* ── Variables ───────────────────────────────────────────── */
      :root {
        --black: #0a0a0a;
        --dark: #111111;
        --surface: #181818;
        --surface2: #222222;
        --border: #2a2a2a;
        --gold: #c9a84c;
        --gold-dim: #c9a84c33;
        --white: #f5f0e8;
        --muted: #888880;

        --font-display: "Cormorant Garamond", Georgia, serif;
        --font-body: "Outfit", sans-serif;

        --radius: 6px;
        --radius-lg: 12px;
        --transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
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
      a {
        color: inherit;
        text-decoration: none;
        transition: color var(--transition);
      }

      /* ── Typography ──────────────────────────────────────────── */
      h1,
      h2,
      h3 {
        font-family: var(--font-display);
        font-weight: 400;
        line-height: 1.15;
        letter-spacing: 0.01em;
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
      .text-center {
        text-align: center;
      }

      /* ── Breadcrumb ──────────────────────────────────────────── */
      .breadcrumb {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 12px;
        color: var(--muted);
        margin-bottom: 28px;
      }
      .breadcrumb a:hover {
        color: var(--gold);
      }
      .breadcrumb span {
        color: var(--muted);
      }

      /* ── Blog Tag ────────────────────────────────────────────── */
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

      /* ── Post Body ───────────────────────────────────────────── */
      .post-body {
        max-width: 720px;
        margin: 0 auto;
      }
      .post-body p {
        margin-bottom: 24px;
      }
      .post-body h3 {
        color: var(--white);
        margin: 40px 0 16px;
      }
      .post-body blockquote {
        border-left: 2px solid var(--gold);
        margin: 32px 0;
        padding: 16px 28px;
        background: var(--surface);
        border-radius: 0 var(--radius) var(--radius) 0;
      }
      .post-body blockquote p {
        font-family: var(--font-display);
        font-style: italic;
        font-size: 1.15rem;
        color: var(--white);
        margin: 0;
      }

      /* ── Button ──────────────────────────────────────────────── */
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
      .btn-ghost {
        border: 1px solid var(--border);
        color: var(--white);
      }
      .btn-ghost:hover {
        border-color: var(--gold);
        color: var(--gold);
      }

      /* ── Responsive ──────────────────────────────────────────── */
      @media (max-width: 768px) {
        .container {
          padding: 0 20px;
        }
      }
      @media (max-width: 480px) {
        .btn {
          padding: 12px 22px;
          font-size: 12px;
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
        href="../index.jsp"
        class="text-3xl font-black uppercase tracking-widest"
        >Home</a
      >
      <a
        href="packages.jsp"
        class="text-3xl font-black uppercase tracking-widest"
        >Package</a
      >
      <a href="about.jsp" class="text-3xl font-black uppercase tracking-widest"
        >About</a
      >
      <a href="blog.jsp" class="text-3xl font-black uppercase tracking-widest"
        >Blog</a
      >
      <a href="../auth/login.jsp" class="uppercase btn-secondary mt-4">Login</a>
      <a href="packages.jsp" class="uppercase btn-primary mt-4">Book Now</a>
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

      <main class="pt-14 md:pt-0">
        <section style="padding: 80px 0 60px">
          <div class="container">
            <div class="breadcrumb">
              <a href="blog.jsp">Blog</a>
              <span>›</span>
              <span>Wedding</span>
            </div>
            <div class="post-body">
              <span class="blog-tag">Wedding</span>
              <h1
                style="margin: 16px 0 20px; font-size: clamp(2rem, 4vw, 3rem)"
              >
                Inside Arjun &amp; Priya's Luxury Wedding — A Pokhara Story
              </h1>
              <div
                style="
                  display: flex;
                  align-items: center;
                  gap: 16px;
                  margin-bottom: 48px;
                  flex-wrap: wrap;
                "
              >
                <div style="display: flex; align-items: center; gap: 10px">
                  <div
                    style="
                      width: 36px;
                      height: 36px;
                      border-radius: 50%;
                      background: var(--surface2);
                      border: 1px solid var(--gold);
                      display: flex;
                      align-items: center;
                      justify-content: center;
                      font-family: var(--font-display);
                      color: var(--gold);
                    "
                  >
                    <img
                      src="../../../assets/img/darshan.jpg"
                      alt="Darshan Regmi"
                      style="width: 100%; height: 100%; border-radius: 50%"
                    />
                  </div>
                  <span style="font-size: 13px">Darshan Regmi</span>
                </div>
                <span style="color: var(--border)">|</span>
                <span style="font-size: 13px; color: var(--muted)"
                  >June 15, 2025</span
                >
                <span style="color: var(--border)">|</span>
                <span style="font-size: 13px; color: var(--muted)"
                  >6 min read</span
                >
              </div>

              <div
                style="
                  height: 400px;
                  background: linear-gradient(135deg, #1a1208, #0d0d0d);
                  border-radius: var(--radius-lg);
                  display: flex;
                  align-items: center;
                  justify-content: center;
                  font-size: 6rem;
                  border: 1px solid var(--border);
                  margin-bottom: 48px;
                "
              >
                <img
                  src="../../../assets/img/blog/inside-arjun-priya-luxury-wedding-2.jpeg"
                  alt="Arjun and Priya's wedding"
                  style="
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    border-radius: var(--radius-lg);
                  "
                />
              </div>

              <p>
                When Arjun and Priya reached out to us in early April, we knew
                this was going to be something special. A Pokhara wedding with
                the Annapurna Range as a backdrop, a full crew, and a couple
                with a vision as clear as mountain air — this was the kind of
                project we dream about.
              </p>

              <p>
                The Luxury Package deployment for this event included our full
                photo and video crew, a dedicated drone operator, and two full
                days of coverage starting with the pre-wedding shoot at Phewa
                Lake.
              </p>

              <h3>Day One: The Pre-Wedding Shoot</h3>
              <p>
                We arrived at Phewa Lake at 5:30am. The light at that hour is
                irreplaceable — soft, warm, directional, and entirely
                cooperative. Arjun and Priya were nervous at first, as most
                couples are, but within twenty minutes of being in front of the
                lens they'd forgotten we were there entirely. That's the moment
                we live for.
              </p>

              <blockquote>
                <p>
                  "We didn't feel like we were being photographed — we felt like
                  we were just living, and someone happened to be there."
                </p>
              </blockquote>

              <p>
                Bijaya took the DJI Mavic 3 up at golden hour for a series of
                aerial establishing shots. The resulting footage — the two of
                them on a small boat, the mountains reflected in the lake, drone
                circling slowly — has become one of our favourite sequences of
                the year.
              </p>

              <h3>Day Two: The Wedding</h3>
              <p>
                The ceremony was held at a heritage venue in Pokhara's old
                quarter. Sudip coordinated a two-camera setup while Arjun
                covered the ceremony from the front and I handled the wide and
                detail shots. Moments like these require silence and patience —
                you cannot manufacture the look on a father's face when his
                daughter walks past.
              </p>

              <p>
                The final deliverables included over 300 edited photographs, a
                14-minute cinematic film, and a separate 3-minute highlight
                reel. The entire project took six weeks of post-production work.
              </p>

              <h3>What We Learned</h3>
              <p>
                Every luxury production teaches us something. This one
                reinforced our belief that the best work comes from genuine
                trust between the team and the couple. When clients feel safe,
                they're present. When they're present, the moments are real. And
                real moments — even the imperfect ones — are the ones worth
                keeping.
              </p>
            </div>
          </div>
        </section>

        <!-- Back to Blog -->
        <section style="padding: 60px 0; border-top: 1px solid var(--border)">
          <div class="container text-center">
            <a href="../blog.jsp" class="btn btn-ghost">← Back to blogs</a>
          </div>
        </section>
        <!-- ↑↑↑ END OF YOUR SECTIONS ↑↑↑ -->

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
                    <a href="../index.jsp"><div>Home</div></a>
                  </div>
                  <div class="item">
                    <a href="packages.jsp"><div>Packages</div></a>
                  </div>
                  <div class="item">
                    <a href="about.jsp"><div>About</div></a>
                  </div>
                  <div class="item">
                    <a href="blog.jsp"><div>Blog</div></a>
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
                    <a href="../auth/login.jsp"><div>Login</div></a>
                  </div>
                  <div class="item">
                    <a href="../auth/register.jsp"><div>Register</div></a>
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
          <a href="../../index.jsp" class="block uppercase">Home</a>
          <a href="../packages.jsp" class="block uppercase">Packages</a>
          <a href="../about.jsp" class="block uppercase">About</a>
          <a href="../blog.jsp" class="block uppercase">Blog</a>
          <a href="../auth/login.jsp" class="uppercase btn-secondary mt-4"
            >Login</a
          >
          <a href="../packages.jsp" class="uppercase btn-primary mt-4"
            >Book Now</a
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
  </body>
</html>
