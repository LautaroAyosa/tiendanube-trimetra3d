(function () {
  var paymentPage = document.querySelector(".payment-page");
  if (!paymentPage) {
    return;
  }

  function parseDate(value, endOfDay) {
    var match = String(value || "").match(/^(\d{4})-(\d{2})-(\d{2})$/);
    if (!match) {
      return null;
    }

    var year = Number(match[1]);
    var month = Number(match[2]) - 1;
    var day = Number(match[3]);
    var date = endOfDay ? new Date(year, month, day, 23, 59, 59, 999) : new Date(year, month, day);
    var isValid = date.getFullYear() === year && date.getMonth() === month && date.getDate() === day;

    return isValid ? date : null;
  }

  function pad(value) {
    return value < 10 ? "0" + value : String(value);
  }

  var installmentsValueNodes = paymentPage.querySelectorAll("[data-payment-installments-value]");
  var installmentsScopeNodes = paymentPage.querySelectorAll("[data-payment-installments-scope]");

  function updatePromotedInstallments(activePromo) {
    var installments = activePromo ? activePromo.getAttribute("data-promo-installments") : "";
    var scope = activePromo ? activePromo.getAttribute("data-promo-scope") : "";
    var hasPromoInstallments = Boolean(installments && scope);

    Array.prototype.forEach.call(installmentsValueNodes, function (node) {
      node.textContent = hasPromoInstallments ? installments : node.getAttribute("data-payment-installments-base") || "3";
    });

    Array.prototype.forEach.call(installmentsScopeNodes, function (node) {
      if (!hasPromoInstallments) {
        node.hidden = true;
        node.textContent = "";
        return;
      }

      var template = node.getAttribute("data-payment-installments-scope-template") || " en {scope}";
      node.textContent = template.replace("{scope}", scope);
      node.hidden = false;
    });
  }

  function updateCountdown(promo, endDate) {
    var countdown = promo.querySelector("[data-payment-countdown]");
    if (!countdown || promo.getAttribute("data-promo-countdown") !== "true") {
      return;
    }

    var now = new Date();
    var remaining = endDate.getTime() - now.getTime();
    if (remaining <= 0) {
      countdown.hidden = true;
      return;
    }

    var secondsTotal = Math.floor(remaining / 1000);
    var days = Math.floor(secondsTotal / 86400);
    var hours = Math.floor((secondsTotal % 86400) / 3600);
    var minutes = Math.floor((secondsTotal % 3600) / 60);
    var seconds = secondsTotal % 60;
    var daysNode = countdown.querySelector("[data-payment-countdown-days]");
    var hoursNode = countdown.querySelector("[data-payment-countdown-hours]");
    var minutesNode = countdown.querySelector("[data-payment-countdown-minutes]");
    var secondsNode = countdown.querySelector("[data-payment-countdown-seconds]");

    if (daysNode) {
      daysNode.textContent = pad(days);
    }
    if (hoursNode) {
      hoursNode.textContent = pad(hours);
    }
    if (minutesNode) {
      minutesNode.textContent = pad(minutes);
    }
    if (secondsNode) {
      secondsNode.textContent = pad(seconds);
    }

    countdown.hidden = false;
  }

  var promos = paymentPage.querySelectorAll("[data-payment-promo]");
  var oncityPromos = paymentPage.querySelector("[data-oncity-promos]");

  function isActiveDateRange(node, now) {
    var startDate = parseDate(node.getAttribute("data-oncity-start"), false);
    var endDate = parseDate(node.getAttribute("data-oncity-end"), true);

    return Boolean(startDate && endDate && startDate <= endDate && now >= startDate && now <= endDate);
  }

  function updateOncityPromos(activePromo) {
    if (!oncityPromos) {
      return;
    }

    var baseInstallments = oncityPromos.getAttribute("data-oncity-base-installments") || "3";
    var promoInstallments = activePromo ? activePromo.getAttribute("data-promo-installments") : "";
    var activeInstallments = promoInstallments || baseInstallments;
    var currentNodes = oncityPromos.querySelectorAll("[data-oncity-current-installments]");
    var tiers = oncityPromos.querySelectorAll("[data-oncity-tier]");
    var now = new Date();
    var hasVisibleTier = false;

    Array.prototype.forEach.call(currentNodes, function (node) {
      node.textContent = activeInstallments;
    });

    Array.prototype.forEach.call(tiers, function (tier) {
      var isCurrentTier = tier.getAttribute("data-oncity-tier") === activeInstallments;
      var items = tier.querySelectorAll("[data-oncity-item]");
      var hasVisibleItems = false;

      Array.prototype.forEach.call(items, function (item) {
        var isVisible = isCurrentTier && isActiveDateRange(item, now);
        item.hidden = !isVisible;

        if (isVisible) {
          hasVisibleItems = true;
        }
      });

      tier.hidden = !(isCurrentTier && hasVisibleItems);

      if (isCurrentTier && hasVisibleItems) {
        hasVisibleTier = true;
      }
    });

    oncityPromos.hidden = !hasVisibleTier;
  }

  function applyPromoState(promo) {
    var startDate = parseDate(promo.getAttribute("data-promo-start"), false);
    var endDate = parseDate(promo.getAttribute("data-promo-end"), true);
    var now = new Date();
    var active = startDate && endDate && startDate <= endDate && now >= startDate && now <= endDate;

    promo.hidden = !active;
    if (active) {
      promo.classList.add("payment-page__promo--active");
    } else {
      promo.classList.remove("payment-page__promo--active");
    }

    if (active) {
      updateCountdown(promo, endDate);
    } else {
      var countdown = promo.querySelector("[data-payment-countdown]");
      if (countdown) {
        countdown.hidden = true;
      }
    }

    return active;
  }

  function applyAllPromoStates() {
    var activePromo = null;

    Array.prototype.forEach.call(promos, function (promo) {
      if (applyPromoState(promo) && !activePromo) {
        activePromo = promo;
      }
    });

    updatePromotedInstallments(activePromo);
    updateOncityPromos(activePromo);
  }

  if (promos.length) {
    applyAllPromoStates();
    window.setInterval(applyAllPromoStates, 1000);
  } else {
    updatePromotedInstallments(null);
    updateOncityPromos(null);
  }

  var chatCtas = paymentPage.querySelectorAll("[data-payment-chat-cta]");
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
