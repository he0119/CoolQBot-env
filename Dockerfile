FROM coolq/wine-coolq:v2.0.1

# 添加 CoolQ HTTP API 插件
ARG VER=4.8.0

ADD https://github.com/richardchien/coolq-http-api/releases/download/${VER}/io.github.richardchien.coolqhttpapi.cpk /home/user/io.github.richardchien.coolqhttpapi.cpk
ADD https://raw.githubusercontent.com/richardchien/coolq-http-api/master/docker/bootstrap.py /home/user/bootstrap.py
RUN chown user:user /home/user/io.github.richardchien.coolqhttpapi.cpk /home/user/bootstrap.py
RUN echo "\n\nsudo -E -Hu user /usr/bin/python3 /home/user/bootstrap.py" >> /etc/cont-init.d/110-get-coolq

EXPOSE 5700

# 安装 Python3.7 和 Vim
RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.7 vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

# 设置环境变量
ENV CQHTTP_SERVE_DATA_FILES=true \
    CQHTTP_WS_REVERSE_API_URL=ws://127.0.0.1:8080/ws/api/ \
    CQHTTP_WS_REVERSE_EVENT_URL=ws://127.0.0.1:8080/ws/event/ \
    CQHTTP_USE_WS_REVERSE=true
