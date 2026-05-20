<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>The Art of Color Grading in Wedding Films — Mero Nepal Production</title>

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
              <span>Editing</span>
            </div>
            <div class="post-body">
              <span class="blog-tag">Editing</span>
              <h1
                style="margin: 16px 0 20px; font-size: clamp(2rem, 4vw, 3rem)"
              >
                The Art of Color Grading in Wedding Films
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
                    SG
                  </div>
                  <span style="font-size: 13px">Sudip Gautam</span>
                </div>
                <span style="color: var(--border)">|</span>
                <span style="font-size: 13px; color: var(--muted)"
                  >March 19, 2025</span
                >
                <span style="color: var(--border)">|</span>
                <span style="font-size: 13px; color: var(--muted)"
                  >6 min read</span
                >
              </div>

              <div
                style="
                  height: 400px;
                  background: linear-gradient(135deg, #101414, #0d0d0d);
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
                  src="${pageContext.request.contextPath}/assets/img/blog/color-grading-wedding-films.jpeg"
                  alt="Color grading wedding films"
                  style="
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                  "
                />
              </div>

              <p>
                Color grading is the part of the wedding-film process that
                clients almost never see and that determines almost everything
                about how the final film feels. A clip can be perfectly shot,
                perfectly cut, perfectly scored, and still feel wrong — or
                exactly right — depending entirely on what happens between
                editor and image in the last week of post.
              </p>

              <h3>Why Color Matters More Than People Think</h3>
              <p>
                Color is the fastest emotional language a moving image has.
                Long before a viewer parses the action in a frame, they've
                already absorbed its temperature, its contrast, its saturation,
                and made a subconscious judgement about whether the scene feels
                warm, distant, joyful, melancholy, or intimate. We can shape
                that judgement with a few well-placed adjustments. We can
                undermine the entire film with a few poor ones.
              </p>

              <h3>The Mero Nepal Look</h3>
              <p>
                Our house style for wedding films sits in a specific zone:
                slightly warm skin tones, lifted shadows that stay readable
                rather than crushed, gentle desaturation in the greens to keep
                Nepal's landscapes from going cartoonish, and a careful pull on
                the highlights so whites breathe instead of clip. It's a look
                that ages well — bright enough to feel celebratory, soft
                enough to feel timeless. We avoid trendy looks that scream the
                year they were made.
              </p>

              <blockquote>
                <p>
                  "The best grade is invisible. If the audience notices the
                  colour, the colour is too loud."
                </p>
              </blockquote>

              <h3>The Process, Honestly</h3>
              <p>
                Every wedding film we deliver goes through three grading
                passes. The first is the technical pass — converting the raw
                log footage to a working colour space and balancing each shot
                so the same scene cuts together cleanly. The second is the
                creative pass, where the look of the film is shaped and the
                emotional arc is mapped onto colour temperature shifts. The
                third is the final review, where we sit back, watch the entire
                film through, and pull anything that draws too much attention
                to itself.
              </p>

              <h3>Skin Tones Are Sacred</h3>
              <p>
                The single biggest mistake we see in amateur wedding films is
                pushing skin tones into unnatural territory chasing a
                "cinematic" look. Skin should always feel like skin. We grade
                everything else around the people first, never the other way
                around. A perfect sky behind an orange-faced bride is not a
                tradeoff anyone should make.
              </p>

              <h3>Matching Across a Wedding Day</h3>
              <p>
                A Nepali wedding can pass through six lighting environments in
                twelve hours — bright morning sun, indoor tungsten, mixed
                ballroom LEDs, candlelit ceremony, evening reception lasers,
                drone-light golden hour. Matching all of that into a single
                cohesive film is most of the grading work. We rely on shot
                grouping in DaVinci Resolve, custom LUTs built off our own
                reference frames, and a lot of careful attention to white
                balance shot-by-shot.
              </p>

              <h3>Restraint Is the Whole Discipline</h3>
              <p>
                The grade that wins is the grade you almost didn't do. Every
                slider has a temptation to push it further; the discipline is
                pulling it back to the point where the image still feels like
                a memory rather than a music video. Memories are what couples
                are paying us to preserve. Everything else is just colour
                noise.
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
