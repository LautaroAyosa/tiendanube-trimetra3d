import { access, readFile, readdir } from "node:fs/promises";
import path from "node:path";
import process from "node:process";

const root = process.cwd();
const errors = [];

const routes = [
  { handle: "envios", key: "shipping", template: "custom-shipping-page.tpl", css: "shipping-page.scss", js: "shipping-page.js.tpl" },
  { handle: "pagos", key: "payment", template: "custom-payment-page.tpl", css: "payment-page.scss", js: "payment-page.js.tpl" },
  { handle: "garantias-y-devoluciones", key: "warranty", template: "custom-warranty-page.tpl", css: "warranty-page.scss", js: "warranty-page.js.tpl" },
  { handle: "contacto-y-horarios", key: "contact_hours", template: "custom-contact-hours-page.tpl", css: "contact-hours-page.scss", js: "contact-hours-page.js.tpl" },
  { handle: "quienes-somos", key: "about", template: "custom-about-page.tpl", css: "about-page.scss", js: "about-page.js.tpl" },
  { handle: "preventas", key: "preorders", template: "custom-preventas-page.tpl", css: "preventas-page.scss", js: "preventas-page.js.tpl" },
  { handle: "sorteo", key: "giveaway", template: "custom-giveaway-page.tpl", css: "giveaway-page.scss", ended: true },
  { handle: "pre-promo", key: "pre_promo", template: "custom-pre-promo-page.tpl", css: "pre-promo-page.scss", ended: true },
  { handle: "hot-days", key: "hot_days", template: "custom-hot-days-page.tpl", css: "hot-days-page.scss", ended: true }
];

function fail(file, message) {
  errors.push(`${file}: ${message}`);
}

async function text(relativePath) {
  return readFile(path.join(root, relativePath), "utf8");
}

async function exists(relativePath) {
  try {
    await access(path.join(root, relativePath));
    return true;
  } catch {
    return false;
  }
}

function tagsWithAttribute(source, attribute) {
  const expression = new RegExp(`<[^>]*\\b${attribute}\\b[^>]*>`, "gi");
  return source.match(expression) || [];
}

const contextPath = "snipplets/custom-pages/page-context.tpl";
const factsPath = "snipplets/custom-pages/business-facts.tpl";
const templatePath = "templates/page.tpl";
const layoutPath = "layouts/layout.tpl";
const sharedJsPath = "static/js/custom-pages.js.tpl";
const context = await text(contextPath);
const facts = await text(factsPath);
const pageTemplate = await text(templatePath);
const layout = await text(layoutPath);
const sharedJs = await text(sharedJsPath);

