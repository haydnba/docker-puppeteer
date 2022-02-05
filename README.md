## Safe run puppeteer in docker

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
