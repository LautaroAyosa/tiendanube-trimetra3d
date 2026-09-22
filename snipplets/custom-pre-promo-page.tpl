{% set pre_promo_products_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'products_url' }) | trim %}
{% set pre_promo_contact_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'contact_url' }) | trim %}
{% set pre_promo_campaign_state = custom_page_campaign_state in ['scheduled', 'active', 'ended'] ? custom_page_campaign_state : 'ended' %}

<main class="pre-promo-page" data-store="pre-promo-page" data-cro-page="pre_promo" data-campaign-state="{{ pre_promo_campaign_state }}">
	<section class="pre-promo-page__ended" aria-labelledby="pre-promo-ended-title">
		<div class="container pre-promo-page__container">
			<div class="pre-promo-page__ended-layout">
				<div class="pre-promo-page__ended-copy">
					{% if pre_promo_campaign_state == 'scheduled' %}
						<p class="pre-promo-page__status">Pr&oacute;xima campa&ntilde;a</p>
						<h1 id="pre-promo-ended-title">El acceso anticipado todav&iacute;a no comenz&oacute;</h1>
						<p>Esta p&aacute;gina a&uacute;n no recibe datos. Las fechas y condiciones se publicar&aacute;n antes de habilitar cualquier registro.</p>
					{% elseif pre_promo_campaign_state == 'active' %}
						<p class="pre-promo-page__status">Campa&ntilde;a vigente</p>
						<h1 id="pre-promo-ended-title">El acceso anticipado est&aacute; activo</h1>
						<p>Consult&aacute; las condiciones publicadas y revis&aacute; el precio, las cuotas y la disponibilidad final en cada producto y en el checkout. Esta p&aacute;gina no recibe datos.</p>
					{% else %}
						<p class="pre-promo-page__status">Campa&ntilde;a finalizada</p>
						<h1 id="pre-promo-ended-title">La etapa de acceso anticipado ya termin&oacute;</h1>
						<p>La suscripci&oacute;n est&aacute; cerrada y esta p&aacute;gina ya no recibe datos. Los precios, cuotas y disponibilidad vigentes se muestran en cada producto y en el checkout.</p>
					{% endif %}
					<div class="pre-promo-page__actions">
						<a class="pre-promo-page__button" href="{{ pre_promo_products_url }}" data-custom-return-link data-custom-return-label="Volver al producto" data-cro-cta="pre_promo_{{ pre_promo_campaign_state }}_catalog" data-cro-location="{{ pre_promo_campaign_state }}_state" data-cro-action="browse" data-cro-channel="web">Explorar productos</a>
						<a class="pre-promo-page__button pre-promo-page__button--secondary" href="{{ pre_promo_contact_url }}" data-custom-chat-cta data-cro-cta="pre_promo_{{ pre_promo_campaign_state }}_contact" data-cro-location="{{ pre_promo_campaign_state }}_state" data-cro-action="contact" data-cro-channel="chat">Consultar al equipo</a>
					</div>
				</div>

				<aside class="pre-promo-page__ended-note" aria-label="Estado de la campa&ntilde;a">
					{% if pre_promo_campaign_state == 'scheduled' %}
						<span aria-hidden="true">Pr&oacute;xima</span>
						<h2>Esper&aacute; la publicaci&oacute;n de las condiciones</h2>
						<p>No compartas datos en formularios que no tengan vigencia y privacidad publicadas.</p>
					{% elseif pre_promo_campaign_state == 'active' %}
						<span aria-hidden="true">Vigente</span>
						<h2>Las condiciones actuales mandan</h2>
						<p>El consentimiento de marketing debe seguir siendo opcional y separado.</p>
					{% else %}
						<span aria-hidden="true">Cerrada</span>
						<h2>Sin formularios ni avisos pendientes</h2>
						<p>Si hay una nueva campa&ntilde;a, la vas a encontrar publicada con sus fechas y condiciones actuales.</p>
					{% endif %}
				</aside>
			</div>
		</div>
	</section>
</main>
