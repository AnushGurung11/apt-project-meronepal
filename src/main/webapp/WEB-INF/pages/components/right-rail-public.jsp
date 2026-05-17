<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!-- ── RIGHT RAIL (public) ── -->
<aside
  class="hidden md:flex flex-col justify-between p-12 border-l border-white/10 sticky top-0 h-screen"
>
  <nav class="space-y-6">
    <a href="${pageContext.request.contextPath}/home" class="block uppercase"
      >Home</a
    >
    <a
      href="${pageContext.request.contextPath}/packages"
      class="block uppercase"
      >Packages</a
    >
    <a href="${pageContext.request.contextPath}/about" class="block uppercase"
      >About</a
    >
    <a href="${pageContext.request.contextPath}/blog" class="block uppercase"
      >Blog</a
    >
    <%@ include file="/WEB-INF/pages/components/profile-button.jsp" %>
    <a
      href="${pageContext.request.contextPath}/packages"
      class="uppercase btn-primary mt-4"
      >Book Now</a
    >
  </nav>
</aside>
