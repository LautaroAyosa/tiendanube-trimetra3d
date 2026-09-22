{% set hot_days_products_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'products_url' }) | trim %}
{% set hot_days_contact_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'contact_url' }) | trim %}
{% set hot_days_campaign_state = custom_page_campaign_state in ['scheduled', 'active', 'ended'] ? custom_page_campaign_state : 'ended' %}

<main class="hot-days-page" data-store="hot-days-page" data-cro-page="hot_days" data-campaign-state="{{ hot_days_campaign_state }}">
	<section class="hot-days-page__ended" aria-labelledby="hot-days-ended-title">
		<div class="container hot-days-page__container">
			<div class="hot-days-page__ended-layout">
				<div class="hot-days-page__ended-copy">
					{% if hot_days_campaign_state == 'scheduled' %}
						<p class="hot-days-page__status">Pr&oacute;ximos Hot Days</p>
						<h1 id="hot-days-ended-title">La campa&ntilde;a todav&iacute;a no comenz&oacute;</h1>
						<p>Publicaremos la vigencia y las condiciones antes del inicio. Mientras tanto, el cat&aacute;logo muestra los precios, el stock y las opciones actuales.</p>
					{% elseif hot_days_campaign_state == 'active' %}
						<p class="hot-days-page__status">Hot Days vigente</p>
						<h1 id="hot-days-ended-title">La campa&ntilde;a est&aacute; activa</h1>
						<p>Consult&aacute; el cat&aacute;logo para ver precios, stock, cuotas y opciones de entrega actualizados. El total y la elegibilidad final se confirman en checkout.</p>
					{% else %}
						<p class="hot-days-page__status">Hot Days finalizado</p>
						<h1 id="hot-days-ended-title">Esta campa&ntilde;a ya termin&oacute;</h1>
						<p>Las ofertas de esta edici&oacute;n dejaron de estar vigentes. Consult&aacute; el cat&aacute;logo para ver precios, stock, cuotas y opciones de entrega actualizados.</p>
					{% endif %}
					<div class="hot-days-page__actions">
						<a class="hot-days-page__button" href="{{ hot_days_products_url }}" data-custom-return-link data-custom-return-label="Volver al producto" data-cro-cta="hot_days_{{ hot_days_campaign_state }}_catalog" data-cro-location="{{ hot_days_campaign_state }}_state" data-cro-action="browse" data-cro-channel="web">Ver cat&aacute;logo actual</a>
						<a class="hot-days-page__button hot-days-page__button--secondary" href="{{ hot_days_contact_url }}" data-custom-chat-cta data-cro-cta="hot_days_{{ hot_days_campaign_state }}_contact" data-cro-location="{{ hot_days_campaign_state }}_state" data-cro-action="contact" data-cro-channel="chat">Pedir asesoramiento</a>
					</div>
				</div>

				<aside class="hot-days-page__ended-note" aria-label="Estado de Hot Days">
					{% if hot_days_campaign_state == 'scheduled' %}
						<span aria-hidden="true">Pr&oacute;xima</span>
						<h2>No hay promociones futuras habilitadas todav&iacute;a</h2>
						<p>La informaci&oacute;n se publicar&aacute; cuando la campa&ntilde;a tenga vigencia confirmada.</p>
					{% elseif hot_days_campaign_state == 'active' %}
						<span aria-hidden="true">Vigente</span>
						<h2>La informaci&oacute;n actual est&aacute; en la tienda</h2>
						<p>El total y las condiciones finales se confirman siempre antes de completar el pago.</p>
					{% else %}
						<span aria-hidden="true">Finalizada</span>
						<h2>La informaci&oacute;n actual est&aacute; en la tienda</h2>
						<p>El total y las condiciones finales se confirman siempre antes de completar el pago.</p>
					{% endif %}
				</aside>
			</div>
		</div>
	</section>
</main>
