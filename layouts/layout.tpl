<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}">
    <head>
        {% set is_hot_days_page = template == 'page' and (page.handle == 'hot-days' or page.handle == 'pre-hot-sale') %}
        {% set is_pre_promo_page = template == 'page' and page.handle == 'pre-promo' %}
        {% set hot_days_page_title = 'Hot Sale Trimetra 3D | Ofertas en impresoras 3D y filamentos' %}
        {% set hot_days_page_description = 'Aprovecha Hot Sale en Trimetra 3D con ofertas en impresoras 3D, filamentos, insumos, cuotas, envios a todo el pais y soporte especializado.' %}
        {% set pre_promo_page_title = '9 cuotas sin interes Trimetra 3D | Promo del 22 al 30 de junio' %}
        {% set pre_promo_page_description = 'Promo Trimetra 3D del 22 al 30 de junio de 2026: 9 cuotas sin interes y envio gratis en impresoras 3D seleccionadas.' %}
        {% if is_hot_days_page %}
            {% set page_title = hot_days_page_title %}
            {% set page_description = hot_days_page_description %}
        {% elseif is_pre_promo_page %}
            {% set page_title = pre_promo_page_title %}
            {% set page_description = pre_promo_page_description %}
        {% endif %}

        <link rel="preconnect" href="{{ store_resource_hints }}" />
        <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>{{ page_title }}</title>
        <meta name="description" content="{{ page_description }}" />
        <link rel="preload" as="style" href="{{ [settings.font_headings, settings.font_rest] | google_fonts_url('400,700') }}" />
        <link rel="preload" href="{{ 'css/style-critical.scss' | static_url }}" as="style" />
        <link rel="preload" href="{{ 'css/style-colors.scss' | static_url }}" as="style" />

        {# Preload LCP home, category and product page elements #}

        {% snipplet 'preload-images.tpl' %}

        {{ component('social-meta') }}

        {#/*============================================================================
            #CSS and fonts
        ==============================================================================*/#}

        <style>
            {# Font families #}

            {{ component(
                'fonts',{
                    font_weights: '400,700',
                    font_settings: 'settings.font_headings, settings.font_rest'
                })
            }}

            {# General CSS Tokens #}

            {% include "static/css/style-tokens.tpl" %}
        </style>

        {# Critical CSS #}

        {{ 'css/style-critical.scss' | static_url | static_inline }}

        {# Colors and fonts used from settings.txt and defined on theme customization #}

        {{ 'css/style-colors.scss' | static_url | static_inline }}

        {# Load async styling not mandatory for first meaningfull paint #}

        <link rel="stylesheet" href="{{ 'css/style-async.scss' | static_url }}" media="print" onload="this.media='all'">

        {% set is_contact_hours_page = template == 'page' and (page.handle == 'contacto-y-horarios' or page.handle == 'contacto-horarios' or page.handle == 'contacto-y-horarios-de-atencion' or page.handle == 'informacion-de-contacto-y-horarios' or page.handle == 'informacion-de-contacto-y-horarios-de-atencion') %}
        {% set is_warranty_page = template == 'page' and page.handle == 'garantias-y-devoluciones' %}
        {% set is_about_page = template == 'page' and page.handle == 'quienes-somos' %}
        {% set is_giveaway_page = template == 'page' and page.handle == 'sorteo' %}
        {% set is_single_product_page = template == 'product' %}

        {% if template == 'page' and page.handle == 'envios' %}
            <link rel="stylesheet" href="{{ 'css/shipping-page.scss' | static_url }}" media="all">
        {% elseif template == 'page' and page.handle == 'pagos' %}
            <link rel="stylesheet" href="{{ 'css/payment-page.scss' | static_url }}" media="all">
        {% elseif is_warranty_page %}
            <link rel="stylesheet" href="{{ 'css/warranty-page.scss' | static_url }}" media="all">
        {% elseif is_contact_hours_page %}
            <link rel="stylesheet" href="{{ 'css/contact-hours-page.scss' | static_url }}" media="all">
        {% elseif is_about_page %}
            <link rel="stylesheet" href="{{ 'css/about-page.scss' | static_url }}" media="all">
        {% elseif is_giveaway_page %}
            <link rel="stylesheet" href="https://sibforms.com/forms/end-form/build/sib-styles.css" media="all">
            <link rel="stylesheet" href="{{ 'css/giveaway-page.scss' | static_url }}" media="all">
        {% elseif is_pre_promo_page %}
            <link rel="stylesheet" href="{{ 'css/pre-promo-page.scss' | static_url }}" media="all">
        {% elseif is_hot_days_page %}
            <link rel="stylesheet" href="{{ 'css/hot-days-page.scss' | static_url }}" media="all">
        {% elseif is_single_product_page %}
            <link rel="stylesheet" href="{{ 'css/single-product.scss' | static_url }}" media="all">
        {% endif %}

        {# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

        <style>
            {{ settings.css_code | raw }}
        </style>

        {#/*============================================================================
            #Javascript: Needed before HTML loads
        ==============================================================================*/#}

        {# Defines if async JS will be used by using script_tag(true) #}

        {% set async_js = true %}

        {# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

        {% set nojquery = true %}

        {# Jquery async by adding script_tag(true) #}

        {% if load_jquery %}

            {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag(true) }}

        {% endif %}

        {# Loads private Tiendanube JS #}

        {% head_content %}

        {# Structured data to provide information for Google about the page content #}

        {{ component('structured-data-organization') }}
        {{ component('structured-data') }}

    </head>
    <body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}">
        {# Facebook comments on product page #}

        {% if template == 'product' %}

            {# Facebook comment box JS #}
            {% if settings.show_product_fb_comment_box %}
                {{ fb_js }}
            {% endif %}

            {# Pinterest share button JS #}
            {{ pin_js }}

        {% endif %}

        {# Back to admin bar #}

        {{back_to_admin}}

        {# Header = Advertising + Nav + Logo + Search + Ajax Cart #}

        {% snipplet "header/header.tpl" %}

        {# Page content #}

        {% template_content %}

        {# Quickshop modal #}

        {% snipplet "grid/quick-shop.tpl" %}

        {# WhatsApp chat button #}

        {% if not settings.whatsapp_header_link %}
            {% snipplet "whatsapp-chat.tpl" %}
        {% endif %}

        {# Footer #}

        {% snipplet "footer/footer.tpl" %}

        {% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

            {# Minimum used for free shipping progress messages. Located on header so it can be accesed everywhere with shipping calculator active or inactive #}

            <span class="js-ship-free-min hidden" data-pricemin="{{ cart.free_shipping.min_price_free_shipping.min_price_raw }}"></span>
            <span class="js-free-shipping-config hidden" data-config="{{ cart.free_shipping.allFreeConfigurations }}"></span>
            <span class="js-cart-subtotal hidden" data-priceraw="{{ cart.subtotal }}"></span>
            <span class="js-cart-discount hidden" data-priceraw="{{ cart.promotional_discount_amount }}"></span>
        {% endif %}

        {#/*============================================================================
            #Javascript: Needed after HTML loads
        ==============================================================================*/#}

        {# Javascript used in the store #}

        <script type="text/javascript">

            {# Libraries that do NOT depend on other libraries, e.g: Jquery #}

            {% include "static/js/external-no-dependencies.js.tpl" %}

            {# LS.ready.then function waits to Jquery and private Tiendanube JS to be loaded before executing what´s inside #}

            LS.ready.then(function(){

                {# Libraries that requires Jquery to work #}

                {% include "static/js/external.js.tpl" %}

                {# Specific store JS functions: product variants, cart, shipping, etc #}

                {% include "static/js/store.js.tpl" %}
            });
        </script>

        {% if template == 'page' and page.handle == 'envios' %}
            <script type="text/javascript">
                {% include "static/js/shipping-page.js.tpl" %}
            </script>
        {% elseif template == 'page' and page.handle == 'pagos' %}
            <script type="text/javascript">
                {% include "static/js/payment-page.js.tpl" %}
            </script>
        {% elseif is_warranty_page %}
            <script type="text/javascript">
                {% include "static/js/warranty-page.js.tpl" %}
            </script>
        {% elseif is_contact_hours_page %}
            <script type="text/javascript">
                {% include "static/js/contact-hours-page.js.tpl" %}
            </script>
        {% elseif is_about_page %}
            <script type="text/javascript">
                {% include "static/js/about-page.js.tpl" %}
            </script>
        {% elseif is_pre_promo_page %}
            <script type="text/javascript">
                {% include "static/js/pre-promo-page.js.tpl" %}
            </script>
        {% elseif is_hot_days_page %}
            <script type="text/javascript">
                {% include "static/js/hot-days-page.js.tpl" %}
            </script>
        {% endif %}

        {# Google reCAPTCHA on register page #}

        {% if template == 'account.register' %}
            {% if not store.hasContactFormsRecaptcha() %}
                {{ '//www.google.com/recaptcha/api.js' | script_tag(true) }}
            {% endif %}
            <script type="text/javascript">
                var recaptchaCallback = function() {
                    jQueryNuvem('.js-recaptcha-button').prop('disabled', false);
                };
            </script>
        {% endif %}

        {# Google survey JS for Tiendanube Survey #}

        {{ component('google-survey') }}

        {# Store external codes added from admin #}

        {% if store.assorted_js %}
            <script>
                LS.ready.then(function() {
                    var trackingCode = jQueryNuvem.parseHTML('{{ store.assorted_js| escape("js") }}', document, true);
                    jQueryNuvem('body').append(trackingCode);
                });
            </script>
        {% endif %}
        <script>
            window.chatwootSettings = {"position":"right","type":"expanded_bubble","launcherTitle":"¿Necesitás ayuda?"};
            (function(d,t) {
                var BASE_URL="https://soporte.trimetra3d.com.ar";
                var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
                g.src=BASE_URL+"/packs/js/sdk.js";
                g.async = true;
                s.parentNode.insertBefore(g,s);
                g.onload=function(){
                window.chatwootSDK.run({
                    websiteToken: 'UJa17qWiHUeNMHJq5siUdop7',
                    baseUrl: BASE_URL
                })
                }
            })(document,"script");
        </script>

    </body>
</html>
