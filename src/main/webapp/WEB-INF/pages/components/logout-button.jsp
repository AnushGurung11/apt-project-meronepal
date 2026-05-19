<%--
  Reusable Logout button — designed for the LEFT RAIL of authenticated pages.
  Include via: <%@ include file="/WEB-INF/pages/components/logout-button.jsp" %>
--%>
<a
  href="${pageContext.request.contextPath}/login"
  class="flex flex-col items-center gap-1 text-[10px] tracking-[0.3em] uppercase transition-colors"
  style="color: var(--gold, #c9a84c); text-decoration: none;"
  title="Logout"
>
  <span class="material-symbols-outlined" style="font-size: 20px;">logout</span>
  <span>Logout</span>
</a>
