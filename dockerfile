FROM alpine:latest

RUN apk add --no-cache curl bash python3 linux-headers git build-base imagemagick py3-pip

RUN curl -sSf https://sshx.io/get | sh

CMD sh -c "python3 -m http.server $PORT & while true; do sshx; sleep 5; done"
