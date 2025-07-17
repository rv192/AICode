# 使用轻量的 Python 镜像作为基础
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 安装 git 和 curl (用于安装 uv)
RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

# 安装 uv
# 强制重新运行以避免缓存问题并安装 uv
RUN echo "Installing uv to break cache" && curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.astral/bin:${PATH}"

# 克隆 claude-code-proxy 仓库
RUN git clone https://github.com/fuergaosi233/claude-code-proxy.git .

# 使用 uv 安装依赖
RUN uv sync

# 暴露代理端口
EXPOSE 8082

# 启动代理服务的命令
CMD ["uv", "run", "claude-code-proxy"]