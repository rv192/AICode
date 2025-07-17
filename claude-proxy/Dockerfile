# 使用轻量的 Python 镜像作为基础
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 安装 uv (使用官方推荐的方法)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# 添加 uv 到 PATH (检查多个可能的安装位置)
ENV PATH="/root/.cargo/bin:/root/.local/bin:${PATH}"

# 克隆 claude-code-proxy 仓库
RUN git clone https://github.com/fuergaosi233/claude-code-proxy.git .

# 验证 uv 安装并显示版本
RUN /root/.cargo/bin/uv --version || /root/.local/bin/uv --version || which uv

# 使用完整路径安装依赖
RUN /root/.cargo/bin/uv sync || /root/.local/bin/uv sync

# 复制启动脚本
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# 暴露代理端口
EXPOSE 8082

# 启动代理服务的命令
CMD ["/app/start.sh"]