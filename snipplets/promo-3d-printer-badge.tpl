{% set promo_printer_badge_has_active_promo = include("snipplets/payment-installments-config.tpl", { mode: "has_active_promo" }) | trim %}
{% set promo_printer_badge_installments = include("snipplets/payment-installments-config.tpl", { mode: "promo_installments" }) | trim %}
{% set promo_printer_badge_is_eligible = include("snipplets/payment-promo-product-eligibility.tpl") | trim %}

{% if promo_printer_badge_has_active_promo == "true" and promo_printer_badge_is_eligible == "true" %}
  <span class="promo-printer-badge{% if product_detail | default(false) %} promo-printer-badge--detail{% endif %}" role="img" aria-label="{{ promo_printer_badge_installments }} cuotas sin interés">
    <strong class="promo-printer-badge__number" aria-hidden="true">{{ promo_printer_badge_installments }}</strong>
    <span class="promo-printer-badge__text" aria-hidden="true">
      <span>sin</span>
      <span>inter&eacute;s</span>
    </span>
  </span>
{% endif %}
