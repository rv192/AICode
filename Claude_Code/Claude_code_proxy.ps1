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

# 设置控制台输出为 UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# === 设置区域：可根据需要修改 ===

# Claude Code 命令
$CLAUDE_COMMAND = "claude"

# Claude Proxy 服务地址
# 完整的代理服务URL，支持http或https
# 如果您的 Docker 在远程主机上，请修改为对应的地址
$ANTHROPIC_BASE_URL = "http://localhost:8082"

# Claude Code 需要的环境变量
# 认证 Token：
# - 如果代理服务器在 .env 中设置了 PROXY_API_KEY，此值必须与之完全匹配
# - 如果代理服务器未设置 PROXY_API_KEY，可以使用任意值
# - 建议：如果您在代理服务器中设置了认证，请在此处填入相同的值
$ANTHROPIC_AUTH_TOKEN = "any-value"
$MAX_TOKENS_LIMIT = 65535         # 根据您在 .env 中配置的大模型调整

#==================================================
# 函数定义
#==================================================

# 检查指定端口是否被占用
function Test-PortInUse {
    param([int]$Port)
    try {
        $connection = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue
        return [bool]$connection
    } catch {
        return $false
    }
}

#==================================================
# 脚本主体
#==================================================

# 1. 检查 Claude Code 是否已安装
Write-Host "📦 正在检查 Claude Code 是否已安装..." -ForegroundColor Cyan
try {
    $claudeVersion = & $CLAUDE_COMMAND --version 2>$null
    if ($claudeVersion) {
        Write-Host "✅ $CLAUDE_COMMAND 已安装" -ForegroundColor Green
    } else {
        throw "$CLAUDE_COMMAND not found"
    }
} catch {
    Write-Host "❌ 未检测到 $CLAUDE_COMMAND，尝试使用 npm 全局安装..." -ForegroundColor Yellow

    try {
        $npmVersion = npm --version 2>$null
        if (-not $npmVersion) {
            throw "npm not found"
        }
    } catch {
        Write-Host "❌ 未检测到 npm，请先安装 Node.js 环境" -ForegroundColor Red
        Write-Host "   下载地址: https://nodejs.org/"
        Read-Host "按任意键退出"
        exit 1
    }

    Write-Host "📥 正在全局安装 Claude Code..." -ForegroundColor Blue
    try {
        npm install -g @anthropic-ai/claude-code
        Write-Host "✅ Claude Code 安装成功" -ForegroundColor Green
    } catch {
        Write-Host "❌ 安装失败，请检查网络或权限" -ForegroundColor Red
        Read-Host "按任意键退出"
        exit 1
    }
}

# 2. 检查 Docker Proxy 服务是否正在运行
Write-Host ""
Write-Host "🔍 正在检查 Claude Proxy (Docker) 服务状态..." -ForegroundColor Cyan

# 从 ANTHROPIC_BASE_URL 中提取端口号进行检查
if ($ANTHROPIC_BASE_URL -match ':(\d+)') {
    $PROXY_PORT = [int]$matches[1]
} else {
    $PROXY_PORT = 80  # 默认端口，如果没有指定端口
}

if (-not (Test-PortInUse -Port $PROXY_PORT)) {
    Write-Host "⚠️  警告: 无法检测到在端口 ${PROXY_PORT} 上监听的代理服务。" -ForegroundColor Yellow
    Write-Host "   请确保您已经在 'claude-proxy' 目录下运行了 'docker-compose up -d'。" -ForegroundColor Yellow
    Write-Host "   或者检查 ANTHROPIC_BASE_URL 配置是否正确：$ANTHROPIC_BASE_URL" -ForegroundColor Yellow
    $choice = Read-Host "是否仍然尝试启动 Claude Code？(y/n)"
    if ($choice -notmatch '^[Yy是]$') {
        Write-Host "❌ 操作已取消。" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "✅ Claude Proxy 服务正在端口 ${PROXY_PORT} 上运行" -ForegroundColor Green
}

# 3. 启动 Claude Code
Write-Host ""
Write-Host "========================================================" -ForegroundColor Magenta
Write-Host "🚀           启动 Claude Code" -ForegroundColor Magenta
Write-Host "========================================================" -ForegroundColor Magenta
Write-Host "    代理地址: $ANTHROPIC_BASE_URL"
Write-Host "    最大令牌: $MAX_TOKENS_LIMIT"
Write-Host ""

# 为当前会话设置环境变量并启动 Claude Code
$env:CLAUDE_CODE_MAX_OUTPUT_TOKENS = $MAX_TOKENS_LIMIT
$env:ANTHROPIC_BASE_URL = $ANTHROPIC_BASE_URL
$env:ANTHROPIC_AUTH_TOKEN = $ANTHROPIC_AUTH_TOKEN

# 启动客户端
& $CLAUDE_COMMAND
