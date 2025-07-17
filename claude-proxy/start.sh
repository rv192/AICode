#!/bin/bash

# 查找 uv 的安装位置
UV_PATH=""
if [ -f "/root/.cargo/bin/uv" ]; then
    UV_PATH="/root/.cargo/bin/uv"
elif [ -f "/root/.local/bin/uv" ]; then
    UV_PATH="/root/.local/bin/uv"
elif command -v uv &> /dev/null; then
    UV_PATH="uv"
else
    echo "Error: uv not found in any expected location"
    exit 1
fi

echo "Using uv at: $UV_PATH"
echo "Starting Claude Code Proxy..."

# 启动代理服务
exec "$UV_PATH" run claude-code-proxy
