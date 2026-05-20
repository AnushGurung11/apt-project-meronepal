<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Documenting Heritage: Our Cultural Film in Patan — Mero Nepal Production</title>

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
              <span>Documentary</span>
            </div>
            <div class="post-body">
              <span class="blog-tag">Documentary</span>
              <h1
                style="margin: 16px 0 20px; font-size: clamp(2rem, 4vw, 3rem)"
              >
                Documenting Heritage: Our Cultural Film in Patan
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
                    AG
                  </div>
                  <span style="font-size: 13px">Anush Gurung</span>
                </div>
                <span style="color: var(--border)">|</span>
                <span style="font-size: 13px; color: var(--muted)"
                  >July 4, 2025</span
                >
                <span style="color: var(--border)">|</span>
                <span style="font-size: 13px; color: var(--muted)"
                  >8 min read</span
                >
              </div>

              <div
                style="
                  height: 400px;
                  background: linear-gradient(135deg, #141018, #0d0d0d);
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
                  src="${pageContext.request.contextPath}/assets/img/blog/documenting-heritage-patan.jpeg"
                  alt="Documenting heritage in Patan"
                  style="
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                  "
                />
              </div>

              <p>
                Most of what we shoot at Mero Nepal Production is built around
                a single day — a wedding, a launch, a campaign. The Patan
                project was different. We spent four months walking the same
                narrow streets, sitting in the same workshops, drinking the
                same butter tea, and slowly being trusted enough to point a
                camera. The result is the most personal film we've ever made,
                and the one I'm most proud of.
              </p>

              <h3>Why Patan</h3>
              <p>
                Patan — known locally as Lalitpur, "the city of beauty" — has
                been a centre of Newar craftsmanship for over a thousand years.
                Walk through its alleyways and you can still hear hand-hammered
                metalwork ringing out of doorways, see thangka painters
                detailing brushstrokes finer than a hair, watch wood-carvers
                shape patterns their grandfathers carved. The skills have
                survived earthquakes, modernisation, and emigration. They may
                not survive another generation of indifference.
              </p>
              <p>
                We didn't want to make a film about loss. We wanted to make a
                film about presence — about the artisans still here, still
                working, still passing the craft along — while there is still
                time.
              </p>

              <h3>Meeting the Craftsmen</h3>
              <p>
                Our first month was almost entirely without a camera. I
                visited workshops, introduced myself, asked questions, and
                left. The community had been filmed many times before by
                tourists, journalists, and well-meaning students who took
                footage and were never heard from again. The right to film is
                not the same as the permission to film.
              </p>

              <blockquote>
                <p>
                  "If you arrive with a camera first, you only ever capture
                  surfaces. The depth waits until the camera disappears."
                </p>
              </blockquote>

              <p>
                By month two, three families had agreed to participate. By
                month three, they were inviting us in for tea before we'd even
                set up. That shift — from being a stranger with a lens to being
                a guest with a job — is the entire foundation of the film.
              </p>

              <h3>Filming with Respect</h3>
              <p>
                Documentary work is the opposite of staged photography. You
                don't direct, you observe. You don't ask people to repeat
                actions for a better angle. You wait, you listen, and you
                shoot when the moment arrives — and then you stop, because
                continuing past the moment is how trust is broken.
              </p>
              <p>
                Practically, we shot on a single Sony FX3 with two prime
                lenses, no rig, no boom. The smaller the kit, the smaller the
                disruption to the room. The audio is almost entirely on-camera
                with one lavalier when we needed clean dialogue. Less gear,
                more presence.
              </p>

              <h3>What Remains</h3>
              <p>
                The film is twenty-two minutes long. It will screen at two
                local cultural festivals this autumn, and we are donating a
                full-resolution archive copy to the families and to the
                Kathmandu Valley Preservation Trust. Whatever happens to the
                craftsmen's workshops over the next decade, there will at
                least be a record of how it looked when the work was still
                being done by the people who learned it from the people who
                learned it from the people who built this city.
              </p>

              <p>
                If you take one thing from this project, let it be that
                documentary filmmaking in your own country is one of the most
                meaningful things a camera can do. Heritage doesn't preserve
                itself. Someone has to choose to point a lens at it before
                the door closes.
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
