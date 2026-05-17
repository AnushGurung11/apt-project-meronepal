<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!-- ── LEFT RAIL (authenticated — includes Logout) ── -->
<aside
  class="hidden md:flex flex-col justify-between items-center py-12 border-r border-white/10 sticky top-0 h-screen"
>
  <div class="text-2xl font-black">
    <a href="${pageContext.request.contextPath}/home">M.NP</a>
  </div>
  <div
    class="vertical-text text-[10px] tracking-[0.4em] uppercase"
    style="color: var(--color-gold)"
  >
    Mero Nepal Production — EST. 2014
  </div>
  <div class="flex flex-col items-center gap-5">
    <%@ include file="/WEB-INF/pages/components/logout-button.jsp" %>
  </div>
</aside>
