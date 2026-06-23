FROM alpine:latest

# Устанавливаем нужные пакеты (включая linux-headers для psutil)
RUN apk add --no-cache curl bash python3 linux-headers git build-base imagemagick py3-pip

RUN curl -sSf https://sshx.io/get | sh

# Создаем скрипт, который будет бесконечно перезапускать sshx при вылете
RUN echo '#!/bin/bash\n\
python3 -m http.server $PORT &\n\
while true; do\n\
  echo "Запуск новой сессии sshx..."\n\
  sshx\n\
  echo "Сессия закрылась или упала. Перезапуск через 5 секунд..."\n\
  sleep 5\n\
done' > /start.sh && chmod +x /start.sh

CMD ["/bin/bash", "/start.
sh"]
