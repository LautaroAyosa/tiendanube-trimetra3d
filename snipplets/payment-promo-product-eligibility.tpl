{# Promo eligibility: Bambu Lab printers only. Prefer the structured brand and use model names only when brand is missing. #}
{%- set payment_promo_product_brand = product.brand | default('') | trim | lower -%}
{%- set payment_promo_product_text = (product.name ~ ' ' ~ product.url) | lower -%}
{%- set payment_promo_product_has_brand = payment_promo_product_brand | length > 0 -%}
{%- set payment_promo_product_brand_is_bambu =
  'bambu lab' in payment_promo_product_brand
  or 'bambu-lab' in payment_promo_product_brand
-%}
{%- set payment_promo_product_model_is_bambu =
  'bambu lab' in payment_promo_product_text
  or 'bambu-lab' in payment_promo_product_text
  or 'a1' in payment_promo_product_text
  or 'p1s' in payment_promo_product_text
  or 'p1p' in payment_promo_product_text
  or 'bambu lab x1' in payment_promo_product_text
  or 'x1 carbon' in payment_promo_product_text
  or 'h2s' in payment_promo_product_text
  or 'h2d' in payment_promo_product_text
  or 'p2s' in payment_promo_product_text
  or 'a2l' in payment_promo_product_text
  or 'h2c' in payment_promo_product_text
  or 'x2d' in payment_promo_product_text
-%}
{%- set payment_promo_product_is_accessory =
  'filamento' in payment_promo_product_text
  or 'resina' in payment_promo_product_text
  or 'repuesto' in payment_promo_product_text
  or 'boquilla' in payment_promo_product_text
  or 'nozzle' in payment_promo_product_text
  or 'hotend' in payment_promo_product_text
  or 'extrusor' in payment_promo_product_text
  or 'extruder' in payment_promo_product_text
  or 'placa' in payment_promo_product_text
  or 'cama' in payment_promo_product_text
  or 'ptfe' in payment_promo_product_text
-%}
{%- set payment_promo_product_is_bambu =
  payment_promo_product_brand_is_bambu
  or (not payment_promo_product_has_brand and payment_promo_product_model_is_bambu)
-%}
{{- payment_promo_product_is_bambu and not payment_promo_product_is_accessory ? 'true' : 'false' -}}
