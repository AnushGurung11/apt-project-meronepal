<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!-- ── MOBILE NAV SCRIPT ── -->
<script>
  (function () {
    const toggle = document.getElementById("nav-toggle");
    const drawer = document.getElementById("mobile-nav");
    const bar1 = document.getElementById("bar1");
    const bar2 = document.getElementById("bar2");
    const bar3 = document.getElementById("bar3");
    if (!toggle || !drawer) return;
    let isOpen = false;

    toggle.addEventListener("click", () => {
      isOpen = !isOpen;
      drawer.style.transform = isOpen ? "translateX(0)" : "translateX(100%)";
      bar1.style.transform = isOpen ? "translateY(6px) rotate(45deg)" : "";
      bar2.style.opacity = isOpen ? "0" : "1";
      bar3.style.transform = isOpen ? "translateY(-6px) rotate(-45deg)" : "";
      bar3.style.width = isOpen ? "24px" : "";
    });

    drawer.querySelectorAll("a").forEach((a) =>
      a.addEventListener("click", () => {
        isOpen = false;
        drawer.style.transform = "translateX(100%)";
        bar1.style.transform = bar3.style.transform = "";
        bar2.style.opacity = "1";
        bar3.style.width = "";
      })
    );
  })();
</script>
