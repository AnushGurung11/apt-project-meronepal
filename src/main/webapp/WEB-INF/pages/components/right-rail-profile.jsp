<!-- ── RIGHT RAIL (profile) ── -->
<aside
  class="hidden md:flex flex-col justify-between p-12 border-l border-white/10 sticky top-0 h-screen"
>
  <nav class="space-y-6">
    <a href="${pageContext.request.contextPath}/profile" class="block uppercase"
      >My Profile</a
    >
    <a
      href="${pageContext.request.contextPath}/my-booking"
      class="block uppercase"
      >My Bookings</a
    >
    <a
      href="${pageContext.request.contextPath}/packages"
      class="block uppercase btn-secondary"
      >+ New Booking</a
    >
    <hr class="hr" />
    <br />
    <a
      href="${pageContext.request.contextPath}/packages"
      class="block uppercase"
      >Packages</a
    >
    <a href="${pageContext.request.contextPath}/blog" class="block uppercase"
      >Blog</a
    >
    <%@ include file="/WEB-INF/pages/components/profile-button.jsp" %>
  </nav>
</aside>
