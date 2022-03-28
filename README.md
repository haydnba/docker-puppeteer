## Secure headful docker puppeteer

Run containerised puppeteer chrome as securely as possible (e.g. for testing
untrusted domains), plus enable headful execution with Xvfb frame buffer.

### Context

Official puppeteer documentation "strongly discourages" the very common use of
`--no-sandbox` flag with dockerised puppeteer on security grounds, yet appears
to recommend creating a non-privileged user and passing the equally suspect
`--cap-add=SYS_ADMIN` flag to `docker run` command.

Generally the best option appears to be to use a custom "seccomp" profile (see
[here](https://docs.docker.com/engine/security/seccomp/)) - this is the pattern
[adopted/recommended](https://playwright.dev/docs/docker#crawling-and-scraping)
by the playwright team among others.

Implementation here follows the Playwright method of cloning the docker [default
seccomp profile](https://raw.githubusercontent.com/docker/engine/d0d99b04cf6e00ed3fc27e81fc3d94e7eda70af3/profiles/seccomp/default.json)
and adding a specific namespacing rule:

```json
{
  "comment": "Allow create user namespaces",
  "names": ["clone", "setns", "unshare"],
  "action": "SCMP_ACT_ALLOW",
  "args": [],
  "includes": {},
  "excludes": {}
}
```

An alternative is to use the Chrome seccomp profile provided by Jess Frazelle
[here](https://github.com/jessfraz/dotfiles/blob/master/etc/docker/seccomp/chrome.json)

### Resources

- https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-puppeteer-in-docker
- https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#setting-up-chrome-linux-sandbox
- https://security.stackexchange.com/questions/219577/how-to-securely-run-puppeteer-chromium-in-a-docker-container
- https://github.com/Zenika/alpine-chrome#-the-best-with-seccomp

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
