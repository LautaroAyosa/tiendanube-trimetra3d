{% set shipping_contact_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "contact_url" }) | trim %}
{% set shipping_products_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "products_url" }) | trim %}
{% set shipping_address = include("snipplets/custom-pages/business-facts.tpl", { mode: "address" }) | trim %}
{% set shipping_pickup_note = include("snipplets/custom-pages/business-facts.tpl", { mode: "pickup_note" }) | trim %}

<main class="shipping-page" data-store="shipping-page" data-cro-page="shipping" data-cro-content-group="commercial_information">
	<section class="shipping-page__intro">
		<div class="container shipping-page__container">
			<div class="shipping-page__intro-layout">
				<div class="shipping-page__intro-copy">
					<p class="shipping-page__eyebrow">Informaci&oacute;n de env&iacute;os</p>
					<h1 class="shipping-page__title">Eleg&iacute; la entrega seg&uacute;n tu ubicaci&oacute;n</h1>
					<p class="shipping-page__lead">Enviamos dentro de Argentina por courier local y operadores log&iacute;sticos. Ingres&aacute; tu c&oacute;digo postal en el producto, carrito o checkout para ver las opciones, el costo y la estimaci&oacute;n vigentes.</p>
				</div>
				<div class="shipping-page__intro-summary" aria-label="Resumen de env&iacute;os">
					<div class="shipping-page__summary-row"><span>CABA y GBA</span><strong>Courier seg&uacute;n cobertura</strong></div>
					<div class="shipping-page__summary-row"><span>Resto del pa&iacute;s</span><strong>Correo seg&uacute;n checkout</strong></div>
					<div class="shipping-page__summary-row"><span>Retiro</span><strong>{{ shipping_address }}</strong></div>
				</div>
			</div>
		</div>
	</section>

	<section class="shipping-page__section">
		<div class="container shipping-page__container">
			<div class="shipping-page__quick-grid" aria-label="Claves para elegir el env&iacute;o">
				<article class="shipping-page__card">
					<p class="shipping-page__card-kicker">Costo y cobertura</p>
					<h2 class="shipping-page__card-title">Se calculan con tu CP</h2>
					<p>El checkout considera destino, peso, dimensiones y opciones disponibles para ese pedido.</p>
				</article>
				<article class="shipping-page__card">
					<p class="shipping-page__card-kicker">Preparaci&oacute;n</p>
					<h2 class="shipping-page__card-title">Hasta 24 h h&aacute;biles</h2>
					<p>Un pedido confirmado antes del corte puede despacharse el mismo d&iacute;a; de lo contrario, se prepara dentro de las siguientes 24 horas h&aacute;biles.</p>
				</article>
				<article class="shipping-page__card">
					<p class="shipping-page__card-kicker">Seguimiento</p>
					<h2 class="shipping-page__card-title">Despu&eacute;s del despacho</h2>
					<p>La fecha de entrega depende del operador, el destino y las novedades del recorrido.</p>
				</article>
				<article class="shipping-page__card">
					<p class="shipping-page__card-kicker">Retiro</p>
					<h2 class="shipping-page__card-title">Coordinaci&oacute;n previa</h2>
					<p>{{ shipping_pickup_note }} Esper&aacute; la confirmaci&oacute;n antes de acercarte.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="shipping-page__coverage">
		<div class="container shipping-page__container">
			<div class="shipping-page__section-heading">
				<p class="shipping-page__eyebrow">Cobertura</p>
				<h2>C&oacute;mo puede viajar tu pedido</h2>
				<p>Las alternativas concretas se habilitan seg&uacute;n el c&oacute;digo postal y las caracter&iacute;sticas del carrito.</p>
			</div>
			<div class="shipping-page__coverage-layout">
				<div class="shipping-page__coverage-visual">
					<img class="shipping-page__map-image" src="{{ 'images/shipping-zones-map.png' | static_url }}" alt="Mapa orientativo de cobertura de env&iacute;os de Trimetra 3D" width="1040" height="600" loading="lazy">
				</div>
				<div class="shipping-page__coverage-list" aria-label="Modalidades de entrega">
					<article class="shipping-page__mini-card"><h3>Courier local</h3><p>Para CABA y zonas seleccionadas de GBA, cuando el checkout lo habilita.</p></article>
					<article class="shipping-page__mini-card"><h3>Correo a domicilio o punto de retiro</h3><p>Para el resto del pa&iacute;s, seg&uacute;n las alternativas informadas durante la compra.</p></article>
					<article class="shipping-page__mini-card"><h3>Retiro en dep&oacute;sito</h3><p>{{ shipping_address }}. {{ shipping_pickup_note }}</p></article>
				</div>
			</div>
		</div>
	</section>

	<section class="shipping-page__section">
		<div class="container shipping-page__container">
			<div class="shipping-page__section-heading">
				<p class="shipping-page__eyebrow">Preparaci&oacute;n y entrega</p>
				<h2>Qu&eacute; significa el horario de corte</h2>
			</div>
			<div class="shipping-page__method-grid">
				<article class="shipping-page__card shipping-page__card--method">
					<h3>Courier local</h3>
					<p>Los pedidos confirmados dentro del horario operativo y con stock disponible pueden despacharse el mismo d&iacute;a. La entrega depende de la cobertura y de la ruta disponible.</p>
					<p class="shipping-page__note">Confirmar un pedido no garantiza una franja horaria exacta.</p>
				</article>
				<article class="shipping-page__card shipping-page__card--method">
					<h3>Correo al resto del pa&iacute;s</h3>
					<p>Los pedidos confirmados antes del corte operativo pueden despacharse el mismo d&iacute;a. Si no, se preparan dentro de las siguientes 24 horas h&aacute;biles.</p>
					<p class="shipping-page__note">El tiempo de entrega comienza luego del despacho.</p>
				</article>
				<article class="shipping-page__card shipping-page__card--method">
					<h3>Retiro coordinado</h3>
					<p>Retir&aacute; en <strong>{{ shipping_address }}</strong> una vez que te confirmemos que el pedido est&aacute; preparado.</p>
					<p class="shipping-page__note">No funciona como local con atenci&oacute;n abierta.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="shipping-page__notice">
		<div class="container shipping-page__container">
			<div class="shipping-page__section-heading"><h2>Si surge un problema</h2></div>
			<div class="shipping-page__notice-grid">
				<article>
					<h3>Producto o embalaje da&ntilde;ado</h3>
					<p>Escribinos cuanto antes. Avisar dentro de las primeras <strong>48 horas</strong> y enviar fotos del embalaje y del producto agiliza la gesti&oacute;n, pero ese plazo no hace caducar tus derechos.</p>
				</article>
				<article>
					<h3>Demora o extrav&iacute;o</h3>
					<p>Contactanos con el n&uacute;mero de pedido. Revisaremos el seguimiento y gestionaremos el reclamo con el operador.</p>
				</article>
				<article>
					<h3>Cambio de direcci&oacute;n</h3>
					<p>Solicitalo lo antes posible. Si el pedido ya fue despachado, la posibilidad de modificarla depende del operador.</p>
				</article>
				<article>
					<h3>Intentos y reprogramaci&oacute;n</h3>
					<p>Cada operador define sus intentos de entrega, permanencia en sucursal y condiciones de reprogramaci&oacute;n.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="shipping-page__cta">
		<div class="container shipping-page__container">
			<div class="shipping-page__cta-layout">
				<div>
					<h2>&iquest;No aparece una opci&oacute;n para tu c&oacute;digo postal?</h2>
					<p>Consultanos antes de comprar o volv&eacute; al cat&aacute;logo para calcular el env&iacute;o desde un producto.</p>
				</div>
				<div class="shipping-page__cta-actions">
					<a class="shipping-page__button" href="{{ shipping_contact_url }}" data-custom-chat-cta data-cro-cta="open_chat" data-cro-location="footer" data-cro-action="contact" data-cro-channel="chat">Consultar mi env&iacute;o</a>
					<a class="shipping-page__button shipping-page__button--outline" href="{{ shipping_products_url }}" data-custom-return-link data-custom-return-label="Volver al producto" data-cro-cta="view_catalog" data-cro-location="footer" data-cro-action="navigate" data-cro-channel="web">Ver productos</a>
				</div>
			</div>
		</div>
	</section>
</main>
