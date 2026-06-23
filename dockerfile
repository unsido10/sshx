FROM alpine:latest

# Добавляем tmux для управления сессиями терминала
RUN apk add --no-cache curl bash python3 tmux

RUN curl -sSf https://sshx.io/get | sh

# Скрипт-заглушка для удержания контейнера и запуска сервера
CMD sh -c "python3 -m http.server $PORT & tmux new-session -d -s main && tmux send-keys -t main 'sshx' Enter && tmux attach-session -t ma
in"
