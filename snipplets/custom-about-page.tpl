{% set about_contact_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'contact_url' }) | trim %}
{% set about_products_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'products_url' }) | trim %}
{% set about_whatsapp_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'whatsapp_primary_url' }) | trim %}
{% set about_business_id = include('snipplets/custom-pages/business-facts.tpl', { mode: 'business_id' }) | trim %}
{% set about_address = include('snipplets/custom-pages/business-facts.tpl', { mode: 'address' }) | trim %}

<main class="about-page" data-store="about-page" data-cro-page="about">
	<section class="about-page__hero" aria-labelledby="about-title">
		<div class="container about-page__container">
			<div class="about-page__hero-layout">
				<div class="about-page__hero-copy">
					<p class="about-page__eyebrow">Qui&eacute;nes somos</p>
					<h1 class="about-page__title" id="about-title">Personas, stock y posventa que pod&eacute;s comprobar</h1>
					<p class="about-page__lead">Somos un equipo especializado en impresi&oacute;n 3D. Preparamos los pedidos, asesoramos antes de la compra y seguimos presentes cuando necesit&aacute;s configurar un equipo o resolver un problema.</p>
					<div class="about-page__hero-actions">
						<a class="about-page__button" href="{{ about_contact_url }}" data-custom-chat-cta data-cro-cta="about_contact_primary" data-cro-location="hero" data-cro-action="contact" data-cro-channel="chat">Hablar con el equipo</a>
						<a class="about-page__button about-page__button--outline" href="{{ about_products_url }}" data-cro-cta="about_catalog_primary" data-cro-location="hero" data-cro-action="browse" data-cro-channel="web">Ver productos</a>
					</div>
				</div>

				<div class="about-page__hero-media" aria-label="Operaci&oacute;n real de Trimetra 3D">
					<figure class="about-page__photo about-page__photo--main" data-about-photo-card data-about-fallback="Imagen del equipo de Trimetra 3D">
						<video controls muted loop playsinline preload="none" poster="{{ 'images/about/about-workshop.jpg' | static_url }}" aria-label="Equipo de Trimetra 3D" width="720" height="520" data-about-media data-about-video>
							<source data-src="{{ 'images/about/about-team.webm' | static_url }}" type="video/webm">
						</video>
						<figcaption>Equipo y atenci&oacute;n</figcaption>
					</figure>
					<figure class="about-page__photo about-page__photo--small" data-about-photo-card data-about-fallback="Imagen de productos disponibles">
						<img src="{{ 'images/about/about-products_small.jpg' | static_url }}" alt="Impresoras 3D, filamentos y mercader&iacute;a de Trimetra 3D" width="360" height="260" loading="lazy" data-about-media>
						<figcaption>Mercader&iacute;a real</figcaption>
					</figure>
				</div>
			</div>

			<div class="about-page__quick-grid" aria-label="Resumen de la operaci&oacute;n">
				<article class="about-page__quick-card">
					<span>Especialidad</span>
					<strong>Impresi&oacute;n 3D</strong>
				</article>
				<article class="about-page__quick-card">
					<span>Preparaci&oacute;n</span>
					<strong>Pedidos gestionados por nuestro equipo</strong>
				</article>
				<article class="about-page__quick-card">
					<span>Atenci&oacute;n</span>
					<strong>Antes y despu&eacute;s de comprar</strong>
				</article>
				<article class="about-page__quick-card">
					<span>Comprobante</span>
					<strong>Factura A o B</strong>
				</article>
			</div>
		</div>
	</section>

	<section class="about-page__proof" aria-labelledby="about-proof-title">
		<div class="container about-page__container">
			<div class="about-page__proof-layout">
				<div class="about-page__proof-media">
					<figure class="about-page__photo about-page__photo--proof" data-about-photo-card data-about-fallback="Imagen de preparaci&oacute;n de pedidos">
						<video muted loop playsinline preload="none" poster="{{ 'images/about/about-workshop_small.jpg' | static_url }}" aria-label="Preparaci&oacute;n de pedidos en Trimetra 3D" width="720" height="520" data-about-media data-about-video data-about-manual>
							<source data-src="{{ 'images/about/about-operation.mp4' | static_url }}" type="video/mp4">
						</video>
						<button class="about-page__video-play" type="button" data-about-play aria-label="Reproducir video de preparaci&oacute;n de pedidos">Reproducir video</button>
						<figcaption>Pedidos y operaci&oacute;n</figcaption>
					</figure>
					<figure class="about-page__photo about-page__photo--proof-small" data-about-photo-card data-about-fallback="Imagen del espacio de trabajo">
						<img src="{{ 'images/about/about-workshop_small.jpg' | static_url }}" alt="Trabajo t&eacute;cnico e impresoras funcionando en Trimetra 3D" width="420" height="320" loading="lazy" data-about-media>
						<figcaption>Taller y soporte</figcaption>
					</figure>
				</div>

				<div class="about-page__proof-copy">
					<p class="about-page__eyebrow">Posventa comprobable</p>
					<h2 id="about-proof-title">La confianza se demuestra cuando algo necesita soluci&oacute;n</h2>
					<p>Una rese&ntilde;a p&uacute;blica resume un caso concreto de nuestra posventa:</p>
					<blockquote class="about-page__case-study">
						<p>&ldquo;Tuve un problema con una A1 y me cambiaron el equipo.&rdquo;</p>
						<footer>Experiencia compartida por un cliente de Trimetra 3D</footer>
					</blockquote>
					<ul class="about-page__check-list">
						<li>Atenci&oacute;n directa para ventas y soporte.</li>
						<li>Seguimiento del caso hasta definir el pr&oacute;ximo paso.</li>
						<li>Derivaci&oacute;n t&eacute;cnica cuando hace falta revisar el equipo.</li>
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

	<section class="about-page__section about-page__identity" aria-labelledby="about-identity-title">
		<div class="container about-page__container">
			<div class="about-page__section-heading">
				<p class="about-page__eyebrow">Datos verificables</p>
				<h2 id="about-identity-title">Sab&eacute;s qui&eacute;n prepara tu compra y c&oacute;mo contactarlo</h2>
				<p>La informaci&oacute;n comercial y de contacto publicada en la tienda es la referencia para cualquier consulta o gesti&oacute;n.</p>
			</div>

			<div class="about-page__service-grid" aria-label="Datos de Trimetra 3D">
				<article class="about-page__service-card about-page__service-card--featured">
					<p>Identidad comercial</p>
					<h3>Trimetra 3D</h3>
					{% if about_business_id %}<p>{{ about_business_id }}</p>{% else %}<p>Datos fiscales disponibles en la documentaci&oacute;n de compra.</p>{% endif %}
				</article>
				<article class="about-page__service-card">
					<p>Factura</p>
					<h3>Factura A o B</h3>
					<p>Ingres&aacute; los datos fiscales necesarios al completar tu compra.</p>
				</article>
				<article class="about-page__service-card">
					<p>Operaci&oacute;n</p>
					<h3>Dep&oacute;sito con retiro coordinado</h3>
					<p>{{ about_address }}</p>
				</article>
				<article class="about-page__service-card">
					<p>Ayuda</p>
					<h3>Canales publicados</h3>
					<p>Us&aacute; el chat o la p&aacute;gina de contacto para hablar con nuestro equipo.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="about-page__mission" aria-labelledby="about-story-title">
		<div class="container about-page__container">
			<div class="about-page__mission-layout">
				<div>
					<p class="about-page__eyebrow">Nuestra historia</p>
					<h2 id="about-story-title">Crecemos sobre trabajo real</h2>
					<p>Trimetra 3D naci&oacute; en mayo de 2025 con un cat&aacute;logo chico y foco en un rubro que ya conoc&iacute;amos. Desde entonces sumamos stock, procesos y soporte sin perder el trato directo.</p>
				</div>
				<div>
					<p class="about-page__eyebrow">Nuestro criterio</p>
					<h2>Elegir mejor antes de comprar</h2>
					<p>Preferimos entender para qu&eacute; vas a usar el equipo o material y recomendar una alternativa razonable. La misma claridad gu&iacute;a la configuraci&oacute;n y la posventa.</p>
				</div>
			</div>
		</div>
	</section>

	<section class="about-page__cta" aria-labelledby="about-next-step-title">
		<div class="container about-page__container">
			<div class="about-page__cta-layout">
				<div>
					<h2 id="about-next-step-title">Encontr&aacute; el pr&oacute;ximo paso para tu proyecto 3D</h2>
					<p>Recorr&eacute; el cat&aacute;logo o contanos qu&eacute; quer&eacute;s imprimir. Te ayudamos a comparar opciones con informaci&oacute;n clara.</p>
				</div>
				<div class="about-page__cta-actions">
					<a class="about-page__button" href="{{ about_contact_url }}" data-custom-chat-cta data-cro-cta="about_contact_final" data-cro-location="final_cta" data-cro-action="contact" data-cro-channel="chat">Consultar antes de comprar</a>
					<a class="about-page__button about-page__button--outline" href="{{ about_products_url }}" data-custom-return-link data-custom-return-label="Volver al producto" data-cro-cta="about_catalog_final" data-cro-location="final_cta" data-cro-action="browse" data-cro-channel="web">Ver cat&aacute;logo</a>
					<a class="about-page__button about-page__button--outline" href="{{ about_whatsapp_url }}" target="_blank" rel="noopener" data-cro-cta="about_whatsapp_final" data-cro-location="final_cta" data-cro-action="contact" data-cro-channel="whatsapp">WhatsApp</a>
				</div>
			</div>
		</div>
	</section>
</main>
