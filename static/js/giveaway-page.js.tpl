(function () {
  var giveawayPage = document.querySelector(".giveaway-page");
  if (!giveawayPage) {
    return;
  }

  var formCard = giveawayPage.querySelector(".giveaway-page__form-card");
  var brevoForm = giveawayPage.querySelector("[data-giveaway-brevo-form]");
  var formHeading = giveawayPage.querySelector("[data-giveaway-form-heading]");
  var successMessage = giveawayPage.querySelector("#success-message");
  var successPanel = giveawayPage.querySelector("[data-giveaway-success]");
  var formCtas = giveawayPage.querySelectorAll("[data-giveaway-form-cta]");

  var isVisible = function (element) {
    if (!element) {
      return false;
    }

    var style = window.getComputedStyle(element);

    return style.display !== "none" &&
      style.visibility !== "hidden" &&
      style.opacity !== "0" &&
      element.offsetHeight > 0;
  };

  var showSuccessPanel = function () {
    if (!successPanel || !isVisible(successMessage)) {
      return;
    }

    if (formCard) {
      formCard.classList.add("is-success");
    }

    if (brevoForm) {
      brevoForm.setAttribute("hidden", "hidden");
    }

    if (formHeading) {
      formHeading.setAttribute("hidden", "hidden");
    }

    successPanel.removeAttribute("hidden");
    successPanel.scrollIntoView({ behavior: "smooth", block: "center" });
  };

  Array.prototype.forEach.call(formCtas, function (cta) {
    cta.addEventListener("click", function (event) {
      var formSection = giveawayPage.querySelector("#giveaway-form");

      if (!formSection) {
        return;
      }

      event.preventDefault();
      formSection.scrollIntoView({ behavior: "smooth", block: "start" });
    });
  });

  if (successMessage && "MutationObserver" in window) {
    var observer = new MutationObserver(showSuccessPanel);
    observer.observe(successMessage, {
      attributes: true,
      attributeFilter: ["class", "style", "hidden", "aria-hidden"]
    });
  }

  window.setTimeout(showSuccessPanel, 300);
})();
