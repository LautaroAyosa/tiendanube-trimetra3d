import { readFile } from "node:fs/promises";
import { expect, test } from "@playwright/test";

const rootUrl = new URL("../../", import.meta.url);
const criticalCss = await readFile(new URL("static/css/style-critical.scss", rootUrl), "utf8");
const promoConfig = await readFile(new URL("snipplets/payment-installments-config.tpl", rootUrl), "utf8");
const promoHeader = await readFile(new URL("snipplets/header/header-advertising.tpl", rootUrl), "utf8");
const promoEligibility = await readFile(new URL("snipplets/payment-promo-product-eligibility.tpl", rootUrl), "utf8");
const productInstallments = await readFile(new URL("snipplets/product/product-installments-summary.tpl", rootUrl), "utf8");
const storeJs = await readFile(new URL("static/js/store.js.tpl", rootUrl), "utf8");

const countdownMarkup = `
  <header class="head-main">
    <section class="js-adbar section-adbar section-adbar--countdown" data-adbar-countdown>
      <div class="adbar-countdown">
        <span class="adbar-countdown__message" data-adbar-countdown-message>SE VIENE TREMENDA PROMO</span>
        <span class="adbar-countdown__label" data-adbar-countdown-label></span>
        <span class="adbar-countdown__timer" aria-hidden="true">
          <span class="adbar-countdown__unit adbar-countdown__unit--days"><strong>01</strong><small>DÍAS</small></span>
          <span class="adbar-countdown__unit"><strong>23</strong><small>HORAS</small></span>
          <span class="adbar-countdown__separator">:</span>
          <span class="adbar-countdown__unit"><strong>59</strong><small>MINUTOS</small></span>
          <span class="adbar-countdown__separator">:</span>
          <span class="adbar-countdown__unit"><strong>59</strong><small>SEGUNDOS</small></span>
        </span>
      </div>
    </section>
  </header>`;

async function renderCountdown(page, active = false) {
  await page.setContent(countdownMarkup);
  await page.addStyleTag({ content: criticalCss });
  await page.addStyleTag({ content: "html, body { margin: 0; } .section-adbar { display: flex; width: 100%; }" });

  if (active) {
    await page.evaluate(() => {
      const section = document.querySelector("[data-adbar-countdown]");
      section.classList.add("section-adbar--countdown-active");
      section.querySelector("[data-adbar-countdown-message]").textContent = "APROVECHA LAS 9 CUOTAS,";
      section.querySelector("[data-adbar-countdown-label]").textContent = "solo quedan...";
    });
  }
}

test("contrato de campaña Bambu Lab", () => {
  expect(promoConfig).toContain("payment_promo_start_date = '2026-08-27'");
  expect(promoConfig).toContain("payment_promo_end_date = '2026-09-07'");
  expect(promoConfig).toContain("payment_promo_start_date ~ 'T00:00:00-03:00'");
  expect(promoConfig).toContain("payment_promo_end_date ~ 'T10:00:00-03:00'");
  expect(promoConfig).toContain("payment_promo_countdown = 'true'");
  expect(promoConfig).toContain("payment_promo_scope = 'impresoras Bambu Lab'");

  expect(promoHeader).toContain('data-adbar-countdown-before-message="SE VIENE TREMENDA PROMO"');
  expect(promoHeader).toContain('data-adbar-countdown-active-message="APROVECHA LAS 9 CUOTAS,"');
  expect(promoHeader).toContain('data-adbar-countdown-active-label="solo quedan..."');
  expect(promoHeader).toContain('mode: "promo_countdown"');

  expect(promoEligibility).toContain("product.brand");
  expect(promoEligibility).toContain("not payment_promo_product_has_brand");
  expect(promoEligibility).not.toContain("'snapmaker'");
  expect(promoEligibility).not.toContain("'impresora'");
  for (const accessory of ["filamento", "repuesto", "boquilla", "hotend", "extrusor", "placa", "cama", "ptfe"]) {
    expect(promoEligibility).toContain(`'${accessory}'`);
  }

  expect(productInstallments).toContain('data-max-installments="{{ product_installments_limit }}"');
  expect(productInstallments).toContain('data-promo-eligible="{{ product_promo_applies ? \'true\' : \'false\' }}"');
  expect(storeJs).toContain("$installments_summary.attr('data-max-installments')");
  expect(storeJs).toContain("get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests, max_installments_without_interests_to_show)");
});

test("límites temporales de la promo", () => {
  const start = new Date("2026-08-27T00:00:00-03:00").getTime();
  const end = new Date("2026-09-07T10:00:00-03:00").getTime();
  const stateAt = (timestamp) => timestamp < start ? "scheduled" : timestamp <= end ? "active" : "ended";

  expect(stateAt(new Date("2026-08-26T23:59:59-03:00").getTime())).toBe("scheduled");
  expect(stateAt(start)).toBe("active");
  expect(stateAt(new Date("2026-08-27T09:59:59-03:00").getTime())).toBe("active");
  expect(stateAt(end)).toBe("active");
  expect(stateAt(new Date("2026-09-07T10:00:01-03:00").getTime())).toBe("ended");
});

for (const viewport of [
  { name: "mobile 320", width: 320, height: 640 },
  { name: "mobile 390", width: 390, height: 844 },
  { name: "mobile horizontal", width: 667, height: 375 },
  { name: "tablet", width: 768, height: 900 },
  { name: "desktop", width: 1440, height: 900 }
]) {
  test(`countdown responsive: ${viewport.name}`, async ({ page }, testInfo) => {
    await page.setViewportSize({ width: viewport.width, height: viewport.height });
    await renderCountdown(page, true);

    const section = page.locator("[data-adbar-countdown]");
    const message = page.locator("[data-adbar-countdown-message]");
    const label = page.locator("[data-adbar-countdown-label]");
    const timer = page.locator(".adbar-countdown__timer");

    await expect(message).toHaveText("APROVECHA LAS 9 CUOTAS,");
    await expect(label).toHaveText("solo quedan...");
    await expect(page.locator(".adbar-countdown__unit")).toHaveCount(4);
    for (const unit of await page.locator(".adbar-countdown__unit").all()) {
      await expect(unit).toBeVisible();
    }
    for (const separator of await page.locator(".adbar-countdown__separator").all()) {
      await expect(separator).toBeVisible();
    }

    const sectionBox = await section.boundingBox();
    const messageBox = await message.boundingBox();
    const timerBox = await timer.boundingBox();
    expect(sectionBox).not.toBeNull();
    expect(messageBox).not.toBeNull();
    expect(timerBox).not.toBeNull();

    if (viewport.width < 768) {
      expect(sectionBox.height).toBeGreaterThanOrEqual(76);
      expect(timerBox.y).toBeGreaterThan(messageBox.y);
    } else {
      expect(sectionBox.height).toBe(50);
      expect(Math.abs(timerBox.y - messageBox.y)).toBeLessThan(12);
    }

    expect(await page.evaluate(() => document.documentElement.scrollWidth <= document.documentElement.clientWidth + 1)).toBe(true);

    if (process.env.PROMO_SCREENSHOTS === "1") {
      await page.screenshot({ path: testInfo.outputPath(`promo-${viewport.width}x${viewport.height}.png`), fullPage: true });
    }
  });
}

test("countdown respeta movimiento reducido", async ({ page }) => {
  await page.emulateMedia({ reducedMotion: "reduce" });
  await renderCountdown(page, true);
  const animationName = await page.locator("[data-adbar-countdown]").evaluate((node) => getComputedStyle(node).animationName);
  expect(animationName).toBe("none");
});
