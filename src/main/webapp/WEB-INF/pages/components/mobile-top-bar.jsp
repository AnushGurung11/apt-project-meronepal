<!-- ── MOBILE TOP BAR ── -->
<div
  class="md:hidden fixed top-0 left-0 right-0 z-50 flex items-center justify-between px-6 h-14 bg-[#0a0a0a]"
  style="border-bottom: 1px solid var(--color-border)"
>
  <div class="text-xl font-black">
    <a href="${pageContext.request.contextPath}/home">M.NP</a>
  </div>
  <button
    id="nav-toggle"
    class="flex flex-col gap-[5px] p-1"
    aria-label="Toggle menu"
  >
    <span
      id="bar1"
      class="block w-6 h-px bg-white"
      style="transition: transform 0.25s, opacity 0.25s;"
    ></span>
    <span
      id="bar2"
      class="block w-6 h-px bg-white"
      style="transition: opacity 0.25s"
    ></span>
    <span
      id="bar3"
      class="block w-4 h-px bg-white"
      style="transition: transform 0.25s"
    ></span>
  </button>
</div>
