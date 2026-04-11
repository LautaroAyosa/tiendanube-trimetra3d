(function () {
  var aboutPage = document.querySelector(".about-page");
  if (!aboutPage) {
    return;
  }

  var chatCtas = aboutPage.querySelectorAll("[data-about-chat-cta]");
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

  var photos = aboutPage.querySelectorAll("[data-about-photo]");

  Array.prototype.forEach.call(photos, function (photo) {
    var photoCard = photo.closest("[data-about-photo-card]");

    var markMissing = function () {
      if (photoCard) {
        photoCard.classList.add("is-missing");
      }
      photo.hidden = true;
    };

    photo.addEventListener("error", markMissing);

    if (photo.complete && !photo.naturalWidth) {
      markMissing();
    }
  });
})();
