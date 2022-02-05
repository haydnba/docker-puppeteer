## Run puppeteer in docker

### Context

Official documentation "strongly discourages" use of `--no-sandbox` flag with
dockerised puppeteer and appears to recommend creating a non-privileged user and
passing the equally suspect `--cap-add=SYS_ADMIN` flag to `docker run` command.

https://github.com/jessfraz/dotfiles/blob/master/etc/docker/seccomp/chrome.json
provides a means to preserve the sandbox and run the instance with a custom
seccomp profile.

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
