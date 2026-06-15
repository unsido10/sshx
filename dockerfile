FROM alpine:latest

RUN apk add --no-cache curl bash

RUN curl -sSf https://sshx.io/get | sh

CMD sshx
