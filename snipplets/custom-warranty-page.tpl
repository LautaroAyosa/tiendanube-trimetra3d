{% set warranty_admin_content = page.content | trim %}
{% set warranty_contact_url = 'https://trimetra3d.mitiendanube.com/contacto-y-horarios/' %}
{% set warranty_whatsapp_target = store.whatsapp ? store.whatsapp : 'https://wa.me/5491173703391' %}

<main class="warranty-page" data-store="warranty-page">
	<section class="warranty-page__hero">
		<div class="container warranty-page__container">
			<div class="warranty-page__hero-layout">
				<div class="warranty-page__hero-copy">
					<p class="warranty-page__eyebrow">Garant&iacute;as y devoluciones</p>
					<h1 class="warranty-page__title">Garant&iacute;as claras para comprar sin vueltas</h1>
					<p class="warranty-page__lead">Te contamos qu&eacute; cubre cada caso, c&oacute;mo iniciar un reclamo y qu&eacute; datos necesitamos para ayudarte r&aacute;pido. En impresoras buscamos resolver primero a distancia; si hace falta revisar el equipo, lo deriva nuestro t&eacute;cnico.</p>
				</div>

				<aside class="warranty-page__hero-panel" aria-label="Resumen r&aacute;pido de garant&iacute;as">
					<div class="warranty-page__panel-row">
						<span>Devoluci&oacute;n</span>
						<strong>10 d&iacute;as desde la entrega</strong>
					</div>
					<div class="warranty-page__panel-row">
						<span>Filamentos</span>
						<strong>30 d&iacute;as de garant&iacute;a</strong>
					</div>
					<div class="warranty-page__panel-row">
						<span>Impresoras 3D</span>
						<strong>Seg&uacute;n componente</strong>
					</div>
					<div class="warranty-page__hero-actions">
						<a class="warranty-page__button" href="{{ warranty_contact_url }}" data-warranty-webchat-cta>Abrir chat de la web</a>
						<a class="warranty-page__button warranty-page__button--outline" href="{{ warranty_whatsapp_target }}" target="_blank" rel="noopener">Escribir por WhatsApp</a>
					</div>
				</aside>
			</div>
		</div>
	</section>

	<section class="warranty-page__section">
		<div class="container warranty-page__container">
			<div class="warranty-page__quick-grid" aria-label="Resumen de pol&iacute;ticas principales">
				<article class="warranty-page__quick-card">
					<span class="warranty-page__icon" aria-hidden="true">{% include "snipplets/svg/returns.tpl" with {svg_custom_class: "warranty-page__icon-svg"} %}</span>
					<p class="warranty-page__card-kicker">Arrepentimiento</p>
					<h2>10 d&iacute;as</h2>
					<p>Pod&eacute;s solicitar la devoluci&oacute;n desde la entrega si el producto est&aacute; nuevo, sin uso y con packaging y accesorios originales.</p>
				</article>
				<article class="warranty-page__quick-card warranty-page__quick-card--featured">
					<span class="warranty-page__icon" aria-hidden="true">{% include "snipplets/svg/check-circle.tpl" with {svg_custom_class: "warranty-page__icon-svg"} %}</span>
					<p class="warranty-page__card-kicker">Filamentos</p>
					<h2>30 d&iacute;as</h2>
					<p>Si viene fallado, demasiado h&uacute;medo o no se puede usar, lo cambiamos por otro rollo o devolvemos el dinero.</p>
				</article>
				<article class="warranty-page__quick-card">
					<span class="warranty-page__icon" aria-hidden="true">{% include "snipplets/svg/security.tpl" with {svg_custom_class: "warranty-page__icon-svg"} %}</span>
					<p class="warranty-page__card-kicker">Impresoras</p>
					<h2>Por pieza</h2>
					<p>La cobertura depende del componente. Algunas piezas tienen 12 meses, otras 6 o 3 meses, y algunas no tienen garant&iacute;a.</p>
				</article>
				<article class="warranty-page__quick-card">
					<span class="warranty-page__icon" aria-hidden="true">{% include "snipplets/svg/chat.tpl" with {svg_custom_class: "warranty-page__icon-svg"} %}</span>
					<p class="warranty-page__card-kicker">RMA</p>
					<h2>Escribinos</h2>
					<p>Inici&aacute; el reclamo por el chat de la web o WhatsApp con n&uacute;mero de pedido, descripci&oacute;n y fotos o video.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="warranty-page__policy">
		<div class="container warranty-page__container">
			<div class="warranty-page__policy-grid">
				<article class="warranty-page__policy-card">
					<p class="warranty-page__eyebrow">Devoluciones</p>
					<h2>Arrepentimiento o cambio</h2>
					<p>El plazo es de <strong>10 d&iacute;as desde la entrega</strong>. El producto debe estar nuevo, sin uso, con packaging y accesorios originales.</p>
					<p>Si la devoluci&oacute;n es por arrepentimiento, el costo de log&iacute;stica queda a cargo del cliente.</p>
				</article>
				<article class="warranty-page__policy-card warranty-page__policy-card--accent">
					<p class="warranty-page__eyebrow">Garant&iacute;a</p>
					<h2>Defecto o error nuestro</h2>
					<p>Si el problema corresponde a defecto de producto o error nuestro, cubrimos la gesti&oacute;n que corresponda y avanzamos con reparaci&oacute;n, cambio o reembolso.</p>
					<p>En todos los casos te damos un estimado despu&eacute;s de la evaluaci&oacute;n inicial.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="warranty-page__filament">
		<div class="container warranty-page__container">
			<div class="warranty-page__filament-layout">
				<div class="warranty-page__section-heading">
					<p class="warranty-page__eyebrow">Filamentos</p>
					<h2>30 d&iacute;as de garant&iacute;a en rollos</h2>
					<p>Queremos que puedas imprimir sin pelearte con el material. Si el filamento no se puede usar, lo revisamos y lo resolvemos.</p>
				</div>
				<div class="warranty-page__filament-checks" aria-label="Casos cubiertos en filamentos">
					<div>
						<strong>Lo cubrimos si:</strong>
						<ul>
							<li>vino fallado</li>
							<li>est&aacute; demasiado h&uacute;medo al punto de no poder usarse</li>
							<li>no tiene las dimensiones esperadas</li>
							<li>tiene un problema que impide usarlo</li>
						</ul>
					</div>
					<div>
						<strong>C&oacute;mo lo resolvemos:</strong>
						<ul>
							<li>te enviamos un filamento nuevo gratis</li>
							<li>nos devolv&eacute;s el rollo fallado</li>
							<li>si la log&iacute;stica es demasiado costosa, devolvemos el dinero</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="warranty-page__section">
		<div class="container warranty-page__container">
			<div class="warranty-page__section-heading">
				<p class="warranty-page__eyebrow">Impresoras 3D</p>
				<h2>Per&iacute;odo de garant&iacute;a por componente</h2>
				<p>Estos plazos aplican seg&uacute;n el componente afectado y las condiciones de uso del equipo.</p>
			</div>

			<div class="warranty-page__period-grid" aria-label="Plazos de garant&iacute;a por componente">
				<article class="warranty-page__period-card">
					<span>12 meses</span>
					<h3>Componentes principales</h3>
					<ul class="warranty-page__component-list">
						<li>Motherboard</li>
						<li>Display PCB</li>
						<li>Fuente de alimentaci&oacute;n</li>
						<li>Estructura met&aacute;lica</li>
						<li>Calefactor de cama</li>
					</ul>
				</article>
				<article class="warranty-page__period-card">
					<span>6 meses</span>
					<h3>Electr&oacute;nica espec&iacute;fica</h3>
					<ul class="warranty-page__component-list">
						<li>Drivers extra&iacute;bles</li>
						<li>Display de impresoras de resina</li>
					</ul>
					<p class="warranty-page__period-note">En drivers: 6 meses desde la compra y 3 meses despu&eacute;s del primer cambio.</p>
				</article>
				<article class="warranty-page__period-card warranty-page__period-card--dense">
					<span>3 meses</span>
					<h3>Partes de desgaste</h3>
					<ul class="warranty-page__component-list">
						<li>Ventiladores</li>
						<li>Motores paso a paso</li>
						<li>Termistores</li>
						<li>Calefactor hotend</li>
						<li>Cables</li>
						<li>Heat block</li>
						<li>Nozzle</li>
						<li>Selector de control</li>
						<li>Extrusor</li>
						<li>Tubo de tefl&oacute;n</li>
						<li>Conectores de tubo</li>
						<li>Correas</li>
						<li>Sensores</li>
						<li>Rodamientos</li>
					</ul>
				</article>
				<article class="warranty-page__period-card warranty-page__period-card--excluded">
					<span>Sin garant&iacute;a</span>
					<h3>Consumibles y accesorios</h3>
					<ul class="warranty-page__component-list">
						<li>Cama</li>
						<li>Memoria SD</li>
						<li>Adaptador de memoria</li>
						<li>Kit de herramientas</li>
					</ul>
				</article>
			</div>
		</div>
	</section>

	<section class="warranty-page__process">
		<div class="container warranty-page__container">
			<div class="warranty-page__section-heading">
				<p class="warranty-page__eyebrow">Proceso</p>
				<h2>C&oacute;mo verificamos una impresora en garant&iacute;a</h2>
				<p>Primero intentamos resolverlo a distancia para que no tengas que desprenderte de tu impresora. Si no alcanza, avanzamos con diagn&oacute;stico t&eacute;cnico.</p>
			</div>

			<ol class="warranty-page__timeline">
				<li>
					<span>1</span>
					<h3>C&oacute;digo del equipo</h3>
					<p>Te pedimos el c&oacute;digo de la impresora para verificar que la vendimos nosotros.</p>
				</li>
				<li>
					<span>2</span>
					<h3>Soporte a distancia</h3>
					<p>Te ponemos en contacto con el t&eacute;cnico para revisar si el problema puede solucionarse sin enviar el equipo.</p>
				</li>
				<li>
					<span>3</span>
					<h3>Recepci&oacute;n t&eacute;cnica</h3>
					<p>Si no se puede resolver a distancia, el t&eacute;cnico recibe el equipo para hacer un diagn&oacute;stico.</p>
				</li>
				<li>
					<span>4</span>
					<h3>Diagn&oacute;stico</h3>
					<p>Te comunicamos el resultado y, si no est&aacute; cubierto por garant&iacute;a, un presupuesto aproximado.</p>
				</li>
				<li>
					<span>5</span>
					<h3>Reparaci&oacute;n</h3>
					<p>Se procede con la reparaci&oacute;n seg&uacute;n la cobertura o la autorizaci&oacute;n del presupuesto.</p>
				</li>
			</ol>
		</div>
	</section>

	<section class="warranty-page__notice">
		<div class="container warranty-page__container">
			<div class="warranty-page__section-heading">
				<h2>Para iniciar un reclamo</h2>
				<p>Cuanta m&aacute;s informaci&oacute;n nos mandes al comienzo, m&aacute;s r&aacute;pido podemos orientarte.</p>
			</div>
			<div class="warranty-page__notice-grid">
				<article>
					<h3>1. Escribinos</h3>
					<p>Contactanos por el chat de la web o WhatsApp con el n&uacute;mero de pedido y una descripci&oacute;n clara del problema.</p>
				</article>
				<article>
					<h3>2. Adjunt&aacute; evidencia</h3>
					<p>Envi&aacute; fotos o video del producto, del inconveniente y, si aplica, del embalaje.</p>
				</article>
				<article>
					<h3>3. Evaluaci&oacute;n inicial</h3>
					<p>Respondemos en 1 d&iacute;a h&aacute;bil e intentamos resolver el problema a distancia cuando sea posible.</p>
				</article>
				<article>
					<h3>4. Resoluci&oacute;n</h3>
					<p>Avanzamos con reparaci&oacute;n, cambio o reembolso seg&uacute;n corresponda.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="warranty-page__section">
		<div class="container warranty-page__container">
			<div class="warranty-page__section-heading">
				<p class="warranty-page__eyebrow">Exclusiones</p>
				<h2>Casos que pueden dejar la garant&iacute;a sin cobertura</h2>
			</div>
			<div class="warranty-page__exclusion-grid">
				<article class="warranty-page__exclusion-card">
					<span class="warranty-page__icon" aria-hidden="true">{% include "snipplets/svg/exclamation-triangle.tpl" with {svg_custom_class: "warranty-page__icon-svg"} %}</span>
					<h3>Mal uso o desarme</h3>
					<p>Da&ntilde;os por mal uso, desarme del cliente o uso intensivo fuera de condiciones normales.</p>
				</article>
				<article class="warranty-page__exclusion-card">
					<span class="warranty-page__icon" aria-hidden="true">{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "warranty-page__icon-svg"} %}</span>
					<h3>Modificaciones</h3>
					<p>Toda modificaci&oacute;n fuera del departamento t&eacute;cnico oficial o firmware no autorizado cancela la garant&iacute;a.</p>
				</article>
				<article class="warranty-page__exclusion-card">
					<span class="warranty-page__icon" aria-hidden="true">{% include "snipplets/svg/trash-alt.tpl" with {svg_custom_class: "warranty-page__icon-svg"} %}</span>
					<h3>Servicios no cubiertos</h3>
					<p>No cubre destapado de hotend ni cambio de repuestos originados en mal uso o desarme.</p>
				</article>
				<article class="warranty-page__exclusion-card">
					<span class="warranty-page__icon" aria-hidden="true">{% include "snipplets/svg/package.tpl" with {svg_custom_class: "warranty-page__icon-svg"} %}</span>
					<h3>Faltantes o embalaje</h3>
					<p>Accesorios faltantes o packaging da&ntilde;ado pueden afectar la devoluci&oacute;n o evaluaci&oacute;n.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="warranty-page__repairs">
		<div class="container warranty-page__container">
			<div class="warranty-page__repairs-layout">
				<div>
					<p class="warranty-page__eyebrow">Reparaciones y costos</p>
					<h2>Presupuesto si no est&aacute; cubierto</h2>
					<p>Las reparaciones de mano de obra o repuestos hasta <strong>ARS 100.000</strong> se realizan directamente, sin autorizaci&oacute;n previa. Si el costo supera esa suma, te contactamos telef&oacute;nicamente para autorizar antes de continuar.</p>
				</div>
				<strong>ARS 100.000</strong>
			</div>
		</div>
	</section>

	<section class="warranty-page__section">
		<div class="container warranty-page__container">
			<div class="warranty-page__section-heading">
				<h2>Preguntas r&aacute;pidas</h2>
			</div>
			<div class="warranty-page__faq-grid">
				<article class="warranty-page__faq-card">
					<h3>&iquest;Qui&eacute;n paga el env&iacute;o en una devoluci&oacute;n?</h3>
					<p>Depende del motivo. Si es defecto o error nuestro, lo cubrimos. Si es arrepentimiento, puede aplicar costo de log&iacute;stica.</p>
				</article>
				<article class="warranty-page__faq-card">
					<h3>&iquest;Cu&aacute;nto tarda la garant&iacute;a?</h3>
					<p>Var&iacute;a seg&uacute;n producto y fabricante. Te damos un estimado despu&eacute;s de la evaluaci&oacute;n inicial.</p>
				</article>
				<article class="warranty-page__faq-card">
					<h3>&iquest;Qu&eacute; piezas tienen 12 meses?</h3>
					<p>Motherboard, display PCB, fuente de alimentaci&oacute;n, estructura met&aacute;lica y calefactor de cama.</p>
				</article>
				<article class="warranty-page__faq-card">
					<h3>&iquest;Las memorias SD tienen garant&iacute;a?</h3>
					<p>No. Las memorias SD y sus adaptadores no tienen garant&iacute;a.</p>
				</article>
				<article class="warranty-page__faq-card">
					<h3>&iquest;El destapado de hotend est&aacute; cubierto?</h3>
					<p>No, ese servicio no est&aacute; incluido en la garant&iacute;a. Igual podemos guiarte y ayudarte.</p>
				</article>
				<article class="warranty-page__faq-card">
					<h3>&iquest;Qu&eacute; hago si mi impresora funciona mal?</h3>
					<p>Contactanos. Primero intentamos resolverlo a distancia con el t&eacute;cnico; si no alcanza, coordinamos la revisi&oacute;n del equipo.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="warranty-page__cta">
		<div class="container warranty-page__container">
			<div class="warranty-page__cta-layout">
				<div>
					<h2>&iquest;Necesit&aacute;s iniciar una garant&iacute;a o devoluci&oacute;n?</h2>
					<p>Escribinos con tu n&uacute;mero de pedido, fotos o video y una descripci&oacute;n del problema. Te indicamos el siguiente paso.</p>
				</div>
				<div class="warranty-page__cta-actions">
					<a class="warranty-page__button" href="{{ warranty_contact_url }}" data-warranty-webchat-cta>Abrir chat de la web</a>
					<a class="warranty-page__button warranty-page__button--outline" href="{{ warranty_whatsapp_target }}" target="_blank" rel="noopener">Escribir por WhatsApp</a>
				</div>
			</div>
		</div>
	</section>

	{% if warranty_admin_content %}
		<section class="warranty-page__section warranty-page__admin-section">
			<div class="container warranty-page__container">
				<div class="warranty-page__admin-content user-content">
					{{ page.content }}
				</div>
			</div>
		</section>
	{% endif %}
</main>
