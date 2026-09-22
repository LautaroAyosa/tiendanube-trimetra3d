import { defineConfig, devices } from "@playwright/test";

const configuredBaseUrl = process.env.CUSTOM_PAGES_BASE_URL;

export default defineConfig({
  testDir: "./tests/custom-pages",
  fullyParallel: true,
  forbidOnly: Boolean(process.env.CI),
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 2 : undefined,
  reporter: process.env.CI ? [["list"], ["html", { open: "never" }]] : "list",
  use: {
    baseURL: configuredBaseUrl || "http://127.0.0.1",
    trace: "retain-on-failure",
    screenshot: "only-on-failure",
    video: "retain-on-failure"
  },
  projects: [
    {
      name: "chromium",
      use: { ...devices["Desktop Chrome"] }
    }
  ]
});

export { configuredBaseUrl };
