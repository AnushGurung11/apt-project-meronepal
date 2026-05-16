<<<<<<< HEAD
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
=======
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
>>>>>>> 2ea22dc (completion of User password and Editing User details)
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile — Mero Nepal Production</title>

    <script src="https://cdn.tailwindcss.com"></script>
<<<<<<< HEAD
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
=======
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;900&family=Playfair+Display:ital,wght@0,400;1,400&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico" />
    <link rel="stylesheet"              href="${pageContext.request.contextPath}/assets/css/styles.css" />
>>>>>>> 2ea22dc (completion of User password and Editing User details)

    <style>
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
      input, textarea, select {
        font-family: var(--font-body); font-size: 14px;
        background: var(--surface2); border: 1px solid var(--border);
        color: var(--white); border-radius: var(--radius);
        padding: 12px 16px; width: 100%; outline: none;
        transition: border-color var(--transition); box-sizing: border-box;
      }
      input:focus, textarea:focus, select:focus { border-color: var(--gold); }
      input::placeholder, textarea::placeholder { color: var(--muted); }

      .hr {
        --color-border: rgba(255,255,255,0.08);
        --font-sans: "Inter", sans-serif;
        font-family: var(--font-sans); font-size: 16px; line-height: 1.7;
        -webkit-font-smoothing: antialiased; box-sizing: border-box;
        padding: 0; border: none; border-top: 1px solid var(--color-border);
        margin: 2rem 0;
      }

      .profile-h2 { font-family: var(--font-display); font-weight: 400; font-size: clamp(2rem,4vw,3.2rem); line-height: 1.15; letter-spacing: 0.01em; }
      .profile-h3 { font-family: var(--font-display); font-weight: 400; font-size: 1.3rem; line-height: 1.15; }
      .profile-h4 { font-family: var(--font-display); font-weight: 400; font-size: 1.25rem; line-height: 1.15; }

      .btn {
        display: inline-flex; align-items: center; gap: 8px;
        padding: 14px 32px; border-radius: var(--radius);
        font-size: 13px; font-weight: 500; letter-spacing: 0.08em;
        text-transform: uppercase; transition: all var(--transition);
        white-space: nowrap; cursor: pointer; text-decoration: none;
        border: none; font-family: var(--font-body);
      }
      .btn-gold { background: var(--gold); color: #0a0a0a; }
      .btn-gold:hover { background: var(--gold-light); transform: translateY(-1px); box-shadow: 0 4px 20px rgba(201,168,76,0.3); }
      .btn-sm { padding: 9px 20px; font-size: 12px; }

      .profile-wrapper { padding: 48px 40px; }
      .page-header { margin-bottom: 40px; }
      .page-header p { color: #b0aa9f; font-size: 14px; font-weight: 300; }

      .profile-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 32px; align-items: flex-start; }

      .profile-card { background: var(--surface); border: 1px solid var(--border); border-radius: var(--radius-lg); padding: 36px; }

      .profile-avatar {
        width: 64px; height: 64px; border-radius: 50%;
        background: var(--surface2); border: 2px solid var(--gold);
        display: flex; align-items: center; justify-content: center;
        font-family: var(--font-display); font-size: 1.8rem;
        color: var(--gold); flex-shrink: 0; text-transform: uppercase;
      }

      .badge {
        display: inline-flex; align-items: center; gap: 5px;
        font-size: 11px; font-weight: 500; letter-spacing: 0.08em;
        text-transform: uppercase; padding: 4px 12px; border-radius: 20px;
      }
      .badge::before { content: ""; display: block; width: 6px; height: 6px; border-radius: 50%; }
      .badge-confirmed { background: rgba(52,199,89,0.12); color: #34c759; }
      .badge-confirmed::before { background: #34c759; }

      .summary-row {
        display: flex; justify-content: space-between; align-items: center;
        padding: 10px 0; border-bottom: 1px solid var(--border); font-size: 14px;
      }
      .summary-row:last-child { border-bottom: none; }
      .summary-row .label { color: var(--muted); }
      .summary-row .value { color: var(--white); font-weight: 500; }

      .divider { width: 60px; height: 1px; background: var(--gold); margin: 24px 0; }

      .alert { padding: 14px 20px; border-radius: var(--radius); font-size: 14px; border-left: 3px solid; margin-bottom: 24px; }
      .alert-success { background: rgba(52,199,89,0.1); border-color: #34c759; color: #34c759; }
      .alert-error   { background: rgba(192,57,43,0.1);  border-color: var(--red); color: var(--red); }

<<<<<<< HEAD
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
=======
      .mt-8  { margin-top: 8px; }
      .mt-16 { margin-top: 16px; }
>>>>>>> 2ea22dc (completion of User password and Editing User details)

      @media (max-width: 768px) {
        .profile-wrapper { padding: 24px 20px; }
        .profile-grid    { grid-template-columns: 1fr; }
      }
    </style>
  </head>

  <body>
    <!-- BACKGROUND GRID -->
    <div class="fixed inset-0 opacity-20 z-0 background-grid">
      <script>for(let i=0;i<96;i++)document.write('<div class="grid-cell"></div>');</script>
    </div>
    <div class="fixed inset-0 opacity-5 pointer-events-none grain-overlay"></div>

<<<<<<< HEAD
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
=======
    <!-- MOBILE TOP BAR -->
    <div class="md:hidden fixed top-0 left-0 right-0 z-50 flex items-center justify-between px-6 h-14 bg-[#0a0a0a]"
         style="border-bottom:1px solid rgba(255,255,255,0.08)">
      <div class="text-xl font-black"><a href="${pageContext.request.contextPath}/home">M.NP</a></div>
      <button id="nav-toggle" class="flex flex-col gap-[5px] p-1" aria-label="Toggle menu">
        <span id="bar1" class="block w-6 h-px bg-white" style="transition:transform 0.25s,opacity 0.25s;"></span>
        <span id="bar2" class="block w-6 h-px bg-white" style="transition:opacity 0.25s"></span>
        <span id="bar3" class="block w-4 h-px bg-white" style="transition:transform 0.25s"></span>
      </button>
    </div>

    <!-- MOBILE NAV DRAWER -->
    <nav id="mobile-nav" class="md:hidden fixed inset-0 z-40 bg-[#0a0a0a] flex flex-col justify-center items-center gap-10"
         style="transform:translateX(100%);transition:transform 0.3s ease">
      <a href="${pageContext.request.contextPath}/home"     class="text-3xl font-black uppercase tracking-widest">Home</a>
      <a href="${pageContext.request.contextPath}/packages" class="text-3xl font-black uppercase tracking-widest">Bookings</a>
      <a href="${pageContext.request.contextPath}/about"    class="text-3xl font-black uppercase tracking-widest">About</a>
      <a href="${pageContext.request.contextPath}/blog"     class="text-3xl font-black uppercase tracking-widest">Blog</a>
    </nav>

    <!-- MAIN 3-COLUMN LAYOUT -->
    <div class="relative z-10 grid md:grid-cols-[80px_1fr_300px] min-h-screen border-b border-white/10">

      <!-- LEFT RAIL -->
      <aside class="hidden md:flex flex-col justify-between items-center py-12 border-r border-white/10 sticky top-0 h-screen">
        <div class="text-2xl font-black"><a href="${pageContext.request.contextPath}/home">M.NP</a></div>
        <div class="vertical-text text-[10px] tracking-[0.4em] uppercase" style="color:var(--color-gold)">
          Mero Nepal Production — EST. 2014
        </div>
        <div class="w-2 h-2 rounded-full" style="background:var(--color-gold)"></div>
      </aside>
>>>>>>> 2ea22dc (completion of User password and Editing User details)

      <!-- CENTER — PROFILE CONTENT -->
      <main class="pt-14 md:pt-0">
        <div class="profile-wrapper">

          <div class="page-header">
            <h2 class="profile-h2">My Profile</h2>
            <p>View and manage your personal details.</p>
          </div>

<<<<<<< HEAD
=======
          <%-- ── Flash messages (success / error) forwarded by servlet or consumed from session ── --%>
>>>>>>> 2ea22dc (completion of User password and Editing User details)
          <c:if test="${not empty success}">
            <div class="alert alert-success"><c:out value="${success}" /></div>
          </c:if>
          <c:if test="${not empty error}">
            <div class="alert alert-error"><c:out value="${error}" /></div>
          </c:if>

          <div class="profile-grid">
<<<<<<< HEAD
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
=======

            <%-- ══════════════════════════════════════════════════════════
                 PROFILE SUMMARY CARD
                 Attributes set by UserProfileServlet:
                   userName, email, phoneNumber, userRole, createdAt
            ══════════════════════════════════════════════════════════ --%>
            <div class="profile-card">

              <div style="display:flex;align-items:center;gap:20px;margin-bottom:32px;">

                <%-- Avatar: first character of userName, upper-cased via fn taglib.
                     The fn taglib is declared at the top of this file — without it
                     the EL expression throws a 500. --%>
                <div class="profile-avatar">
                  ${fn:toUpperCase(fn:substring(userName, 0, 1))}
                </div>

                <div>
                  <h3 class="profile-h3" style="margin-bottom:4px;">
>>>>>>> 2ea22dc (completion of User password and Editing User details)
                    <c:out value="${userName}" />
                  </h3>
                  <span class="badge badge-confirmed">
                    <c:out value="${userRole}" />
                  </span>
                </div>
              </div>
<<<<<<< HEAD

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

=======

              <div class="summary-row">
                <span class="label">Email</span>
                <span class="value"><c:out value="${email}" /></span>
              </div>

              <div class="summary-row">
                <span class="label">Phone</span>
                <span class="value">
                  <%-- Prefix +977 only when not already present --%>
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
            <%-- /summary card --%>

            <%-- ══════════════════════════════════════════════════════════
                 QUICK-ACTIONS CARD
                 Links to dedicated update / password-change endpoints.
                 The edit form has been removed from this page; its own
                 servlet (/profile/update) owns all update logic.
            ══════════════════════════════════════════════════════════ --%>
            <div class="profile-card">
              <h4 class="profile-h4" style="margin-bottom:24px;">Account Actions</h4>

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
                <a href="${pageContext.request.contextPath}/packages"
                   class="btn btn-gold btn-sm">My Bookings</a>
              </div>

            </div>
            <%-- /actions card --%>

          </div>
          <%-- /profile-grid --%>

        </div>
        <%-- /profile-wrapper --%>

        <!-- FOOTER -->
        <div class="footer">
          <div class="container">
            <div class="container2">
              <div class="container3"><div class="mero-nepal">Mero Nepal Production</div></div>
              <div class="container4">
                <div class="text"><br />Cinematic photography and media production based in Nepal. We capture the moments that define your story.</div>
              </div>
            </div>
            <div class="container5">
              <div class="container6">
                <div class="heading-6"><div class="navigation">NAVIGATION</div></div><br />
                <div class="list">
                  <div class="item"><a href="${pageContext.request.contextPath}/home"><div>Home</div></a></div>
                  <div class="item"><a href="${pageContext.request.contextPath}/packages"><div>Packages</div></a></div>
                  <div class="item"><a href="${pageContext.request.contextPath}/about"><div>About</div></a></div>
                  <div class="item"><a href="${pageContext.request.contextPath}/blog"><div>Blog</div></a></div>
                </div>
              </div>
              <div class="container7">
                <div class="heading-6"><div class="legal">Account</div></div><br />
                <div class="list">
                  <div class="item"><a href="${pageContext.request.contextPath}/profile"><div>My Profile</div></a></div>
                  <div class="item"><a href="${pageContext.request.contextPath}/logout"><div>Logout</div></a></div>
                </div>
              </div>
            </div>
            <div class="container8">
              <div class="heading-6"><div class="stay-inspired">Contact</div></div>
              <div class="horizontal-border">
                <input class="footer-input" type="email" placeholder="Email Address" />
                <button class="footer-btn">→</button>
              </div>
              <div class="container10">
                <a href="mailto:hello@meronepal.com" class="social-link" aria-label="Email" target="_blank">
                  <span class="material-symbols-outlined social-icon">mail</span>
                </a>
                <a href="https://meronepal.com" class="social-link" aria-label="Website" target="_blank">
                  <span class="material-symbols-outlined social-icon">language</span>
                </a>
                <a href="https://instagram.com/yourpage" class="social-link" aria-label="Instagram" target="_blank">
                  <span class="material-symbols-outlined social-icon">photo_camera</span>
                </a>
              </div>
            </div>
          </div>
          <div class="horizontal-border2">
            <div class="container3">
              <div class="_2024-mero-nepal-production-the-modern-auteur">
                © <script>document.write(new Date().getFullYear());</script>
                Mero Nepal Production. The Modern Auteur.
              </div>
            </div>
          </div>
        </div>
        <%-- /footer --%>

      </main>

      <!-- RIGHT RAIL -->
      <aside class="hidden md:flex flex-col justify-between p-12 border-l border-white/10 sticky top-0 h-screen">
        <nav class="space-y-6">
          <a href="${pageContext.request.contextPath}/profile"  class="block uppercase active">My Profile</a>
          <a href="${pageContext.request.contextPath}/packages" class="block uppercase">Bookings</a>
          <hr class="hr" />
          <a href="${pageContext.request.contextPath}/about"   class="block uppercase">About</a>
          <a href="${pageContext.request.contextPath}/blog"    class="block uppercase">Blog</a>
          <a href="${pageContext.request.contextPath}/logout"  class="uppercase btn-secondary mt-4">Logout</a>
        </nav>
      </aside>

    </div>
    <%-- /3-col grid --%>

    <!-- MOBILE NAV SCRIPT -->
    <script>
      const toggle = document.getElementById("nav-toggle");
      const drawer = document.getElementById("mobile-nav");
      const bar1   = document.getElementById("bar1");
      const bar2   = document.getElementById("bar2");
      const bar3   = document.getElementById("bar3");
      let isOpen   = false;

      toggle.addEventListener("click", () => {
        isOpen = !isOpen;
        drawer.style.transform = isOpen ? "translateX(0)" : "translateX(100%)";
        bar1.style.transform   = isOpen ? "translateY(6px) rotate(45deg)" : "";
        bar2.style.opacity     = isOpen ? "0" : "1";
        bar3.style.transform   = isOpen ? "translateY(-6px) rotate(-45deg)" : "";
        bar3.style.width       = isOpen ? "24px" : "";
      });

      drawer.querySelectorAll("a").forEach(a =>
        a.addEventListener("click", () => {
          isOpen = false;
          drawer.style.transform     = "translateX(100%)";
          bar1.style.transform = bar3.style.transform = "";
          bar2.style.opacity   = "1";
          bar3.style.width     = "";
        })
      );
    </script>
>>>>>>> 2ea22dc (completion of User password and Editing User details)
  </body>
</html>
