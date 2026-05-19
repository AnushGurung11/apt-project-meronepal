<!-- ── MOBILE NAV DRAWER (profile) ── -->
<nav
  id="mobile-nav"
  class="md:hidden fixed inset-0 z-40 bg-[#0a0a0a] flex flex-col justify-center items-center gap-10"
  style="transform: translateX(100%); transition: transform 0.3s ease"
>
  <a
    href="${pageContext.request.contextPath}/profile"
    class="text-3xl font-black uppercase tracking-widest"
    >My Profile</a
  >
  <a
    href="${pageContext.request.contextPath}/home"
    class="text-3xl font-black uppercase tracking-widest"
    >Home</a
  >
  <a
    href="${pageContext.request.contextPath}/packages"
    class="text-3xl font-black uppercase tracking-widest"
    >Packages</a
  >
  <a
    href="${pageContext.request.contextPath}/blog"
    class="text-3xl font-black uppercase tracking-widest"
    >Blog</a
  >
  <a
    href="${pageContext.request.contextPath}/login"
    class="uppercase btn-secondary mt-4"
    >Logout</a
  >
</nav>
