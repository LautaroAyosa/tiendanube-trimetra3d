{% set preventas_selected_products = sections.preventas.products | default([]) %}
{% set preventas_products = [] %}
{# Falla de forma segura: una seleccion administrativa comun no debe publicarse como preventa. #}
{% for product in preventas_selected_products %}
	{% set preventa_product_name = product.name | lower %}
	{% set preventa_product_has_month_first_half = 'enero' in preventa_product_name or 'febrero' in preventa_product_name or 'marzo' in preventa_product_name or 'abril' in preventa_product_name or 'mayo' in preventa_product_name or 'junio' in preventa_product_name %}
	{% set preventa_product_has_month_second_half = 'julio' in preventa_product_name or 'agosto' in preventa_product_name or 'septiembre' in preventa_product_name or 'setiembre' in preventa_product_name or 'octubre' in preventa_product_name or 'noviembre' in preventa_product_name or 'diciembre' in preventa_product_name %}
	{% set preventa_product_has_month = preventa_product_has_month_first_half or preventa_product_has_month_second_half %}
	{% if 'preventa' in preventa_product_name and preventa_product_has_month %}
		{% set preventas_products = preventas_products | merge([product]) %}
	{% endif %}
{% endfor %}
{% set preventas_has_products = preventas_products | length > 0 %}
{% set preventas_hero_product = preventas_has_products ? preventas_products | first %}
{% set preventas_contact_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'contact_url' }) | trim %}
{% set preventas_products_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'products_url' }) | trim %}
{% set preventas_whatsapp_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'whatsapp_primary_url' }) | trim %}
{% set preventas_deposit_percent = include('snipplets/custom-pages/business-facts.tpl', { mode: 'preorder_deposit_percent' }) | trim %}
{% set preventas_hero_image = preventas_hero_product and preventas_hero_product.featured_image ? preventas_hero_product.featured_image | product_image_url('large') : 'images/about/about-products_small.jpg' | static_url %}

