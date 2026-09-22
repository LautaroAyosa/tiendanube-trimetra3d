{% set custom_page_handle = page.handle | default('') %}
{% set custom_page_is_custom = include('snipplets/custom-pages/page-context.tpl', { mode: 'is_custom', custom_page_handle: custom_page_handle }) | trim == 'true' %}
{% set custom_page_key = include('snipplets/custom-pages/page-context.tpl', { mode: 'page_key', custom_page_handle: custom_page_handle }) | trim %}
{% set custom_page_template = include('snipplets/custom-pages/page-context.tpl', { mode: 'template', custom_page_handle: custom_page_handle }) | trim %}
{% set custom_page_campaign_state = include('snipplets/custom-pages/page-context.tpl', { mode: 'campaign_state', custom_page_handle: custom_page_handle }) | trim %}
{% set custom_page_redirect_path = include('snipplets/custom-pages/page-context.tpl', { mode: 'redirect_path', custom_page_handle: custom_page_handle }) | trim %}

{% if custom_page_redirect_path %}
	<main class="custom-page custom-page--redirect" data-cro-page="{{ custom_page_key }}" data-campaign-state="{{ custom_page_campaign_state }}">
		<div class="container custom-page__container custom-page__status" role="status">
			<h1>Esta p&aacute;gina cambi&oacute; de direcci&oacute;n</h1>
			<p>Te estamos llevando a la p&aacute;gina vigente.</p>
			<a class="custom-page__button" href="{{ custom_page_redirect_path }}" data-cro-cta="redirect_continue" data-cro-location="redirect_state" data-cro-action="navigate" data-cro-channel="web">Continuar</a>
		</div>
	</main>
	<script>
		window.location.replace('{{ custom_page_redirect_path | escape('js') }}');
	</script>
{% elseif custom_page_is_custom and custom_page_template %}
	{% include custom_page_template %}
{% else %}
	{% embed "snipplets/page-header.tpl" %}
		{% block page_header_text %}{{ page.name }}{% endblock page_header_text %}
	{% endembed %}

	{# Pagina institucional administrada desde Tiendanube. #}

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
