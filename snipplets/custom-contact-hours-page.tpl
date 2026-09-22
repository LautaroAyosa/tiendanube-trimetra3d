{% set contact_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "contact_url" }) | trim %}
{% set contact_whatsapp_primary_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "whatsapp_primary_url" }) | trim %}
{% set contact_whatsapp_primary_display = include("snipplets/custom-pages/business-facts.tpl", { mode: "whatsapp_primary_display" }) | trim %}
{% set contact_whatsapp_secondary_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "whatsapp_secondary_url" }) | trim %}
{% set contact_whatsapp_secondary_display = include("snipplets/custom-pages/business-facts.tpl", { mode: "whatsapp_secondary_display" }) | trim %}
{% set contact_phone_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "phone_url" }) | trim %}
{% set contact_phone_display = include("snipplets/custom-pages/business-facts.tpl", { mode: "phone_display" }) | trim %}
{% set contact_address = include("snipplets/custom-pages/business-facts.tpl", { mode: "address" }) | trim %}
{% set contact_hours_weekdays = include("snipplets/custom-pages/business-facts.tpl", { mode: "hours_weekdays" }) | trim %}
{% set contact_hours_saturday = include("snipplets/custom-pages/business-facts.tpl", { mode: "hours_saturday" }) | trim %}
{% set contact_pickup_note = include("snipplets/custom-pages/business-facts.tpl", { mode: "pickup_note" }) | trim %}
{% set contact_products_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "products_url" }) | trim %}
{% set contact_email = include("snipplets/custom-pages/business-facts.tpl", { mode: "email" }) | trim %}

