FROM alpine:latest

# Устанавливаем системные пакеты, включая tmate
RUN apk add --no-cache curl bash python3 python3-dev linux-headers git build-base imagemagick py3-pip tmate

# Клонируем бота
RUN git clone https://github.com/unsidogandon/ratko /ratko

# Ставим зависимости в систему
WORKDIR /ratko
RUN pip install --no-cache-dir --break-system-packages -r requirements.txt

# Запускаем веб-сервер для крон-жоба и tmate в бесконечном цикле
CMD sh -c "python3 -m http.server $PORT & while true; do tmate -F; sleep 5; done"