<main class="preventas-page" data-store="preventas-page" data-cro-page="preorders">
	<section class="preventas-page__hero" aria-labelledby="preventas-title">
		<div class="container preventas-page__container">
			<div class="preventas-page__hero-layout">
				<div class="preventas-page__hero-copy">
					<p class="preventas-page__eyebrow">Preventas Trimetra 3D</p>
					<h1 class="preventas-page__title" id="preventas-title">Reserv&aacute; con una se&ntilde;a del {{ preventas_deposit_percent }}% y segu&iacute; una fecha estimada clara</h1>
					<p class="preventas-page__lead">Una preventa te permite reservar una unidad que todav&iacute;a est&aacute; por llegar. Pod&eacute;s pagar el total online o coordinar la se&ntilde;a y completar el saldo antes del despacho.</p>

					<div class="preventas-page__hero-actions">
						<a class="preventas-page__button" href="#preventas-products" data-custom-scroll data-cro-cta="preorders_view_products" data-cro-location="hero" data-cro-action="scroll" data-cro-channel="web">Ver preventas disponibles</a>
						<a class="preventas-page__button preventas-page__button--outline" href="{{ preventas_contact_url }}" data-custom-chat-cta data-cro-cta="preorders_contact_deposit" data-cro-location="hero" data-cro-action="contact" data-cro-channel="chat">Consultar se&ntilde;a del {{ preventas_deposit_percent }}%</a>
					</div>

					<div class="preventas-page__proof-row" aria-label="Condiciones principales de preventa">
						<span>Se&ntilde;a fija del {{ preventas_deposit_percent }}%</span>
						<span>Mes estimado</span>
						<span>Saldo antes del despacho</span>
					</div>
				</div>

				<aside class="preventas-page__hero-panel" aria-label="Resumen de preventa">
					<div class="preventas-page__hero-image-frame">
						<img class="preventas-page__hero-image" src="{{ preventas_hero_image }}" alt="{% if preventas_hero_product %}{{ preventas_hero_product.name }} en preventa{% else %}Productos de Trimetra 3D{% endif %}" width="720" height="560" fetchpriority="high">
					</div>
					<div class="preventas-page__reserve-ticket">
						<span>Reserva m&iacute;nima</span>
						<strong>{{ preventas_deposit_percent }}%</strong>
						<p>Por efectivo o transferencia. La reserva se confirma cuando acreditamos el pago.</p>
					</div>
				</aside>
			</div>
		</div>
	</section>

	<section class="preventas-page__section preventas-page__definition" aria-labelledby="preventas-definition">
		<div class="container preventas-page__container">
			<div class="preventas-page__split">
				<div class="preventas-page__section-heading">
					<p class="preventas-page__eyebrow">Qu&eacute; significa</p>
					<h2 id="preventas-definition">No es entrega inmediata: es una reserva anticipada</h2>
					<p>Cuando compr&aacute;s una preventa est&aacute;s reservando una unidad que todav&iacute;a est&aacute; en camino o en planificaci&oacute;n de importaci&oacute;n. Por eso la fecha exacta puede moverse.</p>
				</div>

				<div class="preventas-page__fact-grid" aria-label="Puntos clave sobre preventas">
					<article class="preventas-page__fact">
						<span class="preventas-page__icon" aria-hidden="true">{% include "snipplets/svg/calendar.tpl" with {svg_custom_class: "preventas-page__icon-svg"} %}</span>
						<h3>Mes estimado</h3>
						<p>Una preventa para &ldquo;mes X&rdquo; suele entregarse hacia fin de ese mes. No tiene d&iacute;a exacto garantizado.</p>
					</article>
					<article class="preventas-page__fact">
						<span class="preventas-page__icon" aria-hidden="true">{% include "snipplets/svg/credit-card.tpl" with {svg_custom_class: "preventas-page__icon-svg"} %}</span>
						<h3>Dos formas de reservar</h3>
						<p>Pod&eacute;s abonar el 100% online o coordinar una se&ntilde;a fija del {{ preventas_deposit_percent }}% por efectivo o transferencia.</p>
					</article>
					<article class="preventas-page__fact preventas-page__fact--accent">
						<span class="preventas-page__icon" aria-hidden="true">{% include "snipplets/svg/security.tpl" with {svg_custom_class: "preventas-page__icon-svg"} %}</span>
						<h3>Reserva real</h3>
						<p>La unidad queda reservada solo cuando el pago completo o la se&ntilde;a est&aacute;n confirmados.</p>
					</article>
				</div>
			</div>
		</div>
	</section>

	<section class="preventas-page__section preventas-page__reasons" aria-labelledby="preventas-reasons">
		<div class="container preventas-page__container">
			<div class="preventas-page__section-heading">
				<p class="preventas-page__eyebrow">Por qu&eacute; existen</p>
				<h2 id="preventas-reasons">Una forma clara de reservar antes de la llegada</h2>
				<p>Usamos preventas para ordenar importaciones y asignar unidades antes de que est&eacute;n disponibles con stock local.</p>
			</div>

			<div class="preventas-page__reason-board">
				<article class="preventas-page__reason">
					<h3>Productos que todav&iacute;a no llegaron al pa&iacute;s</h3>
					<p>Cuando un equipo todav&iacute;a no tiene stock local, la preventa permite reservar una unidad dentro del pr&oacute;ximo ingreso.</p>
				</article>
				<article class="preventas-page__reason">
					<h3>Productos con mucha demanda</h3>
					<p>Si un producto se agota r&aacute;pido, la preventa nos ayuda a planificar mejor la importaci&oacute;n y comunicar el mes estimado.</p>
				</article>
			</div>
		</div>
	</section>

	<div class="preventas-page__anchor" id="preventas-products"></div>

	<section class="preventas-page__section preventas-page__products" aria-labelledby="preventas-products-title">
		<div class="container preventas-page__container">
			<div class="preventas-page__products-header">
				<div>
					<p class="preventas-page__eyebrow">Disponibles ahora</p>
					<h2 id="preventas-products-title">Productos en preventa</h2>
					<p>El precio total se mantiene actualizado desde cada producto. Para reservar con la se&ntilde;a fija del {{ preventas_deposit_percent }}%, escribinos antes de finalizar la compra.</p>
				</div>
				<a class="preventas-page__text-link" href="{{ preventas_contact_url }}" data-custom-chat-cta data-cro-cta="preorders_contact_products" data-cro-location="products_header" data-cro-action="contact" data-cro-channel="chat">Coordinar se&ntilde;a</a>
			</div>

			{% if preventas_has_products %}
				<div class="preventas-page__product-grid" aria-label="Productos disponibles en preventa">
					{% for product in preventas_products %}
						{% set preventa_product_image = product.featured_image ? product.featured_image | product_image_url('large') : 'images/about/about-products_small.jpg' | static_url %}
						<article class="preventas-page__product-card">
							<a class="preventas-page__product-media" href="{{ product.url }}" aria-label="Ver {{ product.name }}" data-cro-cta="preorder_product_image" data-cro-location="product_card" data-cro-action="view_product" data-cro-channel="web">
								<img src="{{ preventa_product_image }}" alt="{{ product.name }}" width="640" height="640" loading="lazy">
								<span class="preventas-page__product-badge">Preventa</span>
							</a>
							<div class="preventas-page__product-body">
								<h3><a href="{{ product.url }}" data-cro-cta="preorder_product_name" data-cro-location="product_card" data-cro-action="view_product" data-cro-channel="web">{{ product.name }}</a></h3>
								{% if product.display_price %}
									<p class="preventas-page__product-price">{{ product.price | money }} <small>precio total</small></p>
								{% else %}
									<p class="preventas-page__product-price"><small>Consult&aacute; el precio total</small></p>
								{% endif %}
								<p class="preventas-page__product-note">Revis&aacute; en el nombre y el detalle del producto el mes estimado de llegada.</p>
								<div class="preventas-page__product-actions">
									<a class="preventas-page__product-button" href="{{ product.url }}" data-cro-cta="preorder_product_view" data-cro-location="product_card" data-cro-action="view_product" data-cro-channel="web">Ver producto</a>
									<a class="preventas-page__product-button preventas-page__product-button--secondary" href="{{ preventas_contact_url }}" data-custom-chat-cta data-custom-chat-context="{{ product.name }}" data-cro-cta="preorder_product_deposit" data-cro-location="product_card" data-cro-action="contact" data-cro-channel="chat">Consultar se&ntilde;a</a>
								</div>
							</div>
						</article>
					{% endfor %}
				</div>
			{% else %}
				<div class="preventas-page__empty-products">
					<div>
						<h3>Estamos preparando nuevas preventas</h3>
						<p>Mientras cargamos los productos, pod&eacute;s consultarnos qu&eacute; modelos est&aacute;n por entrar o recorrer el cat&aacute;logo completo.</p>
					</div>
					<div class="preventas-page__empty-actions">
						<a class="preventas-page__button" href="{{ preventas_contact_url }}" data-custom-chat-cta data-cro-cta="preorders_contact_empty" data-cro-location="empty_state" data-cro-action="contact" data-cro-channel="chat">Consultar pr&oacute;ximas preventas</a>
						<a class="preventas-page__button preventas-page__button--outline-dark" href="{{ preventas_products_url }}" data-custom-return-link data-custom-return-label="Volver al producto" data-cro-cta="preorders_catalog_empty" data-cro-location="empty_state" data-cro-action="browse" data-cro-channel="web">Ver cat&aacute;logo</a>
					</div>
				</div>
			{% endif %}
		</div>
	</section>

	<section class="preventas-page__section preventas-page__timeline" aria-labelledby="preventas-steps">
		<div class="container preventas-page__container">
			<div class="preventas-page__section-heading">
				<p class="preventas-page__eyebrow">C&oacute;mo funciona</p>
				<h2 id="preventas-steps">De la reserva a la entrega</h2>
			</div>

			<ol class="preventas-page__steps" aria-label="Pasos de una preventa">
				<li>
					<strong>1</strong>
					<h3>Eleg&iacute;s el producto</h3>
					<p>Revis&aacute; el producto, el mes estimado de llegada y las condiciones visibles en la tienda.</p>
				</li>
				<li>
					<strong>2</strong>
					<h3>Confirm&aacute;s la reserva</h3>
					<p>Pag&aacute;s el 100% online o coordin&aacute;s la se&ntilde;a del {{ preventas_deposit_percent }}% por efectivo o transferencia.</p>
				</li>
				<li>
					<strong>3</strong>
					<h3>Seguimos la llegada</h3>
					<p>Te informamos si la log&iacute;stica modifica el mes estimado de la preventa.</p>
				</li>
				<li>
					<strong>4</strong>
					<h3>Complet&aacute;s el saldo</h3>
					<p>Antes del despacho coordinamos el pago pendiente y la opci&oacute;n de env&iacute;o o retiro.</p>
				</li>
			</ol>
		</div>
	</section>

	<section class="preventas-page__transparency" aria-labelledby="preventas-transparency">
		<div class="container preventas-page__container">
			<div class="preventas-page__transparency-layout">
				<div>
					<p class="preventas-page__eyebrow preventas-page__eyebrow--light">Transparencia</p>
					<h2 id="preventas-transparency">La fecha es estimada y los cambios se comunican</h2>
					<p>Una preventa depende de log&iacute;stica internacional y procesos locales. El transporte, la aduana y la &uacute;ltima milla pueden modificar los tiempos informados.</p>
				</div>
				<ul class="preventas-page__check-list">
					<li>El mes publicado es una estimaci&oacute;n, no un d&iacute;a garantizado.</li>
					<li>Si cambia la estimaci&oacute;n, te contactamos con la informaci&oacute;n disponible.</li>
					<li>Si Trimetra cancela o no puede cumplir la preventa, reintegra lo abonado.</li>
				</ul>
			</div>
		</div>
	</section>

	{% include 'snipplets/reviews/reviews-settings.tpl' with {
		reviews_id: 'preventas-reviews',
		reviews_layout: 'mixed'
	} %}

	<section class="preventas-page__section preventas-page__contact" aria-labelledby="preventas-contact">
		<div class="container preventas-page__container">
			<div class="preventas-page__contact-layout">
				<div>
					<p class="preventas-page__eyebrow">Contactanos</p>
					<h2 id="preventas-contact">Si ten&eacute;s dudas, habl&aacute; con nosotros antes de reservar</h2>
					<p>Te ayudamos a confirmar si una preventa tiene sentido para tu caso, qu&eacute; incluye, c&oacute;mo reservar con se&ntilde;a y qu&eacute; esperar de los tiempos.</p>
				</div>
				<div class="preventas-page__contact-actions">
					<a class="preventas-page__button" href="{{ preventas_contact_url }}" data-custom-chat-cta data-cro-cta="preorders_contact_final" data-cro-location="contact_section" data-cro-action="contact" data-cro-channel="chat">Abrir chat de la web</a>
					<a class="preventas-page__button preventas-page__button--outline-dark" href="{{ preventas_whatsapp_url }}" target="_blank" rel="noopener" data-cro-cta="preorders_whatsapp_final" data-cro-location="contact_section" data-cro-action="contact" data-cro-channel="whatsapp">Escribir por WhatsApp</a>
				</div>
			</div>
		</div>
	</section>

	<section class="preventas-page__section preventas-page__faq" aria-labelledby="preventas-faq">
		<div class="container preventas-page__container">
			<div class="preventas-page__faq-layout">
				<div class="preventas-page__section-heading">
					<p class="preventas-page__eyebrow">Preguntas frecuentes</p>
					<h2 id="preventas-faq">Antes de comprar una preventa</h2>
				</div>

				<div class="preventas-page__faq-list">
					<details class="preventas-page__faq-item" data-cro-content-group="delivery_date">
						<summary>&iquest;Una preventa tiene fecha exacta de entrega?</summary>
						<p>No. Informamos un mes estimado que puede cambiar por log&iacute;stica internacional, aduana o &uacute;ltima milla.</p>
					</details>
					<details class="preventas-page__faq-item" data-cro-content-group="deposit">
						<summary>&iquest;Puedo reservar pagando solo una parte?</summary>
						<p>S&iacute;. Pod&eacute;s coordinar una se&ntilde;a fija del {{ preventas_deposit_percent }}% en efectivo o transferencia. La unidad queda reservada cuando acreditamos el pago.</p>
					</details>
					<details class="preventas-page__faq-item" data-cro-content-group="delays">
						<summary>&iquest;Qu&eacute; pasa si la importaci&oacute;n se demora?</summary>
						<p>Te contactamos para informar la nueva estimaci&oacute;n. Si Trimetra cancela o no puede cumplir la preventa, reintegra lo abonado.</p>
					</details>
					<details class="preventas-page__faq-item" data-cro-content-group="full_payment">
						<summary>&iquest;Puedo pagar el 100% desde la tienda?</summary>
						<p>S&iacute;. Si el producto est&aacute; publicado y disponible para compra online, pod&eacute;s pagarlo completo desde el checkout.</p>
					</details>
					<details class="preventas-page__faq-item" data-cro-content-group="cancellation">
						<summary>&iquest;Qu&eacute; pasa si quiero cancelar?</summary>
						<p>La solicitud se eval&uacute;a seg&uacute;n la pol&iacute;tica vigente de garant&iacute;as y devoluciones. <a href="/garantias-y-devoluciones/" data-cro-cta="preorders_returns_policy" data-cro-location="faq" data-cro-action="read_policy" data-cro-channel="web">Consult&aacute; la pol&iacute;tica completa</a>.</p>
					</details>
				</div>
			</div>
		</div>
	</section>
</main>
