const puppeteer = require("puppeteer");
const path = require("path");

(async () => {
  const browser = await puppeteer.launch({
    headless: "new",
    args: ["--no-sandbox", "--disable-setuid-sandbox"]
  });

  const page = await browser.newPage();

  const filePath = "file://" + path.join(process.cwd(), "cv/index.html");
  await page.goto(filePath, { waitUntil: "networkidle0" });

  await page.pdf({
    path: "pdf/Cesar_Gomez_Senior_RoR_Engineer.pdf",
    format: "A4",
    printBackground: true,
    margin: {
      top: "10mm",
      bottom: "10mm",
      left: "10mm",
      right: "10mm"
    }
  });


  await browser.close();
})();