<main class="contact-hours-page" data-store="contact-hours-page" data-cro-page="contact_hours" data-cro-content-group="institutional">
	<section class="contact-hours-page__hero">
		<div class="container contact-hours-page__container">
			<div class="contact-hours-page__hero-layout">
				<div class="contact-hours-page__hero-copy">
					<p class="contact-hours-page__eyebrow">Contacto y horarios</p>
					<h1 class="contact-hours-page__title">Contact&aacute; al equipo de Trimetra 3D</h1>
					<p class="contact-hours-page__lead">Eleg&iacute; el canal que te resulte m&aacute;s c&oacute;modo para consultas de compra, soporte, seguimiento o retiros. Estos son nuestros &uacute;nicos canales publicados.</p>
				</div>

				<aside class="contact-hours-page__hero-panel" aria-label="Datos principales de contacto">
					<div class="contact-hours-page__panel-row">
						<span>WhatsApp principal</span>
						<strong><a class="contact-hours-page__panel-link" href="{{ contact_whatsapp_primary_url }}" target="_blank" rel="noopener noreferrer" data-cro-cta="whatsapp_primary" data-cro-location="hero" data-cro-action="contact" data-cro-channel="whatsapp">{{ contact_whatsapp_primary_display }}</a></strong>
					</div>
					<div class="contact-hours-page__panel-row">
						<span>Atenci&oacute;n humana</span>
						<strong>{{ contact_hours_weekdays }}<br>{{ contact_hours_saturday }}</strong>
					</div>
					<div class="contact-hours-page__panel-row">
						<span>Dep&oacute;sito y retiro</span>
						<strong>{{ contact_address }}</strong>
					</div>
					<a class="contact-hours-page__button" href="{{ contact_url }}" data-custom-chat-cta data-cro-cta="open_chat" data-cro-location="hero" data-cro-action="contact" data-cro-channel="chat">Abrir chat de la web</a>
					<a class="contact-hours-page__button contact-hours-page__button--outline" href="{{ contact_whatsapp_primary_url }}" target="_blank" rel="noopener noreferrer" data-cro-cta="whatsapp_primary" data-cro-location="hero" data-cro-action="contact" data-cro-channel="whatsapp">Escribir por WhatsApp</a>
				</aside>
			</div>
		</div>
	</section>

	<section class="contact-hours-page__quick-section">
		<div class="container contact-hours-page__container">
			<div class="contact-hours-page__quick-grid" aria-label="Resumen de canales y ubicaci&oacute;n">
				<article class="contact-hours-page__quick-card contact-hours-page__quick-card--accent">
					<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/chat.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
					<p>Chat de la web</p>
					<h2>Canal recomendado</h2>
					<a href="{{ contact_url }}" data-custom-chat-cta data-cro-cta="open_chat" data-cro-location="summary" data-cro-action="contact" data-cro-channel="chat">Abrir chat</a>
				</article>
				<article class="contact-hours-page__quick-card">
					<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
					<p>WhatsApp principal</p>
					<h2>{{ contact_whatsapp_primary_display }}</h2>
					<a href="{{ contact_whatsapp_primary_url }}" target="_blank" rel="noopener noreferrer" data-cro-cta="whatsapp_primary" data-cro-location="summary" data-cro-action="contact" data-cro-channel="whatsapp">Abrir WhatsApp</a>
				</article>
				<article class="contact-hours-page__quick-card">
					<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/phone.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
					<p>Llamadas</p>
					<h2>{{ contact_phone_display }}</h2>
					<a href="{{ contact_phone_url }}" data-cro-cta="phone_primary" data-cro-location="summary" data-cro-action="contact" data-cro-channel="phone">Llamar</a>
				</article>
				<article class="contact-hours-page__quick-card">
					<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/map-marker-alt.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
					<p>Dep&oacute;sito y retiro</p>
					<h2>{{ contact_address }}</h2>
					<span>{{ contact_pickup_note }}</span>
				</article>
			</div>
		</div>
	</section>

	<section class="contact-hours-page__channels">
		<div class="container contact-hours-page__container">
			<div class="contact-hours-page__section-heading">
				<p class="contact-hours-page__eyebrow">Canales oficiales</p>
				<h2>Dos n&uacute;meros, con funciones claras</h2>
				<p>El 7370 es el canal principal para ventas, soporte, retiros y llamadas. Si no pod&eacute;s comunicarte, us&aacute; el 7058 como respaldo.</p>
			</div>

			<div class="contact-hours-page__channel-grid">
				<article class="contact-hours-page__channel-card">
					<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
					<h3>WhatsApp principal</h3>
					<a href="{{ contact_whatsapp_primary_url }}" target="_blank" rel="noopener noreferrer" data-cro-cta="whatsapp_primary" data-cro-location="channels" data-cro-action="contact" data-cro-channel="whatsapp">{{ contact_whatsapp_primary_display }}</a>
					<p>Ventas, soporte, seguimiento y coordinaci&oacute;n de retiros.</p>
				</article>
				<article class="contact-hours-page__channel-card">
					<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
					<h3>WhatsApp de respaldo</h3>
					<a href="{{ contact_whatsapp_secondary_url }}" target="_blank" rel="noopener noreferrer" data-cro-cta="whatsapp_backup" data-cro-location="channels" data-cro-action="contact" data-cro-channel="whatsapp">{{ contact_whatsapp_secondary_display }}</a>
					<p>Usalo si el canal principal no est&aacute; disponible.</p>
				</article>
				<article class="contact-hours-page__channel-card">
					<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/phone.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
					<h3>Llamadas</h3>
					<a href="{{ contact_phone_url }}" data-cro-cta="phone_primary" data-cro-location="channels" data-cro-action="contact" data-cro-channel="phone">{{ contact_phone_display }}</a>
					<p>N&uacute;mero principal para atenci&oacute;n telef&oacute;nica.</p>
				</article>
				{% if contact_email %}
					<article class="contact-hours-page__channel-card">
						<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/email.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
						<h3>Email</h3>
						<a href="mailto:{{ contact_email }}" data-cro-cta="email_general" data-cro-location="channels" data-cro-action="contact" data-cro-channel="email">{{ contact_email }}</a>
						<p>Consultas que necesiten documentaci&oacute;n o archivos.</p>
					</article>
				{% endif %}
			</div>
		</div>
	</section>

	<section class="contact-hours-page__hours">
		<div class="container contact-hours-page__container">
			<div class="contact-hours-page__section-heading">
				<p class="contact-hours-page__eyebrow">Horarios y retiro</p>
				<h2>Cu&aacute;ndo respondemos</h2>
				<p>Horarios de Buenos Aires (UTC-3). En feriados nacionales la atenci&oacute;n puede estar reducida.</p>
			</div>
			<div class="contact-hours-page__hours-board" aria-label="Horarios de atenci&oacute;n">
				<article class="contact-hours-page__hours-row contact-hours-page__hours-row--open">
					<div><span>D&iacute;as h&aacute;biles</span><h3>Atenci&oacute;n humana</h3></div>
					<strong>{{ contact_hours_weekdays }}</strong>
					<p>Ventas, soporte y seguimiento de gestiones.</p>
				</article>
				<article class="contact-hours-page__hours-row">
					<div><span>Fin de semana</span><h3>Atenci&oacute;n humana</h3></div>
					<strong>{{ contact_hours_saturday }}</strong>
					<p>Las consultas fuera de horario se responden en la pr&oacute;xima franja de atenci&oacute;n.</p>
				</article>
				<article class="contact-hours-page__hours-row">
					<div><span>{{ contact_address }}</span><h3>Retiro en dep&oacute;sito</h3></div>
					<strong>Con coordinaci&oacute;n previa</strong>
					<p>{{ contact_pickup_note }} Esper&aacute; nuestra confirmaci&oacute;n antes de acercarte.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="contact-hours-page__safety">
		<div class="container contact-hours-page__container">
			<div class="contact-hours-page__safety-layout">
				<div>
					<h2>&iquest;Quer&eacute;s seguir comprando?</h2>
					<p>Volv&eacute; al cat&aacute;logo o consultanos antes de elegir un producto.</p>
				</div>
				<div class="contact-hours-page__cta-actions">
					<a class="contact-hours-page__button" href="{{ contact_products_url }}" data-custom-return-link data-custom-return-label="Volver al producto" data-cro-cta="view_catalog" data-cro-location="footer" data-cro-action="navigate" data-cro-channel="web">Ver productos</a>
					<a class="contact-hours-page__button contact-hours-page__button--outline" href="{{ contact_url }}" data-custom-chat-cta data-cro-cta="open_chat" data-cro-location="footer" data-cro-action="contact" data-cro-channel="chat">Abrir chat</a>
				</div>
			</div>
		</div>
	</section>
</main>
