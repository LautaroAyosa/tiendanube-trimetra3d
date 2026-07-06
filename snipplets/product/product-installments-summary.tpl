{# Product installments summary capped to the base interest-free installments. #}

{%- set product_installments_limit = installments_limit | default(include("snipplets/payment-installments-config.tpl", { mode: "base_installments" }) | trim) -%}
{%- set max_installments_without_interests = product.get_max_installments(false) -%}
{%- set available_installments = max_installments_without_interests ? max_installments_without_interests.installment : 0 -%}
{%- set installments_to_show = available_installments > product_installments_limit ? product_installments_limit : available_installments -%}

{%- if installments_to_show > 1 -%}
    {%- set installment_price = product.price / installments_to_show -%}
    <div class="js-max-installments-container {{ installments_container_class | default('') }}">
        <span class="js-max-installments">
            <span class="js-installment-amount">{{ installments_to_show }}</span>x
            <span class="js-installment-price" data-value="{{ installment_price }}">{{ (installment_price) | money }}</span>
            <span>sin inter&eacute;s</span>
        </span>
    </div>
{%- endif -%}
