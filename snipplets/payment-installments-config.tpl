{%- set payment_base_installments = '3' -%}
{# Promo 9 cuotas: inicio adelantado temporalmente para preview visual. #}
{%- set payment_promo_start = '2026-06-22' -%}
{%- set payment_promo_end = '2026-06-29' -%}
{%- set payment_promo_countdown = 'true' -%}
{%- set payment_promo_installments = '9' -%}
{%- set payment_promo_scope = 'productos seleccionados' -%}
{%- set payment_current_date = "now" | date("Y-m-d") -%}
{%- set payment_has_active_promo = payment_promo_start and payment_promo_end and payment_promo_installments and payment_current_date >= payment_promo_start and payment_current_date <= payment_promo_end -%}
{%- set payment_installments_mode = mode | default('current_installments') -%}

{%- if payment_installments_mode == 'base_installments' -%}
{{ payment_base_installments }}
{%- elseif payment_installments_mode == 'promo_start' -%}
{{ payment_promo_start }}
{%- elseif payment_installments_mode == 'promo_end' -%}
{{ payment_promo_end }}
{%- elseif payment_installments_mode == 'promo_start_display' -%}
{{ payment_promo_start | date("d/m") }}
{%- elseif payment_installments_mode == 'promo_end_display' -%}
{{ payment_promo_end | date("d/m") }}
{%- elseif payment_installments_mode == 'promo_countdown' -%}
{{ payment_promo_countdown }}
{%- elseif payment_installments_mode == 'promo_installments' -%}
{{ payment_promo_installments }}
{%- elseif payment_installments_mode == 'promo_scope' -%}
{{ payment_promo_scope }}
{%- elseif payment_installments_mode == 'has_active_promo' -%}
{{ payment_has_active_promo ? 'true' : 'false' }}
{%- else -%}
{{ payment_has_active_promo ? payment_promo_installments : payment_base_installments }}
{%- endif -%}
