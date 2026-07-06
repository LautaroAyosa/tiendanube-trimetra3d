{% set promo_printer_badge_has_active_promo = include("snipplets/payment-installments-config.tpl", { mode: "has_active_promo" }) | trim %}
{% set promo_printer_badge_installments = include("snipplets/payment-installments-config.tpl", { mode: "promo_installments" }) | trim %}
{% set promo_printer_badge_product_text = (product.name ~ ' ' ~ product.url) | lower %}
{% set promo_printer_badge_is_candidate =
  'impresora' in promo_printer_badge_product_text
  or 'a1' in promo_printer_badge_product_text
  or 'p1s' in promo_printer_badge_product_text
  or 'p1p' in promo_printer_badge_product_text
  or 'bambu lab x1' in promo_printer_badge_product_text
  or 'x1 carbon' in promo_printer_badge_product_text
  or 'snapmaker' in promo_printer_badge_product_text
  or 'h2s' in promo_printer_badge_product_text
  or 'h2d' in promo_printer_badge_product_text
  or 'p2s' in promo_printer_badge_product_text
%}
{% set promo_printer_badge_is_accessory =
  'filamento' in promo_printer_badge_product_text
  or 'resina' in promo_printer_badge_product_text
  or 'repuesto' in promo_printer_badge_product_text
  or 'boquilla' in promo_printer_badge_product_text
  or 'nozzle' in promo_printer_badge_product_text
  or 'hotend' in promo_printer_badge_product_text
  or 'extrusor' in promo_printer_badge_product_text
  or 'extruder' in promo_printer_badge_product_text
  or 'placa' in promo_printer_badge_product_text
  or 'cama' in promo_printer_badge_product_text
  or 'ptfe' in promo_printer_badge_product_text
%}

{% if promo_printer_badge_has_active_promo == "true" and promo_printer_badge_is_candidate and not promo_printer_badge_is_accessory %}
  <span class="promo-printer-badge{% if product_detail | default(false) %} promo-printer-badge--detail{% endif %}" aria-label="{{ promo_printer_badge_installments }} cuotas sin interes y envio gratis en impresoras 3D">
    <span class="promo-printer-badge__main">{{ promo_printer_badge_installments }} cuotas s/int.</span>
    <span class="promo-printer-badge__ship">+ env&iacute;o gratis</span>
  </span>
{% endif %}
