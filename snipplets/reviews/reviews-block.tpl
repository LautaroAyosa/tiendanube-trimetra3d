{#
  Resuelve: mostrar un bloque reusable de reviews con resumen, layouts y CTA.
  Uso: home u otras plantillas via include manual.
  Variables: reviews_id, reviews_title, reviews_summary_score, reviews_summary_count,
  reviews_external_text, reviews_external_url, reviews_layout, reviews_show_desktop_arrows, reviews_items.
  Estados: vacio, grid, slider, mixed, cards con datos parciales, cards destacadas.
#}

{% set reviews_id = reviews_id | default('reviews-block') %}
{% set reviews_title = reviews_title | default('') %}
{% set reviews_summary_score = reviews_summary_score | default('') %}
{% set reviews_summary_count = reviews_summary_count | default('') %}
{% set reviews_external_text = reviews_external_text | default('') %}
{% set reviews_external_url = reviews_external_url | default('') %}
{% set reviews_layout = reviews_layout | default('mixed') %}
{% set reviews_show_desktop_arrows = reviews_show_desktop_arrows | default(false) %}
{% set reviews_items = reviews_items | default([]) %}

{% if reviews_layout not in ['grid', 'slider', 'mixed'] %}
    {% set reviews_layout = 'mixed' %}
{% endif %}

{% set visible_reviews = [] %}
{% for review in reviews_items %}
    {% set review_has_content = review.name or review.text or review.rating or review.context or review.product_name or review.avatar_image or review.media_image or review.source_label or review.date_label %}
    {% if review_has_content %}
        {% set visible_reviews = visible_reviews | merge([review]) %}
    {% endif %}
{% endfor %}

{% set reviews_count = visible_reviews | length %}
{% set reviews_has_slider = reviews_layout != 'grid' and reviews_count > 1 %}
{% set reviews_show_arrows = reviews_layout == 'slider' and reviews_show_desktop_arrows and reviews_count > 1 %}
{% set reviews_show_pagination = reviews_has_slider %}
{% set reviews_has_header = reviews_title or reviews_summary_score or reviews_summary_count or (reviews_external_text and reviews_external_url) %}

{% if reviews_count > 0 %}
    <section
        id="{{ reviews_id }}"
        class="section-reviews js-reviews-block reviews-layout-{{ reviews_layout }}{% if reviews_show_arrows %} reviews-has-desktop-arrows{% endif %}"
        data-reviews-id="{{ reviews_id }}"
        data-reviews-layout="{{ reviews_layout }}"
        data-reviews-count="{{ reviews_count }}"
        data-reviews-show-arrows="{{ reviews_show_arrows ? 'true' : 'false' }}">
        <div class="container">
            {% if reviews_has_header %}
                <header class="reviews-block-header">
                    {% if reviews_title %}
                        <div class="reviews-block-heading">
                            <h2 class="section-title h3 mb-0">{{ reviews_title }}</h2>
                        </div>
                    {% endif %}

                    {% if reviews_summary_score or reviews_summary_count or (reviews_external_text and reviews_external_url) %}
                        <div class="reviews-block-summary">
                            {% if reviews_summary_score or reviews_summary_count %}
                                <p class="reviews-block-summary-text">
                                    {% if reviews_summary_score %}
                                        <strong class="reviews-block-summary-score">{{ reviews_summary_score }}/5</strong>
                                    {% endif %}
                                    {% if reviews_summary_count %}
                                        <span class="reviews-block-summary-count">basado en {{ reviews_summary_count }} opiniones</span>
                                    {% endif %}
                                </p>
                            {% endif %}

                            {% if reviews_external_text and reviews_external_url %}
                                <a href="{{ reviews_external_url }}" class="reviews-block-external-link"{% if '://' in reviews_external_url or reviews_external_url | slice(0, 2) == '//' %} target="_blank" rel="noreferrer noopener"{% endif %}>
                                    <span>{{ reviews_external_text }}</span>
                                    {% include "snipplets/svg/arrow-right-long.tpl" with {svg_custom_class: "icon-inline icon-sm svg-icon-accent"} %}
                                </a>
                            {% endif %}
                        </div>
                    {% endif %}
                </header>
            {% endif %}

            <div class="reviews-block-body">
                <div class="reviews-slider-shell{% if reviews_has_slider %} js-reviews-swiper swiper-container{% endif %}">
                    <div class="reviews-track{% if reviews_has_slider %} swiper-wrapper{% endif %}">
                        {% for review in visible_reviews %}
                            <div class="reviews-item js-review-slide{% if reviews_has_slider %} swiper-slide{% endif %}{% if review.highlight | default(false) %} reviews-item-highlight{% endif %}">
                                {% include 'snipplets/reviews/review-card.tpl' with {
                                    review: review,
                                    reviews_id: reviews_id,
                                    review_index: loop.index
                                } %}
                            </div>
                        {% endfor %}
                    </div>
                </div>

                {% if reviews_show_arrows %}
                    <button type="button" class="js-reviews-prev reviews-slider-control reviews-slider-control-prev swiper-button-prev swiper-button-outside svg-icon-text" data-reviews-id="{{ reviews_id }}" aria-label="Reviews anteriores">
                        {% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}
                    </button>
                    <button type="button" class="js-reviews-next reviews-slider-control reviews-slider-control-next swiper-button-next swiper-button-outside svg-icon-text" data-reviews-id="{{ reviews_id }}" aria-label="Reviews siguientes">
                        {% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}
                    </button>
                {% endif %}
            </div>

            {% if reviews_show_pagination %}
                <div class="js-reviews-pagination reviews-slider-pagination swiper-pagination position-relative d-block" data-reviews-id="{{ reviews_id }}"></div>
            {% endif %}
        </div>
    </section>
{% endif %}
