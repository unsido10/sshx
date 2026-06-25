FROM alpine:latest

# 1. Устанавливаем системные пакеты
RUN apk add --no-cache curl bash python3 python3-dev linux-headers git build-base imagemagick py3-pip

# 2. Создаем глобальный конфиг для pip, чтобы разрешить установку пакетов внутри скриптов бота (PEP 668 bypass)
RUN mkdir -p /root/.config/pip && echo -e "[global]\nbreak-system-packages = true" > /root/.config/pip/pip.conf

# 3. Скачиваем sshx
RUN curl -sSf https://sshx.io/get | sh

# 4. Клонируем бота
RUN git clone https://github.com/unsidogandon/ratko /ratko

# 5. Ставим зависимости в систему
WORKDIR /ratko
RUN pip install --no-cache-dir -r requirements.txt

# 6. Запускаем веб-сервер и терминал в бесконечном цикле
CMD sh -c "python3 -m http.server $PORT & while true; do sshx; sleep 5; done"
