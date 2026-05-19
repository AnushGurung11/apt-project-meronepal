<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!-- ── RIGHT RAIL (admin) ── -->
<aside
  class="hidden md:flex flex-col justify-between p-12 border-l border-white/10 sticky top-0 h-screen"
>
  <nav class="space-y-6">
    <a
      href="${pageContext.request.contextPath}/dashboard"
      class="block uppercase"
      >Dashboard</a
    >
    <a
      href="${pageContext.request.contextPath}/admin-booking"
      class="block uppercase"
      >Bookings</a
    >
    <a href="${pageContext.request.contextPath}/admin-services" class="block uppercase">Services</a>
    <div
      style="margin-top: 16px; display: flex; flex-direction: column; gap: 10px"
    >
      <a
        href="${pageContext.request.contextPath}/home"
        class="uppercase btn-primary"
        >Visit Site</a
      >
    </div>
  </nav>
</aside>
