FROM alpine:latest

RUN apk add --no-cache curl bash python3

RUN curl -sSf https://sshx.io/get | sh

CMD sh -c "sshx & python3 -m http.server $PORT"
