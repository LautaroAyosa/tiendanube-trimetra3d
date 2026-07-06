(function () {
  var hotDaysPage = document.querySelector(".hot-days-page");
  if (!hotDaysPage) {
    return;
  }

  var scrollLinks = hotDaysPage.querySelectorAll("[data-hot-days-scroll]");

  Array.prototype.forEach.call(scrollLinks, function (link) {
    link.addEventListener("click", function (event) {
      var href = link.getAttribute("href") || "";

      if (href.charAt(0) !== "#") {
        return;
      }

      var target = hotDaysPage.querySelector(href);
      if (!target) {
        return;
      }

      event.preventDefault();
      target.scrollIntoView({ behavior: "smooth", block: "start" });
    });
  });
})();
