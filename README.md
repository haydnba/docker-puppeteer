## Run puppeteer in docker

### Context

Official documentation "strongly discourages" use of `--no-sandbox` flag with
dockerised puppeteer and appears to recommend creating a non-privileged user and
passing the equally suspect `--cap-add=SYS_ADMIN` flag to `docker run` command.
Here we follow the second option for now... Still to be investigated are options
to manually configure the sandbox.

https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-puppeteer-in-docker
https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#setting-up-chrome-linux-sandbox

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

### @TODO

Typescript & ts-node
