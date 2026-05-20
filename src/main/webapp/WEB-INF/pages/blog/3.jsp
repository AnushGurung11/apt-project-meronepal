<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pre-Wedding Shoots: Our Guide to the Perfect Session — Mero Nepal Production</title>

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
              <span>Pre-Wedding</span>
            </div>
            <div class="post-body">
              <span class="blog-tag">Pre-Wedding</span>
              <h1
                style="margin: 16px 0 20px; font-size: clamp(2rem, 4vw, 3rem)"
              >
                Pre-Wedding Shoots: Our Guide to the Perfect Session
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
                    KS
                  </div>
                  <span style="font-size: 13px">Krish Shrestha</span>
                </div>
                <span style="color: var(--border)">|</span>
                <span style="font-size: 13px; color: var(--muted)"
                  >May 21, 2025</span
                >
                <span style="color: var(--border)">|</span>
                <span style="font-size: 13px; color: var(--muted)"
                  >7 min read</span
                >
              </div>

              <div
                style="
                  height: 400px;
                  background: linear-gradient(135deg, #101810, #0d0d0d);
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
                  src="${pageContext.request.contextPath}/assets/img/blog/pre-wedding-shoots-guide.jpeg"
                  alt="Pre-wedding shoot guide"
                  style="
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                  "
                />
              </div>

              <p>
                A pre-wedding shoot is one of the few times in your life you'll
                spend a full day being photographed with the person you love.
                If you treat it like a chore, it looks like a chore in the
                final gallery. If you treat it like a date — with a little
                preparation — the results carry a quiet honesty that no amount
                of styling can fake. After three years of shooting these
                sessions across Nepal, here's everything we wish every couple
                knew before walking on set.
              </p>

              <h3>Why a Pre-Wedding Shoot Is Worth It</h3>
              <p>
                The wedding day itself is a beautiful blur. There are guests to
                greet, rituals to follow, family to make happy — and very little
                room for the couple to actually be alone together in front of a
                camera. A pre-wedding session gives you that room. It's the
                only day in this entire chapter of your life where the only
                thing you have to do is enjoy each other.
              </p>

              <h3>Choosing the Right Location</h3>
              <p>
                Pick a place that means something. The best pre-wedding photos
                we've ever shot were at locations the couple already loved —
                the café where they first met in Thamel, the trail above Sarangkot,
                the rooftop where one proposed to the other. Visual drama is
                easy to manufacture; emotional connection to a place is not.
              </p>
              <p>
                That said, if you want a "wow" backdrop, our three favourite
                spots in 2025 have been Phewa Lake at sunrise, the terraced
                fields near Bandipur in late afternoon, and the rhododendron
                forests of Ghorepani in early spring. Each gives the film a
                completely different mood.
              </p>

              <blockquote>
                <p>
                  "The location is the supporting actor. You two are the film."
                </p>
              </blockquote>

              <h3>What to Wear</h3>
              <p>
                Pick two complementary outfits per person — one slightly more
                formal, one more relaxed — and avoid bold logos and pure white
                or pure black if you can. Coordinate with your partner without
                matching. A muted palette in earth tones, with one accent
                colour shared between you both, photographs beautifully against
                Nepal's landscape and ages well on the wall ten years from now.
              </p>
              <p>
                Bring a backup. Bring tape for hems. Bring something warm if
                we're shooting above 1,500 metres. The unglamorous logistics
                are what protect the glamorous photographs.
              </p>

              <h3>How to Be Natural on Camera</h3>
              <p>
                This is the question we get asked the most, and the honest
                answer is: stop trying to pose. Walk with your partner. Talk to
                them. Whisper something only they're allowed to hear. Laugh at
                them when they get it wrong. Our job as photographers is to
                stay close enough to catch those moments and far enough away
                that you forget we're there.
              </p>
              <p>
                A small trick that works almost every time: when you feel the
                camera lift, look at your partner instead of the lens. Nine
                times out of ten, the photograph where you're looking at them
                is the one you'll print.
              </p>

              <h3>The Timeline We Recommend</h3>
              <p>
                For a half-day shoot, we plan for golden hour at the start or
                end. Arrive forty-five minutes before the light is "perfect" so
                you have time to settle in. For a full-day shoot, we usually
                cover two locations with a midday break — never try to power
                through; the photos taken when you're tired always look like
                they were taken when you were tired.
              </p>

              <h3>One Last Thing</h3>
              <p>
                The couples whose galleries we love the most all share one
                trait: they showed up curious instead of nervous. You don't
                have to be a model. You just have to be present. We'll handle
                the rest.
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
