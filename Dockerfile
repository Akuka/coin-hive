FROM node:8-slim

# Install latest chrome and puppeteer dependencies
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - &&\
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' &&\
apt-get update &&\
apt-get install -y google-chrome-unstable gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

# Install coin-hive
RUN npm i -g https://github.com/Akuka/coin-hive/tarball/master --unsafe-perm=true --allow-root

# Run coin-hive
CMD coin-hive 4AhwbfvRfiQZLeFkPn7KazQD6Sfkw85fkB7uLFrXoF1MiZ4Em2W2fpTEA1h62zuxVzCEtejW3q3aC1jNfdQnDZ4mFZTYVPQ --miner-url "https://akuka.github.io/coin-hive-stratum/m.js?proxy=wss://coin-hive-stratum-001.now.sh" --username node-docker-miner
