{% set contact_hours_admin_content = page.content | trim %}
{% set contact_page_url = 'https://trimetra3d.mitiendanube.com/contacto-y-horarios/' %}
{% set contact_whatsapp_primary = 'https://wa.me/5491173703391' %}
{% set contact_whatsapp_secondary = 'https://wa.me/5491170587575' %}
{% set contact_email_support = 'mailto:info@trimetra3d.com.ar' %}
{% set contact_email_billing = 'mailto:facturaci%C3%B3n@trimetra3d.com.ar' %}

<main class="contact-hours-page" data-store="contact-hours-page">
	<section class="contact-hours-page__hero">
		<div class="container contact-hours-page__container">
			<div class="contact-hours-page__hero-layout">
				<div class="contact-hours-page__hero-copy">
					<p class="contact-hours-page__eyebrow">Contacto y horarios</p>
					<h1 class="contact-hours-page__title">Escribinos por los canales oficiales</h1>
					<p class="contact-hours-page__lead">Atendemos consultas, ventas, soporte, retiros y servicio t&eacute;cnico por el chat de la web, WhatsApp y email. La atenci&oacute;n humana funciona de lunes a viernes de 09:00 a 17:00 y s&aacute;bados de 10:00 a 13:00.</p>
				</div>

				<aside class="contact-hours-page__hero-panel" aria-label="Resumen r&aacute;pido de atenci&oacute;n">
					<div class="contact-hours-page__panel-row">
						<span>Canal recomendado</span>
						<strong><a class="contact-hours-page__panel-link" href="{{ contact_page_url }}" data-contact-chat-cta>Chat de la web</a></strong>
					</div>
					<div class="contact-hours-page__panel-row">
						<span>WhatsApp</span>
						<strong><a class="contact-hours-page__panel-link" href="{{ contact_whatsapp_primary }}" target="_blank" rel="noopener">+54 9 11 7370-3391</a></strong>
					</div>
					<div class="contact-hours-page__panel-row">
						<span>Atenci&oacute;n humana</span>
						<strong>Lun a vie 09:00 a 17:00<br>S&aacute;b 10:00 a 13:00</strong>
					</div>
					<a class="contact-hours-page__button" href="{{ contact_page_url }}" data-contact-chat-cta>Abrir chat de la web</a>
					<a class="contact-hours-page__button contact-hours-page__button--outline" href="{{ contact_whatsapp_primary }}" target="_blank" rel="noopener">Escribir por WhatsApp</a>
				</aside>
			</div>
		</div>
	</section>

	<section class="contact-hours-page__quick-section">
		<div class="container contact-hours-page__container">
			<div class="contact-hours-page__quick-grid" aria-label="Datos clave de contacto y horarios">
				<article class="contact-hours-page__quick-card contact-hours-page__quick-card--accent">
					<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/chat.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
					<p>Chat de la web</p>
					<h2>Canal recomendado</h2>
					<a href="{{ contact_page_url }}" data-contact-chat-cta>Abrir chat</a>
				</article>
				<article class="contact-hours-page__quick-card">
					<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
					<p>WhatsApp principal</p>
					<h2>+54 9 11 7370-3391</h2>
					<a href="{{ contact_whatsapp_primary }}" target="_blank" rel="noopener">Abrir WhatsApp</a>
				</article>
				<article class="contact-hours-page__quick-card">
					<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/phone.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
					<p>Atenci&oacute;n humana</p>
					<h2>Lun a vie 09:00 a 17:00</h2>
					<span>S&aacute;bados 10:00 a 13:00.</span>
				</article>
				<article class="contact-hours-page__quick-card">
					<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/map-marker-alt.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
					<p>Retiros</p>
					<h2>Ciudadela</h2>
					<span>Direcci&oacute;n exacta coordinada por mensaje.</span>
				</article>
			</div>
		</div>
	</section>

	<section class="contact-hours-page__channels">
		<div class="container contact-hours-page__container">
			<div class="contact-hours-page__section-heading">
				<p class="contact-hours-page__eyebrow">Canales oficiales</p>
				<h2>Us&aacute; el chat de la web o estos medios oficiales</h2>
				<p>Para que podamos ayudarte y mantener la seguridad de tu compra, no usamos n&uacute;meros alternativos ni emails gen&eacute;ricos fuera de esta lista.</p>
			</div>

			<div class="contact-hours-page__channels-layout">
				<article class="contact-hours-page__primary-channel">
					<div class="contact-hours-page__primary-top">
						<span class="contact-hours-page__large-icon" aria-hidden="true">{% include "snipplets/svg/chat.tpl" with {svg_custom_class: "contact-hours-page__large-icon-svg"} %}</span>
						<div>
							<p>Canal recomendado</p>
							<h3>Chat de la web</h3>
						</div>
					</div>
					<strong>Desde la tienda</strong>
					<p>Usalo para consultas r&aacute;pidas mientras naveg&aacute;s, dudas antes de comprar y seguimiento de una gesti&oacute;n. Si el equipo necesita m&aacute;s datos, te va a derivar al canal correspondiente.</p>
					<a class="contact-hours-page__button contact-hours-page__button--light" href="{{ contact_page_url }}" data-contact-chat-cta>Abrir chat de la web</a>
				</article>

				<div class="contact-hours-page__channel-grid">
					<article class="contact-hours-page__channel-card">
						<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
						<h3>WhatsApp primario</h3>
						<a href="{{ contact_whatsapp_primary }}" target="_blank" rel="noopener">+54 9 11 7370-3391</a>
						<p>Soporte, ventas, coordinaci&oacute;n de retiros y consultas operativas.</p>
					</article>
					<article class="contact-hours-page__channel-card">
						<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
						<h3>WhatsApp secundario</h3>
						<a href="{{ contact_whatsapp_secondary }}" target="_blank" rel="noopener">+54 9 11 7058-7575</a>
						<p>Atenci&oacute;n humana; puede haber demoras en la respuesta.</p>
					</article>
					<article class="contact-hours-page__channel-card">
						<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/info-circle.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
						<h3>Respuesta m&aacute;s r&aacute;pida</h3>
						<p>Para consultas de compra, soporte y coordinaci&oacute;n, us&aacute; WhatsApp o el chat de la web. Escribinos por email solo cuando sea completamente necesario.</p>
					</article>
					<article class="contact-hours-page__channel-card">
						<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/phone.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
						<h3>Llamadas</h3>
						<a href="tel:+54973703391">+54 9 7370-3391</a>
						<p>N&uacute;mero oficial para llamados.</p>
					</article>
					<article class="contact-hours-page__channel-card">
						<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/email.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
						<h3>Email general</h3>
						<a href="{{ contact_email_support }}">info@trimetra3d.com.ar</a>
						<p>Soporte general, garant&iacute;as y RMA.</p>
					</article>
					<article class="contact-hours-page__channel-card">
						<span class="contact-hours-page__icon" aria-hidden="true">{% include "snipplets/svg/email.tpl" with {svg_custom_class: "contact-hours-page__icon-svg"} %}</span>
						<h3>Facturaci&oacute;n</h3>
						<a href="{{ contact_email_billing }}">facturaci&oacute;n@trimetra3d.com.ar</a>
						<p>Consultas y gestiones de facturaci&oacute;n.</p>
					</article>
				</div>
			</div>
		</div>
	</section>

	<section class="contact-hours-page__hours">
		<div class="container contact-hours-page__container">
			<div class="contact-hours-page__section-heading">
				<p class="contact-hours-page__eyebrow">Horarios operativos</p>
				<h2>Horarios de atenci&oacute;n</h2>
				<p>La atenci&oacute;n humana funciona de lunes a viernes de 09:00 a 17:00 y s&aacute;bados de 10:00 a 13:00. Horarios en zona UTC-3 (Buenos Aires, Argentina). En feriados nacionales la atenci&oacute;n puede estar reducida o suspendida; confirmalo por mensaje.</p>
			</div>

			<div class="contact-hours-page__hours-board" aria-label="Horarios de atenci&oacute;n">
				<article class="contact-hours-page__hours-row contact-hours-page__hours-row--open">
					<div>
						<span>Canal web</span>
						<h3>Chat de la tienda</h3>
					</div>
					<strong>Desde la web</strong>
					<p>Pod&eacute;s abrirlo desde el sitio. Respondemos dentro del horario de atenci&oacute;n humana.</p>
				</article>
				<article class="contact-hours-page__hours-row">
					<div>
						<span>Consultas complejas</span>
						<h3>Atenci&oacute;n humana</h3>
					</div>
					<strong>Lun a vie 09:00 a 17:00</strong>
					<p>S&aacute;bados de 10:00 a 13:00 para ventas, soporte, servicio t&eacute;cnico y operaciones especiales.</p>
				</article>
				<article class="contact-hours-page__hours-row">
					<div>
						<span>Dep&oacute;sito Ciudadela</span>
						<h3>Retiros coordinados</h3>
					</div>
					<strong>09:00 a 19:00</strong>
					<p>Coordin&aacute; por mensaje. Preparaci&oacute;n m&iacute;nima: 2 horas antes del retiro.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="contact-hours-page__operations">
		<div class="container contact-hours-page__container">
			<div class="contact-hours-page__section-heading">
				<h2>Cortes y coordinaci&oacute;n</h2>
				<p>Estos horarios ayudan a estimar cu&aacute;ndo se prepara o despacha un pedido.</p>
			</div>

			<div class="contact-hours-page__operations-grid">
				<article class="contact-hours-page__operation-card">
					<span>CABA y GBA</span>
					<h3>Pedidos antes de las 12:00</h3>
					<p>Se entregan en el d&iacute;a por courier propio si el pedido queda confirmado antes del corte.</p>
				</article>
				<article class="contact-hours-page__operation-card">
					<span>Resto del pa&iacute;s</span>
					<h3>Pedidos antes de las 15:00</h3>
					<p>Se despachan en el d&iacute;a por correo si el pedido queda confirmado antes del corte.</p>
				</article>
				<article class="contact-hours-page__operation-card">
					<span>Retiro en dep&oacute;sito</span>
					<h3>Coordinaci&oacute;n previa</h3>
					<p>La direcci&oacute;n exacta y el horario de retiro se confirman exclusivamente por mensaje.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="contact-hours-page__social">
		<div class="container contact-hours-page__container">
			<div class="contact-hours-page__social-layout">
				<div>
					<p class="contact-hours-page__eyebrow">Redes sociales</p>
					<h2>Seguinos en nuestros perfiles oficiales</h2>
				</div>
				<div class="contact-hours-page__social-links" aria-label="Redes sociales oficiales">
					<a href="https://www.instagram.com/trimetra3d/" target="_blank" rel="noopener">
						{% include "snipplets/svg/instagram.tpl" with {svg_custom_class: "contact-hours-page__social-icon"} %}
						<span>Instagram</span>
					</a>
					<a href="https://www.facebook.com/profile.php?id=61576241912866" target="_blank" rel="noopener">
						{% include "snipplets/svg/facebook-f.tpl" with {svg_custom_class: "contact-hours-page__social-icon"} %}
						<span>Facebook</span>
					</a>
					<a href="https://www.tiktok.com/@trimetra3d" target="_blank" rel="noopener">
						{% include "snipplets/svg/tiktok.tpl" with {svg_custom_class: "contact-hours-page__social-icon"} %}
						<span>TikTok</span>
					</a>
				</div>
			</div>
		</div>
	</section>

	<section class="contact-hours-page__safety">
		<div class="container contact-hours-page__container">
			<div class="contact-hours-page__safety-layout">
				<div>
					<h2>Antes de escribirnos</h2>
					<p>Las consultas y gestiones por fuera de los canales oficiales no son v&aacute;lidas ni seguras. Si necesit&aacute;s contacto humano, abr&iacute; el chat de la web o escribinos por WhatsApp principal y te derivamos al &aacute;rea correspondiente.</p>
				</div>
				<a class="contact-hours-page__button" href="{{ contact_page_url }}" data-contact-chat-cta>Abrir chat de la web</a>
			</div>
		</div>
	</section>

	{% if contact_hours_admin_content %}
		<section class="contact-hours-page__section contact-hours-page__admin-section">
			<div class="container contact-hours-page__container">
				<div class="contact-hours-page__admin-content user-content">
					{{ page.content }}
				</div>
			</div>
		</section>
	{% endif %}
</main>
