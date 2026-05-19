<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile — Mero Nepal Production</title>

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
      href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Outfit:wght@300;400;500;600&display=swap"
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
      /* ── Profile page variables ── */
      :root {
        --surface: #181818;
        --surface2: #222222;
        --border: #2a2a2a;
        --gold: #c9a84c;
        --gold-light: #e2c07a;
        --gold-dim: #c9a84c33;
        --white: #f5f0e8;
        --muted: #888880;
        --red: #c0392b;
        --radius: 6px;
        --radius-lg: 12px;
        --transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        --font-display: "Cormorant Garamond", Georgia, serif;
        --font-body: "Outfit", sans-serif;
      }

      /* ── Reset additions ── */
      input,
      textarea,
      select {
        font-family: var(--font-body);
        font-size: 14px;
        background: var(--surface2);
        border: 1px solid var(--border);
        color: var(--white);
        border-radius: var(--radius);
        padding: 12px 16px;
        width: 100%;
        outline: none;
        transition: border-color var(--transition);
        box-sizing: border-box;
      }
      input:focus,
      textarea:focus,
      select:focus {
        border-color: var(--gold);
      }
      input::placeholder,
      textarea::placeholder {
        color: var(--muted);
      }

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

      /* ── Typography ── */
      .profile-h2 {
        font-family: var(--font-display);
        font-weight: 400;
        font-size: clamp(2rem, 4vw, 3.2rem);
        line-height: 1.15;
        letter-spacing: 0.01em;
      }
      .profile-h3 {
        font-family: var(--font-display);
        font-weight: 400;
        font-size: 1.3rem;
        line-height: 1.15;
      }
      .profile-h4 {
        font-family: var(--font-display);
        font-weight: 400;
        font-size: 1.25rem;
        line-height: 1.15;
      }

      /* ── Buttons ── */
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
        cursor: pointer;
        text-decoration: none;
        border: none;
        font-family: var(--font-body);
      }
      .btn-gold {
        background: var(--gold);
        color: #0a0a0a;
      }
      .btn-gold:hover {
        background: var(--gold-light);
        transform: translateY(-1px);
        box-shadow: 0 4px 20px rgba(201, 168, 76, 0.3);
      }
      .btn-sm {
        padding: 9px 20px;
        font-size: 12px;
      }

      /* ── Profile layout wrapper ── */
      .profile-wrapper {
        padding: 48px 40px;
      }

      /* ── Page header ── */
      .page-header {
        margin-bottom: 40px;
      }
      .page-header p {
        color: #b0aa9f;
        font-size: 14px;
        font-weight: 300;
      }

      /* ── Two-column grid ── */
      .profile-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 32px;
        align-items: flex-start;
      }

      /* ── Card shell ── */
      .profile-card {
        background: var(--surface);
        border: 1px solid var(--border);
        border-radius: var(--radius-lg);
        padding: 36px;
      }

      /* ── Avatar ── */
      .profile-avatar {
        width: 64px;
        height: 64px;
        border-radius: 50%;
        background: var(--surface2);
        border: 2px solid var(--gold);
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: var(--font-display);
        font-size: 1.8rem;
        color: var(--gold);
        flex-shrink: 0;
      }

      /* ── Badge ── */
      .badge {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        padding: 4px 12px;
        border-radius: 20px;
      }
      .badge::before {
        content: "";
        display: block;
        width: 6px;
        height: 6px;
        border-radius: 50%;
      }
      .badge-confirmed {
        background: rgba(52, 199, 89, 0.12);
        color: #34c759;
      }
      .badge-confirmed::before {
        background: #34c759;
      }

      /* ── Summary rows ── */
      .summary-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 0;
        border-bottom: 1px solid var(--border);
        font-size: 14px;
      }
      .summary-row:last-child {
        border-bottom: none;
      }
      .summary-row .label {
        color: var(--muted);
      }
      .summary-row .value {
        color: var(--white);
        font-weight: 500;
      }

      /* ── Divider ── */
      .divider {
        width: 60px;
        height: 1px;
        background: var(--gold);
        margin: 24px 0;
      }

      /* ── Form ── */
      .form-group {
        margin-bottom: 20px;
      }
      .form-label {
        display: block;
        font-size: 11px;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        color: var(--muted);
        margin-bottom: 8px;
      }
      .form-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
      }

      /* ── Alert ── */
      .alert {
        padding: 14px 20px;
        border-radius: var(--radius);
        font-size: 14px;
        border-left: 3px solid;
      }
      .alert-success {
        background: rgba(52, 199, 89, 0.1);
        border-color: #34c759;
        color: #34c759;
      }
      .alert-error {
        background: rgba(192, 57, 43, 0.1);
        border-color: var(--red);
        color: var(--red);
      }

      /* ── Utilities ── */
      .mt-8 {
        margin-top: 8px;
      }
      .mt-16 {
        margin-top: 16px;
      }

      /* ── Responsive ── */
      @media (max-width: 768px) {
        .profile-wrapper {
          padding: 24px 20px;
        }
        .profile-grid {
          grid-template-columns: 1fr;
        }
        .form-row {
          grid-template-columns: 1fr;
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

    <%@ include file="/WEB-INF/pages/components/mobile-top-bar.jsp" %>

    <%@ include file="/WEB-INF/pages/components/mobile-nav-drawer-profile.jsp" %>

    <!-- ── MAIN 3-COLUMN LAYOUT ── -->
    <div
      class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10"
    >
      <%@ include file="/WEB-INF/pages/components/left-rail-auth.jsp" %>

      <!-- CENTER — PROFILE CONTENT -->
      <main class="pt-14 md:pt-0">
        <!-- ─── PROFILE PAGE ─── -->
        <div class="profile-wrapper">
          <div class="page-header">
            <h2 class="profile-h2">My Profile</h2>
            <p>View and manage your personal details.</p>
          </div>

          <c:if test="${not empty success}">
            <div class="alert alert-success"><c:out value="${success}" /></div>
          </c:if>
          <c:if test="${not empty error}">
            <div class="alert alert-error"><c:out value="${error}" /></div>
          </c:if>

          <div class="profile-grid">
            <!-- Profile summary card -->
            <div class="profile-card">
              <div
                style="
                  display: flex;
                  align-items: center;
                  gap: 20px;
                  margin-bottom: 32px;
                "
              >
                <div class="profile-avatar">
                  ${fn:toUpperCase(fn:substring(userName, 0, 1))}
                </div>
                <div>
                  <h3 class="profile-h3" style="margin-bottom: 4px">
                    <c:out value="${userName}" />
                  </h3>
                  <span class="badge badge-confirmed">
                    <c:out value="${userRole}" />
                  </span>
                </div>
              </div>

              <div class="summary-row">
                <span class="label">Email</span>
                <span class="value"><c:out value="${email}" /></span>
              </div>

              <div class="summary-row">
                <span class="label">Phone</span>
                <span class="value">
                  <c:choose>
                    <c:when test="${fn:startsWith(phoneNumber, '+977')}">
                      <c:out value="${phoneNumber}" />
                    </c:when>
                    <c:otherwise>+977 <c:out value="${phoneNumber}" /></c:otherwise>
                  </c:choose>
                </span>
              </div>

              <div class="summary-row">
                <span class="label">Member Since</span>
                <span class="value"><c:out value="${formattedCreatedAt}" /></span>
              </div>

              <div class="summary-row">
                <span class="label">Role</span>
                <span class="value"><c:out value="${userRole}" /></span>
              </div>
            </div>

            <!-- Quick actions card -->
            <div class="profile-card">
              <h4 class="profile-h4" style="margin-bottom: 24px">Account Actions</h4>

              <div class="summary-row">
                <span class="label">Update name, email or phone</span>
                <a href="${pageContext.request.contextPath}/profile/update"
                   class="btn btn-gold btn-sm">Edit Details</a>
              </div>

              <div class="summary-row">
                <span class="label">Change your password</span>
                <a href="${pageContext.request.contextPath}/profile/changePassword"
                   class="btn btn-gold btn-sm">Change Password</a>
              </div>

              <div class="divider"></div>

              <div class="summary-row">
                <span class="label">View your bookings</span>
                <a href="${pageContext.request.contextPath}/my-booking"
                   class="btn btn-gold btn-sm">My Bookings</a>
              </div>
            </div>
          </div>
          <!-- /profile-grid -->
        </div>
        <!-- /profile-wrapper -->
        <!-- ─── END PROFILE PAGE ─── -->

        <%@ include file="/WEB-INF/pages/components/footer.jsp" %>
      </main>

      <%@ include file="/WEB-INF/pages/components/right-rail-profile.jsp" %>
    </div>
    <!-- /3-col grid -->

    <%@ include file="/WEB-INF/pages/components/mobile-nav-script.jsp" %>

  </body>
</html>
