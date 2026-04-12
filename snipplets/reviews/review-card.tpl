{#
  Resuelve: mostrar una opinion compacta y degradable.
  Uso: dentro de snipplets/reviews/reviews-block.tpl.
  Variables: review, reviews_id, review_index.
  Estados: con/sin rating, verificacion, imagen, texto largo o producto.
#}

{% set review_name = review.name | default('') %}
{% set review_text = review.text | default('') %}
{% set review_rating = review.rating | default(0) %}
{% set review_context = review.context | default('') %}
{% set review_source_label = review.source_label | default('') %}
{% set review_date_label = review.date_label | default('') %}
{% set review_product_name = review.product_name | default('') %}
{% set review_product_url = review.product_url | default('') %}
{% set review_verification_type = review.verification_type | default('none') %}
{% set review_source = review.source | default('') %}
{% set review_image = review.image | default('') %}
{% set review_image_original = review.image_original | default(review_image) %}
{% set review_profile_image = review.profile_image | default('') %}
{% set review_body_id = reviews_id ~ '-review-copy-' ~ review_index %}
{% set review_image_alt = review_product_name ? review_product_name : (review_name ? 'Opinion de ' ~ review_name : 'Opinion de cliente') %}

{% if review_image and '://' not in review_image and review_image | slice(0, 2) != '//' %}
    {% set review_image = review_image | static_url %}
{% endif %}

{% if review_image_original and '://' not in review_image_original and review_image_original | slice(0, 2) != '//' %}
    {% set review_image_original = review_image_original | static_url %}
{% endif %}

{% if review_profile_image and '://' not in review_profile_image and review_profile_image | slice(0, 2) != '//' %}
    {% set review_profile_image = review_profile_image | static_url %}
{% endif %}

{% set verification_label = '' %}
{% if review_verification_type == 'purchase' %}
    {% set verification_label = 'Compra verificada' %}
{% elseif review_verification_type == 'customer' %}
    {% set verification_label = 'Cliente verificado' %}
{% endif %}

{% set review_source_label_key = review_source_label | trim | lower %}
{% if not review_source or review_source == 'other' %}
    {% if review_source_label_key == 'google' %}
        {% set review_source = 'google' %}
    {% elseif review_source_label_key == 'tienda' %}
        {% set review_source = 'store' %}
    {% elseif review_source_label_key == 'mercado libre' %}
        {% set review_source = 'mercado_libre' %}
    {% elseif review_source_label_key == 'instagram' %}
        {% set review_source = 'instagram' %}
    {% elseif review_source_label_key == 'facebook' %}
        {% set review_source = 'facebook' %}
    {% endif %}
{% endif %}

{% set source_label = review_source_label %}
{% if review_source == 'google' %}
    {% set source_label = 'Google' %}
{% elseif review_source == 'store' %}
    {% set source_label = 'Tienda' %}
{% elseif review_source == 'mercado_libre' %}
    {% set source_label = 'Mercado Libre' %}
{% elseif review_source == 'instagram' %}
    {% set source_label = 'Instagram' %}
{% elseif review_source == 'facebook' %}
    {% set source_label = 'Facebook' %}
{% elseif review_source == 'other' and not review_source_label %}
    {% set source_label = '' %}
{% endif %}

<article class="review-card js-review-card{% if review.highlight | default(false) %} review-card-highlight{% endif %}">
    <div class="review-card-main">
        <header class="review-card-head">
            {% if review_profile_image %}
                <div class="review-card-avatar">
                    <img src="{{ review_profile_image }}" alt="{% if review_name %}{{ review_name }}{% else %}Cliente{% endif %}" loading="lazy" />
                </div>
            {% endif %}

            <div class="review-card-head-content">
                {% if review_rating %}
                    <div class="review-card-rating" aria-label="Calificacion {{ review_rating }} de 5">
                        <span class="review-card-rating-stars" aria-hidden="true">
                            {% for star in 1..5 %}
                                <span class="review-card-rating-star{% if review_rating >= star %} is-filled{% endif %}"></span>
                            {% endfor %}
                        </span>
                        <span class="review-card-rating-score">{{ review_rating }}/5</span>
                    </div>
                {% endif %}

                {% if review_name %}
                    <h3 class="review-card-name">{{ review_name }}</h3>
                {% endif %}

                {% if review_context %}
                    <p class="review-card-context">{{ review_context }}</p>
                {% endif %}
            </div>
        </header>

        {% if verification_label or source_label or review_date_label %}
            <ul class="review-card-meta list" aria-label="Datos de la opinion">
                {% if verification_label %}
                    <li class="review-card-chip review-card-chip-verified">
                        {% include "snipplets/svg/check-circle-filled.tpl" with {svg_custom_class: "icon-inline icon-xs svg-icon-accent"} %}
                        <span>{{ verification_label }}</span>
                    </li>
                {% endif %}

                {% if source_label %}
                    <li class="review-card-chip review-card-chip-source{% if review_source %} review-card-chip-source-{{ review_source }}{% endif %}">
                        {% if review_source == 'google' %}
                            {% include "snipplets/svg/google.tpl" with {svg_custom_class: "review-card-source-icon"} %}
                        {% elseif review_source == 'store' %}
                            {% include "snipplets/svg/store.tpl" with {svg_custom_class: "review-card-source-icon"} %}
                        {% elseif review_source == 'mercado_libre' %}
                            {% include "snipplets/svg/mercado-libre.tpl" with {svg_custom_class: "review-card-source-icon"} %}
                        {% elseif review_source == 'instagram' %}
                            {% include "snipplets/svg/instagram.tpl" with {svg_custom_class: "review-card-source-icon"} %}
                        {% elseif review_source == 'facebook' %}
                            {% include "snipplets/svg/facebook.tpl" %}
                        {% endif %}
                        <span>{{ source_label }}</span>
                    </li>
                {% endif %}

                {% if review_date_label %}
                    <li class="review-card-date">{{ review_date_label }}</li>
                {% endif %}
            </ul>
        {% endif %}

        {% if review_text %}
            <div class="review-card-copy">
                <p id="{{ review_body_id }}" class="review-card-text js-review-text">{{ review_text }}</p>
                <button type="button" class="review-card-more js-review-more" aria-controls="{{ review_body_id }}" aria-expanded="false" data-more-label="Ver m&aacute;s" data-less-label="Ver menos">
                    Ver m&aacute;s
                </button>
            </div>
        {% endif %}

        {% if review_product_name %}
            <div class="review-card-product">
                <span class="review-card-product-label">Compr&oacute;:</span>
                {% if review_product_url %}
                    <a href="{{ review_product_url }}" class="review-card-product-link">{{ review_product_name }}</a>
                {% else %}
                    <span class="review-card-product-name">{{ review_product_name }}</span>
                {% endif %}
            </div>
        {% endif %}
    </div>

    {% if review_image %}
        <figure class="review-card-image">
            <img src="{{ review_image }}" alt="{{ review_image_alt | escape('html_attr') }}" loading="lazy" />
        </figure>
    {% endif %}
</article>
