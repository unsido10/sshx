FROM alpine:latest

RUN apk add --no-cache curl bash busybox

RUN curl -sSf https://sshx.io/get | sh

# Запускаем sshx в фоне, а на переднем плане — busybox httpd, который слушает порт $PORT
CMD sh -c "sshx & busybox httpd -f -p $PORT"
