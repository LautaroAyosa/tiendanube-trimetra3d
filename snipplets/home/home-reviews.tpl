{#
  Resuelve: incluir opiniones globales en la home.
  Uso: seccion reviews del orden de pagina de inicio.
  Variables: settings.
  Estados: storefront con datos parciales o completos.
#}

{% include 'snipplets/reviews/reviews-settings.tpl' with {
    reviews_id: 'home-reviews'
} %}
