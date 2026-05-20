<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>5 Drone Shots That Changed Our Wedding Films — Mero Nepal Production</title>

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
      @import url("https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Outfit:wght@300;400;500;600&display=swap");

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

      .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 32px;
      }
      .text-center {
        text-align: center;
      }

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
    <div class="fixed inset-0 opacity-20 z-0 background-grid">
      <script>
        for (let i = 0; i < 96; i++)
          document.write('<div class="grid-cell"></div>');
      </script>
    </div>

    <div
      class="fixed inset-0 opacity-5 pointer-events-none grain-overlay"
    ></div>

    <%@ include file="/WEB-INF/pages/components/mobile-top-bar.jsp" %>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-drawer-public.jsp" %>

    <div
      class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10"
    >
      <%@ include file="/WEB-INF/pages/components/left-rail.jsp" %>

      <main class="pt-14 md:pt-0">
        <section style="padding: 80px 0 60px">
          <div class="container">
            <div class="breadcrumb">
              <a href="${pageContext.request.contextPath}/blog">Blog</a>
              <span>›</span>
              <span>Drone</span>
            </div>
            <div class="post-body">
              <span class="blog-tag">Drone</span>
              <h1
                style="margin: 16px 0 20px; font-size: clamp(2rem, 4vw, 3rem)"
              >
                5 Drone Shots That Changed Our Wedding Films
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
                      font-size: 14px;
                    "
                  >
                    BK
                  </div>
                  <span style="font-size: 13px">Bijaya Khanal</span>
                </div>
                <span style="color: var(--border)">|</span>
                <span style="font-size: 13px; color: var(--muted)"
                  >July 12, 2025</span
                >
                <span style="color: var(--border)">|</span>
                <span style="font-size: 13px; color: var(--muted)"
                  >5 min read</span
                >
              </div>

              <div
                style="
                  height: 400px;
                  background: linear-gradient(135deg, #101418, #0d0d0d);
                  border-radius: var(--radius-lg);
                  display: flex;
                  align-items: center;
                  justify-content: center;
                  border: 1px solid var(--border);
                  margin-bottom: 48px;
                  overflow: hidden;
                "
              >
                <img
                  src="${pageContext.request.contextPath}/assets/img/blog/drone-shots-wedding-films.jpeg"
                  alt="Drone shots in wedding films"
                  style="
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                  "
                />
              </div>

              <p>
                I've been flying drones professionally for almost six years now,
                and the single biggest lesson the work has taught me is this:
                most aerial footage is forgettable because most operators treat
                the drone like a novelty rather than a camera. The five shots
                below are the ones I return to on every wedding shoot —
                compositions that consistently make our clients pause when they
                watch the final film.
              </p>

              <h3>1. The Reveal Pull-Back</h3>
              <p>
                Start tight on the couple at ground level — close enough to read
                their expressions — then slowly pull the drone backward and
                upward, opening the frame until the venue, the valley, or the
                Himalayas fill the background. The emotional logic is simple:
                the audience starts with two people and ends with their entire
                world. We used this exact movement to open Arjun and Priya's
                film and it set the tone for the next fourteen minutes.
              </p>

              <h3>2. The Mountain Approach</h3>
              <p>
                Nepal gives us something almost no other country can: ceremonies
                staged against an 8,000-metre wall of rock and ice. The shot
                that captures it best is a low, steady push from behind the
                couple toward the horizon, drone height matched to the treeline.
                The trick is restraint — fly slow, keep the gimbal locked, and
                let the geography do the work.
              </p>

              <blockquote>
                <p>
                  "A drone shot should feel like a held breath, not a
                  rollercoaster. The moment you notice the drone, the shot has
                  already failed."
                </p>
              </blockquote>

              <h3>3. The Slow Orbit</h3>
              <p>
                An orbit around the couple at the end of a pre-wedding session,
                roughly fifteen metres up, framed with the sun just out of view.
                It's a cliché if you fly it too fast, but at a true cinematic
                pace — eight to twelve seconds per revolution — it becomes one
                of the most reusable shots in the edit. We almost always cut to
                it during the music's emotional swell.
              </p>

              <h3>4. The Ceremony Overhead</h3>
              <p>
                Directly above the mandap, perfectly centred, descending
                vertically just enough to feel like the frame is breathing.
                Indian and Nepali weddings have so much intricate visual detail
                — the geometry of the fire, the arrangement of guests, the
                patterns on the canopy — that an overhead view becomes its own
                kind of portrait of the ceremony.
              </p>

              <h3>5. The Send-Off Pull-Up</h3>
              <p>
                The final shot of nearly every wedding film we deliver. The
                couple walks away from camera, the drone rises straight up, and
                the venue gradually shrinks beneath them. It works because it
                visually closes the story — a literal ending — and because it's
                shot last, when everyone's relaxed and the light has gone soft.
              </p>

              <h3>The Equipment Honestly Matters Less Than You Think</h3>
              <p>
                I get asked about the gear on every shoot. We fly the DJI Mavic
                3 Cine, mostly because of the file flexibility in post, but I'd
                make the same shots with a Mini 4 Pro in a pinch. What actually
                matters is wind awareness, battery discipline, and rehearsing
                the move on the ground before you ever take off. The drone is
                the brush; the composition is the painting.
              </p>
            </div>
          </div>
        </section>

        <section style="padding: 60px 0; border-top: 1px solid var(--border)">
          <div class="container text-center">
            <a href="${pageContext.request.contextPath}/blog" class="btn btn-ghost">← Back to blogs</a>
          </div>
        </section>

        <%@ include file="/WEB-INF/pages/components/footer.jsp" %>
      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-public.jsp" %>
    </div>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>
  </body>
</html>
