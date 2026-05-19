<!-- ── MOBILE NAV DRAWER (admin) ── -->
<nav
  id="mobile-nav"
  class="md:hidden fixed inset-0 z-40 bg-[#0a0a0a] flex flex-col justify-center items-center gap-10"
  style="transform: translateX(100%); transition: transform 0.3s ease"
>
  <a href="${pageContext.request.contextPath}/dashboard" class="text-3xl font-black uppercase tracking-widest">Dashboard</a>
  <a href="${pageContext.request.contextPath}/admin-booking" class="text-3xl font-black uppercase tracking-widest">Bookings</a>
  <a href="${pageContext.request.contextPath}/home" class="text-3xl font-black uppercase tracking-widest">Visit Site</a>
  <a href="${pageContext.request.contextPath}/login" class="uppercase btn-secondary mt-4">Logout</a>
</nav>
