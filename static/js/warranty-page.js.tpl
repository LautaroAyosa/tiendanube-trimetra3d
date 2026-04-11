(function () {
  var warrantyPage = document.querySelector(".warranty-page");
  if (!warrantyPage) {
    return;
  }

  var chatCtas = warrantyPage.querySelectorAll("[data-warranty-webchat-cta]");
  if (!chatCtas.length) {
    return;
  }

  var chatwootReady = window.$chatwoot && typeof window.$chatwoot.toggle === "function";

  window.addEventListener("chatwoot:ready", function () {
    chatwootReady = true;
  });

  Array.prototype.forEach.call(chatCtas, function (chatCta) {
    chatCta.addEventListener("click", function (event) {
      if (chatwootReady && window.$chatwoot && typeof window.$chatwoot.toggle === "function") {
        event.preventDefault();
        window.$chatwoot.toggle("open");
      }
    });
  });
})();
