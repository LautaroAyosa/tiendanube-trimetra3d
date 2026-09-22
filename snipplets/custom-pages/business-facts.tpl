{#
  Fuente de verdad para los datos compartidos por las paginas custom.

  Uso:
    {% set contact_url = include('snipplets/custom-pages/business-facts.tpl', { mode: 'contact_url' }) | trim %}

  Los datos administrados por Tiendanube tienen prioridad. Los literales son
  fallbacks deliberados para que una configuracion incompleta no deje CTAs rotos.
#}
{%- set business_fact_mode = mode | default('') -%}
{%- set fallback_whatsapp_primary_url = 'https://wa.me/5491173703391' -%}
{%- set fallback_whatsapp_primary_display = '+54 9 11 7370-3391' -%}
{%- set fallback_phone = '+5491173703391' -%}
{%- set fallback_phone_display = '+54 9 11 7370-3391' -%}
{%- set fallback_email = 'info@trimetra3d.com.ar' -%}
{%- set fallback_address = 'Rafaela 3724, Ciudadela, Buenos Aires' -%}
{%- set whatsapp_primary_url = store.whatsapp ? store.whatsapp : fallback_whatsapp_primary_url -%}
{%- set phone_value = store.phone ? store.phone : fallback_phone -%}
{%- set warranty_12_components = 'Motherboard|Display PCB|Fuente de alimentación|Estructura metálica|Calefactor de cama' -%}
{%- set warranty_6_components = 'Drivers extraíbles|Display de impresoras de resina' -%}
{%- set warranty_3_components = 'Ventiladores|Motores paso a paso|Termistores|Calefactor hotend|Cables|Heat block|Nozzle|Selector de control|Extrusor|Tubo de teflón|Conectores de tubo|Correas|Sensores|Rodamientos' -%}

{%- if business_fact_mode == 'contact_url' -%}
{{ store.contact_url ? store.contact_url : '/contacto/' }}
{%- elseif business_fact_mode == 'products_url' -%}
{{ store.products_url ? store.products_url : '/productos/' }}
{%- elseif business_fact_mode == 'instagram_url' -%}
{{ store.instagram ? store.instagram : '' }}
{%- elseif business_fact_mode == 'oncity_url' -%}
https://www.oncity.com/trimetra-3d?map=seller
{%- elseif business_fact_mode == 'whatsapp_primary_url' -%}
{{ whatsapp_primary_url }}
{%- elseif business_fact_mode == 'whatsapp_primary_display' -%}
{%- if whatsapp_primary_url == fallback_whatsapp_primary_url -%}
{{ fallback_whatsapp_primary_display }}
{%- else -%}
{{ whatsapp_primary_url | trim('https://wa.me/') }}
{%- endif -%}
{%- elseif business_fact_mode == 'whatsapp_secondary_url' -%}
https://wa.me/5491170587575
{%- elseif business_fact_mode == 'whatsapp_secondary_display' -%}
+54 9 11 7058-7575
{%- elseif business_fact_mode == 'phone_url' -%}
tel:{{ phone_value }}
{%- elseif business_fact_mode == 'phone_display' -%}
{{ store.phone ? store.phone : fallback_phone_display }}
{%- elseif business_fact_mode == 'email' -%}
{{ store.email ? store.email : fallback_email }}
{%- elseif business_fact_mode == 'address' -%}
{{ store.address ? store.address : fallback_address }}
{%- elseif business_fact_mode == 'business_id' -%}
{{ store.business_id ? store.business_id : '' }}
{%- elseif business_fact_mode == 'hours_weekdays' -%}
Lunes a viernes de 09:00 a 17:00
{%- elseif business_fact_mode == 'hours_saturday' -%}
Sábados de 10:00 a 13:00
{%- elseif business_fact_mode == 'pickup_note' -%}
Depósito con retiro únicamente coordinado con anterioridad
{%- elseif business_fact_mode == 'preorder_deposit_percent' -%}
30
{%- elseif business_fact_mode == 'warranty_12_months' -%}
12
{%- elseif business_fact_mode == 'warranty_6_months' -%}
6
{%- elseif business_fact_mode == 'warranty_3_months' -%}
3
{%- elseif business_fact_mode == 'warranty_12_components' -%}
{{ warranty_12_components }}
{%- elseif business_fact_mode == 'warranty_6_components' -%}
{{ warranty_6_components }}
{%- elseif business_fact_mode == 'warranty_3_components' -%}
{{ warranty_3_components }}
{%- endif -%}
