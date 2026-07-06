{% set shipping_admin_content = page.content | trim %}
{% set shipping_contact_url = 'https://trimetra3d.mitiendanube.com/contacto-y-horarios/' %}
{% set shipping_payment_has_active_promo = include("snipplets/payment-installments-config.tpl", { mode: "has_active_promo" }) | trim %}
{% set shipping_payment_installments = include("snipplets/payment-installments-config.tpl", { mode: "promo_installments" }) | trim %}
{% set shipping_payment_promo_end = include("snipplets/payment-installments-config.tpl", { mode: "promo_end_display" }) | trim %}

<main class="shipping-page" data-store="shipping-page">
	<section class="shipping-page__intro">
		<div class="container shipping-page__container">
			<div class="shipping-page__intro-layout">
				<div class="shipping-page__intro-copy">
					<p class="shipping-page__eyebrow">Información de Envíos</p>
					<h1 class="shipping-page__title">Envíos rápidos, claros y sin vueltas</h1>
					<p class="shipping-page__lead">Enviamos a todo el país. En CABA y GBA contamos con entregas rápidas mediante courier propio, y para las zonas no cubiertas por courier propio trabajamos con Correo Argentino y Andreani a domicilio, sucursal o punto de retiro según disponibilidad.</p>
				</div>
				<div class="shipping-page__intro-summary" aria-label="Resumen de envíos">
					<div class="shipping-page__summary-row">
						<span>CABA / GBA</span>
						<strong>En el día</strong>
					</div>
					<div class="shipping-page__summary-row">
						<span>Resto del país</span>
						<strong>Correo Argentino / Andreani</strong>
					</div>
					<div class="shipping-page__summary-row">
						<span>Retiro</span>
						<strong>Ciudadela</strong>
					</div>
				</div>
			</div>
		</div>
	</section>

	{% if shipping_payment_has_active_promo == "true" %}
	<section class="shipping-page__hot-sale">
		<div class="container shipping-page__container">
			<div class="shipping-page__hot-sale-notice" role="status" aria-label="Aviso de promo vigente para impresoras 3D">
				<div class="shipping-page__hot-sale-marker" aria-hidden="true">!</div>
				<div class="shipping-page__hot-sale-copy">
					<h2>Promo vigente: {{ shipping_payment_installments }} cuotas sin inter&eacute;s + env&iacute;o gratis en impresoras 3D</h2>
					<p>Hasta el {{ shipping_payment_promo_end }} las impresoras 3D seleccionadas suman env&iacute;o gratis durante la campa&ntilde;a. Si necesit&aacute;s confirmar alcance, zona o plazo antes de comprar, escribinos y te ayudamos.</p>
				</div>
			</div>
		</div>
	</section>
	{% endif %}

	<section class="shipping-page__section">
		<div class="container shipping-page__container">
			<div class="shipping-page__quick-grid" aria-label="Resumen rápido de envíos">
				<article class="shipping-page__card">
					<p class="shipping-page__card-kicker">CABA / GBA</p>
					<h2 class="shipping-page__card-title">En el día</h2>
					<p>Para pedidos confirmados antes de las <strong>12:00 hs</strong>.</p>
				</article>
				<article class="shipping-page__card">
					<p class="shipping-page__card-kicker">Resto del país</p>
					<h2 class="shipping-page__card-title">Despacho ágil</h2>
					<p>Despachamos en hasta <strong>24 hs hábiles</strong> y luego podés elegir <strong>Correo Argentino</strong> o <strong>Andreani</strong> en el checkout.</p>
				</article>
				<article class="shipping-page__card">
					<p class="shipping-page__card-kicker">Retiro</p>
					<h2 class="shipping-page__card-title">Sin costo</h2>
					<p>Podés retirar por <strong>Ciudadela</strong> con coordinación previa.</p>
				</article>
				<article class="shipping-page__card">
					<p class="shipping-page__card-kicker">Checkout</p>
					<h2 class="shipping-page__card-title">Costo automático</h2>
					<p>En muchas zonas el costo se calcula automáticamente según <strong>CP, peso y bulto</strong>, y podés elegir empresa y modalidad.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="shipping-page__coverage">
		<div class="container shipping-page__container">
			<div class="shipping-page__section-heading">
				<p class="shipping-page__eyebrow">Visual rápido de cobertura</p>
				<h2>Zonas y tiempos de referencia</h2>
			</div>
			<div class="shipping-page__coverage-layout">
				<div class="shipping-page__coverage-visual">
					<img class="shipping-page__map-image" src="{{ 'images/shipping-zones-map.png' | static_url }}" alt="Zonas de cobertura de envíos para CABA y GBA">
				</div>
				<div class="shipping-page__coverage-list" aria-label="Cobertura para otras zonas">
					<article class="shipping-page__mini-card">
						<h3>Resto de Buenos Aires</h3>
						<p>Entrega estimada de <strong>1 a 3 días hábiles</strong> luego del despacho.</p>
					</article>
					<article class="shipping-page__mini-card">
						<h3>Resto de Argentina</h3>
						<p>Entrega estimada de <strong>1 a 5 días hábiles</strong> luego del despacho.</p>
					</article>
					<article class="shipping-page__mini-card">
						<h3>Tierra del Fuego</h3>
						<p>Cobertura disponible con tiempos y costos según Correo Argentino o Andreani.</p>
					</article>
				</div>
			</div>
		</div>
	</section>

	<section class="shipping-page__section">
		<div class="container shipping-page__container">
			<div class="shipping-page__section-heading">
				<h2>Cómo podés recibir tu compra</h2>
			</div>
			<div class="shipping-page__method-grid">
				<article class="shipping-page__card shipping-page__card--method">
					<h3>Courier propio</h3>
					<p>Disponible para CABA y zonas de GBA seleccionadas. Si tu pedido se confirma antes de las <strong>12:00 hs</strong>, puede salir <strong>en el día</strong>.</p>
					<p class="shipping-page__note">Ideal para entregas rápidas.</p>
				</article>
				<article class="shipping-page__card shipping-page__card--method">
					<h3>Correo a domicilio o sucursal</h3>
					<p>Para las zonas no cubiertas por el courier propio trabajamos con <strong>Correo Argentino</strong> y <strong>Andreani</strong>. Podés elegir la empresa y la modalidad disponible que prefieras en el checkout.</p>
					<p class="shipping-page__note">Depende de CP, peso, dimensiones y empresa elegida.</p>
				</article>
				<article class="shipping-page__card shipping-page__card--method">
					<h3>Retiro coordinado</h3>
					<p>También podés retirar sin costo por nuestro depósito en <strong>Ciudadela</strong>. Solo te pedimos que hagas el pedido y nos escribas para coordinar.</p>
					<p class="shipping-page__note">Retiro con coordinación previa.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="shipping-page__section">
		<div class="container shipping-page__container">
			<div class="shipping-page__section-heading">
				<h2>Costos y tiempos estimados</h2>
			</div>
			<div class="shipping-page__rates-grid" aria-label="Costos y tiempos estimados de envío">
				<article class="shipping-page__rate-card">
					<h3>CABA</h3>
					<p>Entrega en el día antes de las 12:00 hs.</p>
					<strong>$3.900</strong>
					<span>Hasta 30 kg</span>
					<em>Envío gratis desde $100.000</em>
				</article>
				<article class="shipping-page__rate-card">
					<h3>GBA · 1er cordón</h3>
					<p>Entrega en el día antes de las 12:00 hs.</p>
					<strong>$5.600</strong>
					<span>Hasta 30 kg</span>
					<em>Envío gratis desde $100.000</em>
				</article>
				<article class="shipping-page__rate-card">
					<h3>GBA · 2do cordón</h3>
					<p>Entrega en el día antes de las 12:00 hs.</p>
					<strong>$7.600</strong>
					<span>Hasta 30 kg</span>
					<em>Envío gratis desde $100.000</em>
				</article>
				<article class="shipping-page__rate-card">
					<h3>GBA · 3er cordón</h3>
					<p>Entrega en el día antes de las 12:00 hs.</p>
					<strong>$9.600</strong>
					<span>Hasta 30 kg</span>
					<em>Envío gratis desde $100.000</em>
				</article>
				<article class="shipping-page__rate-card">
					<h3>Resto de Buenos Aires</h3>
					<p>Entrega estimada de <strong>1 a 3 días hábiles</strong> luego del despacho.</p>
					<strong>Costo variable</strong>
					<span>Según peso, volumen y destino</span>
					<em>Envío gratis desde $200.000</em>
				</article>
				<article class="shipping-page__rate-card">
					<h3>Resto de Argentina</h3>
					<p>Entrega estimada de <strong>1 a 5 días hábiles</strong> luego del despacho.</p>
					<strong>Costo variable</strong>
					<span>Según peso, volumen y destino</span>
					<em>Envío gratis desde $300.000</em>
				</article>
				<article class="shipping-page__rate-card">
					<h3>Tierra del Fuego</h3>
					<p>Entrega estimada de <strong>1 a 5 días hábiles</strong> luego del despacho.</p>
					<strong>Costo variable</strong>
					<span>Según peso, volumen y destino</span>
					<em>Envío gratis desde $500.000</em>
				</article>
			</div>
		</div>
	</section>

	<section class="shipping-page__notice">
		<div class="container shipping-page__container">
			<div class="shipping-page__section-heading">
				<h2>Importante antes de comprar</h2>
			</div>
			<div class="shipping-page__notice-grid">
				<article>
					<h3>Pedidos después del corte</h3>
					<p>Los pedidos que ingresan después del horario de corte salen al <strong>día siguiente</strong>. Si es sábado, pasan al <strong>próximo día hábil</strong>.</p>
				</article>
				<article>
					<h3>Intentos de entrega</h3>
					<p>La empresa seleccionada realiza hasta <strong>2 intentos</strong> de entrega. Después, puede derivarlo a sucursal o requerir reprogramación.</p>
				</article>
				<article>
					<h3>Cobertura</h3>
					<p>Realizamos envíos <strong>dentro de Argentina</strong>. No hacemos envíos internacionales por el momento.</p>
				</article>
				<article>
					<h3>Horarios exactos</h3>
					<p>No siempre se puede garantizar una franja horaria exacta. Eso depende de la empresa seleccionada y la ruta del día.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="shipping-page__section">
		<div class="container shipping-page__container">
			<div class="shipping-page__section-heading">
				<h2>¿Qué pasa si hay un problema con el envío?</h2>
			</div>
			<div class="shipping-page__problem-grid">
				<article class="shipping-page__card">
					<h3>Si llega dañado</h3>
					<p>Necesitamos que nos escribas dentro de las <strong>48 horas</strong> de recibido y nos envíes <strong>fotos del embalaje y del producto</strong> para evaluar reposición o reembolso.</p>
				</article>
				<article class="shipping-page__card">
					<h3>Si hay extravío o demora anormal</h3>
					<p>Nosotros gestionamos el reclamo con la empresa de transporte. Si corresponde, avanzamos con <strong>reposición o reembolso</strong>.</p>
				</article>
				<article class="shipping-page__card">
					<h3>Si querés cambiar la dirección</h3>
					<p>Es posible <strong>si el pedido todavía no fue despachado</strong>. Escribinos cuanto antes para revisarlo.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="shipping-page__cta">
		<div class="container shipping-page__container">
			<div class="shipping-page__cta-layout">
				<div>
					<h2>¿Tenés dudas con tu zona o tu código postal?</h2>
					<p>Si no estás seguro de qué costo o plazo aplica para tu pedido, escribinos y te ayudamos a validarlo. En envíos fuera de CABA/GBA, el valor final puede variar según <strong>peso, dimensiones, empresa, modalidad elegida y código postal</strong>.</p>
				</div>
				<a class="shipping-page__button" href="{{ shipping_contact_url }}" data-shipping-chat-cta>Consultanos tu envío antes de comprar</a>
			</div>
		</div>
	</section>

	{% if shipping_admin_content %}
		<section class="shipping-page__section shipping-page__admin-section">
			<div class="container shipping-page__container">
				<div class="shipping-page__admin-content user-content">
					{{ page.content }}
				</div>
			</div>
		</section>
	{% endif %}
</main>
