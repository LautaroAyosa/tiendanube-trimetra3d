{% set pre_promo_admin_content = page.content | trim %}
{% set pre_promo_target = '2026-06-22T09:30:00-03:00' %}

<main class="pre-promo-page" data-store="pre-promo-page" data-pre-promo-target="{{ pre_promo_target }}">
	<section class="pre-promo-page__hero" aria-labelledby="pre-promo-title">
		<div class="container pre-promo-page__container pre-promo-page__hero-container">
			<div class="pre-promo-page__hero-layout">
				<div class="pre-promo-page__hero-copy">
					<p class="pre-promo-page__eyebrow pre-promo-page__eyebrow--light">Previa Aniversario Bambu Lab</p>
					<h1 class="pre-promo-page__title" id="pre-promo-title">Hasta <span class="pre-promo-page__redacted" aria-label="cuotas a confirmar"><span aria-hidden="true">**</span></span> Cuotas sin inter&eacute;s</h1>
					<p class="pre-promo-page__lead">La promoci&oacute;n empieza el lunes 22 de junio de 2026 a las 9:30. A esa hora vamos a mandar la informaci&oacute;n de las ofertas por email y WhatsApp.</p>

					<div class="pre-promo-page__hero-actions">
						<a class="pre-promo-page__button pre-promo-page__button--outline" href="{{ store.products_url }}">Ver cat&aacute;logo</a>
					</div>

					<div class="pre-promo-page__countdown-panel" aria-label="Cuenta regresiva para la promoci&oacute;n">
						<p class="pre-promo-page__countdown-kicker">Falta para que empiece</p>
						<div class="pre-promo-page__countdown" data-pre-promo-countdown>
							<div class="pre-promo-page__countdown-item">
								<strong data-pre-promo-days>00</strong>
								<span>D&iacute;as</span>
							</div>
							<div class="pre-promo-page__countdown-item">
								<strong data-pre-promo-hours>00</strong>
								<span>Horas</span>
							</div>
							<div class="pre-promo-page__countdown-item">
								<strong data-pre-promo-minutes>00</strong>
								<span>Minutos</span>
							</div>
							<div class="pre-promo-page__countdown-item">
								<strong data-pre-promo-seconds>00</strong>
								<span>Segundos</span>
							</div>
						</div>
						<p class="pre-promo-page__countdown-status" data-pre-promo-status>La promo empieza el lunes 22/06/2026 a las 9:30.</p>
					</div>
				</div>

				<section class="pre-promo-page__form-card" id="pre-promo-form" aria-labelledby="pre-promo-form-title">
					<div class="pre-promo-page__form-heading">
						<h2 id="pre-promo-form-title">Recib&iacute; las promociones apenas salgan</h2>
						<span>Complet&aacute; tus datos y te avisamos cuando se habiliten los descuentos.</span>
					</div>

					<div class="pre-promo-page__form-note">
						<strong>Importante:</strong>
						<span>el stock es limitado. Anotarte ayuda a enterarte antes de que se agoten las unidades m&aacute;s buscadas.</span>
					</div>

					<div class="pre-promo-page__brevo-embed">
						{% include 'snipplets/pre-promo-brevo-form.tpl' %}
					</div>
				</section>
			</div>
		</div>
	</section>

	<section class="pre-promo-page__section pre-promo-page__steps-section" aria-labelledby="pre-promo-steps">
		<div class="container pre-promo-page__container">
			<div class="pre-promo-page__section-header">
				<p class="pre-promo-page__eyebrow">C&oacute;mo funciona</p>
				<h2 id="pre-promo-steps">Tres pasos para llegar a tiempo</h2>
				<p>No hace falta comprar ahora: dej&aacute; tus datos y esper&aacute; el aviso cuando las promociones est&eacute;n activas.</p>
			</div>

			<div class="pre-promo-page__steps-grid">
				<article class="pre-promo-page__step-card">
					<span class="pre-promo-page__step-icon" aria-hidden="true">{% include "snipplets/svg/email.tpl" with {svg_custom_class: "pre-promo-page__icon-svg"} %}</span>
					<strong>Te anot&aacute;s</strong>
					<p>Complet&aacute;s el formulario con tus datos de contacto para recibir el aviso de la promo.</p>
				</article>
				<article class="pre-promo-page__step-card pre-promo-page__step-card--accent">
					<span class="pre-promo-page__step-icon" aria-hidden="true">{% include "snipplets/svg/calendar.tpl" with {svg_custom_class: "pre-promo-page__icon-svg"} %}</span>
					<strong>Te avisamos a las 9:30</strong>
					<p>El lunes 22/06/2026 mandamos la informaci&oacute;n de los descuentos apenas empiece la campa&ntilde;a.</p>
				</article>
				<article class="pre-promo-page__step-card">
					<span class="pre-promo-page__step-icon" aria-hidden="true">{% include "snipplets/svg/package.tpl" with {svg_custom_class: "pre-promo-page__icon-svg"} %}</span>
					<strong>Compr&aacute;s con stock real</strong>
					<p>Las unidades son limitadas, por eso conviene tener la info a mano desde el primer minuto.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="pre-promo-page__section pre-promo-page__categories" aria-labelledby="pre-promo-categories">
		<div class="container pre-promo-page__container">
			<div class="pre-promo-page__section-header">
				<p class="pre-promo-page__eyebrow">Lo que se viene</p>
				<h2 id="pre-promo-categories">Ofertas para equiparte mejor</h2>
				<p>Vamos a compartir descuentos seleccionados en productos de impresi&oacute;n 3D, con foco en disponibilidad y compra r&aacute;pida.</p>
			</div>

			<div class="pre-promo-page__category-grid">
				<a class="pre-promo-page__category-card" href="{{ store.products_url }}?q=impresora%203d">
					<span class="pre-promo-page__category-icon" aria-hidden="true">{% include "snipplets/svg/store-alt.tpl" with {svg_custom_class: "pre-promo-page__icon-svg"} %}</span>
					<strong>Impresoras 3D</strong>
					<span>Equipos para empezar, producir o actualizar tu setup.</span>
				</a>
				<a class="pre-promo-page__category-card" href="{{ store.products_url }}?q=filamento">
					<span class="pre-promo-page__category-icon" aria-hidden="true">{% include "snipplets/svg/package.tpl" with {svg_custom_class: "pre-promo-page__icon-svg"} %}</span>
					<strong>Filamentos</strong>
					<span>Material para aprovechar la promo y seguir imprimiendo.</span>
				</a>
				<a class="pre-promo-page__category-card" href="{{ store.products_url }}?q=accesorios">
					<span class="pre-promo-page__category-icon" aria-hidden="true">{% include "snipplets/svg/promotions.tpl" with {svg_custom_class: "pre-promo-page__icon-svg"} %}</span>
					<strong>Accesorios</strong>
					<span>Repuestos, herramientas e insumos para no frenar el flujo.</span>
				</a>
			</div>
		</div>
	</section>

	<section class="pre-promo-page__section pre-promo-page__faq" aria-labelledby="pre-promo-faq">
		<div class="container pre-promo-page__container">
			<div class="pre-promo-page__faq-layout">
				<div class="pre-promo-page__section-header">
					<p class="pre-promo-page__eyebrow">Preguntas frecuentes</p>
					<h2 id="pre-promo-faq">Antes de anotarte</h2>
					<p>La suscripci&oacute;n solo sirve para avisarte cuando la promo est&eacute; disponible.</p>
				</div>
				<div class="pre-promo-page__faq-list">
					<details class="pre-promo-page__faq-item">
						<summary>&iquest;Cu&aacute;ndo empieza la promoci&oacute;n?</summary>
						<p>Empieza el lunes 22 de junio de 2026 a las 9:30, hora Argentina.</p>
					</details>
					<details class="pre-promo-page__faq-item">
						<summary>&iquest;Por qu&eacute; conviene anotarse?</summary>
						<p>Porque el stock es limitado y vamos a mandar la informaci&oacute;n de las ofertas apenas se habiliten.</p>
					</details>
					<details class="pre-promo-page__faq-item">
						<summary>&iquest;Anotarme me obliga a comprar?</summary>
						<p>No. Solo te permite recibir el aviso de la promoci&oacute;n y decidir cuando veas las ofertas disponibles.</p>
					</details>
				</div>
			</div>
		</div>
	</section>

	{% if pre_promo_admin_content %}
		<section class="pre-promo-page__section pre-promo-page__admin-section">
			<div class="container pre-promo-page__container">
				<div class="pre-promo-page__admin-content user-content">
					{{ page.content }}
				</div>
			</div>
		</section>
	{% endif %}
</main>
