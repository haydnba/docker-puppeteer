FROM node:16-slim

LABEL "repository"="https://github.com/haydnba/docker-puppeteer"
LABEL "maintainer"="Haydn Appleby"

# https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-puppeteer-in-docker
RUN apt-get update \
  && apt-get install -y wget gnupg xvfb \
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update \
  && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
    --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy to working directory
COPY . .

# Launch browser with browser.launch({executablePath: 'google-chrome-stable'})
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Project dependencies
RUN npm install

# Add user so we don't need --no-sandbox.
RUN groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
  && mkdir -p /home/pptruser/Downloads \
  && chown -R pptruser:pptruser /home/pptruser \
  && chown -R pptruser:pptruser /app

# Run everything after as non-privileged user.
USER pptruser

# Create the display
ENV DISPLAY :99

# Start the automation
CMD Xvfb :99 -screen 0 1024x768x16 & npm run start
