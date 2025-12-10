FROM node:20-bullseye

# Install required dependencies for Puppeteer / Chromium
RUN apt-get update && apt-get install -y \
  wget \
  gnupg \
  fonts-noto \
  fonts-noto-color-emoji \
  libxkbcommon0 \
  libgbm1 \
  libasound2 \
  libnss3 \
  libatk1.0-0 \
  libcups2 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  libxshmfence1 \
  libgtk-3-0 \
  xvfb \
  && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Install Puppeteer
COPY package*.json ./
RUN npm install

# Copy CV files
COPY cv ./cv

CMD ["node", "cv/render.js"]
