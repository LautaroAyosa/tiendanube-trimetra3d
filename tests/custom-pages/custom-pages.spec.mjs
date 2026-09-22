import AxeBuilder from "@axe-core/playwright";
import { expect, test } from "@playwright/test";
const configuredBaseUrl = process.env.CUSTOM_PAGES_BASE_URL;

test.skip(!configuredBaseUrl, "Defini CUSTOM_PAGES_BASE_URL con la URL del preview de Tiendanube.");

const pages = [
  { path: "/envios/", key: "shipping" },
  { path: "/pagos/", key: "payment" },
  { path: "/garantias-y-devoluciones/", key: "warranty" },
  { path: "/contacto-y-horarios/", key: "contact_hours" },
  { path: "/quienes-somos/", key: "about" },
  { path: "/preventas/", key: "preorders" },
  { path: "/sorteo/", key: "giveaway", ended: true },
  { path: "/pre-promo/", key: "pre_promo", ended: true },
  { path: "/hot-days/", key: "hot_days", ended: true }
];

for (const customPage of pages) {
  test(`${customPage.key}: render, contrato CRO y accesibilidad`, async ({ page }) => {
    await page.goto(customPage.path, { waitUntil: "domcontentloaded" });

    const root = page.locator(`[data-cro-page="${customPage.key}"]`);
    await expect(root).toBeVisible();

    const accessibility = await new AxeBuilder({ page })
      .include(`[data-cro-page="${customPage.key}"]`)
      .withTags(["wcag2a", "wcag2aa"])
      .analyze();
    expect(accessibility.violations).toEqual([]);

    const ctas = root.locator("[data-cro-cta]");
    for (let index = 0; index < await ctas.count(); index += 1) {
      const cta = ctas.nth(index);
      await expect(cta).toHaveAttribute("data-cro-location", /^[a-z0-9][a-z0-9_-]*$/i);
      await expect(cta).toHaveAttribute("data-cro-action", /^[a-z0-9][a-z0-9_-]*$/i);
    }
  });
}

test("aliases de contacto usan la misma pagina custom", async ({ page }) => {
  for (const alias of [
    "/contacto-horarios/",
    "/contacto-y-horarios-de-atencion/",
    "/informacion-de-contacto-y-horarios/",
    "/informacion-de-contacto-y-horarios-de-atencion/"
  ]) {
    await page.goto(alias, { waitUntil: "domcontentloaded" });
    await expect(page.locator('[data-cro-page="contact_hours"]')).toBeVisible();
  }
});

test("pre-hot-sale deriva a hot-days", async ({ page }) => {
  await page.goto("/pre-hot-sale/", { waitUntil: "domcontentloaded" });
  await page.waitForURL(/\/hot-days\/?$/);
  await expect(page.locator('[data-cro-page="hot_days"]')).toBeVisible();
});

test("contacto nativo y arrepentimiento permanecen fuera del router custom", async ({ page }) => {
  await page.goto("/contacto/", { waitUntil: "domcontentloaded" });
  await expect(page.locator("[data-cro-page]")).toHaveCount(0);
  await expect(page.locator("#contact-form")).toBeVisible();

  await page.goto("/contacto/?order_cancellation_without_id=true", { waitUntil: "domcontentloaded" });
  await expect(page.locator("[data-cro-page]")).toHaveCount(0);
  await expect(page.locator("#contact-form")).toBeVisible();
  await expect(page.locator('[data-component="order-cancellation-disclaimer"]')).toBeVisible();
});

test("garantia distingue plazo legal y cobertura comercial por componente", async ({ page }) => {
  await page.goto("/garantias-y-devoluciones/", { waitUntil: "domcontentloaded" });
  const root = page.locator('[data-cro-page="warranty"]');

  await expect(root).toContainText("12, 6 o 3 meses según componente");
  await expect(root).toContainText("Los 12 meses no cubren toda la impresora");
  await expect(root.locator(".warranty-page__coverage-row")).toHaveCount(3);
  await expect(root).toContainText("Motherboard");
  await expect(root).toContainText("Rodamientos");
});

test("retorno contextual conserva solo el path del producto same-origin", async ({ page }) => {
  const productUrl = new URL("/productos/producto-de-prueba/", configuredBaseUrl).toString();
  await page.goto("/pagos/", { waitUntil: "domcontentloaded", referer: `${productUrl}?email=no-se-conserva@example.com` });

  const returnLink = page.locator("[data-custom-return-link]").first();
  await expect(returnLink).toHaveAttribute("href", "/productos/producto-de-prueba/");
  await expect(returnLink).toHaveText("Volver al producto");
});

test("campanas ended no cargan formularios ni vendors", async ({ page }) => {
  const vendorRequests = [];
  page.on("request", (request) => {
    if (/sibforms|sendinblue|brevo|recaptcha/i.test(request.url())) {
      vendorRequests.push(request.url());
    }
  });

  for (const campaign of pages.filter((entry) => entry.ended)) {
    await page.goto(campaign.path, { waitUntil: "domcontentloaded" });
    await page.waitForTimeout(250);
    const root = page.locator(`[data-cro-page="${campaign.key}"]`);
    await expect(root).toHaveAttribute("data-campaign-state", "ended");
    await expect(root.locator("form, .g-recaptcha, [data-giveaway-brevo-form]")).toHaveCount(0);
    await expect(page.locator('meta[name="robots"]')).toHaveAttribute("content", "noindex,follow");
  }

  expect(vendorRequests).toEqual([]);
});

