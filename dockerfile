FROM alpine:latest

# Устанавливаем все зависимости, включая компиляторы и заголовки для psutil
RUN apk add --no-cache curl bash python3 linux-headers git build-base imagemagick py3-pip

# Скачиваем sshx
RUN curl -sSf https://sshx.io/get | sh

# Запускаем сервер на порту Render и бесконечный цикл перезапуска sshx (всё в одну строку)
CMD sh -c "python3 -m http.server $PORT & while true; do echo 'Запуск sshx...'; sshx; echo 'Сессия упала. Перезапуск через 5 сек...'; sleep 5; do
ne"
