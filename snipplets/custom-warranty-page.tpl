{% set warranty_contact_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "contact_url" }) | trim %}
{% set warranty_whatsapp_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "whatsapp_primary_url" }) | trim %}
{% set warranty_products_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "products_url" }) | trim %}
{% set warranty_regret_url = status_page_url_regret ? status_page_url_regret : warranty_contact_url ~ '?order_cancellation_without_id=true' %}
{% set warranty_12_months = include("snipplets/custom-pages/business-facts.tpl", { mode: "warranty_12_months" }) | trim %}
{% set warranty_6_months = include("snipplets/custom-pages/business-facts.tpl", { mode: "warranty_6_months" }) | trim %}
{% set warranty_3_months = include("snipplets/custom-pages/business-facts.tpl", { mode: "warranty_3_months" }) | trim %}
{% set warranty_12_components = include("snipplets/custom-pages/business-facts.tpl", { mode: "warranty_12_components" }) | trim | split('|') %}
{% set warranty_6_components = include("snipplets/custom-pages/business-facts.tpl", { mode: "warranty_6_components" }) | trim | split('|') %}
{% set warranty_3_components = include("snipplets/custom-pages/business-facts.tpl", { mode: "warranty_3_components" }) | trim | split('|') %}

<main class="warranty-page" data-store="warranty-page" data-cro-page="warranty" data-cro-content-group="legal_support">
	<section class="warranty-page__hero">
		<div class="container warranty-page__container">
			<div class="warranty-page__hero-layout">
				<div class="warranty-page__hero-copy">
					<p class="warranty-page__eyebrow">Garant&iacute;as y devoluciones</p>
					<h1 class="warranty-page__title">Tres caminos para resolver tu gesti&oacute;n</h1>
					<p class="warranty-page__lead">Garant&iacute;as y devoluciones gestionadas por Trimetra 3D. Eleg&iacute; si quer&eacute;s ejercer el arrepentimiento, informar una falla o pedir una reparaci&oacute;n fuera de garant&iacute;a.</p>
				</div>
				<aside class="warranty-page__hero-panel" aria-label="Resumen de derechos y gestiones">
					<div class="warranty-page__panel-row"><span>Arrepentimiento</span><strong>10 d&iacute;as corridos</strong></div>
					<div class="warranty-page__panel-row"><span>Impresoras 3D</span><strong>{{ warranty_12_months }}, {{ warranty_6_months }} o {{ warranty_3_months }} meses seg&uacute;n componente</strong></div>
					<div class="warranty-page__panel-row"><span>Producto nuevo</span><strong>M&iacute;nimo legal de 6 meses</strong></div>
					<div class="warranty-page__panel-row"><span>Fuera de garant&iacute;a</span><strong>Presupuesto antes de reparar</strong></div>
					<div class="warranty-page__hero-actions">
						<a class="warranty-page__button" href="{{ warranty_contact_url }}" data-custom-chat-cta data-cro-cta="open_support_chat" data-cro-location="hero" data-cro-action="contact" data-cro-channel="chat">Iniciar una consulta</a>
						<a class="warranty-page__button warranty-page__button--outline" href="{{ warranty_regret_url }}" data-cro-cta="start_regret" data-cro-location="hero" data-cro-action="contact" data-cro-channel="web">Ejercer arrepentimiento</a>
					</div>
				</aside>
			</div>
		</div>
	</section>

	<section class="warranty-page__section">
		<div class="container warranty-page__container">
			<div class="warranty-page__section-heading">
				<p class="warranty-page__eyebrow">Eleg&iacute; tu caso</p>
				<h2>Qu&eacute; gesti&oacute;n necesit&aacute;s</h2>
			</div>
			<div class="warranty-page__path-grid">
				<article class="warranty-page__policy-card">
					<p class="warranty-page__eyebrow">1. Arrepentimiento</p>
					<h2>Cancelar una compra a distancia</h2>
					<p>Pod&eacute;s solicitarlo dentro de los <strong>10 d&iacute;as corridos</strong> desde la entrega. La devoluci&oacute;n por este derecho no tiene costo para vos.</p>
					<a class="warranty-page__text-link" href="{{ warranty_regret_url }}" data-cro-cta="start_regret" data-cro-location="paths" data-cro-action="contact" data-cro-channel="web">Abrir el formulario nativo</a>
				</article>
				<article class="warranty-page__policy-card warranty-page__policy-card--accent">
					<p class="warranty-page__eyebrow">2. Falla o defecto</p>
					<h2>Solicitar garant&iacute;a</h2>
					<p>En impresoras 3D, la cobertura comercial es de <strong>{{ warranty_12_months }}, {{ warranty_6_months }} o {{ warranty_3_months }} meses seg&uacute;n el componente afectado</strong>. Los {{ warranty_12_months }} meses corresponden s&oacute;lo a las piezas indicadas abajo, no al equipo completo.</p>
					<a class="warranty-page__text-link" href="{{ warranty_contact_url }}" data-custom-chat-cta data-cro-cta="open_warranty_claim" data-cro-location="paths" data-cro-action="contact" data-cro-channel="chat">Informar una falla</a>
				</article>
				<article class="warranty-page__policy-card">
					<p class="warranty-page__eyebrow">3. Servicio t&eacute;cnico</p>
					<h2>Reparaci&oacute;n fuera de garant&iacute;a</h2>
					<p>Primero diagnosticamos el equipo. Si el trabajo tiene costo, enviamos un presupuesto por escrito y <strong>esperamos tu autorizaci&oacute;n expresa</strong> antes de reparar.</p>
					<a class="warranty-page__text-link" href="{{ warranty_contact_url }}" data-custom-chat-cta data-cro-cta="request_repair" data-cro-location="paths" data-cro-action="contact" data-cro-channel="chat">Consultar servicio t&eacute;cnico</a>
				</article>
			</div>
		</div>
	</section>

	<section class="warranty-page__coverage" aria-labelledby="warranty-coverage-title">
		<div class="container warranty-page__container">
			<div class="warranty-page__section-heading">
				<p class="warranty-page__eyebrow">Impresoras 3D</p>
				<h2 id="warranty-coverage-title">Cobertura comercial por componente</h2>
				<p>El plazo se determina por la pieza afectada despu&eacute;s del diagn&oacute;stico. Los {{ warranty_12_months }} meses corresponden exclusivamente a los componentes principales nombrados en la primera fila.</p>
			</div>

			<dl class="warranty-page__coverage-list">
				<div class="warranty-page__coverage-row">
					<dt><strong>{{ warranty_12_months }} meses</strong><span>Componentes principales</span></dt>
					<dd>
						<ul class="warranty-page__component-list">
							{% for component in warranty_12_components %}<li>{{ component }}</li>{% endfor %}
						</ul>
					</dd>
				</div>
				<div class="warranty-page__coverage-row">
					<dt><strong>{{ warranty_6_months }} meses</strong><span>Electr&oacute;nica espec&iacute;fica</span></dt>
					<dd>
						<ul class="warranty-page__component-list">
							{% for component in warranty_6_components %}<li>{{ component }}</li>{% endfor %}
						</ul>
						<p>En drivers extra&iacute;bles, la cobertura es de {{ warranty_6_months }} meses desde la compra y de {{ warranty_3_months }} meses despu&eacute;s del primer cambio.</p>
					</dd>
				</div>
				<div class="warranty-page__coverage-row">
					<dt><strong>{{ warranty_3_months }} meses</strong><span>Partes de desgaste</span></dt>
					<dd>
						<ul class="warranty-page__component-list">
							{% for component in warranty_3_components %}<li>{{ component }}</li>{% endfor %}
						</ul>
					</dd>
				</div>
			</dl>

			<p class="warranty-page__coverage-legal"><strong>Importante:</strong> estos plazos describen la cobertura comercial por pieza. No reemplazan ni reducen la garant&iacute;a legal aplicable al producto nuevo.</p>
		</div>
	</section>

	<section class="warranty-page__process">
		<div class="container warranty-page__container">
			<div class="warranty-page__section-heading">
				<p class="warranty-page__eyebrow">Garant&iacute;a y soporte</p>
				<h2>C&oacute;mo gestionamos una falla</h2>
				<p>Buscamos resolver primero a distancia cuando sea seguro y suficiente. Si hace falta una revisi&oacute;n f&iacute;sica, coordinamos el traslado o la recepci&oacute;n.</p>
			</div>
			<ol class="warranty-page__timeline">
				<li><span>1</span><h3>Contanos el problema</h3><p>Compart&iacute; el n&uacute;mero de pedido, una descripci&oacute;n y fotos o video si ayudan a mostrar la falla.</p></li>
				<li><span>2</span><h3>Revisi&oacute;n inicial</h3><p>Verificamos los datos del producto y proponemos pruebas remotas que no pongan en riesgo el equipo.</p></li>
				<li><span>3</span><h3>Diagn&oacute;stico</h3><p>Si no se resuelve a distancia, coordinamos la revisi&oacute;n e informamos los tiempos estimados.</p></li>
				<li><span>4</span><h3>Propuesta de soluci&oacute;n</h3><p>Seg&uacute;n corresponda, gestionamos reparaci&oacute;n, cambio u otra soluci&oacute;n aplicable.</p></li>
				<li><span>5</span><h3>Autorizaci&oacute;n si hay costo</h3><p>Un servicio no cubierto avanza solamente despu&eacute;s de que aceptes por escrito el presupuesto.</p></li>
			</ol>
		</div>
	</section>

	<section class="warranty-page__notice">
		<div class="container warranty-page__container">
			<div class="warranty-page__section-heading">
				<h2>Qu&eacute; informaci&oacute;n agiliza la gesti&oacute;n</h2>
				<p>La falta de una foto o del embalaje original no reemplaza la evaluaci&oacute;n de tus derechos; pedimos evidencia s&oacute;lo cuando resulta &uacute;til para diagnosticar.</p>
			</div>
			<div class="warranty-page__notice-grid">
				<article><h3>N&uacute;mero de pedido</h3><p>Nos permite ubicar el producto y la fecha de compra.</p></article>
				<article><h3>Descripci&oacute;n clara</h3><p>Indic&aacute; qu&eacute; ocurre y desde cu&aacute;ndo.</p></article>
				<article><h3>Fotos o video</h3><p>Adjuntalos si ayudan a mostrar la falla o un da&ntilde;o de transporte.</p></article>
				<article><h3>Datos de contacto</h3><p>Confirm&aacute; por qu&eacute; canal quer&eacute;s recibir las novedades.</p></article>
			</div>
		</div>
	</section>

	<section class="warranty-page__repairs">
		<div class="container warranty-page__container">
			<div class="warranty-page__repairs-layout">
				<div>
					<p class="warranty-page__eyebrow">Servicio fuera de garant&iacute;a</p>
					<h2>Sin cargos autom&aacute;ticos</h2>
					<p>El diagn&oacute;stico indicar&aacute; alcance, repuestos, mano de obra, costo y plazo estimado. No realizaremos una reparaci&oacute;n paga sin tu autorizaci&oacute;n expresa.</p>
				</div>
				<strong>Presupuesto previo</strong>
			</div>
		</div>
	</section>

	<section class="warranty-page__section">
		<div class="container warranty-page__container">
			<div class="warranty-page__section-heading"><h2>Preguntas frecuentes</h2></div>
			<div class="warranty-page__disclosures">
				<details class="warranty-page__disclosure">
					<summary>&iquest;Qui&eacute;n paga la devoluci&oacute;n por arrepentimiento?</summary>
					<div><p>La devoluci&oacute;n vinculada al derecho de arrepentimiento no tiene costo para el consumidor. Inici&aacute; la solicitud con el formulario nativo.</p></div>
				</details>
				<details class="warranty-page__disclosure">
					<summary>&iquest;Tengo que autorizar una reparaci&oacute;n paga?</summary>
					<div><p>S&iacute;. Primero recibir&aacute;s un presupuesto por escrito. El trabajo comenzar&aacute; despu&eacute;s de tu aceptaci&oacute;n expresa.</p></div>
				</details>
				<details class="warranty-page__disclosure">
					<summary>&iquest;Los {{ warranty_12_months }} meses cubren toda la impresora?</summary>
					<div><p>No. Ese plazo corresponde a motherboard, display PCB, fuente de alimentaci&oacute;n, estructura met&aacute;lica y calefactor de cama. Las dem&aacute;s piezas listadas tienen cobertura comercial de {{ warranty_6_months }} o {{ warranty_3_months }} meses.</p></div>
				</details>
				<details class="warranty-page__disclosure">
					<summary>&iquest;Una modificaci&oacute;n elimina toda la garant&iacute;a?</summary>
					<div><p>Cada caso se eval&uacute;a seg&uacute;n la falla y su causa. Una condici&oacute;n comercial no reduce los derechos reconocidos por la normativa aplicable.</p></div>
				</details>
			</div>
		</div>
	</section>

	<section class="warranty-page__cta">
		<div class="container warranty-page__container">
			<div class="warranty-page__cta-layout">
				<div>
					<h2>&iquest;Necesit&aacute;s iniciar una gesti&oacute;n?</h2>
					<p>Us&aacute; el formulario de arrepentimiento para cancelar una compra o contactanos para una falla y servicio t&eacute;cnico.</p>
				</div>
				<div class="warranty-page__cta-actions">
					<a class="warranty-page__button" href="{{ warranty_contact_url }}" data-custom-chat-cta data-cro-cta="open_support_chat" data-cro-location="footer" data-cro-action="contact" data-cro-channel="chat">Abrir chat</a>
					<a class="warranty-page__button warranty-page__button--outline" href="{{ warranty_whatsapp_url }}" target="_blank" rel="noopener noreferrer" data-cro-cta="whatsapp_support" data-cro-location="footer" data-cro-action="contact" data-cro-channel="whatsapp">Escribir por WhatsApp</a>
					<a class="warranty-page__text-link" href="{{ warranty_products_url }}" data-custom-return-link data-custom-return-label="Volver al producto" data-cro-cta="view_catalog" data-cro-location="footer" data-cro-action="navigate" data-cro-channel="web">Volver a productos</a>
				</div>
			</div>
		</div>
	</section>
</main>
