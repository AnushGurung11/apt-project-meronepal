<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book a Package — Mero Nepal Production</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css" />

    <style>
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

      *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
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

      .container { max-width: 1200px; margin: 0 auto; padding: 0 32px; }
      .section { padding: 80px 0; }

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

      .divider { width: 60px; height: 1px; background: var(--gold); margin: 24px 0; }
      .divider-center { margin: 24px auto; }

      .page-hero {
        padding: 160px 0 60px;
        background: linear-gradient(to bottom, rgba(201, 168, 76, 0.04) 0%, transparent 100%);
        border-bottom: 1px solid var(--border);
        text-align: center;
      }

      /* ── Booking Layout ── */
      .booking-layout {
        display: grid;
        grid-template-columns: 1fr 420px;
        gap: 48px;
        align-items: start;
      }

      /* ── Package Summary Card ── */
      .package-summary {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        padding: 36px 32px;
        position: sticky;
        top: 32px;
      }
      .package-summary-header {
        border-bottom: 1px solid var(--border);
        padding-bottom: 24px;
        margin-bottom: 24px;
      }
      .package-price {
        font-family: var(--font-display);
        font-size: 2.4rem;
        color: var(--gold);
        margin: 8px 0 4px;
      }
      .package-price span {
        font-size: 1rem;
        color: var(--muted);
      }
      .services-list { margin-top: 16px; }
      .service-item {
        display: flex;
        align-items: flex-start;
        gap: 10px;
        padding: 8px 0;
        font-size: 13px;
        color: #b0aa9f;
        border-bottom: 1px solid var(--border);
      }
      .service-item:last-child { border-bottom: none; }
      .service-item::before {
        content: "✦";
        color: var(--gold);
        font-size: 9px;
        margin-top: 5px;
        flex-shrink: 0;
      }
      .service-type {
        font-size: 11px;
        color: var(--muted);
        display: block;
        margin-top: 2px;
      }

      /* ── Booking Form ── */
      .booking-form-card {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        padding: 40px 36px;
      }

      .form-group { margin-bottom: 28px; }
      .form-label {
        display: block;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 0.14em;
        text-transform: uppercase;
        color: var(--gold);
        margin-bottom: 10px;
      }
      .form-input,
      .form-textarea {
        width: 100%;
        background: var(--surface2);
        border: 1px solid var(--border);
        border-radius: var(--radius);
        color: var(--white);
        font-family: var(--font-body);
        font-size: 14px;
        padding: 14px 16px;
        transition: border-color var(--transition), box-shadow var(--transition);
        outline: none;
        -webkit-appearance: none;
        appearance: none;
      }
      .form-input:focus,
      .form-textarea:focus {
        border-color: var(--gold);
        box-shadow: 0 0 0 3px var(--gold-dim);
      }
      /* Style the date picker icon to match */
      .form-input[type="date"]::-webkit-calendar-picker-indicator {
        filter: invert(0.7) sepia(1) saturate(2) hue-rotate(5deg);
        cursor: pointer;
        opacity: 0.7;
      }
      .form-textarea {
        resize: vertical;
        min-height: 120px;
        line-height: 1.6;
      }

      .form-divider {
        height: 1px;
        background: var(--border);
        margin: 32px 0;
      }

      /* ── Submit Button ── */
      .btn-submit {
        width: 100%;
        padding: 16px 32px;
        background: var(--gold);
        color: var(--black);
        border-radius: var(--radius);
        font-family: var(--font-body);
        font-size: 13px;
        font-weight: 600;
        letter-spacing: 0.1em;
        text-transform: uppercase;
        cursor: pointer;
        border: none;
        transition: all var(--transition);
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
      }
      .btn-submit:hover {
        background: var(--gold-light);
        transform: translateY(-1px);
        box-shadow: 0 4px 20px rgba(201, 168, 76, 0.3);
      }

      .btn-back {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        font-size: 12px;
        font-weight: 500;
        letter-spacing: 0.1em;
        text-transform: uppercase;
        color: var(--muted);
        transition: color var(--transition);
        margin-bottom: 40px;
      }
      .btn-back:hover { color: var(--gold); }

      /* ── Alert message ── */
      .alert {
        padding: 14px 18px;
        border-radius: var(--radius);
        font-size: 13px;
        margin-bottom: 24px;
      }
      .alert-error {
        background: rgba(220, 60, 60, 0.1);
        border: 1px solid rgba(220, 60, 60, 0.4);
        color: #f08080;
      }
      .alert-success {
        background: rgba(201, 168, 76, 0.1);
        border: 1px solid var(--gold);
        color: var(--gold-light);
      }

      /* ── Responsive ── */
      @media (max-width: 900px) {
        .booking-layout { grid-template-columns: 1fr; }
        .package-summary { position: static; }
      }
      @media (max-width: 768px) {
        .container { padding: 0 20px; }
        .section { padding: 60px 0; }
        .booking-form-card { padding: 28px 20px; }
      }
      @media (max-width: 480px) {
        h1 { font-size: 2.4rem; }
      }
    </style>
  </head>

  <body>
    <div class="fixed inset-0 opacity-20 z-0 background-grid">
      <script>for (let i = 0; i < 96; i++) document.write('<div class="grid-cell"></div>');</script>
    </div>
    <div class="fixed inset-0 opacity-5 pointer-events-none grain-overlay"></div>

    <%@ include file="/WEB-INF/pages/components/mobile-top-bar.jsp" %>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-drawer-public.jsp" %>

    <!-- 3-COLUMN LAYOUT -->
    <div class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10">

      <%@ include file="/WEB-INF/pages/components/left-rail.jsp" %>

      <!-- MAIN CONTENT -->
      <main class="pt-14 md:pt-0">

        <!-- PAGE HERO -->
        <section class="page-hero">
          <div class="container">
            <div class="section-label" style="justify-content: center">Confirm Your Experience</div>
            <h1 style="font-size: clamp(2.8rem, 5vw, 4.5rem)">Reserve Your Package</h1>
            <div class="divider divider-center"></div>
            <p style="max-width: 420px; margin: 0 auto">
              You're one step away from securing your date. Fill in the details below and we'll take care of the rest.
            </p>
          </div>
        </section>

        <!-- BOOKING SECTION -->
        <section class="section">
          <div class="container">

            <!-- Back link -->
            <a href="${pageContext.request.contextPath}/packages" class="btn-back">← Back to Packages</a>

            <!-- Flash messages -->
            <c:if test="${not empty message}">
              <div class="alert ${messageType == 'error' ? 'alert-error' : 'alert-success'}">
                ${message}
              </div>
            </c:if>

            <div class="booking-layout">

              <!-- LEFT: BOOKING FORM -->
              <div class="booking-form-card">
                <div class="section-label">Your Details</div>
                <h2 style="font-size: 1.8rem; margin-bottom: 8px;">Complete Your Booking</h2>
                <p style="font-size: 13px; margin-bottom: 32px;">
                  All fields marked are required. We'll confirm your booking within 24 hours.
                </p>

                <form action="booking" method="post">
                  <!-- Hidden package ID -->
                  <input type="hidden" name="packageId" value="${selectedPackage.packageId}" />

                  <div class="form-group">
                    <label class="form-label" for="eventDate">Event Date (Must be at least 5 days from today)</label>
                    <input
                      class="form-input"
                      type="date"
                      id="eventDate"
                      name="eventDate"
                      required
                      min="${java.time.LocalDate.now()}"
                    />
                  </div>

                  <div class="form-group">
                    <label class="form-label" for="eventAddress">Event Address</label>
                    <input
                      class="form-input"
                      type="text"
                      id="eventAddress"
                      name="eventAddress"
                      placeholder="Venue name, street, city"
                      required
                    />
                  </div>

                  <div class="form-group">
                    <label class="form-label" for="notes">Notes / Special Requests</label>
                    <textarea
                      class="form-textarea"
                      id="notes"
                      name="notes"
                      placeholder="Any special requirements, themes, or details we should know..."
                    ></textarea>
                  </div>

                  <div class="form-divider"></div>

                  <!-- Summary line above submit -->
                  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <span style="font-size: 13px; color: var(--muted);">Package Total</span>
                    <span style="font-family: var(--font-display); font-size: 1.4rem; color: var(--gold);">
                      NPR <fmt:formatNumber value="${selectedPackage.price}" type="number" maxFractionDigits="0" />
                    </span>
                  </div>

                  <button type="submit" class="btn-submit">
                    Confirm Booking ✦
                  </button>

                  <p style="font-size: 11px; color: var(--muted); text-align: center; margin-top: 16px; letter-spacing: 0.04em;">
                    By booking you agree to our terms. A deposit may be required to confirm your date.
                  </p>
                </form>
              </div>

              <!-- RIGHT: PACKAGE SUMMARY -->
              <div class="package-summary">
                <div class="package-summary-header">
                  <div class="section-label">Your Selected Package</div>
                  <h3>${selectedPackage.packageName}</h3>
                  <div class="package-price">
                    NPR <fmt:formatNumber value="${selectedPackage.price}" type="number" maxFractionDigits="0" />
                    <span>/ event</span>
                  </div>
                  <p style="font-size: 13px; margin-top: 10px;">${selectedPackage.description}</p>
                </div>

                <div class="section-label" style="margin-bottom: 12px;">What's Included</div>

                <c:choose>
                  <c:when test="${not empty selectedPackage.services}">
                    <ul class="services-list">
                      <c:forEach var="service" items="${selectedPackage.services}">
                        <li class="service-item">
                          <div>
                            <strong style="color: var(--white); font-size: 13px;">${service.serviceName}</strong>
                            <c:if test="${not empty service.serviceType}">
                              <span class="service-type">${service.serviceType}</span>
                            </c:if>
                          </div>
                        </li>
                      </c:forEach>
                    </ul>
                  </c:when>
                  <c:otherwise>
                    <p style="font-size: 13px; color: var(--muted);"><em>No services listed for this package.</em></p>
                  </c:otherwise>
                </c:choose>

                <!-- Need help box -->
                <div style="margin-top: 32px; padding: 20px; background: var(--gold-dim); border: 1px solid var(--gold); border-radius: var(--radius);">
                  <div style="font-size: 11px; letter-spacing: 0.12em; text-transform: uppercase; color: var(--gold); margin-bottom: 8px;">Need Help?</div>
                  <p style="font-size: 12px; margin-bottom: 12px;">Not sure which package is right for you? We're happy to help.</p>
                  <a href="mailto:hello@meronepal.com" style="font-size: 12px; color: var(--gold); letter-spacing: 0.06em; text-transform: uppercase;">
                    hello@meronepal.com →
                  </a>
                </div>
              </div>

            </div><!-- end booking-layout -->
          </div>
        </section>

        <%@ include file="/WEB-INF/pages/components/footer.jsp" %>

      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-public.jsp" %>
    </div>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>
  </body>
</html>
