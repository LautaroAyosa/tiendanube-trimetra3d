(function () {
  var shippingPage = document.querySelector(".shipping-page");
  if (!shippingPage) {
    return;
  }

  var chatCta = shippingPage.querySelector("[data-shipping-chat-cta]");
  if (!chatCta) {
    return;
  }

  var chatwootReady = window.$chatwoot && typeof window.$chatwoot.toggle === "function";

  window.addEventListener("chatwoot:ready", function () {
    chatwootReady = true;
  });

  chatCta.addEventListener("click", function (event) {
    if (chatwootReady && window.$chatwoot && typeof window.$chatwoot.toggle === "function") {
      event.preventDefault();
      window.$chatwoot.toggle("open");
    }
  });
})();
