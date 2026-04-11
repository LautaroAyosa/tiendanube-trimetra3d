{% set review_name = review.name | default('') %}
{% set review_text = review.text | default('') %}
{% set review_rating = review.rating | default(0) %}
{% set review_context = review.context | default('') %}
{% set review_source_label = review.source_label | default('') %}
{% set review_date_label = review.date_label | default('') %}
{% set review_product_name = review.product_name | default('') %}
{% set review_product_url = review.product_url | default('') %}
{% set review_verification_type = review.verification_type | default('none') %}
{% set review_avatar = review.avatar_image | default('') %}
{% set review_media = review.media_image | default('') %}
{% set review_body_id = reviews_id ~ '-review-copy-' ~ review_index %}

{% if review_avatar and '://' not in review_avatar and review_avatar | slice(0, 2) != '//' %}
    {% set review_avatar = review_avatar | static_url %}
{% endif %}

{% if review_media and '://' not in review_media and review_media | slice(0, 2) != '//' %}
    {% set review_media = review_media | static_url %}
{% endif %}

{% set verification_label = '' %}
{% if review_verification_type == 'purchase' %}
    {% set verification_label = 'Compra verificada' %}
{% elseif review_verification_type == 'customer' %}
    {% set verification_label = 'Cliente verificado' %}
{% endif %}

<article class="review-card js-review-card{% if review.highlight | default(false) %} review-card-highlight{% endif %}">
    <div class="review-card-head">
        <div class="review-card-avatar">
            {% if review_avatar %}
                <img src="{{ review_avatar }}" alt="{% if review_name %}{{ review_name }}{% else %}Cliente de {{ store.name }}{% endif %}" loading="lazy" />
            {% else %}
                <span class="review-card-avatar-fallback">{{ review_name ? review_name | slice(0, 1) | upper : 'C' }}</span>
            {% endif %}
        </div>

        <div class="review-card-head-content">
            {% if review_rating %}
                <div class="review-card-rating" aria-label="Calificacion {{ review_rating }} de 5">
                    <span class="review-card-rating-stars">
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
    </div>

    {% if verification_label or review_source_label or review_date_label %}
        <ul class="review-card-meta list">
            {% if verification_label %}
                <li class="review-card-chip review-card-chip-verified">
                    {% include "snipplets/svg/check-circle-filled.tpl" with {svg_custom_class: "icon-inline icon-xs svg-icon-accent"} %}
                    <span>{{ verification_label }}</span>
                </li>
            {% endif %}

            {% if review_source_label %}
                <li class="review-card-chip">{{ review_source_label }}</li>
            {% endif %}

            {% if review_date_label %}
                <li class="review-card-date">{{ review_date_label }}</li>
            {% endif %}
        </ul>
    {% endif %}

    {% if review_media %}
        <div class="review-card-media">
            <img src="{{ review_media }}" alt="{% if review_product_name %}{{ review_product_name }}{% elseif review_name %}{{ review_name }}{% else %}Review visual{% endif %}" loading="lazy" />
        </div>
    {% endif %}

    {% if review_text %}
        <div class="review-card-copy">
            <div id="{{ review_body_id }}" class="review-card-text js-review-text">{{ review_text }}</div>
            <button type="button" class="review-card-more js-review-more" aria-controls="{{ review_body_id }}" aria-expanded="false" data-more-label="Ver mas" data-less-label="Ver menos">
                Ver mas
            </button>
        </div>
    {% endif %}

    {% if review_product_name %}
        <div class="review-card-product">
            <span class="review-card-product-label">Compro:</span>
            {% if review_product_url %}
                <a href="{{ review_product_url }}" class="review-card-product-link">{{ review_product_name }}</a>
            {% else %}
                <span class="review-card-product-name">{{ review_product_name }}</span>
            {% endif %}
        </div>
    {% endif %}
</article>
