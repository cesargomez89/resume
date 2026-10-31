FROM node:26-bookworm

# Install Chromium and required fonts
RUN apt-get update && apt-get install -y --no-install-recommends \
  chromium \
  fonts-liberation \
  fonts-noto-color-emoji \
  && rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Create app directory
WORKDIR /app

# Install Puppeteer
COPY package*.json ./
RUN npm install

# Copy CV files
COPY cv ./cv

CMD ["node", "cv/render.js"]
