{% set trust_bar_payment_installments = include("snipplets/payment-installments-config.tpl", { mode: "current_installments" }) | trim %}
{% set trust_bar_payment_has_active_promo = include("snipplets/payment-installments-config.tpl", { mode: "has_active_promo" }) | trim %}
{% set trust_bar_payment_promo_end = include("snipplets/payment-installments-config.tpl", { mode: "promo_end_display" }) | trim %}

<section class="trust-bar" aria-label="Beneficios de compra" data-store="trust-bar">
  <div class="container">
    <div class="trust-bar__viewport">
      <div class="trust-bar__grid">
        <article class="trust-bar__item">
          <span class="trust-bar__icon" aria-hidden="true">
            {% include "snipplets/svg/truck.tpl" with {svg_custom_class: "trust-bar__icon-svg"} %}
          </span>
          <h3 class="trust-bar__title">Env&iacute;os a todo el pa&iacute;s</h3>
          <p class="trust-bar__text">Despachos con operadores confiables y seguimiento.</p>
          <a class="trust-bar__link" href="/envios/">Leer m&aacute;s</a>
        </article>

        <article class="trust-bar__item">
          <span class="trust-bar__icon" aria-hidden="true">
            {% include "snipplets/svg/credit-card.tpl" with {svg_custom_class: "trust-bar__icon-svg"} %}
          </span>
          <h3 class="trust-bar__title">{{ trust_bar_payment_installments }} cuotas sin inter&eacute;s</h3>
          <p class="trust-bar__text">{% if trust_bar_payment_has_active_promo == "true" %}Promo vigente hasta el {{ trust_bar_payment_promo_end }} con tarjetas seleccionadas.{% else %}Pag&aacute; en cuotas con tarjetas seleccionadas.{% endif %}</p>
          <a class="trust-bar__link" href="/pagos/">Leer m&aacute;s</a>
        </article>

        <article class="trust-bar__item">
          <span class="trust-bar__icon" aria-hidden="true">
            {% include "snipplets/svg/security.tpl" with {svg_custom_class: "trust-bar__icon-svg"} %}
          </span>
          <h3 class="trust-bar__title">Garant&iacute;a oficial</h3>
          <p class="trust-bar__text">Productos con respaldo y condiciones claras.</p>
          <a class="trust-bar__link" href="/garantias-y-devoluciones/">Leer m&aacute;s</a>
        </article>

        <article class="trust-bar__item">
          <span class="trust-bar__icon" aria-hidden="true">
            {% include "snipplets/svg/comments.tpl" with {svg_custom_class: "trust-bar__icon-svg"} %}
          </span>
          <h3 class="trust-bar__title">Soporte real</h3>
          <p class="trust-bar__text">Atenci&oacute;n humana antes y despu&eacute;s de comprar.</p>
          <a class="trust-bar__link" href="/contacto-y-horarios/">Leer m&aacute;s</a>
        </article>
      </div>
    </div>
  </div>
</section>
