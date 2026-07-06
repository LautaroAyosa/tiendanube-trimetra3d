(function () {
  var prePromoPage = document.querySelector(".pre-promo-page");
  if (!prePromoPage) {
    return;
  }

  var scrollLinks = prePromoPage.querySelectorAll("[data-pre-promo-scroll]");

  Array.prototype.forEach.call(scrollLinks, function (link) {
    link.addEventListener("click", function (event) {
      var href = link.getAttribute("href") || "";

      if (href.charAt(0) !== "#") {
        return;
      }

      var target = prePromoPage.querySelector(href);
      if (!target) {
        return;
      }

      event.preventDefault();
      target.scrollIntoView({ behavior: "smooth", block: "start" });
    });
  });

  var targetValue = prePromoPage.getAttribute("data-pre-promo-target");
  var targetTime = targetValue ? new Date(targetValue).getTime() : NaN;

  if (isNaN(targetTime)) {
    return;
  }

  var daysElement = prePromoPage.querySelector("[data-pre-promo-days]");
  var hoursElement = prePromoPage.querySelector("[data-pre-promo-hours]");
  var minutesElement = prePromoPage.querySelector("[data-pre-promo-minutes]");
  var secondsElement = prePromoPage.querySelector("[data-pre-promo-seconds]");
  var statusElement = prePromoPage.querySelector("[data-pre-promo-status]");

  var setText = function (element, value) {
    if (element) {
      element.textContent = value;
    }
  };

  var pad = function (value) {
    return value < 10 ? "0" + value : String(value);
  };

  var setExpired = function () {
    setText(daysElement, "00");
    setText(hoursElement, "00");
    setText(minutesElement, "00");
    setText(secondsElement, "00");
    setText(statusElement, "La promo ya empez\u00f3.");
  };

  var updateCountdown = function () {
    var remaining = targetTime - Date.now();

    if (remaining <= 0) {
      setExpired();
      return false;
    }

    var totalSeconds = Math.floor(remaining / 1000);
    var days = Math.floor(totalSeconds / 86400);
    var hours = Math.floor((totalSeconds % 86400) / 3600);
    var minutes = Math.floor((totalSeconds % 3600) / 60);
    var seconds = totalSeconds % 60;

    setText(daysElement, pad(days));
    setText(hoursElement, pad(hours));
    setText(minutesElement, pad(minutes));
    setText(secondsElement, pad(seconds));

    return true;
  };

  if (updateCountdown()) {
    var countdownInterval = window.setInterval(function () {
      if (!updateCountdown()) {
        window.clearInterval(countdownInterval);
      }
    }, 1000);
  }
})();
