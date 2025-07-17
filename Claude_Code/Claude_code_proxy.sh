#!/bin/bash
# ==================================================
# Claude Code 启动脚本 (通过 Docker Proxy)
# ==================================================
#
# 功能说明：
# 1. 自动检测并安装 Claude Code
# 2. 配置代理环境并启动 Claude Code
#
# 使用前置条件:
# - Claude Proxy 服务已通过 Docker Compose 启动
#
# 执行流程：
# ├── 环境检查
# │   └── 检查 Claude Code 是否安装
# └── 启动 Claude Code
#     ├── 配置代理环境变量
#     └── 启动 Claude Code 客户端
#
# ==================================================
# === 设置区域：可根据需要修改 ===

# Claude Code 命令
CLAUDE_COMMAND="claude"

# Claude Proxy 服务地址
# 完整的代理服务URL，支持http或https
# 如果您的 Docker 在远程主机上，请修改为对应的地址
ANTHROPIC_BASE_URL="http://localhost:8082"

# Claude Code 需要的环境变量
# 认证 Token：
# - 如果代理服务器在 .env 中设置了 PROXY_API_KEY，此值必须与之完全匹配
# - 如果代理服务器未设置 PROXY_API_KEY，可以使用任意值
# - 建议：如果您在代理服务器中设置了认证，请在此处填入相同的值
ANTHROPIC_AUTH_TOKEN="any-value"
MAX_TOKENS_LIMIT=65535         # 根据您在 .env 中配置的大模型调整

#==================================================
# 脚本主体
#==================================================

# 1. 检查 Claude Code 是否已安装
echo "📦 正在检查 Claude Code 是否已安装..."
if command -v $CLAUDE_COMMAND &>/dev/null; then
    echo "✅ $CLAUDE_COMMAND 已安装"
else
    echo "❌ 未检测到 $CLAUDE_COMMAND，尝试使用 npm 全局安装..."

    if ! command -v npm &>/dev/null; then
        echo "❌ 未检测到 npm，请先安装 Node.js 环境"
        exit 1
    fi

    echo "📥 正在全局安装 Claude Code..."
    if npm install -g @anthropic-ai/claude-code; then
        echo "✅ Claude Code 安装成功"
    else
        echo "❌ 安装失败，请检查网络或权限"
        exit 1
    fi
fi

# 2. 检查 Docker Proxy 服务是否正在运行
echo ""
echo "🔍 正在检查 Claude Proxy (Docker) 服务状态..."

# 从 ANTHROPIC_BASE_URL 中提取端口号进行检查
PROXY_PORT=$(echo "$ANTHROPIC_BASE_URL" | sed -n 's/.*:\([0-9]\+\).*/\1/p')
if [ -z "$PROXY_PORT" ]; then
    PROXY_PORT=80  # 默认端口，如果没有指定端口
fi

if ! lsof -i -P -n | grep -q ":${PROXY_PORT}.*LISTEN"; then
    echo "⚠️  警告: 无法检测到在端口 ${PROXY_PORT} 上监听的代理服务。"
    echo "   请确保您已经在 'claude-proxy' 目录下运行了 'docker-compose up -d'。"
    echo "   或者检查 ANTHROPIC_BASE_URL 配置是否正确：$ANTHROPIC_BASE_URL"
    read -p "是否仍然尝试启动 Claude Code？(y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy是]$ ]]; then
        echo "❌ 操作已取消。"
        exit 1
    fi
else
    echo "✅ Claude Proxy 服务正在端口 ${PROXY_PORT} 上运行"
fi

# 3. 启动 Claude Code
echo ""
echo "========================================================"
echo "🚀           启动 Claude Code"
echo "========================================================"
echo "    代理地址: $ANTHROPIC_BASE_URL"
echo "    最大令牌: $MAX_TOKENS_LIMIT"
echo ""

# 设置环境变量并启动 Claude Code
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=$MAX_TOKENS_LIMIT
export ANTHROPIC_BASE_URL=$ANTHROPIC_BASE_URL
export ANTHROPIC_AUTH_TOKEN=$ANTHROPIC_AUTH_TOKEN

# 启动客户端
$CLAUDE_COMMAND