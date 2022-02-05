import puppeteer from "puppeteer";

void (async function run() {
  // enable config for containerless debugging
  const browser = await puppeteer.launch({
    // headless: false,
    // devtools: true,
    // defaultViewport: null,
    // args: ["--start-maximised"],
    // slowMo: 250,
  });

  console.info("Puppeteer run starting...");
  const page = await browser.newPage();

  try {
    await page.goto("https://github.com/haydnba/docker-puppeteer");
    await page.screenshot({ path: "screenshot.png" });
    console.info("Puppeteer run completed successfully...");
  } catch (err) {
    console.info("Puppeteer run failed on error:", err.message);
  }

  await browser.close();
})();
