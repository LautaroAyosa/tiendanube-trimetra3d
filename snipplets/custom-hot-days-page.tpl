{% set hot_days_admin_content = page.content | trim %}
{% set has_hot_sale_products = sections.sale.products or sections.promotion.products or sections.primary.products or sections.best_seller.products %}

<main class="hot-days-page" data-store="hot-days-page">
	<section class="hot-days-page__hero" aria-labelledby="hot-days-title">
		<div class="container hot-days-page__container hot-days-page__hero-container">
			<div class="hot-days-page__hero-layout">
				<div class="hot-days-page__hero-copy">
					<p class="hot-days-page__eyebrow hot-days-page__eyebrow--light">Hot Sale Trimetra 3D</p>
					<h1 class="hot-days-page__title" id="hot-days-title">Ofertas fuertes para imprimir m&aacute;s</h1>
					<p class="hot-days-page__lead">Impresoras 3D, filamentos, repuestos e insumos seleccionados para comprar con stock real, cuotas y asesoramiento antes de decidir.</p>

					<div class="hot-days-page__hero-actions">
						<a class="hot-days-page__button" href="#hot-sale-products" data-hot-days-scroll>Ver ofertas</a>
						<a class="hot-days-page__button hot-days-page__button--outline" href="{{ store.products_url }}?q=impresora%203d">Impresoras 3D</a>
						<a class="hot-days-page__button hot-days-page__button--outline" href="{{ store.products_url }}?q=filamento">Filamentos</a>
					</div>

					<div class="hot-days-page__proof-row" aria-label="Beneficios principales">
						<span>Productos seleccionados</span>
						<span>Env&iacute;os a todo el pa&iacute;s</span>
						<span>Compra r&aacute;pida</span>
						<span class="hot-days-page__proof-row-highlight">Soporte Trimetra</span>
					</div>
				</div>

				<div class="hot-days-page__hero-media" aria-label="Banner Hot Sale Trimetra 3D">
					<div class="hot-days-page__hero-banner">
						<img class="hot-days-page__hero-image" src="{{ 'images/hot-days/principal_1_MOBILE.png' | static_url }}" alt="Hot Sale Trimetra 3D" width="384" height="245" fetchpriority="high">
					</div>

					<div class="hot-days-page__hero-video">
						<video class="hot-days-page__video" autoplay muted loop playsinline poster="{{ 'images/hot-days/hot-days-ad-poster.webp' | static_url }}">
							<source src="{{ 'images/hot-days/hot-days-ad-h264.mp4' | static_url }}" type="video/mp4">
						</video>
					</div>

					<div class="hot-days-page__hero-offer-card" aria-label="Promociones principales">
						<strong>Hot Sale por tiempo limitado</strong>
						<span>Revis&aacute; precio, cuotas, stock y entrega antes de confirmar tu compra.</span>
					</div>
				</div>
			</div>

			<div class="hot-days-page__hero-metrics" aria-label="Resumen de compra">
				<div class="hot-days-page__metric">
					<span>01</span>
					<strong>Eleg&iacute; por objetivo</strong>
					<p>Equipos, filamentos, accesorios y repuestos ordenados para comprar m&aacute;s r&aacute;pido.</p>
				</div>
				<div class="hot-days-page__metric">
					<span>02</span>
					<strong>Valid&aacute; compatibilidad</strong>
					<p>Si dud&aacute;s entre modelos o materiales, pod&eacute;s consultarnos antes de pagar.</p>
				</div>
				<div class="hot-days-page__metric">
					<span>03</span>
					<strong>Compr&aacute; con respaldo</strong>
					<p>Garant&iacute;a oficial, medios de pago claros y seguimiento de entrega.</p>
				</div>
			</div>
		</div>
	</section>

	<section class="hot-days-page__section hot-days-page__quick-links" aria-labelledby="hot-days-quick-links">
		<div class="container hot-days-page__container">
			<div class="hot-days-page__section-header">
				<p class="hot-days-page__eyebrow">Compr&aacute; por objetivo</p>
				<h2 id="hot-days-quick-links">Lleg&aacute; antes a lo que necesit&aacute;s</h2>
				<p>Atajos para resolver la compra sin recorrer todo el cat&aacute;logo.</p>
			</div>

			<div class="hot-days-page__quick-grid">
				<a class="hot-days-page__quick-card" href="{{ store.products_url }}?q=impresora%203d">
					<span class="hot-days-page__quick-icon" aria-hidden="true">{% include "snipplets/svg/store-alt.tpl" with {svg_custom_class: "hot-days-page__icon-svg"} %}</span>
					<strong>Impresoras 3D</strong>
					<span>Equipos para empezar, producir o actualizar tu setup.</span>
				</a>
				<a class="hot-days-page__quick-card" href="{{ store.products_url }}?q=filamento">
					<span class="hot-days-page__quick-icon" aria-hidden="true">{% include "snipplets/svg/package.tpl" with {svg_custom_class: "hot-days-page__icon-svg"} %}</span>
					<strong>Filamentos</strong>
					<span>Stock para aprovechar la promo y seguir imprimiendo.</span>
				</a>
				<a class="hot-days-page__quick-card" href="{{ store.products_url }}?q=snapmaker">
					<span class="hot-days-page__quick-icon" aria-hidden="true">{% include "snipplets/svg/ruller.tpl" with {svg_custom_class: "hot-days-page__icon-svg"} %}</span>
					<strong>Snapmaker</strong>
					<span>Soluciones modulares para imprimir, grabar y mecanizar.</span>
				</a>
				<a class="hot-days-page__quick-card" href="{{ store.products_url }}?q=accesorios">
					<span class="hot-days-page__quick-icon" aria-hidden="true">{% include "snipplets/svg/promotions.tpl" with {svg_custom_class: "hot-days-page__icon-svg"} %}</span>
					<strong>Accesorios</strong>
					<span>Repuestos, herramientas e insumos para mantener el flujo.</span>
				</a>
			</div>
		</div>
	</section>

	<div class="hot-days-page__products-anchor" id="hot-sale-products"></div>

	{% if has_hot_sale_products %}
		<section class="hot-days-page__products-band" aria-label="Productos Hot Sale">
			<div class="container hot-days-page__container">
				<div class="hot-days-page__products-intro">
					<p class="hot-days-page__eyebrow">Selecci&oacute;n Hot Sale</p>
					<h2>Productos destacados para comprar ahora</h2>
					<p>Grillas amplias, sin carruseles ocultos: m&aacute;s productos visibles para comparar precio, cuotas y disponibilidad.</p>
				</div>
			</div>

			{% if sections.sale.products %}
				<section class="hot-days-page__product-section" aria-labelledby="hot-days-sale-products" data-hot-days-product-section>
					<div class="container hot-days-page__container">
						<div class="hot-days-page__product-heading">
							<div>
								<p class="hot-days-page__eyebrow">Ofertas</p>
								<h2 id="hot-days-sale-products">Ofertas Hot Sale</h2>
							</div>
							<a class="hot-days-page__text-link" href="{{ store.products_url }}?sort_by=price-ascending">Ver m&aacute;s ofertas</a>
						</div>
						<div class="hot-days-page__products-grid row row-grid">
							{% for product in sections.sale.products %}
								{% include 'snipplets/grid/item.tpl' with {'image_priority_high': loop.index <= 5} %}
							{% endfor %}
						</div>
					</div>
				</section>
			{% endif %}

			{% if sections.promotion.products %}
				<section class="hot-days-page__product-section" aria-labelledby="hot-days-promotion-products" data-hot-days-product-section>
					<div class="container hot-days-page__container">
						<div class="hot-days-page__product-heading">
							<div>
								<p class="hot-days-page__eyebrow">Promociones</p>
								<h2 id="hot-days-promotion-products">Promociones destacadas</h2>
							</div>
							<a class="hot-days-page__text-link" href="{{ store.products_url }}?q=promocion">Ver promociones</a>
						</div>
						<div class="hot-days-page__products-grid row row-grid">
							{% for product in sections.promotion.products %}
								{% include 'snipplets/grid/item.tpl' %}
							{% endfor %}
						</div>
					</div>
				</section>
			{% endif %}

			<section class="hot-days-page__deal-panel" aria-labelledby="hot-days-bulk-title">
				<div class="container hot-days-page__container">
					<div class="hot-days-page__deal-layout">
						<div class="hot-days-page__deal-copy">
							<p class="hot-days-page__eyebrow">Stock inteligente</p>
							<h2 id="hot-days-bulk-title">Aprovech&aacute; para equiparte completo</h2>
							<p>Si vas a comprar una impresora, sum&aacute; filamentos, repuestos y accesorios compatibles para no frenar tus primeras impresiones.</p>
							<a class="hot-days-page__button" href="{{ store.products_url }}?q=filamento">Ver filamentos e insumos</a>
						</div>
						<div class="hot-days-page__deal-media">
							<img src="{{ 'images/hot-days/filamentos-10kg-hero.webp' | static_url }}" alt="Filamentos para impresi&oacute;n 3D en Hot Sale" width="1200" height="720" loading="lazy">
						</div>
					</div>
				</div>
			</section>

			{% if sections.primary.products %}
				<section class="hot-days-page__product-section" aria-labelledby="hot-days-featured-products" data-hot-days-product-section>
					<div class="container hot-days-page__container">
						<div class="hot-days-page__product-heading">
							<div>
								<p class="hot-days-page__eyebrow">Curado por Trimetra</p>
								<h2 id="hot-days-featured-products">Elegidos por Trimetra</h2>
							</div>
							<a class="hot-days-page__text-link" href="{{ store.products_url }}">Ver cat&aacute;logo</a>
						</div>
						<div class="hot-days-page__products-grid row row-grid">
							{% for product in sections.primary.products %}
								{% include 'snipplets/grid/item.tpl' %}
							{% endfor %}
						</div>
					</div>
				</section>
			{% endif %}

			{% if sections.best_seller.products %}
				<section class="hot-days-page__product-section" aria-labelledby="hot-days-best-seller-products" data-hot-days-product-section>
					<div class="container hot-days-page__container">
						<div class="hot-days-page__product-heading">
							<div>
								<p class="hot-days-page__eyebrow">Los m&aacute;s buscados</p>
								<h2 id="hot-days-best-seller-products">M&aacute;s vendidos</h2>
							</div>
							<a class="hot-days-page__text-link" href="{{ store.products_url }}?sort_by=sold_quantity-descending">Ver m&aacute;s vendidos</a>
						</div>
						<div class="hot-days-page__products-grid row row-grid">
							{% for product in sections.best_seller.products %}
								{% include 'snipplets/grid/item.tpl' %}
							{% endfor %}
						</div>
					</div>
				</section>
			{% endif %}
		</section>
	{% else %}
		<section class="hot-days-page__section hot-days-page__empty-products" aria-labelledby="hot-days-empty-products">
			<div class="container hot-days-page__container">
				<div class="hot-days-page__empty-panel">
					<p class="hot-days-page__eyebrow">Productos Hot Sale</p>
					<h2 id="hot-days-empty-products">Estamos preparando las ofertas</h2>
					<p>Mientras tanto pod&eacute;s recorrer el cat&aacute;logo completo y consultar stock, cuotas y opciones de entrega.</p>
					<a class="hot-days-page__button" href="{{ store.products_url }}">Ver todos los productos</a>
				</div>
			</div>
		</section>
	{% endif %}

	<section class="hot-days-page__section hot-days-page__conversion" aria-labelledby="hot-days-conversion">
		<div class="container hot-days-page__container">
			<div class="hot-days-page__conversion-layout">
				<div class="hot-days-page__section-header">
					<p class="hot-days-page__eyebrow">Compra con respaldo</p>
					<h2 id="hot-days-conversion">Menos dudas antes de pagar</h2>
					<p>La diferencia no es solo el descuento: es comprar el equipo, material o repuesto correcto para tu uso.</p>
				</div>

				<div class="hot-days-page__conversion-list">
					<article class="hot-days-page__conversion-item">
						<span aria-hidden="true">{% include "snipplets/svg/credit-card.tpl" with {svg_custom_class: "hot-days-page__icon-svg"} %}</span>
						<div>
							<h3>Medios de pago claros</h3>
							<p>La financiaci&oacute;n disponible se informa en cada producto y antes de confirmar el checkout.</p>
						</div>
					</article>
					<article class="hot-days-page__conversion-item">
						<span aria-hidden="true">{% include "snipplets/svg/truck.tpl" with {svg_custom_class: "hot-days-page__icon-svg"} %}</span>
						<div>
							<h3>Entrega coordinada</h3>
							<p>Compr&aacute; online y eleg&iacute; la alternativa de env&iacute;o o retiro disponible para tu ubicaci&oacute;n.</p>
						</div>
					</article>
					<article class="hot-days-page__conversion-item">
						<span aria-hidden="true">{% include "snipplets/svg/comments.tpl" with {svg_custom_class: "hot-days-page__icon-svg"} %}</span>
						<div>
							<h3>Asesoramiento real</h3>
							<p>Si dud&aacute;s entre modelos, materiales o accesorios, te ayudamos a elegir antes de comprar.</p>
						</div>
					</article>
				</div>
			</div>
		</div>
	</section>

	{% include 'snipplets/trust-bar.tpl' %}

	{% include 'snipplets/why-trimetra.tpl' %}

	<section class="hot-days-page__section hot-days-page__faq" aria-labelledby="hot-days-faq">
		<div class="container hot-days-page__container">
			<div class="hot-days-page__faq-layout">
				<div class="hot-days-page__section-header">
					<p class="hot-days-page__eyebrow">Preguntas frecuentes</p>
					<h2 id="hot-days-faq">Antes de comprar</h2>
					<p>Respuestas r&aacute;pidas para reducir fricci&oacute;n durante el Hot Sale.</p>
				</div>
				<div class="hot-days-page__faq-list">
					<details class="hot-days-page__faq-item">
						<summary>&iquest;Las cuotas aplican a todos los productos?</summary>
						<p>Las cuotas y promociones dependen del producto y del medio de pago. La condici&oacute;n final se muestra antes de confirmar el pago.</p>
					</details>
					<details class="hot-days-page__faq-item">
						<summary>&iquest;El stock est&aacute; actualizado?</summary>
						<p>La tienda informa disponibilidad por producto. Si necesit&aacute;s confirmar una compra grande, escribinos antes de finalizar.</p>
					</details>
					<details class="hot-days-page__faq-item">
						<summary>&iquest;Hacen env&iacute;os a todo el pa&iacute;s?</summary>
						<p>S&iacute;, trabajamos con env&iacute;os a todo el pa&iacute;s y las opciones disponibles se calculan durante el checkout.</p>
					</details>
					<details class="hot-days-page__faq-item">
						<summary>&iquest;Puedo pedir ayuda para elegir?</summary>
						<p>S&iacute;. Te orientamos por WhatsApp o por los canales de contacto para que compres el equipo, material o accesorio correcto.</p>
					</details>
				</div>
			</div>
		</div>
	</section>

	{% if hot_days_admin_content %}
		<section class="hot-days-page__section hot-days-page__admin-section">
			<div class="container hot-days-page__container">
				<div class="hot-days-page__admin-content user-content">
					{{ page.content }}
				</div>
			</div>
		</section>
	{% endif %}
</main>
