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

Avoid the dangerous `--no-sandbox` flag with dockerised puppeteer by creating a
non-privileged user and passing the `--dap-add=SYS_ADMIN` falg to `docker run`
command.

https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-puppeteer-in-docker
https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#setting-up-chrome-linux-sandbox

### @TODO

Typescript & ts-node
