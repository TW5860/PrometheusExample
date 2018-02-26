FROM node

ENV MOUNTEBANK_VERSION=1.13.0

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production

EXPOSE 2525
EXPOSE 8181

COPY always-success.json /etc/mountebank/always-success.json

CMD sleep 8640000
