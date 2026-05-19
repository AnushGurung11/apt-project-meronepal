<%-- Reusable Logout button — designed for the LEFT RAIL of authenticated pages.
Include via: <%@ include file="/WEB-INF/pages/components/logout-button.jsp" %>
--%> <%-- Logout Trigger Button --%>
<button
  type="button"
  onclick="document.getElementById('logoutModal').classList.remove('hidden')"
  class="flex flex-col items-center gap-1 text-[10px] tracking-[0.3em] uppercase transition-colors bg-transparent border-none cursor-pointer p-0"
  style="color: var(--gold, #c9a84c)"
  title="Logout"
>
  <span class="material-symbols-outlined" style="font-size: 20px">logout</span>
  <span>Logout</span>
</button>

<%-- Logout Confirmation Modal --%>
<div
  id="logoutModal"
  class="hidden fixed inset-0 z-50 flex items-center justify-center"
  style="background: rgba(0, 0, 0, 0.6); backdrop-filter: blur(2px)"
  onclick="
    if (event.target === this)
      document.getElementById('logoutModal').classList.add('hidden');
  "
>
  <div
    class="rounded-xl shadow-2xl p-8 flex flex-col items-center gap-5 min-w-[300px] max-w-sm mx-4"
    style="
      background: var(--surface, #1a1a2e);
      border: 1px solid var(--gold, #c9a84c);
    "
  >
    <span
      class="material-symbols-outlined"
      style="font-size: 40px; color: var(--gold, #c9a84c)"
      >logout</span
    >

    <div class="text-center flex flex-col gap-1">
      <p
        class="text-base font-semibold tracking-widest uppercase m-0"
        style="color: var(--gold, #c9a84c)"
      >
        Confirm Logout
      </p>
      <p class="text-sm m-0" style="color: rgba(255, 255, 255, 0.55)">
        Are you sure you want to end your session?
      </p>
    </div>

    <div class="flex gap-3 w-full">
      <%-- Cancel --%>
      <button
        type="button"
        onclick="document.getElementById('logoutModal').classList.add('hidden')"
        class="flex-1 py-2 rounded-lg text-xs tracking-widest uppercase font-semibold cursor-pointer"
        style="
          background: transparent;
          border: 1px solid rgba(255, 255, 255, 0.2);
          color: rgba(255, 255, 255, 0.6);
        "
        onmouseover="
          this.style.borderColor = 'rgba(255,255,255,0.45)';
          this.style.color = 'rgba(255,255,255,0.9)';
        "
        onmouseout="
          this.style.borderColor = 'rgba(255,255,255,0.2)';
          this.style.color = 'rgba(255,255,255,0.6)';
        "
      >
        Cancel
      </button>

      <%-- Confirm — simply redirect to /logout --%>
      <button
        type="button"
        onclick="
          window.location.href = '${pageContext.request.contextPath}/logout'
        "
        class="flex-1 py-2 rounded-lg text-xs tracking-widest uppercase font-semibold cursor-pointer"
        style="background: var(--gold, #c9a84c); border: none; color: #1a1a1a"
        onmouseover="this.style.filter = 'brightness(1.15)'"
        onmouseout="this.style.filter = 'brightness(1)'"
      >
        Logout
      </button>
    </div>
  </div>
</div>
