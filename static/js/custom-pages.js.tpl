(function () {
  "use strict";

  if (window.__trimetraCustomPagesLoaded) {
    return;
  }
  window.__trimetraCustomPagesLoaded = true;

  var pageRoot = document.querySelector("[data-cro-page]");
  if (!pageRoot) {
    return;
  }

  var contactFallbackUrl = "{{ include('snipplets/custom-pages/business-facts.tpl', { mode: 'contact_url' }) | trim | escape('js') }}";
  var productsFallbackUrl = "{{ include('snipplets/custom-pages/business-facts.tpl', { mode: 'products_url' }) | trim | escape('js') }}";
  var allowedEvents = {
    cro_cta_click: true,
    contact_intent: true,
    faq_open: true,
    lead_form_start: true,
    lead_form_submit: true,
    view_promotion: true,
    select_promotion: true
  };
  var parameterAttributes = {
    cta_id: "data-cro-cta",
    cta_location: "data-cro-location",
    action_type: "data-cro-action",
    content_group: "data-cro-content-group",
    channel: "data-cro-channel"
  };
  var tokenPattern = /^[a-z0-9][a-z0-9_-]{0,79}$/i;

  function controlledValue(value) {
    var normalized = String(value || "").trim();
    return tokenPattern.test(normalized) ? normalized : "";
  }

  function eventParameters(source) {
    var params = {};
    var pageKey = controlledValue(pageRoot.getAttribute("data-cro-page"));
    var campaignState = controlledValue(pageRoot.getAttribute("data-campaign-state"));

    if (pageKey) {
      params.page_key = pageKey;
    }
    if (campaignState) {
      params.campaign_state = campaignState;
    }

    Object.keys(parameterAttributes).forEach(function (name) {
      var value = source ? controlledValue(source.getAttribute(parameterAttributes[name])) : "";
      if (!value && name === "content_group") {
        value = controlledValue(pageRoot.getAttribute("data-cro-content-group"));
      }
      if (value) {
        params[name] = value;
      }
    });

    return params;
  }

  function track(eventName, source) {
    if (!allowedEvents[eventName]) {
      return;
    }

    var payload = eventParameters(source);
    payload.event = eventName;
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push(payload);
  }

  function isContactIntent(source) {
    var action = controlledValue(source.getAttribute("data-cro-action"));
    var channel = controlledValue(source.getAttribute("data-cro-channel"));
    return /^(chat|whatsapp|phone|email|contact)$/.test(action) || /^(chat|whatsapp|phone|email)$/.test(channel);
  }

  function openChatOrFallback(event, source) {
    if (!source.matches("[data-custom-chat-cta]")) {
      return;
    }

    if (window.$chatwoot && typeof window.$chatwoot.toggle === "function") {
      event.preventDefault();
      var chatContext = String(source.getAttribute("data-custom-chat-context") || "").replace(/\s+/g, " ").trim().slice(0, 120);
      if (chatContext && typeof window.$chatwoot.setCustomAttributes === "function") {
        try {
          window.$chatwoot.setCustomAttributes({ preorder_product: chatContext });
        } catch (error) {
          // El contexto es opcional; abrir el chat sigue siendo la accion principal.
        }
      } else if (!chatContext && typeof window.$chatwoot.deleteCustomAttribute === "function") {
        try {
          window.$chatwoot.deleteCustomAttribute("preorder_product");
        } catch (error) {
          // Evitar un contexto anterior es opcional y nunca debe bloquear el chat.
        }
      }
      window.$chatwoot.toggle("open");
      return;
    }

    if (source.tagName !== "A" || !source.getAttribute("href") || source.getAttribute("href").charAt(0) === "#") {
      event.preventDefault();
      window.location.assign(contactFallbackUrl);
    }
  }

  function moveFocus(target) {
    var hadTabindex = target.hasAttribute("tabindex");
    if (!hadTabindex) {
      target.setAttribute("tabindex", "-1");
      target.addEventListener("blur", function cleanTemporaryTabindex() {
        target.removeAttribute("tabindex");
      }, { once: true });
    }
    try {
      target.focus({ preventScroll: true });
    } catch (error) {
      target.focus();
    }
  }

  function handleInternalScroll(event, source) {
    if (!source.matches("[data-custom-scroll], [data-cro-action='scroll']")) {
      return;
    }

    var href = source.getAttribute("href") || "";
    if (href.length < 2 || href.charAt(0) !== "#") {
      return;
    }

    var target = document.getElementById(href.slice(1));
    if (!target || !pageRoot.contains(target)) {
      return;
    }

    event.preventDefault();
    var reduceMotion = window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;
    target.scrollIntoView({ behavior: reduceMotion ? "auto" : "smooth", block: "start" });
    moveFocus(target);
  }

  document.addEventListener("click", function (event) {
    var eventTarget = event.target;
    if (!eventTarget || typeof eventTarget.closest !== "function") {
      return;
    }
    var source = eventTarget.closest("[data-cro-cta], [data-custom-chat-cta], [data-custom-scroll], [data-cro-action='scroll']");
    var promotion = eventTarget.closest("[data-cro-promotion]");
    if ((!source || !pageRoot.contains(source)) && (!promotion || !pageRoot.contains(promotion))) {
      return;
    }

    if (source && source.hasAttribute("data-cro-cta")) {
      track("cro_cta_click", source);
      if (isContactIntent(source)) {
        track("contact_intent", source);
      }
    }

    if (promotion && pageRoot.contains(promotion)) {
      track("select_promotion", promotion);
    }

    if (source) {
      openChatOrFallback(event, source);
      handleInternalScroll(event, source);
    }
  });

  document.addEventListener("toggle", function (event) {
    var details = event.target;
    if (details.tagName === "DETAILS" && details.open && pageRoot.contains(details)) {
      track("faq_open", details);
    }
  }, true);

  var startedForms = typeof WeakSet === "function" ? new WeakSet() : null;
  document.addEventListener("focusin", function (event) {
    var form = event.target.closest("[data-cro-lead-form]");
    if (!form || !pageRoot.contains(form) || (startedForms && startedForms.has(form))) {
      return;
    }
    if (startedForms) {
      startedForms.add(form);
    } else if (form.getAttribute("data-cro-started") === "true") {
      return;
    } else {
      form.setAttribute("data-cro-started", "true");
    }
    track("lead_form_start", form);
  });

  var successfulForms = typeof WeakSet === "function" ? new WeakSet() : null;
  document.addEventListener("cro:lead-form-success", function (event) {
    var eventTarget = event.target;
    var form = eventTarget && eventTarget.matches && eventTarget.matches("[data-cro-lead-form]")
      ? eventTarget
      : eventTarget && eventTarget.closest
        ? eventTarget.closest("[data-cro-lead-form]")
        : null;

    if (!form || !pageRoot.contains(form) || (successfulForms && successfulForms.has(form))) {
      return;
    }
    if (successfulForms) {
      successfulForms.add(form);
    }
    track("lead_form_submit", form);
  });

  var returnLinks = pageRoot.querySelectorAll("[data-custom-return-link]");
  var productReturnPath = "";
  try {
    var referringUrl = new URL(document.referrer);
    if (referringUrl.origin === window.location.origin && /^\/(productos?|products?)\//i.test(referringUrl.pathname)) {
      productReturnPath = referringUrl.pathname;
    }
  } catch (error) {
    productReturnPath = "";
  }

  Array.prototype.forEach.call(returnLinks, function (link) {
    if (productReturnPath) {
      link.setAttribute("href", productReturnPath);
      link.textContent = link.getAttribute("data-custom-return-label") || "Volver al producto";
    } else if (!link.getAttribute("href")) {
      link.setAttribute("href", productsFallbackUrl);
    }
  });

  var promotions = pageRoot.querySelectorAll("[data-cro-promotion]");
  if ("IntersectionObserver" in window && promotions.length) {
    var seenPromotions = typeof WeakSet === "function" ? new WeakSet() : null;
    var promotionObserver = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting || (seenPromotions && seenPromotions.has(entry.target))) {
          return;
        }
        if (seenPromotions) {
          seenPromotions.add(entry.target);
        }
        track("view_promotion", entry.target);
        promotionObserver.unobserve(entry.target);
      });
    }, { threshold: 0.5 });

    Array.prototype.forEach.call(promotions, function (promotion) {
      promotionObserver.observe(promotion);
    });
  }
})();
