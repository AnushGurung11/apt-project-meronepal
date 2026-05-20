<!-- ── MOBILE NAV DRAWER (public) ── -->
<nav
  id="mobile-nav"
  class="md:hidden fixed inset-0 z-40 bg-[#0a0a0a] flex flex-col justify-center items-center gap-10"
  style="transform: translateX(100%); transition: transform 0.3s ease"
>
  <a href="${pageContext.request.contextPath}/home" class="text-3xl font-black uppercase tracking-widest">Home</a>
  <a href="${pageContext.request.contextPath}/packages" class="text-3xl font-black uppercase tracking-widest">Package</a>
  <a href="${pageContext.request.contextPath}/about" class="text-3xl font-black uppercase tracking-widest">About</a>
  <a href="${pageContext.request.contextPath}/blog" class="text-3xl font-black uppercase tracking-widest">Blog</a>
  <a href="${pageContext.request.contextPath}/login" class="uppercase btn-secondary mt-4">Login</a>
  <a href="${pageContext.request.contextPath}/packages" class="uppercase btn-primary mt-4">Book Now</a>
</nav>
