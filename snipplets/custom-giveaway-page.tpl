{% set giveaway_products_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'products_url' }) | trim %}
{% set giveaway_instagram_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'instagram_url' }) | trim %}
{% set giveaway_campaign_state = custom_page_campaign_state in ['scheduled', 'active', 'ended'] ? custom_page_campaign_state : 'ended' %}

<main class="giveaway-page" data-store="giveaway-page" data-cro-page="giveaway" data-campaign-state="{{ giveaway_campaign_state }}">
	<section class="giveaway-page__ended" aria-labelledby="giveaway-ended-title">
		<div class="container giveaway-page__container">
			<div class="giveaway-page__ended-layout">
				<div class="giveaway-page__ended-copy">
					{% if giveaway_campaign_state == 'scheduled' %}
						<p class="giveaway-page__status">Pr&oacute;ximo sorteo</p>
						<h1 id="giveaway-ended-title">Esta edici&oacute;n todav&iacute;a no comenz&oacute;</h1>
						<p>La participaci&oacute;n a&uacute;n no est&aacute; habilitada y esta p&aacute;gina no recibe datos. Publicaremos las fechas, bases y canales v&aacute;lidos cuando comience.</p>
					{% elseif giveaway_campaign_state == 'active' %}
						<p class="giveaway-page__status">Sorteo vigente</p>
						<h1 id="giveaway-ended-title">Hay una edici&oacute;n activa</h1>
						<p>Consult&aacute; las bases, la vigencia y el mecanismo de participaci&oacute;n publicados en nuestros canales oficiales. Esta p&aacute;gina no recibe datos personales.</p>
					{% else %}
						<p class="giveaway-page__status">Sorteo finalizado</p>
						<h1 id="giveaway-ended-title">Esta edici&oacute;n del sorteo ya termin&oacute;</h1>
						<p>La inscripci&oacute;n est&aacute; cerrada y esta p&aacute;gina ya no recibe datos. Pod&eacute;s seguir recorriendo los productos de impresi&oacute;n 3D o consultar las novedades en nuestros canales publicados.</p>
					{% endif %}
					<div class="giveaway-page__actions">
						<a class="giveaway-page__button" href="{{ giveaway_products_url }}" data-custom-return-link data-custom-return-label="Volver al producto" data-cro-cta="giveaway_{{ giveaway_campaign_state }}_catalog" data-cro-location="{{ giveaway_campaign_state }}_state" data-cro-action="browse" data-cro-channel="web">Ver cat&aacute;logo</a>
						{% if giveaway_instagram_url %}<a class="giveaway-page__button giveaway-page__button--secondary" href="{{ giveaway_instagram_url }}" target="_blank" rel="noopener" data-cro-cta="giveaway_{{ giveaway_campaign_state }}_instagram" data-cro-location="{{ giveaway_campaign_state }}_state" data-cro-action="social" data-cro-channel="instagram">Ver novedades en Instagram</a>{% endif %}
					</div>
				</div>

				<aside class="giveaway-page__ended-note" aria-label="Estado del sorteo">
					{% if giveaway_campaign_state == 'scheduled' %}
						<span aria-hidden="true">Pr&oacute;ximo</span>
						<h2>Todav&iacute;a no abrimos la participaci&oacute;n</h2>
						<p>No completes datos fuera de los canales y fechas que publiquemos.</p>
					{% elseif giveaway_campaign_state == 'active' %}
						<span aria-hidden="true">Vigente</span>
						<h2>Revis&aacute; las bases antes de participar</h2>
						<p>El consentimiento para novedades comerciales siempre debe ser opcional.</p>
					{% else %}
						<span aria-hidden="true">Cerrado</span>
						<h2>No estamos recibiendo nuevas inscripciones</h2>
						<p>No hace falta completar ning&uacute;n formulario en esta p&aacute;gina.</p>
					{% endif %}
				</aside>
			</div>
		</div>
	</section>
</main>
