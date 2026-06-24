FROM alpine:latest

# 1. Устанавливаем системные пакеты и все заголовки для сборки psutil/aiohttp
RUN apk add --no-cache curl bash python3 python3-dev linux-headers git build-base imagemagick py3-pip

# 2. Скачиваем sshx
RUN curl -sSf https://sshx.io/get | sh

# 3. Клонируем репозиторий бота прямо при сборке образа
RUN git clone https://github.com/unsidogandon/ratko /ratko

# 4. Переходим в папку и устанавливаем все зависимости БЕЗ виртуального окружения 
# Флаг --break-system-packages разрешает установку в системный питон внутри Docker
WORKDIR /ratko
RUN pip install --no-cache-dir --break-system-packages -r requirements.txt

# 5. При запуске контейнера стартует веб-сервер и sshx, а бот уже готов к работе
CMD sh -c "python3 -m http.server $PORT & sshx; echo 'Терминал упал, завершаем контейнер...'; exit 1"
