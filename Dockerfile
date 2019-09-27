FROM richardchien/cqhttp:4.11.0

# 安装 Python3.7 和 Vim
RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.7 vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists \
    && curl https://bootstrap.pypa.io/get-pip.py | python3.7

# 设置环境变量
ENV CQHTTP_SERVE_DATA_FILES=true \
    CQHTTP_WS_REVERSE_API_URL=ws://127.0.0.1:8080/ws/api/ \
    CQHTTP_WS_REVERSE_EVENT_URL=ws://127.0.0.1:8080/ws/event/ \
    CQHTTP_USE_WS_REVERSE=true \
    CQHTTP_SHOW_LOG_CONSOLE=false
