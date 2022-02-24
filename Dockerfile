FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN git clone https://github.com/Tritoapriansyah/node_modules.git

RUN npm i

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]
