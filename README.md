## Run puppeteer in docker safely

### Run app locally

```bash
npm run start
```

### Run dockerised app locally

```bash
# Use the script
chmod u+x ./bin/run.sh
./bin/run.sh
```

### Rationale

Run puppeteer in docker without the dangerous `--no-sandbox` flag.

### @TODO

Skip the puppeteer crhomium download...
