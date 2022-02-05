import puppeteer from "puppeteer";

void (async function run() {
  // enable config for debugging
  const browser = await puppeteer.launch({
    headless: false,
    devtools: true,
    defaultViewport: null,
    args: ["--start-maximised"],
    slowMo: 250,
  });

  const page = await browser.newPage();

  await page.goto("https://github.com/haydnba/docker-puppeteer");

  await Promise.all([
    page.waitForNavigation(),
    page.$eval('A[id="issues-tab"]', (el) => el.click()),
  ]);

  await Promise.all([
    page.waitForNavigation(),
    page.$eval('A[selected_link="repo_issues"]', (el) => el.click()),
  ]);

  await Promise.all([
    page.waitForNavigation(),
    page.$eval('A[title="Extra attention is needed"]', (el) => el.click()),
  ]);

  await browser.close();
})();
