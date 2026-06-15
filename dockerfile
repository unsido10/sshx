FROM alpine:latest

RUN apk add --no-cache curl bash

RUN curl -sSf https://sshx.io/get | sh

# Чтобы Render не ругался на отсутствие прослушивания порта,
# запускаем простой HTTP-сервер для keep-alive и пингов.
# Фоном запускаем sshx, а на переднем плане держим busybox httpd.
CMD (./sshx &) && busybox httpd -f -p $PORT
