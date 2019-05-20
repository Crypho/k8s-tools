FROM alpine

RUN apk update
RUN apk add curl jq bind-tools

COPY scripts /usr/local/bin/
