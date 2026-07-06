{% set is_contact_hours_page = page.handle == 'contacto' or page.handle == 'contacto-y-horarios'%}
{% set is_warranty_page = page.handle == 'garantias-y-devoluciones' %}
{% set is_about_page = page.handle == 'quienes-somos' %}
{% set is_giveaway_page = page.handle == 'sorteo' %}
{% set is_pre_promo_page = page.handle == 'pre-promo' %}
{% set is_hot_days_page = page.handle == 'hot-days' or page.handle == 'pre-hot-sale' %}

{% if page.handle == 'envios' %}
	{% include 'snipplets/custom-shipping-page.tpl' %}
{% elseif page.handle == 'pagos' %}
	{% include 'snipplets/custom-payment-page.tpl' %}
{% elseif is_warranty_page %}
	{% include 'snipplets/custom-warranty-page.tpl' %}
{% elseif is_contact_hours_page %}
	{% include 'snipplets/custom-contact-hours-page.tpl' %}
{% elseif is_about_page %}
	{% include 'snipplets/custom-about-page.tpl' %}
{% elseif is_giveaway_page %}
	{% include 'snipplets/custom-giveaway-page.tpl' %}
{% elseif is_pre_promo_page %}
	{% include 'snipplets/custom-pre-promo-page.tpl' %}
{% elseif is_hot_days_page %}
	{% include 'snipplets/custom-hot-days-page.tpl' %}
{% else %}
	{% embed "snipplets/page-header.tpl" %}
		{% block page_header_text %}{{ page.name }}{% endblock page_header_text %}
	{% endembed %}

	{# Institutional page  #}

	<section class="user-content pb-5">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					{{ page.content }}
				</div>
			</div>
		</div>
	</section>
{% endif %}
