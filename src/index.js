import puppeteer from "puppeteer";

const { PUPPETEER_SKIP_CHROMIUM_DOWNLOAD } = process.env;

void (async function run() {
  const args = PUPPETEER_SKIP_CHROMIUM_DOWNLOAD
    ? {
        /** Dockerised execution */
        executablePath: "google-chrome-stable",
      }
    : {
        /** Enabled for local debugging */
        headless: false,
        devtools: true,
        defaultViewport: null,
        args: ["--start-maximised"],
        slowMo: 250,
      };

  const browser = await puppeteer.launch(args);

  try {
    console.info("Puppeteer run starting...");
    const page = await browser.newPage();
    await page.goto("https://github.com/haydnba/docker-puppeteer");
    await page.screenshot({ path: "screenshot.png" });
    console.info("Puppeteer run completed successfully...");
  } catch (err) {
    console.warn("Puppeteer run failed on error:", err.message);
  }

  await browser.close();
})();
