<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
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
      href="${pageContext.request.contextPath}/assets/img/favicon.ico"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css" />

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
        grid-template-columns: repeat(3, minmax(220px, 1fr));
        gap: 16px;
        padding: 0 24px;
      }
      .pkg-card {
        border: 1px solid var(--color-border);
        border-radius: var(--radius);
        padding: 32px 28px; /* increased */
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

    <%@ include file="/WEB-INF/pages/components/mobile-top-bar.jsp" %>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-drawer-profile.jsp" %>

    <!-- ── MAIN 3-COLUMN LAYOUT ── -->
    <div
      class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10"
    >
      <%@ include file="/WEB-INF/pages/components/left-rail-auth.jsp" %>

      <!-- ════════════════════════════════════════
           CENTER — BOOKING CONTENT
           ════════════════════════════════════════ -->
      <main class="pt-14 md:pt-0">
        <!-- ── STEPPER ── -->
        <div class="booking-stepper">
          <div class="step-item active" id="si1">
            <div class="step-circle">1</div>
            <div class="step-label">Select</div>
          </div>
          <div class="step-connector" id="sc1"></div>
          <div class="step-item" id="si2">
            <div class="step-circle">2</div>
            <div class="step-label">Details</div>
          </div>
          <div class="step-connector" id="sc2"></div>
          <div class="step-item" id="si3">
            <div class="step-circle">3</div>
            <div class="step-label">Confirm</div>
          </div>
        </div>

        <!-- ══ STEP 1: Package Selection ══ -->
        <div id="step1">
          <div class="booking-heading">
            <h2>Select a Package</h2>
            <p>Choose the package that fits your event.</p>
          </div>

          <div class="packages-grid">
            <div
              class="pkg-card"
              onclick="selectPackage(this, 'Basic Package', 'NPR 10,000')"
            >
              <div class="pkg-check">✓</div>
              <div class="pkg-name">Basic</div>
              <div class="pkg-price">NPR 10,000</div>
              <div class="pkg-desc">Small events · 3–4 hrs · 50+ photos</div>
            </div>
            <div
              class="pkg-card"
              onclick="selectPackage(this, 'Standard Package', 'NPR 20,000')"
            >
              <div class="pkg-check">✓</div>
              <div class="pkg-name">Standard</div>
              <div class="pkg-price">NPR 20,000</div>
              <div class="pkg-desc">Engagements · 6 hrs · 100+ photos</div>
            </div>
            <div
              class="pkg-card featured"
              onclick="selectPackage(this, 'Premium Package', 'NPR 35,000')"
            >
              <div class="pkg-check">✓</div>
              <div class="pkg-name">Premium</div>
              <div class="pkg-price">NPR 35,000</div>
              <div class="pkg-desc">Weddings · Full day · 200+ photos</div>
            </div>
            <div
              class="pkg-card"
              onclick="selectPackage(this, 'Luxury Package', 'NPR 60,000')"
            >
              <div class="pkg-check">✓</div>
              <div class="pkg-name">Luxury</div>
              <div class="pkg-price">NPR 60,000</div>
              <div class="pkg-desc">High-end · Full crew · 300+ photos</div>
            </div>
            <div
              class="pkg-card"
              onclick="selectPackage(this, 'Business Package', 'NPR 15,000')"
            >
              <div class="pkg-check">✓</div>
              <div class="pkg-name">Business</div>
              <div class="pkg-price">NPR 15,000</div>
              <div class="pkg-desc">Product shoot · Studio setup</div>
            </div>
            <div
              class="pkg-card"
              onclick="selectPackage(this, 'Music Video Package', 'NPR 70,000')"
            >
              <div class="pkg-check">✓</div>
              <div class="pkg-name">Music Video</div>
              <div class="pkg-price">NPR 70,000</div>
              <div class="pkg-desc">Full crew · 1–2 days · 3–6 min</div>
            </div>
          </div>

          <div class="step-actions center">
            <button
              class="btn-gold"
              id="step1Next"
              onclick="goStep(2)"
              disabled
            >
              Continue to Details →
            </button>
          </div>
        </div>

        <!-- ══ STEP 2: Event Details ══ -->
        <div id="step2" style="display: none">
          <div class="booking-heading">
            <h2>Event Details</h2>
            <p>Tell us about your event so we can prepare our team.</p>
          </div>

          <div class="booking-form">
            <div class="form-layout">
              <div>
                <div class="form-group">
                  <label class="form-label">Event Date</label>
                  <input
                    type="date"
                    id="eventDate"
                    class="form-input"
                    required
                  />
                </div>
                <div class="form-group">
                  <label class="form-label">Event Address / Location</label>
                  <input
                    type="text"
                    id="eventAddress"
                    class="form-input"
                    placeholder="e.g. Kathmandu, Nepal"
                  />
                </div>
                <div class="form-group">
                  <label class="form-label">
                    Special Notes
                    <span
                      style="
                        color: var(--color-text-soft);
                        font-size: 9px;
                        margin-left: 4px;
                      "
                      >(Optional)</span
                    >
                  </label>
                  <textarea
                    rows="4"
                    id="eventNotes"
                    class="form-input"
                    style="resize: vertical"
                    placeholder="Any special requirements or notes for the team..."
                  ></textarea>
                </div>
              </div>

              <div class="summary-box">
                <div class="summary-label">Selected Package</div>
                <div class="summary-pkg-name" id="s2PackageName">—</div>
                <div class="summary-pkg-price" id="s2PackagePrice">—</div>
                <div class="summary-divider"></div>
                <p class="summary-note">
                  Date, address, and notes can be updated up to 48 hours before
                  your event. Payment is collected at confirmation.
                </p>
              </div>
            </div>
          </div>

          <div class="step-actions">
            <button class="btn-ghost" onclick="goStep(1)">← Back</button>
            <button class="btn-gold" onclick="goStep(3)">
              Review &amp; Confirm →
            </button>
          </div>
        </div>

        <!-- ══ STEP 3: Confirm & Pay ══ -->
        <div id="step3" style="display: none">
          <div class="booking-heading">
            <h2>Confirm &amp; Pay</h2>
            <p>Review your booking and choose a payment method.</p>
          </div>

          <div class="booking-form">
            <div class="form-layout">
              <div>
                <div class="summary-box" style="margin-bottom: 20px">
                  <div class="summary-label">Booking Summary</div>
                  <div class="summary-row">
                    <span class="lbl">Package</span
                    ><span class="val" id="s3Pkg">—</span>
                  </div>
                  <div class="summary-row">
                    <span class="lbl">Event Date</span
                    ><span class="val" id="s3Date">—</span>
                  </div>
                  <div class="summary-row">
                    <span class="lbl">Location</span
                    ><span class="val" id="s3Loc">—</span>
                  </div>
                  <div class="summary-row total">
                    <span class="lbl">Total</span
                    ><span class="val" id="s3Price">—</span>
                  </div>
                </div>

                <div class="form-group">
                  <label class="form-label">Payment Method</label>
                  <select id="payMethod" class="form-input">
                    <option value="">Select method</option>
                    <option value="Cash">Cash</option>
                    <option value="Card">Card</option>
                    <option value="Bank Transfer">Bank Transfer</option>
                    <option value="Online">Online</option>
                  </select>
                </div>
              </div>

              <div class="next-box">
                <h4>What Happens Next?</h4>
                <div class="next-step-item">
                  <div class="next-num">1</div>
                  <div>
                    <div class="next-title">Booking Confirmed</div>
                    <div class="next-desc">
                      You'll receive a confirmation email with your booking
                      reference.
                    </div>
                  </div>
                </div>
                <div class="next-step-item">
                  <div class="next-num">2</div>
                  <div>
                    <div class="next-title">Team Assigned</div>
                    <div class="next-desc">
                      Our team will reach out to discuss event specifics.
                    </div>
                  </div>
                </div>
                <div class="next-step-item">
                  <div class="next-num">3</div>
                  <div>
                    <div class="next-title">Event Day</div>
                    <div class="next-desc">
                      We show up, capture, and create something beautiful.
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="step-actions">
            <button class="btn-ghost" onclick="goStep(2)">← Back</button>
            <button
              class="btn-gold"
              onclick="window.location.href = 'booking-success.jsp'"
            >
              Confirm Booking ✦
            </button>
          </div>
        </div>

        <%@ include file="/WEB-INF/pages/components/footer.jsp" %>
      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-profile.jsp" %>
    </div>
    <!-- end 3-col grid -->

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>

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