for (const route of routes) {
  if (!context.includes(`context_handle == '${route.handle}'`) && !context.includes(`context_handle == \"${route.handle}\"`)) {
    fail(contextPath, `falta el handle ${route.handle}`);
  }
  if (!context.includes(`set page_key = '${route.key}'`)) {
    fail(contextPath, `falta page_key=${route.key}`);
  }
  if (!context.includes(route.template) || !await exists(`snipplets/${route.template}`)) {
    fail(contextPath, `template inexistente o no mapeado para ${route.handle}: ${route.template}`);
  }
  if (!context.includes(route.css) || !await exists(`static/css/${route.css}`)) {
    fail(contextPath, `CSS inexistente o no mapeado para ${route.handle}: ${route.css}`);
  }
  if (route.js && (!context.includes(route.js) || !await exists(`static/js/${route.js}`))) {
    fail(contextPath, `JS inexistente o no mapeado para ${route.handle}: ${route.js}`);
  }

  const customPath = `snipplets/${route.template}`;
  const customSource = await text(customPath);
  if (!new RegExp(`data-cro-page=["']${route.key}["']`).test(customSource)) {
    fail(customPath, `el root debe declarar data-cro-page="${route.key}"`);
  }
  if (!/data-custom-return-link/.test(customSource)) {
    fail(customPath, "cada pagina custom debe ofrecer retorno contextual al producto o catalogo");
  }
  if (route.ended && !/data-campaign-state=["']{{\s*[a-z_]+_campaign_state\s*}}["']/.test(customSource)) {
    fail(customPath, "el estado de campana debe provenir del mapping page-context.tpl");
  }
  if (route.ended && !/custom_page_campaign_state\s+in\s+\[['"]scheduled['"],\s*['"]active['"],\s*['"]ended['"]\]/.test(customSource)) {
    fail(customPath, "la campana debe implementar el contrato scheduled | active | ended");
  }
}

if (/context_handle\s*==\s*["']contacto["']/.test(context)) {
  fail(contextPath, "el handle nativo contacto no puede mapearse como pagina custom");
}
for (const alias of ["contacto-horarios", "contacto-y-horarios-de-atencion", "informacion-de-contacto-y-horarios", "informacion-de-contacto-y-horarios-de-atencion", "pre-hot-sale"]) {
  if (!context.includes(`context_handle == '${alias}'`)) {
    fail(contextPath, `falta el alias ${alias}`);
  }
}
if (!context.includes("set redirect_path = '/hot-days/'")) {
  fail(contextPath, "pre-hot-sale debe dirigir a /hot-days/");
}
for (const campaignVariable of ["giveaway_campaign_state", "pre_promo_campaign_state", "hot_days_campaign_state"]) {
  if (!context.includes(`set ${campaignVariable} = 'ended'`) || !context.includes(`set campaign_state = ${campaignVariable}`)) {
    fail(contextPath, `${campaignVariable} debe ser la fuente unica ended para body, metadata y robots`);
  }
}
if ((context.match(/campaign_state == 'active'/g) || []).length !== 3 || (context.match(/campaign_state == 'scheduled'/g) || []).length !== 3) {
  fail(contextPath, "cada campana debe sincronizar metadata y robots para scheduled | active | ended");
}

for (const requiredMode of [
  "contact_url", "whatsapp_primary_url", "whatsapp_primary_display",
  "whatsapp_secondary_url", "whatsapp_secondary_display", "phone_url",
  "phone_display", "email", "address", "hours_weekdays",
  "hours_saturday", "pickup_note", "products_url", "business_id",
  "preorder_deposit_percent", "instagram_url", "oncity_url",
  "warranty_12_months", "warranty_6_months", "warranty_3_months",
  "warranty_12_components", "warranty_6_components", "warranty_3_components"
]) {
  if (!facts.includes(`business_fact_mode == '${requiredMode}'`)) {
    fail(factsPath, `falta el modo ${requiredMode}`);
  }
}
for (const fallback of ["5491173703391", "5491170587575", "Rafaela 3724", "30"]) {
  if (!facts.includes(fallback)) {
    fail(factsPath, `falta el fallback confirmado ${fallback}`);
  }
}

for (const [file, source] of [[templatePath, pageTemplate], [layoutPath, layout]]) {
  if (!source.includes(contextPath)) {
    fail(file, "debe consumir el mapping unico page-context.tpl");
  }
}
if (/include\s+["']snipplets\/custom-[^"']+-page\.tpl/.test(pageTemplate)) {
  fail(templatePath, "no debe mantener includes custom hardcodeados fuera del mapping");
}
if (!layout.includes("css/custom-pages-base.scss") || !layout.includes(sharedJsPath)) {
  fail(layoutPath, "debe cargar la base CSS y el JS compartido para paginas custom");
}
if (/sibforms\.com|sendinblue|brevo/i.test(layout)) {
  fail(layoutPath, "no debe cargar vendors de formularios de campana desde el layout");
}

const snippletNames = (await readdir(path.join(root, "snipplets")))
  .filter((name) => /^custom-.*-page\.tpl$/.test(name));
const customFiles = await Promise.all(snippletNames.map(async (name) => ({
  path: `snipplets/${name}`,
  source: await text(`snipplets/${name}`)
})));

const prohibitedContent = [
  { pattern: /trimetra3d\.mitiendanube\.com/i, message: "no se permiten saltos al subdominio mitiendanube" },
  { pattern: /garant(?:i|í|&iacute;)a\s+oficial/i, message: "no se permite el claim Garantia oficial" },
  { pattern: /Vigentes\s+en\s+abril/i, message: "quedo contenido promocional vencido de abril" },
  { pattern: /(?:20\s+al\s+26\s+de\s+julio|22\s+al\s+30\s+de\s+junio|2026-07-(?:20|26)|2026-06-(?:22|30))/i, message: "quedo una fecha promocional vencida" },
  { pattern: /facturaci(?:o|ó|&oacute;|%C3%B3)n@/i, message: "no se permite el email de facturacion no verificado" },
  { pattern: /page\.content/, message: "las paginas code-owned no deben reinyectar page.content" },
  { pattern: /store\.(?:contact_url|products_url|whatsapp|phone|email|address|business_id|instagram)\b/, message: "los datos comerciales deben consumirse desde business-facts.tpl" }
];

for (const file of customFiles) {
  for (const rule of prohibitedContent) {
    if (rule.pattern.test(file.source)) {
      fail(file.path, rule.message);
    }
  }

  for (const tag of tagsWithAttribute(file.source, "target")) {
    if (/target\s*=\s*["']_blank["']/i.test(tag) && !/rel\s*=\s*["'][^"']*noopener[^"']*["']/i.test(tag)) {
      fail(file.path, `target=_blank sin rel=noopener: ${tag.replace(/\s+/g, " ").slice(0, 140)}`);
    }
  }

  for (const tag of tagsWithAttribute(file.source, "data-cro-cta")) {
    if (!/data-cro-location\s*=/.test(tag) || !/data-cro-action\s*=/.test(tag)) {
      fail(file.path, `CTA CRO sin location/action controlados: ${tag.replace(/\s+/g, " ").slice(0, 140)}`);
    }
  }

  for (const match of file.source.matchAll(/href\s*=\s*["']tel:([^"']+)["']/gi)) {
    const value = match[1];
    if (!value.includes("{{") && !/^\+[1-9]\d{7,14}$/.test(value)) {
      fail(file.path, `telefono estatico no valido o no E.164: tel:${value}`);
    }
  }

  for (const match of file.source.matchAll(/https:\/\/wa\.me\/([^\s"'<]+)/gi)) {
    const value = match[1];
    if (!value.includes("{{") && !/^54911\d{8}$/.test(value)) {
      fail(file.path, `WhatsApp estatico no valido: ${value}`);
    }
  }
}

for (const campaignTemplate of ["custom-giveaway-page.tpl", "custom-pre-promo-page.tpl", "custom-hot-days-page.tpl"]) {
  const campaignPath = `snipplets/${campaignTemplate}`;
  const campaign = await text(campaignPath);
  if (/<form\b|sibforms|sendinblue|brevo|recaptcha|g-recaptcha/i.test(campaign)) {
    fail(campaignPath, "una campana ended no puede renderizar formularios ni dependencias de captura");
  }
}

const jsNames = (await readdir(path.join(root, "static/js")))
  .filter((name) => /(?:custom-pages|-page)\.js\.tpl$/.test(name));
for (const name of jsNames) {
  const jsPath = `static/js/${name}`;
  const source = await text(jsPath);
  for (const unsafe of [
    { pattern: /\.innerHTML\s*=/, name: "innerHTML" },
    { pattern: /\.outerHTML\s*=/, name: "outerHTML" },
    { pattern: /insertAdjacentHTML\s*\(/, name: "insertAdjacentHTML" },
    { pattern: /document\.write\s*\(/, name: "document.write" },
    { pattern: /\beval\s*\(/, name: "eval" },
    { pattern: /new\s+Function\s*\(/, name: "new Function" }
  ]) {
    if (unsafe.pattern.test(source)) {
      fail(jsPath, `sink DOM/JS inseguro: ${unsafe.name}`);
    }
  }
  if (name !== "custom-pages.js.tpl" && /dataLayer/.test(source)) {
    fail(jsPath, "el tracking custom debe estar centralizado en custom-pages.js.tpl");
  }
  if (name !== "custom-pages.js.tpl" && /\$chatwoot|chatwoot:ready|scrollIntoView/.test(source)) {
    fail(jsPath, "chat y scroll accesible deben estar centralizados en custom-pages.js.tpl");
  }
}

for (const eventName of ["cro_cta_click", "contact_intent", "faq_open", "lead_form_start", "lead_form_submit", "view_promotion", "select_promotion"]) {
  if (!sharedJs.includes(`${eventName}: true`)) {
    fail(sharedJsPath, `falta el evento permitido ${eventName}`);
  }
}
for (const nativeEvent of ["view_item", "add_to_cart", "begin_checkout", "add_shipping_info", "add_payment_info", "purchase"]) {
  if (sharedJs.includes(nativeEvent)) {
    fail(sharedJsPath, `no debe emitir ni redefinir el evento ecommerce nativo ${nativeEvent}`);
  }
}
if (!sharedJs.includes("[data-custom-chat-cta]") || !sharedJs.includes("business-facts.tpl', { mode: 'contact_url'")) {
  fail(sharedJsPath, "falta el contrato de Chatwoot con fallback centralizado a store.contact_url");
}
if (/payload\.(?:name|email|phone|address|postal|message|query|referrer)|params\.(?:name|email|phone|address|postal|message|query|referrer)/i.test(sharedJs)) {
  fail(sharedJsPath, "el payload de analytics contiene un campo potencialmente identificable");
}
if (!sharedJs.includes("data-custom-chat-context") || !sharedJs.includes("preorder_product") || !sharedJs.includes("deleteCustomAttribute")) {
  fail(sharedJsPath, "el chat debe adjuntar el producto de preventa como contexto operativo, sin enviarlo a analytics");
}
if (!sharedJs.includes('cro:lead-form-success') || /addEventListener\(["']submit["']/.test(sharedJs)) {
  fail(sharedJsPath, "lead_form_submit debe depender del evento explicito cro:lead-form-success, no del submit nativo");
}

const preventasPath = "snipplets/custom-preventas-page.tpl";
const preventas = await text(preventasPath);
if (!preventas.includes("preventas_selected_products") || !preventas.includes("preventa_product_has_month") || !preventas.includes("'preventa' in preventa_product_name")) {
  fail(preventasPath, "debe omitir productos que no declaren Preventa y un mes estimado en el nombre");
}
if (/data-custom-chat-message/.test(preventas) || !/data-custom-chat-context=["']{{\s*product\.name\s*}}["']/.test(preventas)) {
  fail(preventasPath, "la consulta de sena debe identificar el producto mediante el contexto seguro de Chatwoot");
}

const aboutPath = "snipplets/custom-about-page.tpl";
const aboutScriptPath = "static/js/about-page.js.tpl";
const about = await text(aboutPath);
const aboutScript = await text(aboutScriptPath);
if (!/about-operation\.mp4[\s\S]*data-about-manual/.test(about) && !/data-about-manual[\s\S]*about-operation\.mp4/.test(about)) {
  fail(aboutPath, "el video pesado de operacion debe requerir reproduccion manual");
}
if (!about.includes("data-about-play") || !aboutScript.includes(':not([data-about-manual])') || !aboutScript.includes('[data-about-play]')) {
  fail(aboutScriptPath, "los videos manuales no deben hidratarse por proximidad al viewport");
}

const warrantyPath = "snipplets/custom-warranty-page.tpl";
const warranty = await text(warrantyPath);
for (const component of ["Motherboard", "Display PCB", "Fuente de alimentación", "Drivers extraíbles", "Ventiladores", "Rodamientos"]) {
  if (!facts.includes(component)) {
    fail(factsPath, `falta el componente de garantia confirmado: ${component}`);
  }
}
if (!warranty.includes("Cobertura comercial por componente") || !warranty.includes("no al equipo completo")) {
  fail(warrantyPath, "debe aclarar que los 12 meses aplican solo a los componentes nombrados");
}
for (const warrantyMode of ["warranty_12_months", "warranty_6_months", "warranty_3_months", "warranty_12_components", "warranty_6_components", "warranty_3_components"]) {
  if (!warranty.includes(`mode: \"${warrantyMode}\"`)) {
    fail(warrantyPath, `debe consumir ${warrantyMode} desde business-facts.tpl`);
  }
}

if (errors.length) {
  console.error(`Custom pages check failed (${errors.length}):`);
  for (const error of errors) {
    console.error(`- ${error}`);
  }
  process.exitCode = 1;
} else {
  console.log(`Custom pages check passed: ${routes.length} routes, ${customFiles.length} templates, ${jsNames.length} scripts.`);
}
