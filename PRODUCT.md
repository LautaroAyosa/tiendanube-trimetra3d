# Trimetra 3D

<!-- impeccable:product-schema 1 -->

## Platform

web

## Users

Personas y organizaciones de Argentina que evalúan o ya utilizan impresoras 3D, filamentos, repuestos y accesorios. Antes de comprar necesitan confirmar disponibilidad, financiación, entrega y respaldo posventa; después de comprar necesitan canales claros para soporte, garantía, facturación y retiro.

## Product Purpose

Trimetra 3D es una tienda online especializada en impresión 3D. El sitio debe permitir comparar y comprar productos de alto valor con información comercial verificable, y continuar la relación mediante soporte, garantía, preventas y coordinación logística.

El éxito combina ventas pagas, intención comercial calificada y reducción de dudas evitables, sin promesas contradictorias entre páginas.

## Positioning

La propuesta combina catálogo especializado con operación local verificable y gestión directa de asesoramiento, entrega y posventa. La confianza debe apoyarse en personas, stock, canales oficiales, procesos y evidencia reales; no en afirmaciones absolutas o no documentadas.

## Operating Context

- La tienda corre sobre Tiendanube/Nuvemshop y se mantiene como un theme Twig mediante Git y publicación intencional por FTPS.
- Tiendanube es la autoridad para catálogo, precio vigente, stock, checkout, medios de pago habilitados, cálculo de envío y datos `store.*`.
- El chat web usa Chatwoot con fallback al formulario nativo de contacto.
- GA4 y GTM ya están instalados. La integración nativa de Tiendanube es la única dueña de los eventos ecommerce.
- Los documentos dentro de `/docs` son insumos de investigación y pueden no estar versionados ni vigentes. No son configuración de runtime.

## Capabilities and Constraints

- El formulario nativo `/contacto/` y el flujo de arrepentimiento de Tiendanube deben conservarse.
- Las páginas custom cubren contacto y horarios, pagos, envíos, garantías y devoluciones, quiénes somos, preventas y campañas.
- Hechos confirmados para las páginas custom:
  - WhatsApp principal y llamadas: `+54 9 11 7370-3391`.
  - WhatsApp de respaldo: `+54 9 11 7058-7575`.
  - Dirección publicada: Rafaela 3724, Ciudadela, Buenos Aires.
  - Atención humana: lunes a viernes de 09:00 a 17:00 y sábados de 10:00 a 13:00.
  - Los retiros son únicamente con coordinación previa.
  - La seña de preventa es del 30%.
  - En impresoras 3D, la cobertura comercial se define por componente: 12 meses para motherboard, display PCB, fuente de alimentación, estructura metálica y calefactor de cama; 6 meses para drivers extraíbles y display de impresoras de resina; 3 meses para las partes de desgaste listadas en la política. Los 12 meses no cubren la impresora completa.
- El checkout determina importes, cuotas, elegibilidad y costos finales. Las páginas informativas no deben contradecirlo.
- Las campañas tienen estados `scheduled`, `active` y `ended`; una campaña finalizada no recolecta datos ni mantiene promociones en el HTML público.
- Las políticas de garantía y devolución requieren aprobación legal antes de publicarse.
- Las páginas deben funcionar progresivamente sin JavaScript para su contenido y navegación esenciales.

## Brand Commitments

La comunicación es argentina, directa, clara y cercana, con voseo. Debe evitar lenguaje defensivo, promesas absolutas y presión comercial basada en información no verificable. Se conserva la identidad visual vigente del theme; este trabajo no constituye un rebranding.

## Evidence on Hand

- Reporte CRO y materiales operativos en `/docs` como evidencia histórica, no normativa.
- Videos e imágenes reales de equipo, operación y productos dentro de `static/`.
- Reviews y casos de posventa ya presentes en el theme.
- Datos de catálogo, tienda y checkout provistos por Tiendanube.

No se deben fabricar testimonios, proveedores, certificaciones, importadores, plazos o condiciones comerciales que no estén documentados.

## Product Principles

1. Una afirmación comercial debe tener una única fuente de verdad y un responsable identificable.
2. La decisión principal de cada página debe poder encontrarse y ejecutarse rápidamente.
3. El checkout manda sobre cualquier resumen estático de pago o envío.
4. Corregir confianza significa mostrar procesos y evidencia, no multiplicar claims.
5. El tracking mide intención sin recolectar PII ni duplicar ecommerce.

## Accessibility & Inclusion

Las páginas custom deben cumplir WCAG 2.1 AA en contraste, foco, teclado y semántica; soportar zoom de 200%, tap targets de al menos 44 px y `prefers-reduced-motion`. La experiencia esencial debe mantenerse con JavaScript o servicios de terceros no disponibles.
