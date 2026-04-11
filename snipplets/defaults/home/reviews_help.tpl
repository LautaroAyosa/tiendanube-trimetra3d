{# Reviews that work as examples #}

<div class="js-reviews-placeholder">
    {% include 'snipplets/reviews/reviews-block.tpl' with {
        reviews_id: 'home-reviews-placeholder',
        reviews_title: 'Opiniones reales de clientes',
        reviews_summary_score: '4.8',
        reviews_summary_count: '247',
        reviews_external_text: 'Ver resenas en Google',
        reviews_external_url: 'https://www.google.com/maps',
        reviews_layout: 'mixed',
        reviews_show_desktop_arrows: true,
        reviews_items: [
            {
                name: 'Martin',
                text: 'Excelente experiencia de compra. El equipo llego bien embalado y funcionando desde el primer dia.',
                rating: 5,
                context: 'CABA - emprendimiento de impresion 3D',
                verification_type: 'purchase',
                source_label: 'Google',
                date_label: 'Marzo 2026',
                product_name: 'Bambu Lab A1 Combo',
                product_url: '#',
                highlight: true
            },
            {
                name: 'Lucia',
                text: 'Nos ayudaron a elegir el modelo correcto y la puesta en marcha fue simple.',
                rating: 5,
                context: 'Rosario - taller de prototipado',
                verification_type: 'customer',
                source_label: 'Tienda',
                date_label: 'Febrero 2026',
                product_name: 'Creality K1C',
                product_url: '#',
                highlight: false
            },
            {
                name: 'Diego',
                text: 'Muy buena atencion postventa y excelente calidad del producto.',
                rating: 5,
                context: 'Cordoba - estudio de arquitectura',
                verification_type: 'purchase',
                source_label: 'Mercado Libre',
                date_label: 'Enero 2026',
                product_name: 'Bambu Lab P1S',
                product_url: '#',
                highlight: false
            }
        ]
    } %}
</div>

{# Skeleton of "true" section accessed from instatheme.js #}
<div class="js-reviews-top" style="display:none">
    {% include 'snipplets/home/home-reviews.tpl' %}
</div>
