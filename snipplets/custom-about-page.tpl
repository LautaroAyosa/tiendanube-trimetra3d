{% set about_admin_content = page.content | trim %}
{% set about_contact_url = 'https://trimetra3d.mitiendanube.com/contacto-y-horarios/' %}
{% set about_whatsapp_target = store.whatsapp ? store.whatsapp : 'https://wa.me/5491173703391' %}

<main class="about-page" data-store="about-page">
	<section class="about-page__hero">
		<div class="container about-page__container">
			<div class="about-page__hero-layout">
				<div class="about-page__hero-copy">
					<p class="about-page__eyebrow">Qui&eacute;nes somos</p>
					<h1 class="about-page__title">Un equipo real para ayudarte a entrar mejor al mundo 3D</h1>
					<p class="about-page__lead">En Trimetra 3D trabajamos enfocados en impresoras 3D, filamentos e insumos. Te ayudamos a elegir, comprar, configurar y resolver dudas sin vueltas, con atenci&oacute;n cercana y soporte cuando algo se traba.</p>
					<div class="about-page__hero-actions">
						<a class="about-page__button" href="{{ about_contact_url }}" data-about-chat-cta>Hablar con Trimetra 3D</a>
						<a class="about-page__button about-page__button--outline" href="{{ store.products_url }}">Ver productos</a>
					</div>
				</div>

				<div class="about-page__hero-media" aria-label="Fotos reales de Trimetra 3D">
					<figure class="about-page__photo about-page__photo--main" data-about-photo-card data-about-fallback="Foto real del equipo">
						<video autoplay muted loop playsinline preload="metadata" aria-label="Equipo de Trimetra 3D" width="720" height="520" data-about-photo>
							<source src="{{ 'images/about/about-team.webm' | static_url }}" type="video/webm">
						</video>
						<figcaption>Equipo y atenci&oacute;n</figcaption>
					</figure>
					<figure class="about-page__photo about-page__photo--small" data-about-photo-card data-about-fallback="Foto real de mercader&iacute;a">
						<img src="{{ 'images/about/about-products_small.jpg' | static_url }}" alt="Impresoras 3D, filamentos y mercader&iacute;a de Trimetra 3D" width="360" height="260" loading="lazy" data-about-photo>
						<figcaption>Mercader&iacute;a real</figcaption>
					</figure>
				</div>
			</div>

			<div class="about-page__quick-grid" aria-label="Resumen r&aacute;pido de Trimetra 3D">
				<article class="about-page__quick-card">
					<span>Especialidad</span>
					<strong>100% impresi&oacute;n 3D</strong>
				</article>
				<article class="about-page__quick-card">
					<span>Inicio</span>
					<strong>Desde mayo de 2025</strong>
				</article>
				<article class="about-page__quick-card">
					<span>Atenci&oacute;n</span>
					<strong>Antes y despu&eacute;s de comprar</strong>
				</article>
				<article class="about-page__quick-card">
					<span>Cat&aacute;logo</span>
					<strong>Impresoras, filamentos y accesorios</strong>
				</article>
			</div>
		</div>
	</section>

	<section class="about-page__section">
		<div class="container about-page__container">
			<div class="about-page__section-heading">
				<p class="about-page__eyebrow">Qu&eacute; hacemos</p>
				<h2>Vendemos 3D, pero sobre todo te acompa&ntilde;amos a usarlo mejor</h2>
				<p>Preferimos enfocarnos en un rubro que conocemos antes que vender de todo. Eso nos permite orientar mejor, detectar problemas m&aacute;s r&aacute;pido y recomendar productos con criterio.</p>
			</div>

			<div class="about-page__service-grid" aria-label="Qu&eacute; vende y acompa&ntilde;a Trimetra 3D">
				<article class="about-page__service-card">
					<span class="about-page__icon" aria-hidden="true">{% include "snipplets/svg/store-alt.tpl" with {svg_custom_class: "about-page__icon-svg"} %}</span>
					<p>Equipos</p>
					<h3>Impresoras 3D</h3>
					<p>Te ayudamos a elegir una m&aacute;quina seg&uacute;n tu uso, experiencia y objetivo.</p>
				</article>
				<article class="about-page__service-card about-page__service-card--featured">
					<span class="about-page__icon" aria-hidden="true">{% include "snipplets/svg/package.tpl" with {svg_custom_class: "about-page__icon-svg"} %}</span>
					<p>Insumos</p>
					<h3>Filamentos</h3>
					<p>Trabajamos materiales para imprimir mejor, reponer stock y sostener producci&oacute;n.</p>
				</article>
				<article class="about-page__service-card">
					<span class="about-page__icon" aria-hidden="true">{% include "snipplets/svg/ruller.tpl" with {svg_custom_class: "about-page__icon-svg"} %}</span>
					<p>Complementos</p>
					<h3>Accesorios e insumos</h3>
					<p>Sumamos herramientas, repuestos y productos relacionados al ecosistema 3D.</p>
				</article>
				<article class="about-page__service-card">
					<span class="about-page__icon" aria-hidden="true">{% include "snipplets/svg/chat.tpl" with {svg_custom_class: "about-page__icon-svg"} %}</span>
					<p>Gu&iacute;a</p>
					<h3>Asesoramiento</h3>
					<p>Respondemos dudas antes de comprar y tambi&eacute;n cuando ya est&aacute;s usando el equipo.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="about-page__proof">
		<div class="container about-page__container">
			<div class="about-page__proof-layout">
				<div class="about-page__proof-media">
					<figure class="about-page__photo about-page__photo--proof" data-about-photo-card data-about-fallback="Foto real de operaci&oacute;n">
						<video autoplay muted loop playsinline preload="metadata" aria-label="Preparaci&oacute;n de pedidos y operaci&oacute;n de Trimetra 3D" width="720" height="520" data-about-photo>
							<source src="{{ 'images/about/about-operation.mp4' | static_url }}" type="video/mp4">
						</video>
						<figcaption>Pedidos y operaci&oacute;n</figcaption>
					</figure>
					<figure class="about-page__photo about-page__photo--proof-small" data-about-photo-card data-about-fallback="Foto real de taller">
						<img src="{{ 'images/about/about-workshop_small.jpg' | static_url }}" alt="Trabajo t&eacute;cnico e impresoras funcionando en Trimetra 3D" width="420" height="320" loading="lazy" data-about-photo>
						<figcaption>Taller y soporte</figcaption>
					</figure>
				</div>

				<div class="about-page__proof-copy">
					<p class="about-page__eyebrow">Confianza</p>
					<h2>No somos una tienda fantasma</h2>
					<p>Queremos que se vea qui&eacute;n est&aacute; atr&aacute;s de la web: personas reales, mercader&iacute;a real y una operaci&oacute;n que responde cuando necesit&aacute;s ayuda.</p>
					<ul class="about-page__check-list">
						<li>Equipo chico, directo y enfocado en impresi&oacute;n 3D.</li>
						<li>Canales oficiales para ventas, soporte y coordinaci&oacute;n.</li>
						<li>Mercader&iacute;a y pedidos preparados por nosotros.</li>
						<li>Derivaci&oacute;n t&eacute;cnica cuando el caso necesita una revisi&oacute;n m&aacute;s fina.</li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	{% if settings.reviews_show_about_page %}
		{% include 'snipplets/reviews/reviews-settings.tpl' with {
			reviews_id: 'about-reviews'
		} %}
	{% endif %}

	<section class="about-page__story">
		<div class="container about-page__container">
			<div class="about-page__section-heading">
				<p class="about-page__eyebrow">Nuestra historia</p>
				<h2>Arrancamos simple y fuimos construyendo sobre trabajo real</h2>
				<p>Trimetra 3D empez&oacute; con ganas de hacer funcionar un negocio propio dentro de un rubro que ya conoc&iacute;amos. Desde ah&iacute;, fuimos sumando stock, contenido, procesos y horas de trabajo.</p>
			</div>

			<ol class="about-page__timeline" aria-label="Historia resumida de Trimetra 3D">
				<li>
					<span>Mayo 2025</span>
					<h3>Nace Trimetra 3D</h3>
					<p>Una decisi&oacute;n concreta: empezar con lo que hab&iacute;a y hacerlo funcionar.</p>
				</li>
				<li>
					<span>Primer stock</span>
					<h3>4 impresoras y filamento</h3>
					<p>El punto de partida fue chico, pero enfocado en productos que entend&iacute;amos.</p>
				</li>
				<li>
					<span>Crecimiento</span>
					<h3>Trabajo, marketing y contenido</h3>
					<p>Fuimos ordenando la operaci&oacute;n y sumando cat&aacute;logo paso a paso.</p>
				</li>
				<li>
					<span>Hoy</span>
					<h3>M&aacute;s productos, misma cercan&iacute;a</h3>
					<p>Seguimos creciendo sin perder velocidad de respuesta ni trato directo.</p>
				</li>
			</ol>
		</div>
	</section>

	<section class="about-page__audience">
		<div class="container about-page__container">
			<div class="about-page__split-layout">
				<div class="about-page__section-heading">
					<p class="about-page__eyebrow">A qui&eacute;n ayudamos</p>
					<h2>Si quer&eacute;s imprimir mejor, este lugar es para vos</h2>
					<p>No importa si est&aacute;s por comprar tu primera impresora o si ya ven&iacute;s imprimiendo hace tiempo. La idea es la misma: ayudarte a elegir mejor y destrabar lo que haga falta.</p>
				</div>

				<div class="about-page__audience-grid" aria-label="Tipos de clientes que ayudamos">
					<article class="about-page__audience-card">
						<h3>Primera impresora</h3>
						<p>Orientaci&oacute;n simple para entender modelos, usos, materiales y pr&oacute;ximos pasos.</p>
					</article>
					<article class="about-page__audience-card">
						<h3>Usuarios que escalan</h3>
						<p>Equipos, insumos y respuestas para quienes ya producen, venden o quieren mejorar.</p>
					</article>
					<article class="about-page__audience-card">
						<h3>Problemas puntuales</h3>
						<p>Ayuda para revisar dudas, coordinar soporte o encontrar una salida razonable.</p>
					</article>
				</div>
			</div>
		</div>
	</section>

	<section class="about-page__process">
		<div class="container about-page__container">
			<div class="about-page__section-heading">
				<p class="about-page__eyebrow">C&oacute;mo trabajamos</p>
				<h2>Atenci&oacute;n directa, criterio y resoluci&oacute;n</h2>
			</div>

			<div class="about-page__process-grid" aria-label="Forma de trabajo de Trimetra 3D">
				<article class="about-page__process-card">
					<strong>1</strong>
					<h3>Respondemos r&aacute;pido</h3>
					<p>Buscamos que no tengas que pasar por varias personas para resolver una duda simple.</p>
				</article>
				<article class="about-page__process-card">
					<strong>2</strong>
					<h3>Orientamos sin vueltas</h3>
					<p>Si un producto no tiene sentido para tu caso, preferimos decirlo antes de que compres mal.</p>
				</article>
				<article class="about-page__process-card">
					<strong>3</strong>
					<h3>Derivamos con t&eacute;cnico</h3>
					<p>Cuando hace falta revisar una impresora o un problema m&aacute;s fino, movemos el caso al &aacute;rea correcta.</p>
				</article>
				<article class="about-page__process-card">
					<strong>4</strong>
					<h3>Buscamos una salida</h3>
					<p>Cambios, repuestos, garant&iacute;as o alternativas razonables se eval&uacute;an con seguimiento real.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="about-page__mission">
		<div class="container about-page__container">
			<div class="about-page__mission-layout">
				<div>
					<p class="about-page__eyebrow">Misi&oacute;n</p>
					<h2>Acercar la impresi&oacute;n 3D a m&aacute;s personas</h2>
					<p>Creemos que imprimir en 3D va a ser cada vez m&aacute;s com&uacute;n en casas, talleres, trabajos y emprendimientos. Queremos que se sienta posible: que puedas aprender, crear, producir y resolver problemas concretos.</p>
				</div>
				<div>
					<p class="about-page__eyebrow">Visi&oacute;n</p>
					<h2>Crecer sin perder cercan&iacute;a</h2>
					<p>Queremos construir una empresa &aacute;gil, moderna y bien armada, con procesos claros, tecnolog&iacute;a y un equipo muy enfocado. La meta es crecer sin volvernos lentos ni impersonales.</p>
				</div>
			</div>
		</div>
	</section>

	<section class="about-page__cta">
		<div class="container about-page__container">
			<div class="about-page__cta-layout">
				<div>
					<h2>Esto reci&eacute;n empieza</h2>
					<p>Si est&aacute;s por comprar, comparar opciones o resolver una duda de impresi&oacute;n 3D, escribinos. Te ayudamos a encontrar el pr&oacute;ximo paso con informaci&oacute;n clara.</p>
				</div>
				<div class="about-page__cta-actions">
					<a class="about-page__button" href="{{ about_contact_url }}" data-about-chat-cta>Consultar antes de comprar</a>
					<a class="about-page__button about-page__button--outline" href="{{ about_whatsapp_target }}" target="_blank" rel="noopener">Escribir por WhatsApp</a>
				</div>
			</div>
		</div>
	</section>

	{% if about_admin_content %}
		<section class="about-page__section about-page__admin-section">
			<div class="container about-page__container">
				<div class="about-page__admin-content user-content">
					{{ page.content }}
				</div>
			</div>
		</section>
	{% endif %}
</main>
