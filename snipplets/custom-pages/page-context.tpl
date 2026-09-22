{#
  Mapa unico de paginas custom. Este snipplet solo imprime el campo solicitado
  por `mode`; asi puede consumirse desde template y layout sin mutar el scope.
#}
{%- set context_mode = mode | default('') -%}
{%- set context_handle = custom_page_handle | default('') -%}
{# Cambiar cada estado aca actualiza en conjunto body, metadata y robots. #}
{%- set giveaway_campaign_state = 'ended' -%}
{%- set pre_promo_campaign_state = 'ended' -%}
{%- set hot_days_campaign_state = 'ended' -%}
{%- set page_key = '' -%}
{%- set page_template = '' -%}
{%- set page_stylesheet = '' -%}
{%- set page_script = '' -%}
{%- set meta_title = '' -%}
{%- set meta_description = '' -%}
{%- set campaign_state = '' -%}
{%- set robots = '' -%}
{%- set canonical_path = '' -%}
{%- set redirect_path = '' -%}

{%- if context_handle == 'envios' -%}
  {%- set page_key = 'shipping' -%}
  {%- set page_template = 'snipplets/custom-shipping-page.tpl' -%}
  {%- set page_stylesheet = 'css/shipping-page.scss' -%}
  {%- set page_script = 'static/js/shipping-page.js.tpl' -%}
  {%- set meta_title = 'Envíos a todo el país | Trimetra 3D' -%}
  {%- set meta_description = 'Conocé las opciones y tiempos orientativos de envío de Trimetra 3D. El costo y la disponibilidad final se calculan con tu código postal.' -%}
{%- elseif context_handle == 'pagos' -%}
  {%- set page_key = 'payment' -%}
  {%- set page_template = 'snipplets/custom-payment-page.tpl' -%}
  {%- set page_stylesheet = 'css/payment-page.scss' -%}
  {%- set page_script = 'static/js/payment-page.js.tpl' -%}
  {%- set meta_title = 'Medios de pago | Trimetra 3D' -%}
  {%- set meta_description = 'Compará las alternativas de pago de Trimetra 3D y confirmá cuotas, descuentos y total final antes de completar tu compra.' -%}
{%- elseif context_handle == 'garantias-y-devoluciones' -%}
  {%- set page_key = 'warranty' -%}
  {%- set page_template = 'snipplets/custom-warranty-page.tpl' -%}
  {%- set page_stylesheet = 'css/warranty-page.scss' -%}
  {%- set page_script = 'static/js/warranty-page.js.tpl' -%}
  {%- set meta_title = 'Garantías y devoluciones | Trimetra 3D' -%}
  {%- set meta_description = 'Consultá la cobertura de 12, 6 o 3 meses según el componente de tu impresora y cómo gestionar arrepentimientos, fallas o servicio técnico.' -%}
{%- elseif context_handle == 'contacto-y-horarios' or context_handle == 'contacto-horarios' or context_handle == 'contacto-y-horarios-de-atencion' or context_handle == 'informacion-de-contacto-y-horarios' or context_handle == 'informacion-de-contacto-y-horarios-de-atencion' -%}
  {%- set page_key = 'contact_hours' -%}
  {%- set page_template = 'snipplets/custom-contact-hours-page.tpl' -%}
  {%- set page_stylesheet = 'css/contact-hours-page.scss' -%}
  {%- set page_script = 'static/js/contact-hours-page.js.tpl' -%}
  {%- set meta_title = 'Contacto y horarios | Trimetra 3D' -%}
  {%- set meta_description = 'Canales oficiales, horarios de atención y datos para coordinar soporte, ventas o retiros con Trimetra 3D.' -%}
  {%- set canonical_path = '/contacto-y-horarios/' -%}
{%- elseif context_handle == 'quienes-somos' -%}
  {%- set page_key = 'about' -%}
  {%- set page_template = 'snipplets/custom-about-page.tpl' -%}
  {%- set page_stylesheet = 'css/about-page.scss' -%}
  {%- set page_script = 'static/js/about-page.js.tpl' -%}
  {%- set meta_title = 'Quiénes somos | Trimetra 3D' -%}
  {%- set meta_description = 'Conocé al equipo, la operación y el soporte especializado de Trimetra 3D.' -%}
{%- elseif context_handle == 'preventas' -%}
  {%- set page_key = 'preorders' -%}
  {%- set page_template = 'snipplets/custom-preventas-page.tpl' -%}
  {%- set page_stylesheet = 'css/preventas-page.scss' -%}
  {%- set page_script = 'static/js/preventas-page.js.tpl' -%}
  {%- set meta_title = 'Preventas | Trimetra 3D' -%}
  {%- set meta_description = 'Reservá productos en preventa con una seña del 30%, fecha estimada clara y acompañamiento de Trimetra 3D.' -%}
{%- elseif context_handle == 'sorteo' -%}
  {%- set page_key = 'giveaway' -%}
  {%- set page_template = 'snipplets/custom-giveaway-page.tpl' -%}
  {%- set page_stylesheet = 'css/giveaway-page.scss' -%}
  {%- set campaign_state = giveaway_campaign_state -%}
  {%- if campaign_state == 'active' -%}
    {%- set meta_title = 'Sorteo vigente | Trimetra 3D' -%}
    {%- set meta_description = 'Consultá las bases, la vigencia y los canales oficiales del sorteo actual de Trimetra 3D.' -%}
  {%- elseif campaign_state == 'scheduled' -%}
    {%- set meta_title = 'Próximo sorteo | Trimetra 3D' -%}
    {%- set meta_description = 'Próximamente publicaremos fechas, bases y canales válidos para el nuevo sorteo de Trimetra 3D.' -%}
    {%- set robots = 'noindex,follow' -%}
  {%- else -%}
    {%- set meta_title = 'Sorteo finalizado | Trimetra 3D' -%}
    {%- set meta_description = 'El sorteo de Trimetra 3D ya finalizó. Conocé los productos y novedades vigentes.' -%}
    {%- set robots = 'noindex,follow' -%}
  {%- endif -%}
{%- elseif context_handle == 'pre-promo' -%}
  {%- set page_key = 'pre_promo' -%}
  {%- set page_template = 'snipplets/custom-pre-promo-page.tpl' -%}
  {%- set page_stylesheet = 'css/pre-promo-page.scss' -%}
  {%- set campaign_state = pre_promo_campaign_state -%}
  {%- if campaign_state == 'active' -%}
    {%- set meta_title = 'Acceso anticipado vigente | Trimetra 3D' -%}
    {%- set meta_description = 'Consultá las condiciones actuales del acceso anticipado y verificá precio, cuotas y stock antes de comprar.' -%}
  {%- elseif campaign_state == 'scheduled' -%}
    {%- set meta_title = 'Próximo acceso anticipado | Trimetra 3D' -%}
    {%- set meta_description = 'Las fechas y condiciones del próximo acceso anticipado se publicarán antes de habilitar cualquier registro.' -%}
    {%- set robots = 'noindex,follow' -%}
  {%- else -%}
    {%- set meta_title = 'Promoción finalizada | Trimetra 3D' -%}
    {%- set meta_description = 'Esta promoción de Trimetra 3D ya finalizó. Consultá las alternativas disponibles en el catálogo.' -%}
    {%- set robots = 'noindex,follow' -%}
  {%- endif -%}
{%- elseif context_handle == 'hot-days' or context_handle == 'pre-hot-sale' -%}
  {%- set page_key = 'hot_days' -%}
  {%- set page_template = 'snipplets/custom-hot-days-page.tpl' -%}
  {%- set page_stylesheet = 'css/hot-days-page.scss' -%}
  {%- set campaign_state = hot_days_campaign_state -%}
  {%- if campaign_state == 'active' -%}
    {%- set meta_title = 'Hot Days vigente | Trimetra 3D' -%}
    {%- set meta_description = 'Revisá precios, stock y condiciones actuales de Hot Days; el total final se confirma en checkout.' -%}
  {%- elseif campaign_state == 'scheduled' -%}
    {%- set meta_title = 'Próximos Hot Days | Trimetra 3D' -%}
    {%- set meta_description = 'Las fechas y condiciones de los próximos Hot Days se publicarán antes del inicio de la campaña.' -%}
    {%- set robots = 'noindex,follow' -%}
  {%- else -%}
    {%- set meta_title = 'Hot Days finalizado | Trimetra 3D' -%}
    {%- set meta_description = 'Hot Days de Trimetra 3D ya finalizó. Revisá el catálogo para conocer precios y promociones vigentes.' -%}
    {%- set robots = 'noindex,follow' -%}
  {%- endif -%}
  {%- set canonical_path = '/hot-days/' -%}
  {%- if context_handle == 'pre-hot-sale' -%}
    {%- set redirect_path = '/hot-days/' -%}
  {%- endif -%}
{%- endif -%}

{%- if context_mode == 'is_custom' -%}
{{ page_key ? 'true' : 'false' }}
{%- elseif context_mode == 'page_key' -%}
{{ page_key }}
{%- elseif context_mode == 'template' -%}
{{ page_template }}
{%- elseif context_mode == 'stylesheet' -%}
{{ page_stylesheet }}
{%- elseif context_mode == 'script' -%}
{{ page_script }}
{%- elseif context_mode == 'meta_title' -%}
{{ meta_title }}
{%- elseif context_mode == 'meta_description' -%}
{{ meta_description }}
{%- elseif context_mode == 'campaign_state' -%}
{{ campaign_state }}
{%- elseif context_mode == 'robots' -%}
{{ robots }}
{%- elseif context_mode == 'canonical_path' -%}
{{ canonical_path }}
{%- elseif context_mode == 'redirect_path' -%}
{{ redirect_path }}
{%- endif -%}
