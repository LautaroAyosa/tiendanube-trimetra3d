{#
  Resuelve: adaptar settings del home al contrato reusable del bloque de reviews.
  Uso: seccion reviews del home y preview del admin.
  Variables: settings, params.preview.
  Estados: storefront con datos parciales o completos y preview aun sin contenido.
#}

{% set reviews_items = [] %}

{% for review_index in ['01', '02', '03', '04', '05', '06'] %}
    {% set avatar_original = 'reviews_' ~ review_index ~ '_avatar.jpg' %}
    {% set media_original = 'reviews_' ~ review_index ~ '_media.jpg' %}
    {% set avatar_image = '' %}
    {% set media_image = '' %}

    {% if avatar_original | has_custom_image %}
        {% set avatar_image = avatar_original | static_url | settings_image_url('small') %}
    {% endif %}

    {% if media_original | has_custom_image %}
        {% set media_image = media_original | static_url | settings_image_url('large') %}
    {% endif %}

    {% set reviews_items = reviews_items | merge([{
        name: attribute(settings, 'reviews_' ~ review_index ~ '_name'),
        text: attribute(settings, 'reviews_' ~ review_index ~ '_text'),
        rating: attribute(settings, 'reviews_' ~ review_index ~ '_rating'),
        avatar_image: avatar_image,
        media_image: media_image,
        context: attribute(settings, 'reviews_' ~ review_index ~ '_context'),
        verification_type: attribute(settings, 'reviews_' ~ review_index ~ '_verification_type') | default('none'),
        source_label: attribute(settings, 'reviews_' ~ review_index ~ '_source_label'),
        date_label: attribute(settings, 'reviews_' ~ review_index ~ '_date_label'),
        product_name: attribute(settings, 'reviews_' ~ review_index ~ '_product_name'),
        product_url: attribute(settings, 'reviews_' ~ review_index ~ '_product_url'),
        highlight: attribute(settings, 'reviews_' ~ review_index ~ '_highlight')
    }]) %}
{% endfor %}

{% include 'snipplets/reviews/reviews-block.tpl' with {
    reviews_id: 'home-reviews',
    reviews_title: settings.reviews_title,
    reviews_summary_score: settings.reviews_summary_score,
    reviews_summary_count: settings.reviews_summary_count,
    reviews_external_text: settings.reviews_external_text,
    reviews_external_url: settings.reviews_external_url,
    reviews_layout: settings.reviews_layout | default('mixed'),
    reviews_show_desktop_arrows: settings.reviews_show_desktop_arrows,
    reviews_items: reviews_items,
    reviews_preview: params.preview
} %}
