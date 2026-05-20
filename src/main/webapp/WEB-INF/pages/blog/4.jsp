<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Why Product Photography Makes or Breaks Your Brand — Mero Nepal Production</title>

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
              <span>Product</span>
            </div>
            <div class="post-body">
              <span class="blog-tag">Product</span>
              <h1
                style="margin: 16px 0 20px; font-size: clamp(2rem, 4vw, 3rem)"
              >
                Why Product Photography Makes or Breaks Your Brand
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
                      overflow: hidden;
                    "
                  >
                    <img
                      src="${pageContext.request.contextPath}/assets/img/darshan.jpg"
                      alt="Darshan Regmi"
                      style="width: 100%; height: 100%; object-fit: cover"
                    />
                  </div>
                  <span style="font-size: 13px">Darshan Regmi</span>
                </div>
                <span style="color: var(--border)">|</span>
                <span style="font-size: 13px; color: var(--muted)"
                  >April 8, 2025</span
                >
                <span style="color: var(--border)">|</span>
                <span style="font-size: 13px; color: var(--muted)"
                  >6 min read</span
                >
              </div>

              <div
                style="
                  height: 400px;
                  background: linear-gradient(135deg, #181410, #0d0d0d);
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
                  src="${pageContext.request.contextPath}/assets/img/blog/product-photography-tips.jpeg"
                  alt="Product photography tips"
                  style="
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                  "
                />
              </div>

              <p>
                A few months ago a Kathmandu-based skincare brand sent us their
                Shopify analytics before and after we re-shot their product
                line. The conversion rate had nearly doubled. Same products,
                same prices, same copy — only the photography had changed.
                That single number is the entire argument for treating product
                photography as a serious line item in your marketing budget
                rather than an afterthought you handle with a phone camera and
                a white wall.
              </p>

              <h3>First Impressions Are Visual, Always</h3>
              <p>
                Customers form an opinion about your brand within the first
                second of seeing your product page. That second is almost
                entirely visual. Before they read a description, before they
                check a price, they're making a snap judgement about whether
                this brand feels trustworthy, premium, fresh, or amateur. Bad
                photography doesn't just under-sell the product — it actively
                signals that the brand cuts corners elsewhere too.
              </p>

              <h3>Lighting Is the Whole Game</h3>
              <p>
                When clients ask what makes a product photo "look expensive,"
                the honest answer is almost always lighting. A $20 product
                photographed under controlled, diffused light will out-perform
                a $200 product photographed under harsh overhead fluorescents
                every single time. Most of our studio setup time on a product
                shoot is spent shaping the light, not adjusting the product.
              </p>

              <blockquote>
                <p>
                  "The product hasn't changed in the photo. The story we're
                  telling about it has."
                </p>
              </blockquote>

              <h3>The White-Background Photo Is the Bare Minimum</h3>
              <p>
                A clean, well-lit white-background shot is non-negotiable —
                marketplaces require it, ads need it, and customers expect it.
                But the brands that actually win online are the ones that
                publish lifestyle photography alongside it. A bottle of oil on
                a marble counter next to fresh herbs sells the lifestyle of
                using it; a bottle floating on a white void only sells the
                bottle.
              </p>

              <h3>Consistency Is What Builds a Brand</h3>
              <p>
                One excellent photograph won't save you. Forty photographs
                shot with the same lighting, the same colour palette, the same
                styling vocabulary — that's a brand. When customers scroll
                through your feed or your catalogue and every image feels like
                it belongs to the same world, you're no longer selling
                products; you're selling membership.
              </p>

              <h3>What We Actually Do on a Product Shoot</h3>
              <p>
                A typical session in our studio looks like this: we start with
                a planning conversation about where the images will live —
                Shopify, Instagram, Tikok ads, a printed catalogue — because
                each surface has different framing requirements. Then we lock
                a lighting setup, build the styling, and shoot in three modes:
                clean catalogue, hero lifestyle, and detail macro. The deliverables
                cover every channel from a single afternoon of work.
              </p>

              <h3>ROI, Honestly</h3>
              <p>
                Of all the marketing investments a small brand can make, a
                proper photography refresh is probably the highest-leverage
                one we've seen. It costs less than a paid campaign and the
                results compound for years — every ad, every email, every
                product page benefits from one good shoot. If your photos look
                like they belong to 2018, you are leaving money on the table
                today.
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
