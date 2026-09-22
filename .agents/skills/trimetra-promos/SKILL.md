---
name: trimetra-promos
description: Configura, actualiza o finaliza promociones de cuotas en el theme Tiendanube de Trimetra 3D, incluyendo fechas, countdown del header, productos elegibles, badges y copias de pago. No usar para cambiar la financiación real del checkout ni para publicar por FTPS sin pedido explícito.
---

# Trimetra Promos

Gestioná la campaña completa sin convertir claims del theme en autoridad financiera. Tiendanube y sus medios de pago determinan las cuotas finales.

## Antes de editar

- Leé `PRODUCT.md` y `README.md`; preservá cambios locales ajenos con `git status` y diffs focalizados.
- Confirmá año, inicio y fin exactos en hora Argentina (`UTC-03:00`), cantidad de cuotas, alcance, texto de previa y texto activo.
- No reactives landings de campañas, formularios ni tracking salvo que el pedido lo incluya.

## Mapa de la promo

- `snipplets/payment-installments-config.tpl`: fuente única de fechas ISO, horarios visibles, cuotas base/promocionales, label, alcance, countdown y estados temporales.
- `snipplets/payment-promo-product-eligibility.tpl`: fuente única de elegibilidad. Preferí `product.brand`; usá nombres/modelos sólo como fallback si la marca está vacía y mantené exclusiones de accesorios.
- `snipplets/header/header-advertising.tpl`: textos y markup del countdown. La previa apunta al inicio; el estado activo apunta al cierre; después debe volver la barra común.
- `static/js/store.js.tpl`: transición temporal del countdown, compensación del header y actualización de cuotas por variante mediante `data-max-installments`.
- `static/css/style-critical.scss`: layout responsive del countdown y estilos promocionales. Mobile debe mostrar días, horas, minutos y segundos; desktop conserva una sola fila.
- `snipplets/promo-3d-printer-badge.tpl` y `snipplets/product/product-installments-summary.tpl`: consumidores por producto de la elegibilidad y el límite promocional.
- `snipplets/trust-bar.tpl` y `static/checkout.scss.tpl`: superficies globales; calificá la promo con su marca o alcance para no presentarla como general.

## Flujo

1. Actualizá primero la configuración central y mantené timestamps con offset `-03:00`.
2. Ajustá la elegibilidad compartida; nunca dupliques listas entre badge y resumen de cuotas.
3. Actualizá los dos estados del header y asegurá que `promo_countdown` controle su render.
4. Auditá todos los consumidores con `rg -n "payment-installments-config|payment-promo-product-eligibility|promo_installments|promo_scope|promo_label"`.
5. Buscá cada fecha, cantidad y copy retirados. Revisá los resultados antes de borrar: algunas fechas históricas pueden pertenecer a validadores.

Los estados observables son:

- `scheduled`: antes del inicio; header visible sólo si el countdown está habilitado y cuenta hacia el comienzo.
- `active`: entre inicio y fin inclusivos; productos elegibles usan el límite promo y el timer cuenta hacia el cierre.
- `ended`: después del fin; no se renderiza el countdown, vuelven las cuotas base y desaparecen badges promocionales.

## Validación y publicación

- Probá los instantes inmediatamente anterior, exacto y posterior a ambos límites.
- Verificá un producto elegible, uno no elegible, un accesorio excluido y un cambio de variante.
- Revisá el header a 320, 390, 768 y 1440 px, incluyendo `prefers-reduced-motion`.
- Ejecutá `npm test` y `git diff --check`; validá esta skill con el `quick_validate.py` de `skill-creator` cuando cambie.
- No ejecutes uploads FTPS. Si el usuario pide publicar, revisá el diff y pedí la confirmación propia del flujo descrito en `README.md`.
