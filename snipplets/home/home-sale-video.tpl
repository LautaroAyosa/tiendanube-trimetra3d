{% set sale_video_products = sections.sale.products | default([]) %}
{% set sale_video_file = settings.sale_video_file | trim %}

{% if sale_video_file and sale_video_products %}
	{% set sale_video_src = '://' in sale_video_file ? sale_video_file : sale_video_file | static_url %}
	{% set sale_video_type = '.webm' in sale_video_file ? 'video/webm' : 'video/mp4' %}
	{% set sale_video_poster = 'sale_video_image.jpg' | has_custom_image %}
	{% set section_slider = true %}

	<section class="js-section-products-sale-video section-sale-video-home{% if settings.sale_product_colors %} section-sale-products-home-colors{% endif %}" data-store="home-products-sale-video" data-transition="fade-in-up">
		<div class="container">
			<div class="sale-video-shell">
				<div class="sale-video-media">
					<div class="sale-video-frame">
						<video
							class="js-sale-video sale-video-player"
							controls
							playsinline
							preload="metadata"
							{% if settings.sale_video_autoplay %}muted data-autoplay="true"{% endif %}
							{% if settings.sale_video_loop %}loop{% endif %}
							{% if sale_video_poster %}poster="{{ 'sale_video_image.jpg' | static_url | settings_image_url('large') }}"{% endif %}
							aria-label="{{ settings.sale_video_title | default('Video de productos en oferta') }}">
							<source src="{{ sale_video_src }}" type="{{ sale_video_type }}">
							{{ 'Tu navegador no puede reproducir este video.' | translate }}
						</video>
					</div>
				</div>

				<div class="sale-video-products">
					<div class="sale-video-heading">
						<div class="sale-video-heading-copy">
							{% if settings.sale_video_kicker %}
								<div class="sale-video-kicker">{{ settings.sale_video_kicker }}</div>
							{% endif %}
							<h2 class="sale-video-title h3">{{ settings.sale_video_title | default('Ofertas') }}</h2>
						</div>

						{% if sale_video_products | length > 1 %}
							<div class="sale-video-controls">
								<button type="button" class="js-swiper-sale-video-prev swiper-button-prev sale-video-control svg-icon-text" aria-label="{{ 'Producto anterior' | translate }}">
									{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}
								</button>
								<button type="button" class="js-swiper-sale-video-next swiper-button-next sale-video-control svg-icon-text" aria-label="{{ 'Producto siguiente' | translate }}">
									{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}
								</button>
							</div>
						{% endif %}
					</div>

					<div class="sale-video-carousel">
						<div class="js-swiper-sale-video swiper-container p-1">
							<div class="swiper-wrapper">
								{% for product in sale_video_products %}
									{% include 'snipplets/grid/item.tpl' with {
										slide_item: true,
										section_name: 'sale',
										section_columns_desktop: 4,
										section_columns_mobile: 2
									} %}
								{% endfor %}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
{% endif %}
