{% set payment_contact_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "contact_url" }) | trim %}
{% set payment_products_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "products_url" }) | trim %}
{% set oncity_url = include("snipplets/custom-pages/business-facts.tpl", { mode: "oncity_url" }) | trim %}

<main class="payment-page" data-store="payment-page" data-cro-page="payment" data-cro-content-group="commercial_information">
	<section class="payment-page__intro">
		<div class="container payment-page__container">
			<div class="payment-page__intro-layout">
				<div class="payment-page__intro-copy">
					<p class="payment-page__eyebrow">Medios de pago</p>
					<h1 class="payment-page__title">Eleg&iacute; c&oacute;mo pagar con condiciones claras</h1>
					<p class="payment-page__lead">Compar&aacute; las tres alternativas principales y revis&aacute; el importe final antes de confirmar. El carrito y el checkout son la fuente definitiva para descuentos, cuotas, tasas y elegibilidad.</p>
				</div>
				<div class="payment-page__intro-summary" aria-label="Tres decisiones de pago">
					<div class="payment-page__summary-row"><span>Buscar menor precio</span><strong>Transferencia o pago coordinado</strong></div>
					<div class="payment-page__summary-row"><span>Financiar sin inter&eacute;s</span><strong>Cuando el checkout lo ofrezca</strong></div>
					<div class="payment-page__summary-row"><span>Ver m&aacute;s cuotas</span><strong>Condiciones visibles antes de pagar</strong></div>
				</div>
			</div>
		</div>
	</section>

	<section class="payment-page__section">
		<div class="container payment-page__container">
			<div class="payment-page__section-heading">
				<p class="payment-page__eyebrow">Eleg&iacute; tu prioridad</p>
				<h2>Tres caminos para decidir r&aacute;pido</h2>
				<p>No mostramos porcentajes ni cantidad de cuotas fijas fuera del checkout para evitar diferencias con el total vigente.</p>
			</div>
			<div class="payment-page__quick-grid" aria-label="Alternativas principales de pago">
				<article class="payment-page__benefit-card payment-page__benefit-card--featured">
					<p class="payment-page__card-kicker">Menor precio</p>
					<h2>Transferencia o pago coordinado</h2>
					<p>Eleg&iacute; el medio disponible en checkout y confirm&aacute; que el descuento aparezca aplicado en el total antes de finalizar.</p>
				</article>
				<article class="payment-page__benefit-card">
					<p class="payment-page__card-kicker">Sin inter&eacute;s</p>
					<h2>Tarjetas elegibles</h2>
					<p>Si hay un plan sin inter&eacute;s disponible para tu tarjeta y producto, lo vas a ver junto al importe de cada cuota.</p>
				</article>
				<article class="payment-page__benefit-card">
					<p class="payment-page__card-kicker">M&aacute;s alternativas</p>
					<h2>Cuotas y proveedores</h2>
					<p>Las tasas, plazos y condiciones dependen del proveedor y se informan antes de confirmar el pago.</p>
				</article>
			</div>
		</div>
	</section>

	<section class="payment-page__methods">
		<div class="container payment-page__container">
			<div class="payment-page__section-heading">
				<p class="payment-page__eyebrow">Informaci&oacute;n secundaria</p>
				<h2>Detalles de medios y condiciones</h2>
				<p>Abr&iacute; solamente la informaci&oacute;n que necesit&aacute;s.</p>
			</div>
			<div class="payment-page__disclosures">
				<details class="payment-page__disclosure">
					<summary>Tarjetas de cr&eacute;dito y d&eacute;bito</summary>
					<div><p>Las marcas, cuotas y costos disponibles pueden variar por tarjeta, banco, producto y momento de compra. Revis&aacute; el detalle que muestra el checkout antes de confirmar.</p></div>
				</details>
				<details class="payment-page__disclosure">
					<summary>Transferencia y pagos coordinados</summary>
					<div><p>Si el medio tiene un descuento vigente, debe aparecer en el total del checkout. Para efectivo, moneda extranjera u otra modalidad no publicada, consultanos antes de generar el pedido.</p></div>
				</details>
				<details class="payment-page__disclosure">
					<summary>Mercado Pago y financiaci&oacute;n de terceros</summary>
					<div><p>La disponibilidad, aprobaci&oacute;n, tasa y cantidad de cuotas dependen del proveedor y de tu cuenta. La condici&oacute;n v&aacute;lida es la que ves antes de pagar.</p></div>
				</details>
				<details class="payment-page__disclosure">
					<summary>Facturaci&oacute;n</summary>
					<div><p>Emitimos el comprobante correspondiente a la operaci&oacute;n. Complet&aacute; correctamente los datos de facturaci&oacute;n durante la compra y escribinos antes de pagar si necesit&aacute;s revisarlos.</p></div>
				</details>
			</div>
		</div>
	</section>

	<section class="payment-page__notice">
		<div class="container payment-page__container">
			<div class="payment-page__section-heading"><h2>Antes de confirmar</h2></div>
			<div class="payment-page__notice-grid">
				<article><h3>Revis&aacute; el total</h3><p>El importe final debe incluir cualquier descuento, recargo o costo financiero aplicable.</p></article>
				<article><h3>Revis&aacute; las cuotas</h3><p>Confirm&aacute; cantidad, importe individual y costo total antes de ingresar los datos de pago.</p></article>
				<article><h3>Verific&aacute; el medio</h3><p>La disponibilidad puede variar seg&uacute;n producto, tarjeta, banco o proveedor.</p></article>
				<article><h3>Consult&aacute; si no coincide</h3><p>Si una condici&oacute;n no aparece en checkout, no la des por aplicada: escribinos antes de pagar.</p></article>
			</div>
		</div>
	</section>

	<section class="payment-page__section">
		<div class="container payment-page__container">
			<div class="payment-page__section-heading"><h2>Preguntas frecuentes</h2></div>
			<div class="payment-page__disclosures">
				<details class="payment-page__disclosure">
					<summary>&iquest;C&oacute;mo s&eacute; si una cuota es sin inter&eacute;s?</summary>
					<div><p>El checkout debe indicarlo de forma expresa y mostrar el mismo total financiado que corresponde a la compra. Si no lo indica, consultanos.</p></div>
				</details>
				<details class="payment-page__disclosure">
					<summary>&iquest;C&oacute;mo confirmo un descuento?</summary>
					<div><p>Seleccion&aacute; el medio y verific&aacute; el total actualizado antes de finalizar. Una comunicaci&oacute;n anterior no reemplaza el importe vigente del checkout.</p></div>
				</details>
				<details class="payment-page__disclosure">
					<summary>&iquest;Qu&eacute; pasa con un reembolso?</summary>
					<div><p>La devoluci&oacute;n se gestiona seg&uacute;n el medio utilizado y los plazos de acreditaci&oacute;n de su proveedor. Te informaremos el estado de la gesti&oacute;n.</p></div>
				</details>
			</div>
		</div>
	</section>

	<section class="payment-page__cta">
		<div class="container payment-page__container">
			<div class="payment-page__cta-layout">
				<div>
					<h2>&iquest;Necesit&aacute;s comparar una forma de pago?</h2>
					<p>Consultanos antes de confirmar o volv&eacute; al cat&aacute;logo para revisar el total vigente de un producto.</p>
				</div>
				<div class="payment-page__cta-actions">
					<a class="payment-page__button" href="{{ payment_contact_url }}" data-custom-chat-cta data-cro-cta="open_chat" data-cro-location="footer" data-cro-action="contact" data-cro-channel="chat">Consultar medios de pago</a>
					<a class="payment-page__button payment-page__button--ghost" href="{{ payment_products_url }}" data-custom-return-link data-custom-return-label="Volver al producto" data-cro-cta="view_catalog" data-cro-location="footer" data-cro-action="navigate" data-cro-channel="web">Ver productos</a>
				</div>
			</div>
			<p class="payment-page__secondary-marketplace"><a href="{{ oncity_url }}" target="_blank" rel="noopener noreferrer" data-cro-cta="open_oncity" data-cro-location="footer" data-cro-action="navigate" data-cro-channel="marketplace">Consultar condiciones actuales en OnCity</a>. Es una tienda externa y sus condiciones finales pueden ser distintas.</p>
		</div>
	</section>
</main>
