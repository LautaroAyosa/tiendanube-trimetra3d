{% set mobile = mobile | default(false) %}
{% set theme_editor = params.preview %}

{% set has_banners = settings.category_banner_fluid and settings.category_banner_fluid is not empty %}
{% set has_mobile_banners = settings.toggle_category_banner_fluid_mobile and settings.category_banner_fluid_mobile and settings.category_banner_fluid_mobile is not empty %}
{% set section_banner = mobile ? settings.category_banner_fluid_mobile : settings.category_banner_fluid %}
{% set section_title = settings.category_banner_fluid_title %}
{% set section_slider = settings.category_banner_fluid_slider %}
{% set section_without_margins = settings.category_banner_fluid_without_margins %}
{% set section_id = mobile ? 'category-banners-fluid-mobile' : 'category-banners-fluid' %}
{% set section_first = settings.home_order_position_1 == 'categories_fluid' %}

{% set section_columns_mobile_2 = settings.category_banner_fluid_columns_mobile == 2 %}
{% set section_columns_desktop_4 = settings.category_banner_fluid_columns_desktop == 4 %}
{% set section_columns_desktop_3 = settings.category_banner_fluid_columns_desktop == 3 %}
{% set section_columns_desktop_2 = settings.category_banner_fluid_columns_desktop == 2 %}
{% set section_columns_desktop_1 = settings.category_banner_fluid_columns_desktop == 1 or not settings.category_banner_fluid_columns_desktop %}

{% set visibility_classes =
    has_banners and has_mobile_banners ? (mobile ? 'd-md-none' : 'd-none d-md-block')
    : not has_banners and has_mobile_banners and not mobile ? 'd-none'
%}

{% if section_banner and section_banner is not empty or theme_editor %}
    <div class="js-{{ section_id }} category-banners-fluid-group{% if section_without_margins %} category-banners-fluid-no-margins{% endif %} {{ visibility_classes }}">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="section-title h3 mb-3"{% if not section_title %} style="display:none;"{% endif %}>{{ section_title }}</h2>
                </div>
            </div>
        </div>

        <div class="{% if section_without_margins %}container-fluid p-0 overflow-none{% else %}container{% endif %}">
            <div class="row">
                <div class="col-12{% if section_slider and not section_without_margins %} pr-0 pr-md-3{% endif %}">
                    {% if section_slider %}
                        <div class="js-swiper-{{ section_id }} swiper-container{% if not section_without_margins %} pb-1 pl-1{% endif %}">
                            <div class="category-banners-fluid-row swiper-wrapper">
                    {% else %}
                        <div class="category-banners-fluid-row row {% if section_without_margins %}no-gutters{% else %}px-2{% endif %}">
                    {% endif %}

                    {% for slide in section_banner %}
                        {% set apply_lazy_load =
                            not section_first
                            or not (
                                loop.first and (
                                    (has_banners and not has_mobile_banners) or
                                    (has_mobile_banners and mobile)
                                )
                            )
                        %}

                        {% if apply_lazy_load %}
                            {% set slide_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
                        {% else %}
                            {% set slide_src = slide.image | static_url | settings_image_url('large') %}
                        {% endif %}

                        <div class="category-banner-fluid-item {% if section_slider %}swiper-slide{% else %}col-grid {% if section_columns_mobile_2 %}col-6 {% endif %}{% if section_columns_desktop_4 %}col-md-3{% elseif section_columns_desktop_3 %}col-md-4{% elseif section_columns_desktop_2 %}col-md-6{% elseif section_columns_desktop_1 %}col-md-12{% endif %}{% endif %}">
                            {% if slide.link %}
                                <a href="{{ slide.link | setting_url }}" class="category-banner-fluid-link" aria-label="{% if slide.title %}{{ slide.title }}{% else %}Banner de categoria {{ loop.index }}{% endif %}">
                            {% else %}
                                <div class="category-banner-fluid-link">
                            {% endif %}
                                    <span class="category-banner-fluid-media">
                                        <img
                                            {% if not apply_lazy_load %}fetchpriority="high"{% endif %}
                                            {% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %}
                                            {% if apply_lazy_load %}data-{% endif %}src="{{ slide_src }}"
                                            {% if apply_lazy_load %}
                                                data-sizes="auto"
                                                data-expand="-10"
                                            {% endif %}
                                            {% if apply_lazy_load %}data-{% endif %}srcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w"
                                            class="category-banner-fluid-image {% if apply_lazy_load %}lazyautosizes lazyload fade-in{% endif %}"
                                            {% if slide.title %}alt="{{ slide.title }}"{% else %}alt="Banner de categoria {{ store.name }}"{% endif %}
                                        />
                                        {% if apply_lazy_load %}
                                            <span class="placeholder-fade placeholder-banner"></span>
                                        {% endif %}
                                    </span>
                            {% if slide.link %}
                                </a>
                            {% else %}
                                </div>
                            {% endif %}
                        </div>
                    {% endfor %}

                    {% if section_slider %}
                            </div>
                        </div>
                        {% if section_banner and section_banner is not empty or theme_editor %}
                            {% set section_arrows_class = section_without_margins ? 'mx-2 svg-icon-invert' : 'swiper-button-outside svg-icon-text' %}
                            <div class="js-swiper-{{ section_id }}-prev swiper-button-prev {{ section_arrows_class }} d-none d-md-block">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                            <div class="js-swiper-{{ section_id }}-next swiper-button-next {{ section_arrows_class }} d-none d-md-block">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                        {% endif %}
                    {% else %}
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
{% endif %}
