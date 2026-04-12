{#
  Resuelve: adaptar settings.reviews_* al bloque reusable de opiniones.
  Uso: home, paginas custom u otros templates que necesiten el dataset global.
  Variables opcionales: reviews_id, reviews_initial_limit, reviews_layout.
  Estados: datos parciales, imagen faltante, 0 opiniones.
#}

{% set reviews_settings_id = reviews_id | default('reviews-block') %}
{% set reviews_settings_layout = reviews_layout | default(settings.reviews_layout | default('mixed')) %}
{% set reviews_items = [] %}

{% for review_index in ['01', '02', '03', '04', '05', '06'] %}
    {% set image_original = 'reviews_' ~ review_index ~ '_image.jpg' %}
    {% set profile_image_original = 'reviews_' ~ review_index ~ '_profile_image.jpg' %}
    {% set review_image = '' %}
    {% set review_image_original = '' %}
    {% set review_profile_image = '' %}

    {% if image_original | has_custom_image %}
        {% set review_image = image_original | static_url | settings_image_url('large') %}
        {% set review_image_original = image_original | static_url | settings_image_url('original') %}
    {% endif %}

    {% if profile_image_original | has_custom_image %}
        {% set review_profile_image = profile_image_original | static_url | settings_image_url('small') %}
    {% endif %}

    {% set reviews_items = reviews_items | merge([{
        name: attribute(settings, 'reviews_' ~ review_index ~ '_name'),
        text: attribute(settings, 'reviews_' ~ review_index ~ '_text'),
        rating: attribute(settings, 'reviews_' ~ review_index ~ '_rating') | default(0),
        image: review_image,
        image_original: review_image_original,
        profile_image: review_profile_image,
        context: attribute(settings, 'reviews_' ~ review_index ~ '_context'),
        verification_type: attribute(settings, 'reviews_' ~ review_index ~ '_verification_type') | default('none'),
        source: attribute(settings, 'reviews_' ~ review_index ~ '_source') | default(''),
        source_label: attribute(settings, 'reviews_' ~ review_index ~ '_source_label'),
        date_label: attribute(settings, 'reviews_' ~ review_index ~ '_date_label'),
        product_name: attribute(settings, 'reviews_' ~ review_index ~ '_product_name'),
        product_url: attribute(settings, 'reviews_' ~ review_index ~ '_product_url'),
        highlight: attribute(settings, 'reviews_' ~ review_index ~ '_highlight')
    }]) %}
{% endfor %}

{% include 'snipplets/reviews/reviews-block.tpl' with {
    reviews_id: reviews_settings_id,
    reviews_title: settings.reviews_title,
    reviews_summary_score: settings.reviews_summary_score,
    reviews_summary_count: settings.reviews_summary_count,
    reviews_external_text: settings.reviews_external_text,
    reviews_external_url: settings.reviews_external_url,
    reviews_layout: reviews_settings_layout,
    reviews_show_desktop_arrows: settings.reviews_show_desktop_arrows,
    reviews_initial_limit: reviews_initial_limit | default(3),
    reviews_items: reviews_items
} %}