test("campanas ended tampoco exponen contenido vencido sin JavaScript", async ({ browser }) => {
  const context = await browser.newContext({ javaScriptEnabled: false });
  const page = await context.newPage();

  for (const campaign of pages.filter((entry) => entry.ended)) {
    await page.goto(new URL(campaign.path, configuredBaseUrl).toString(), { waitUntil: "domcontentloaded" });
    const html = await page.content();
    expect(html).not.toMatch(/<form\b|sibforms|sendinblue|brevo|recaptcha|Vigentes en abril/i);
  }

  await context.close();
});

test("Chatwoot ausente conserva el fallback al contacto nativo", async ({ browser }) => {
  const context = await browser.newContext();
  await context.route(/soporte\.trimetra3d\.com\.ar/, (route) => route.abort());
  const page = await context.newPage();
  await page.goto(new URL("/contacto-y-horarios/", configuredBaseUrl).toString(), { waitUntil: "domcontentloaded" });

  const chatCta = page.locator("[data-custom-chat-cta]").first();
  await expect(chatCta).toBeVisible();
  await chatCta.click();
  await page.waitForURL(/\/contacto\/?(?:\?.*)?$/);
  await expect(page.locator("#contact-form")).toBeVisible();
  await context.close();
});

test("un click CRO produce un solo evento y nunca PII", async ({ page }) => {
  await page.goto("/contacto-y-horarios/", { waitUntil: "domcontentloaded" });
  const cta = page.locator("[data-cro-cta]").first();
  await expect(cta).toBeVisible();

  await page.evaluate(() => {
    window.dataLayer = [];
    document.addEventListener("click", (event) => event.preventDefault(), { once: true, capture: true });
  });
  await cta.click();

  const customEvents = await page.evaluate(() => (window.dataLayer || []).filter((entry) =>
    entry && ["cro_cta_click", "contact_intent"].includes(entry.event)
  ));
  expect(customEvents.filter((entry) => entry.event === "cro_cta_click")).toHaveLength(1);

  const allowedKeys = new Set([
    "event", "page_key", "cta_id", "cta_location", "action_type",
    "content_group", "channel", "campaign_state"
  ]);
  for (const event of customEvents) {
    expect(Object.keys(event).every((key) => allowedKeys.has(key))).toBe(true);
  }
});

test("lead_form_submit solo se emite ante confirmacion explicita de exito", async ({ page }) => {
  await page.goto("/contacto-y-horarios/", { waitUntil: "domcontentloaded" });

  const result = await page.evaluate(() => {
    window.dataLayer = [];
    const root = document.querySelector("[data-cro-page]");
    const form = document.createElement("form");
    form.setAttribute("data-cro-lead-form", "");
    form.setAttribute("data-cro-cta", "test_lead");
    form.setAttribute("data-cro-location", "test_fixture");
    form.setAttribute("data-cro-action", "lead");
    root.appendChild(form);

    form.dispatchEvent(new Event("submit", { bubbles: true, cancelable: true }));
    const afterNativeSubmit = window.dataLayer.filter((entry) => entry.event === "lead_form_submit").length;
    form.dispatchEvent(new CustomEvent("cro:lead-form-success", { bubbles: true }));
    form.dispatchEvent(new CustomEvent("cro:lead-form-success", { bubbles: true }));
    const afterSuccess = window.dataLayer.filter((entry) => entry.event === "lead_form_submit").length;
    form.remove();
    return { afterNativeSubmit, afterSuccess };
  });

  expect(result).toEqual({ afterNativeSubmit: 0, afterSuccess: 1 });
});

test("layout responsive no genera overflow horizontal", async ({ page }) => {
  for (const width of [360, 768, 1280]) {
    await page.setViewportSize({ width, height: 900 });
    for (const customPage of pages) {
      await page.goto(customPage.path, { waitUntil: "domcontentloaded" });
      const hasOverflow = await page.evaluate(() => document.documentElement.scrollWidth > document.documentElement.clientWidth + 1);
      expect(hasOverflow, `${customPage.path} tiene overflow a ${width}px`).toBe(false);
    }
  }
});

test("respeta prefers-reduced-motion", async ({ page }) => {
  await page.emulateMedia({ reducedMotion: "reduce" });
  await page.goto("/quienes-somos/", { waitUntil: "domcontentloaded" });
  expect(await page.evaluate(() => matchMedia("(prefers-reduced-motion: reduce)").matches)).toBe(true);
  await expect(page.locator("[data-about-video]").first()).toHaveAttribute("data-about-static", "true");
  await expect(page.locator("[data-about-video] source").first()).not.toHaveAttribute("src", /.+/);
});

test("el video pesado de About requiere una accion explicita", async ({ page }) => {
  const heavyVideoRequests = [];
  page.on("request", (request) => {
    if (/about-operation\.mp4(?:\?|$)/.test(request.url())) {
      heavyVideoRequests.push(request.url());
    }
  });

  await page.goto("/quienes-somos/", { waitUntil: "domcontentloaded" });
  const manualVideo = page.locator("[data-about-video][data-about-manual]");
  await manualVideo.scrollIntoViewIfNeeded();
  await page.waitForTimeout(300);

  await expect(page.locator("[data-about-play]")).toBeVisible();
  await expect(manualVideo.locator("source")).not.toHaveAttribute("src", /.+/);
  expect(heavyVideoRequests).toEqual([]);
});
