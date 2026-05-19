<%--
  Reusable Profile button — designed for the RIGHT RAIL of authenticated pages.
  Replaces the previous "Logout" link on the right rail.
  Include via: <%@ include file="/WEB-INF/pages/components/profile-button.jsp" %>
--%>
<a
  href="${pageContext.request.contextPath}/profile"
  class="uppercase btn-secondary mt-4"
>
  Profile
</a>
