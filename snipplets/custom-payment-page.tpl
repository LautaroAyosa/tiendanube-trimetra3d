{% set payment_contact_url = 'https://trimetra3d.mitiendanube.com/contacto-y-horarios/' %}
{% set oncity_url = 'https://www.oncity.com/trimetra-3d?map=seller' %}

<main class="payment-page" data-store="payment-page">
	<section class="payment-page__intro">
		<div class="container payment-page__container">
			<div class="payment-page__intro-layout">
				<div class="payment-page__intro-copy">
					<p class="payment-page__eyebrow">Medios de pago</p>
					<h1 class="payment-page__title">Pagá como te convenga y revisá las promos vigentes</h1>
					<p class="payment-page__lead">Aceptamos tarjetas, MercadoPago, MercadoCrédito, transferencia, efectivo y redes de cobranza. Las cuotas sin interés aplican a Visa y Mastercard bancarias; otros medios pueden tener condiciones propias que se muestran antes de confirmar la compra.</p>
				</div>
				<div class="payment-page__intro-summary" aria-label="Resumen rápido de pagos">
					<div class="payment-page__summary-row">
						<span>Visa / Mastercard bancarias</span>
						<strong><span data-payment-installments-value data-payment-installments-base="3">3</span> cuotas sin interés <span data-payment-installments-scope data-payment-installments-scope-template="en {scope}" hidden></span></strong>
					</div>
					<div class="payment-page__summary-row">
						<span>Transferencia</span>
						<strong>5% de descuento</strong>
					</div>
					<div class="payment-page__summary-row">
						<span>Efectivo / USD</span>
						<strong>10% de descuento</strong>
					</div>
				</div>
			</div>
		</div>
	</section>

	{# Actualizar este bloque con docs/pagos/promo_section_template.md cuando haya una promo vigente. #}
	<section
		class="payment-page__promo"
		data-payment-promo
		data-promo-start="2026-04-10"
		data-promo-end="2026-04-19"
		data-promo-countdown="true"
		data-promo-installments="9"
		data-promo-scope="BambuLab y Snapmaker"
		hidden
		style="--payment-promo-bg: #1d241f; --payment-promo-foreground: #ffffff; --payment-promo-muted: #fff2ed; --payment-promo-accent: #f4c24f; --payment-promo-image: none;"
	>
		<div class="container payment-page__container">
			<div class="payment-page__promo-panel">
				<div class="payment-page__promo-copy">
					<div class="payment-page__promo-copy-body">
						<p class="payment-page__promo-kicker">Promo vigente</p>
						<h2>9 cuotas sin interés</h2>
						<p>Del 11 al 19 de abril, aprovechá 9 cuotas sin interés en productos BambuLab y Snapmaker.</p>
						<div class="payment-page__promo-tags" aria-label="Resumen de la promo">
							<span>Vigencia: <strong>11/04 al 19/04</strong></span>
							<span>Aplica a <strong>BambuLab y Snapmaker</strong></span>
							<span><strong>Visa y Mastercard bancarias</strong></span>
						</div>
					</div>
					<a class="payment-page__button payment-page__button--accent payment-page__promo-primary-action" href="{{ store.products_url }}">Comprar en la tienda</a>
				</div>
				<div class="payment-page__promo-side">
					<div class="payment-page__promo-badge" aria-hidden="true">
						<span>Hasta</span>
						<strong>9x</strong>
					</div>
					<div class="payment-page__promo-countdown" data-payment-countdown hidden aria-label="Tiempo restante de la promo">
						<p>Termina en</p>
						<div>
							<span><strong data-payment-countdown-days>00</strong>días</span>
							<span><strong data-payment-countdown-hours>00</strong>hs</span>
							<span><strong data-payment-countdown-minutes>00</strong>min</span>
							<span><strong data-payment-countdown-seconds>00</strong>seg</span>
						</div>
					</div>
					<a class="payment-page__button payment-page__button--ghost payment-page__promo-secondary-action" href="{{ payment_contact_url }}" data-payment-chat-cta>Consultar dudas</a>
				</div>
			</div>
			<div class="payment-page__promo-conditions">
				<p>Promoción válida para productos BambuLab y Snapmaker durante la vigencia indicada. Aplica con tarjetas Visa y Mastercard bancarias. No acumulable con otras promociones, salvo comunicación explícita. El total final se informa antes de confirmar la compra.</p>
			</div>
		</div>
	</section>

	<section class="payment-page__oncity" data-oncity-promos data-oncity-base-installments="3" hidden>
		<div class="container payment-page__container">
			<div class="payment-page__oncity-layout">
				<div class="payment-page__oncity-header">
					<div class="payment-page__oncity-copy">
						<img class="payment-page__oncity-brand-logo" src="{{ "images/payment-logos/oncity_logo.png" | static_url }}" alt="OnCity" width="220" height="80" loading="lazy">
						<div class="payment-page__oncity-copy-text">
							<p class="payment-page__eyebrow">Promos fuera de la web</p>
							<h2>También vendemos en OnCity</h2>
							<p>OnCity puede sumar alianzas bancarias propias sobre el mismo plan de cuotas publicado. Si tu banco o tarjeta aparece acá, puede convenirte comprar por OnCity.</p>
							<p class="payment-page__oncity-note">Las condiciones finales las informa OnCity antes de confirmar la compra.</p>
						</div>
					</div>
					<div class="payment-page__oncity-header-actions">
						<div class="payment-page__oncity-status">
							<span>Plan activo en OnCity</span>
							<strong><span data-oncity-current-installments>3</span> cuotas + alianzas</strong>
						</div>
						<a class="payment-page__button payment-page__button--accent payment-page__oncity-button" href="{{ oncity_url }}" target="_blank" rel="noopener noreferrer">Ver en OnCity</a>
					</div>
				</div>
				<div class="payment-page__oncity-content">
					<div class="payment-page__oncity-logo-strip" aria-label="Alianzas principales en OnCity">
						<img class="payment-page__oncity-strip-logo" src="{{ "images/payment-logos/NaranjaX-logo.svg.png" | static_url }}" alt="NaranjaX" width="220" height="80" loading="lazy">
						<img class="payment-page__oncity-strip-logo" src="{{ "images/payment-logos/banconacion_logo.png" | static_url }}" alt="Banco Nación" width="220" height="80" loading="lazy">
						<img class="payment-page__oncity-strip-logo" src="{{ "images/payment-logos/Banco-del-Sol.png" | static_url }}" alt="Banco del Sol" width="220" height="80" loading="lazy">
						<img class="payment-page__oncity-strip-logo" src="{{ "images/payment-logos/image-16.png" | static_url }}" alt="Macro" width="220" height="80" loading="lazy">
						<img class="payment-page__oncity-strip-logo" src="{{ "images/payment-logos/Mercado_Pago.svg.webp" | static_url }}" alt="Mercado Pago" width="220" height="80" loading="lazy">
						<img class="payment-page__oncity-strip-logo" src="{{ "images/payment-logos/logo-American-Express.png" | static_url }}" alt="American Express" width="220" height="80" loading="lazy">
					</div>
					<div class="payment-page__oncity-tiers" aria-label="Promociones vigentes de OnCity">
						<div class="payment-page__oncity-tier" data-oncity-tier="3" hidden>
							<div class="payment-page__oncity-tier-heading">
								<h3>Beneficios destacados</h3>
								<span>Vigentes en abril</span>
							</div>
							<div class="payment-page__oncity-card-grid">
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/oncity_logo.png" | static_url }}" alt="OnCity" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 3x</strong>
									<h4>Entidades bancarias</h4>
									<p>Cuotas sin interés en OnCity.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/NaranjaX-logo.svg.png" | static_url }}" alt="NaranjaX" width="220" height="80" loading="lazy">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/image-16.png" | static_url }}" alt="Macro" width="220" height="80" loading="lazy">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/Mercado_Pago.svg.webp" | static_url }}" alt="Mercado Pago" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 6x</strong>
									<h4>Alianzas destacadas</h4>
									<p>Cuotas sin interés con bancos, tarjetas y Mercado Pago.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/oncity_logo.png" | static_url }}" alt="OnCity" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">6x + 10%</strong>
									<h4>Banco Municipal Rosario</h4>
									<p>Reintegro sin tope informado por OnCity.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/Banco-del-Sol.png" | static_url }}" alt="Banco del Sol" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 12x</strong>
									<h4>Banco del Sol</h4>
									<p>Cuotas sin interés en OnCity.</p>
								</article>
							</div>
						</div>

						<div class="payment-page__oncity-tier" data-oncity-tier="6" hidden>
							<div class="payment-page__oncity-tier-heading">
								<h3>Beneficios destacados</h3>
								<span>Vigentes en abril</span>
							</div>
							<div class="payment-page__oncity-card-grid">
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/oncity_logo.png" | static_url }}" alt="OnCity" width="220" height="80" loading="lazy">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/logo-American-Express.png" | static_url }}" alt="American Express" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 6x</strong>
									<h4>Entidades bancarias y Amex</h4>
									<p>Cuotas sin interés en OnCity.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/image-16.png" | static_url }}" alt="Macro" width="220" height="80" loading="lazy">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/Mercado_Pago.svg.webp" | static_url }}" alt="Mercado Pago" width="220" height="80" loading="lazy">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/logo-American-Express.png" | static_url }}" alt="American Express" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 9x</strong>
									<h4>Alianzas destacadas</h4>
									<p>Cabal, BBVA, Macro, Galicia, Amex, Santander, Cencosud, Credicoop y Mercado Pago.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/NaranjaX-logo.svg.png" | static_url }}" alt="NaranjaX" width="220" height="80" loading="lazy">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/banconacion_logo.png" | static_url }}" alt="Banco Nación" width="220" height="80" loading="lazy">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/Banco-del-Sol.png" | static_url }}" alt="Banco del Sol" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">10x, 15x y 18x</strong>
									<h4>NaranjaX, Nación y Banco del Sol</h4>
									<p>Más cuotas sin interés según alianza OnCity.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/oncity_logo.png" | static_url }}" alt="OnCity" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">12x y 6x + 10%</strong>
									<h4>Bancos regionales</h4>
									<p>12 cuotas regionales y 6x + 10% con Banco Municipal Rosario.</p>
								</article>
							</div>
						</div>

						<div class="payment-page__oncity-tier" data-oncity-tier="9" hidden>
							<div class="payment-page__oncity-tier-heading">
								<h3>Beneficios destacados</h3>
								<span>Vigentes en abril</span>
							</div>
							<div class="payment-page__oncity-card-grid">
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/oncity_logo.png" | static_url }}" alt="OnCity" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 9x</strong>
									<h4>Entidades bancarias</h4>
									<p>Cuotas sin interés en OnCity.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/Mercado_Pago.svg.webp" | static_url }}" alt="Mercado Pago" width="220" height="80" loading="lazy">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/image-16.png" | static_url }}" alt="Macro" width="220" height="80" loading="lazy">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/logo-American-Express.png" | static_url }}" alt="American Express" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 12x</strong>
									<h4>Mercado Pago y alianzas</h4>
									<p>Cencosud, Cabal, BBVA, Macro, Amex, Hipotecario, Galicia, Credicoop y Santander.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/banconacion_logo.png" | static_url }}" alt="Banco Nación" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 20x</strong>
									<h4>Banco Nación</h4>
									<p>Cuotas sin interés en OnCity.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/Banco-del-Sol.png" | static_url }}" alt="Banco del Sol" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 24x</strong>
									<h4>Banco del Sol</h4>
									<p>Cuotas sin interés en OnCity.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/NaranjaX-logo.svg.png" | static_url }}" alt="NaranjaX" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 14x</strong>
									<h4>NaranjaX</h4>
									<p>Cuotas sin interés en OnCity.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/logo-American-Express.png" | static_url }}" alt="American Express" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 9x</strong>
									<h4>Amex</h4>
									<p>Cuotas sin interés en OnCity.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/oncity_logo.png" | static_url }}" alt="OnCity" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">12x y 6x + 10%</strong>
									<h4>Bancos regionales</h4>
									<p>12 cuotas regionales y 6x + 10% con Banco Municipal Rosario.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-14" data-oncity-end="2026-04-20" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/image-16.png" | static_url }}" alt="Macro" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 15x</strong>
									<h4>Macro</h4>
									<p>Vigente en OnCity del 14/04 al 20/04.</p>
								</article>
							</div>
						</div>

						<div class="payment-page__oncity-tier" data-oncity-tier="12" hidden>
							<div class="payment-page__oncity-tier-heading">
								<h3>Beneficios destacados</h3>
								<span>Vigentes en abril</span>
							</div>
							<div class="payment-page__oncity-card-grid">
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/oncity_logo.png" | static_url }}" alt="OnCity" width="220" height="80" loading="lazy">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/Mercado_Pago.svg.webp" | static_url }}" alt="Mercado Pago" width="220" height="80" loading="lazy">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/logo-American-Express.png" | static_url }}" alt="American Express" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 12x</strong>
									<h4>Entidades, Mercado Pago y Amex</h4>
									<p>Cuotas sin interés en OnCity.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/banconacion_logo.png" | static_url }}" alt="Banco Nación" width="220" height="80" loading="lazy">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/Banco-del-Sol.png" | static_url }}" alt="Banco del Sol" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">20x y 24x</strong>
									<h4>Nación y Banco del Sol</h4>
									<p>Cuotas sin interés en OnCity.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/NaranjaX-logo.svg.png" | static_url }}" alt="NaranjaX" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 14x</strong>
									<h4>NaranjaX</h4>
									<p>Cuotas sin interés en OnCity.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-01" data-oncity-end="2026-04-30" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/oncity_logo.png" | static_url }}" alt="OnCity" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">18x y 6x + 10%</strong>
									<h4>Credicoop y bancos regionales</h4>
									<p>Incluye 12 cuotas regionales y 6x + 10% con Banco Municipal Rosario.</p>
								</article>
								<article class="payment-page__oncity-card" data-oncity-item data-oncity-start="2026-04-14" data-oncity-end="2026-04-20" hidden>
									<div class="payment-page__oncity-card-logos">
										<img class="payment-page__oncity-logo" src="{{ "images/payment-logos/image-16.png" | static_url }}" alt="Macro" width="220" height="80" loading="lazy">
									</div>
									<strong class="payment-page__oncity-installments">Hasta 18x</strong>
									<h4>Macro</h4>
									<p>Vigente en OnCity del 14/04 al 20/04.</p>
								</article>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="payment-page__section">
		<div class="container payment-page__container">
			<div class="payment-page__quick-grid" aria-label="Beneficios permanentes">
				<article class="payment-page__benefit-card payment-page__benefit-card--featured">
					<p class="payment-page__card-kicker">Transferencia bancaria</p>
					<h2>5% off</h2>
					<p>Elegí “Transferencia bancaria” en el checkout y el descuento se aplica automáticamente en el total.</p>
				</article>
				<article class="payment-page__benefit-card">
					<p class="payment-page__card-kicker">Efectivo / USD</p>
					<h2>10% off</h2>
					<p>Disponible para retiros en persona. Aceptamos ARS y USD; si pagás en USD, escribinos para consultar la cotización.</p>
				</article>
				<article class="payment-page__benefit-card">
					<p class="payment-page__card-kicker">Visa / Mastercard bancarias</p>
					<h2><span data-payment-installments-value data-payment-installments-base="3">3</span> cuotas sin interés</h2>
					<p><span data-payment-installments-scope data-payment-installments-scope-template="Durante la promo vigente, aplica en {scope}. " hidden></span>No incluye American Express ni Tarjeta Naranja. Otras tarjetas pueden tener cuotas y costos independientes.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="payment-page__methods">
		<div class="container payment-page__container">
			<div class="payment-page__section-heading">
				<p class="payment-page__eyebrow">Opciones disponibles</p>
				<h2>Cómo podés pagar</h2>
				<p>Estos medios están disponibles según el checkout, el canal de venta y la forma de entrega elegida.</p>
			</div>
			<div class="payment-page__method-grid" aria-label="Medios de pago aceptados">
				<article class="payment-page__method-card">
					<span class="payment-page__icon" aria-hidden="true">{% include "snipplets/svg/credit-card.tpl" with {svg_custom_class: "payment-page__icon-svg"} %}</span>
					<h3>Tarjeta de crédito o débito</h3>
					<p>Aceptamos Visa, Mastercard, American Express, Tarjeta Naranja, Cabal y otras tarjetas. Las condiciones se informan en el checkout.</p>
				</article>
				<article class="payment-page__method-card">
					<span class="payment-page__icon" aria-hidden="true">{% include "snipplets/svg/cash.tpl" with {svg_custom_class: "payment-page__icon-svg"} %}</span>
					<h3>Transferencia bancaria</h3>
					<p>5% de descuento automático al elegir transferencia en el checkout.</p>
				</article>
				<article class="payment-page__method-card">
					<span class="payment-page__icon" aria-hidden="true">{% include "snipplets/svg/usd-circle.tpl" with {svg_custom_class: "payment-page__icon-svg"} %}</span>
					<h3>Efectivo / USD</h3>
					<p>10% de descuento automático, solo para pedidos con retiro en tienda.</p>
				</article>
				<article class="payment-page__method-card">
					<span class="payment-page__icon" aria-hidden="true">{% include "snipplets/svg/check-circle.tpl" with {svg_custom_class: "payment-page__icon-svg"} %}</span>
					<h3>MercadoPago</h3>
					<p>Podés pagar con los medios cargados en tu cuenta. Las cuotas, tasas y promociones pueden cambiar y se muestran antes de confirmar.</p>
				</article>
				<article class="payment-page__method-card">
					<span class="payment-page__icon" aria-hidden="true">{% include "snipplets/svg/promotions.tpl" with {svg_custom_class: "payment-page__icon-svg"} %}</span>
					<h3>MercadoCrédito</h3>
					<p>Disponible según aprobación, tasas y plazos definidos por MercadoPago para tu cuenta.</p>
				</article>
				<article class="payment-page__method-card">
					<span class="payment-page__icon" aria-hidden="true">{% include "snipplets/svg/store.tpl" with {svg_custom_class: "payment-page__icon-svg"} %}</span>
					<h3>Rapipago / Pago Fácil</h3>
					<p>Pago en efectivo en redes de cobranza. La acreditación depende del operador.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="payment-page__installments">
		<div class="container payment-page__container">
			<div class="payment-page__section-heading">
				<p class="payment-page__eyebrow">Cuotas</p>
				<h2>Qué tener en cuenta al financiar</h2>
				<p>Las cuotas con interés y las tasas pueden cambiar mes a mes. El monto final se informa en el checkout o en MercadoPago antes de confirmar el pago.</p>
			</div>
			<div class="payment-page__installments-grid" aria-label="Planes y condiciones de cuotas">
				<article class="payment-page__installment-card payment-page__installment-card--free">
					<span>Visa / Mastercard</span>
					<h3><span data-payment-installments-value data-payment-installments-base="3">3</span> cuotas</h3>
					<strong>Sin interés</strong>
					<p>Solo con tarjetas Visa y Mastercard bancarias<span data-payment-installments-scope data-payment-installments-scope-template=" en {scope}" hidden></span>.</p>
				</article>
				<article class="payment-page__installment-card">
					<span>Otras cuotas</span>
					<h3>Ver en checkout</h3>
					<strong>Tasas variables</strong>
					<p>El recargo se calcula y se muestra antes de confirmar la compra.</p>
				</article>
				<article class="payment-page__installment-card">
					<span>MercadoPago</span>
					<h3>Según tu cuenta</h3>
					<strong>Condiciones propias</strong>
					<p>Puede ofrecer cuotas, promociones o financiación según el medio elegido.</p>
				</article>
				<article class="payment-page__installment-card">
					<span>AmEx / Naranja / Cabal</span>
					<h3>Aceptadas</h3>
					<strong>Sin plan base</strong>
					<p>No entran en los planes sin interés. Revisá condiciones disponibles en checkout.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="payment-page__notice">
		<div class="container payment-page__container">
			<div class="payment-page__section-heading">
				<h2>Importante antes de pagar</h2>
			</div>
			<div class="payment-page__notice-grid">
				<article>
					<h3>Descuentos automáticos</h3>
					<p>El 5% por transferencia y el 10% por efectivo se aplican al elegir ese medio en el checkout.</p>
				</article>
				<article>
					<h3>Sin interés acotado</h3>
					<p>Los planes sin interés aplican a Visa y Mastercard bancarias. No incluyen American Express ni Tarjeta Naranja.</p>
				</article>
				<article>
					<h3>Financiación variable</h3>
					<p>Las cuotas con interés, MercadoCrédito y promociones de billeteras dependen del proveedor de pago y pueden cambiar.</p>
				</article>
				<article>
					<h3>Facturación</h3>
					<p>Emitimos Factura A o B. Para Factura A, completá CUIT y condición frente a IVA.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="payment-page__section">
		<div class="container payment-page__container">
			<div class="payment-page__section-heading">
				<h2>Preguntas rápidas</h2>
			</div>
			<div class="payment-page__faq-grid">
				<article class="payment-page__faq-card">
					<h3>¿Puedo pagar en dólares?</h3>
					<p>Sí, podés pagar en USD en efectivo o por transferencia. Escribinos por WhatsApp para consultar la cotización.</p>
				</article>
				<article class="payment-page__faq-card">
					<h3>¿Aceptan PayPal, Wise o crypto?</h3>
					<p>Sí, podemos coordinar opciones especiales como PayPal, Wise o criptomonedas por WhatsApp.</p>
				</article>
				<article class="payment-page__faq-card">
					<h3>¿Qué tarjetas tienen cuotas sin interés?</h3>
					<p>Las <span data-payment-installments-value data-payment-installments-base="3">3</span> cuotas sin interés aplican a Visa y Mastercard bancarias<span data-payment-installments-scope data-payment-installments-scope-template=" en {scope}" hidden></span>. No incluye American Express ni Tarjeta Naranja.</p>
				</article>
				<article class="payment-page__faq-card">
					<h3>¿Aceptan American Express, Naranja y Cabal?</h3>
					<p>Sí, las aceptamos, pero tienen cuotas, costos y condiciones independientes que se informan en el checkout.</p>
				</article>
				<article class="payment-page__faq-card">
					<h3>¿Cómo aplico el descuento por transferencia?</h3>
					<p>Seleccioná “Transferencia bancaria” en el checkout. El descuento se aplica automáticamente en el total.</p>
				</article>
				<article class="payment-page__faq-card">
					<h3>¿Cómo se hacen los reembolsos?</h3>
					<p>El reembolso se realiza por el mismo medio de pago. La acreditación puede demorar de 3 a 10 días hábiles según el emisor.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="payment-page__cta">
		<div class="container payment-page__container">
			<div class="payment-page__cta-layout">
				<div>
					<h2>¿Tenés dudas sobre una promo o una forma de pago?</h2>
					<p>Escribinos antes de comprar y te ayudamos a revisar cuotas, descuentos, cotización en USD o medios de pago especiales.</p>
				</div>
				<a class="payment-page__button" href="{{ payment_contact_url }}" data-payment-chat-cta>Consultar medios de pago</a>
			</div>
		</div>
	</section>
</main>
