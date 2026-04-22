{% if settings.main_product_video_file and sections.featured.products %}
	{% if settings.main_product_type == 'random' %}
		{% set product_type = sections.featured.products | shuffle | take(1) %}
	{% else %}
		{% set product_type = sections.featured.products | take(1) %}
	{% endif %}

	{% set main_product_video_file = settings.main_product_video_file | trim %}
	{% set main_product_video_src = '://' in main_product_video_file ? main_product_video_file : main_product_video_file | static_url %}
	{% set main_product_video_type = '.webm' in main_product_video_file ? 'video/webm' : 'video/mp4' %}

	{% if main_product_video_src %}
		{% for product in product_type %}
			<section id="single-product" class="js-product-container section-main-product-home section-main-product-video-home" data-variants="{{ product.variants_object | json_encode }}" data-store="home-product-main-video" data-transition="fade-in">
				<div class="container">
					<div class="main-product-video-layout">
						<div class="main-product-video-product">
							<div class="row justify-content-md-center">
								<div class="col-md-11">
										<div class="row">
											<div class="col-md-7">
												{% include 'snipplets/product/product-image.tpl' with { home_main_product: true } %}
											</div>
											<div class="col" data-store="product-info-{{ product.id }}">
												{% include 'snipplets/product/product-form.tpl' with { home_main_product: true } %}
											</div>
										</div>
								</div>
							</div>
						</div>

						<div class="main-product-video-media">
							<div class="main-product-video-frame position-relative">
								{% if "main_product_video_image.jpg" | has_custom_image %}
									{% set main_product_video_image_static_url = "main_product_video_image.jpg" | static_url %}
								{% endif %}
								<video class="js-main-product-video main-product-video" controls muted playsinline preload="none"{% if main_product_video_image_static_url %} poster="{{ main_product_video_image_static_url | settings_image_url('large') }}"{% endif %}>
									<source src="{{ main_product_video_src }}" type="{{ main_product_video_type }}">
								</video>
							</div>
						</div>
					</div>
				</div>
			</section>
		{% endfor %}
	{% endif %}
{% endif %}
