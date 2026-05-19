<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Our Packages — Mero Nepal Production</title>
    <script>
  tailwind.config = { corePlugins: { preflight: false } };
</script>
<script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;900&family=Playfair+Display:ital,wght@0,400;1,400&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico" />
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

      *, *::before, *::after {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }
      html { scroll-behavior: smooth; }
      body {
        background: var(--black);
        color: var(--white);
        font-family: var(--font-body);
        font-size: 15px;
        line-height: 1.7;
        -webkit-font-smoothing: antialiased;
        overflow-x: hidden;
      }
      img { max-width: 100%; display: block; }
      a { color: inherit; text-decoration: none; transition: color var(--transition); }
      ul { list-style: none; }
      button { cursor: pointer; border: none; background: none; font-family: var(--font-body); }

      h1, h2, h3 {
        font-family: var(--font-display);
        font-weight: 400;
        line-height: 1.15;
        letter-spacing: 0.01em;
      }
      h1 { font-size: clamp(2.8rem, 6vw, 5.5rem); }
      h2 { font-size: clamp(2rem, 4vw, 3.2rem); }
      h3 { font-size: clamp(1.4rem, 2.5vw, 2rem); }
      p { color: #b0aa9f; font-weight: 300; }

      .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 32px;
      }
      .section { padding: 100px 0; }
      .grid-3 {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 32px;
      }

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

      .divider {
        width: 60px;
        height: 1px;
        background: var(--gold);
        margin: 24px 0;
      }
      .divider-center { margin: 24px auto; }

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
      .btn-outline {
        border: 1px solid var(--gold);
        color: var(--gold);
      }
      .btn-outline:hover {
        background: var(--gold);
        color: var(--black);
      }
      .btn-full {
        width: 100%;
        justify-content: center;
      }

      .mt-24 { margin-top: 24px; }

      .page-hero {
        padding: 160px 0 80px;
        background: linear-gradient(to bottom, rgba(201, 168, 76, 0.04) 0%, transparent 100%);
        border-bottom: 1px solid var(--border);
        text-align: center;
      }

      .package-card {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        padding: 36px 32px;
        transition: all var(--transition);
        position: relative;
      }
      .package-card.featured {
        border-color: var(--gold);
        background: linear-gradient(135deg, var(--surface) 0%, rgba(201, 168, 76, 0.05) 100%);
      }
      .package-card.featured::before {
        content: "Most Popular";
        position: absolute;
        top: -1px;
        right: 24px;
        background: var(--gold);
        color: var(--black);
        font-size: 10px;
        font-weight: 600;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        padding: 5px 14px;
        border-radius: 0 0 6px 6px;
      }
      .package-card:hover {
        border-color: var(--gold);
        transform: translateY(-4px);
        box-shadow: var(--shadow);
      }
      .package-price {
        font-family: var(--font-display);
        font-size: 2.4rem;
        color: var(--gold);
        margin: 12px 0 4px;
      }
      .package-price span {
        font-size: 1rem;
        color: var(--muted);
      }

      .package-features {
        margin: 20px 0 28px;
      }
      .package-features li {
        display: flex;
        align-items: flex-start;
        gap: 10px;
        padding: 7px 0;
        font-size: 14px;
        color: #b0aa9f;
        border-bottom: 1px solid var(--border);
      }
      .package-features li:last-child { border-bottom: none; }
      .package-features li::before {
        content: "✦";
        color: var(--gold);
        font-size: 10px;
        margin-top: 5px;
        flex-shrink: 0;
      }

      @media (max-width: 768px) {
        .container { padding: 0 20px; }
        .section { padding: 70px 0; }
        .grid-3 { grid-template-columns: 1fr; }
      }
      @media (max-width: 480px) {
        .btn { padding: 12px 22px; font-size: 12px; }
        h1 { font-size: 2.4rem; }
      }
    </style>
  </head>

    <body>
    <!-- Background Grid -->
    <div class="fixed inset-0 opacity-20 z-0 background-grid">
      <script>
        for (let i = 0; i < 96; i++)
          document.write('<div class="grid-cell"></div>');
      </script>
    </div>

    <!-- Film grain -->
    <div
      class="fixed inset-0 opacity-5 pointer-events-none grain-overlay"
    ></div>

    <%@ include file="/WEB-INF/pages/components/mobile-top-bar.jsp" %>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-drawer-public.jsp" %>

    <!-- Main layout -->
    <div
      class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10"
    >
      <%@ include file="/WEB-INF/pages/components/left-rail.jsp" %>

      <main class="pt-14 md:pt-0">
        <!-- PAGE HERO -->
        <section class="page-hero">
          <div class="container">
            <div class="section-label" style="justify-content: center">
              Choose Your Story
            </div>
            <h1 style="font-size: 68.1px">Our Packages</h1>
            <div class="divider divider-center"></div>
            <p style="max-width: 480px; margin: 0 auto">
              Every package is built around your vision. Select the coverage
              that fits your event, your scale, your story.
            </p>
          </div>
        </section>

        <!-- ERROR MESSAGE -->
        <c:if test="${not empty errorMessage}">
          <section style="padding: 40px 0;">
            <div class="container">
              <div style="background: #c9a84c33; border: 1px solid #c9a84c; border-radius: 6px; padding: 16px; color: #e2c07a;">
                <strong>⚠ Error:</strong> ${errorMessage}
              </div>
            </div>
          </section>
        </c:if>

        <!-- PACKAGES SECTION -->
        <section class="section">
          <div class="container">
            <!-- PACKAGES GRID -->
            <c:if test="${not empty packages}">
              <div class="grid-3">
                <c:forEach var="pkg" items="${packages}" varStatus="status">
                  <div class="package-card ${status.index == 1 ? 'featured' : ''}">
                    <div class="section-label">Package ${status.index + 1}</div>
                    <h3>${pkg.packageName}</h3>
                    <div class="package-price">
                      NPR <fmt:formatNumber value="${pkg.price}" type="number" maxFractionDigits="0" />
                      <span>/ event</span>
                    </div>
                    <p style="font-size: 13px; color: var(--muted); margin-bottom: 8px;">
                      ${pkg.description}
                    </p>

                    <!-- SERVICES IN THIS PACKAGE -->
                    <c:if test="${not empty pkg.services}">
                      <ul class="package-features">
                        <c:forEach var="service" items="${pkg.services}">
                          <li>
                            <strong>${service.serviceName}</strong>
                            <c:if test="${not empty service.serviceType}">
                              <br/><small style="color: var(--muted);">${service.serviceType}</small>
                            </c:if>
                          </li>
                        </c:forEach>
                      </ul>
                    </c:if>
                    <c:if test="${empty pkg.services}">
                      <p style="color: var(--muted); font-size: 12px; padding: 10px 0;">
                        <em>No services included</em>
                      </p>
                    </c:if>

                    <a href="${pageContext.request.contextPath}/booking?packageId=${pkg.packageId}"
                       class="btn ${status.index == 1 ? 'btn-gold' : 'btn-outline'} btn-full mt-24">
                        Book This Package
                    </a>
                  </div>
                </c:forEach>
              </div>
            </c:if>

            <!-- NO PACKAGES MESSAGE -->
            <c:if test="${empty packages}">
              <div style="text-align: center; padding: 60px 0;">
                <p style="font-size: 16px; color: var(--muted); margin-bottom: 20px;">
                  No packages available at the moment. Please check back soon!
                </p>
              </div>
            </c:if>
          </div>
        </section>

        <%@ include file="/WEB-INF/pages/components/footer.jsp" %>
      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-public.jsp" %>
    </div>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>
  </body>
</html>
