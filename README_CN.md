# 🤖 AI 实用脚本集合
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-blue.svg)](https://github.com)
[![Shell](https://img.shields.io/badge/Shell-Bash%20%7C%20PowerShell-green.svg)](https://github.com)

[🇨🇳 中文文档](./README_CN.md) | [🇺🇸 English](./README.md)

一个全面的 AI 相关实用脚本集合，旨在简化 AI 开发工作流程并自动化常见任务。

## 🔧 Claude Code 自动化部署工具

### 🚀 功能概述

这是一个用于自动化部署 Claude Code 和 Claude Code Proxy 的综合工具集，现已增强 Docker 支持：

- ✅ **自动安装依赖** - 检测并安装 uv、npm、Claude Code
- 🔄 **代理服务管理** - 自动安装、配置 Claude Code Proxy
- 🐳 **Docker 支持** - 容器化代理服务，便于部署和管理
- 🚀 **一键启动** - 配置环境变量并启动服务
- ⚡ **端口冲突处理** - 智能检测和解决端口占用问题
- 🔧 **配置管理** - 自动配置 .env 文件和环境变量
- 🌐 **跨平台支持** - 支持 Windows、macOS、Linux

### 🖥️ 系统支持

| 系统 | 脚本文件 | 说明 |
|-----|---------|------|
| 🐧 **Linux/macOS** | `Claude_code_proxy.sh` | 适用于 Unix 系统的 Bash 脚本 |
| 🪟 **Windows** | `Claude_code_proxy.ps1` | 适用于 PowerShell 的脚本 |
| 🐳 **Docker** | `docker-compose.yml` | 容器化代理服务部署 |

## 🚀 快速开始

### 方法一：Docker 部署（推荐）

#### 1. 克隆项目

```bash
git clone https://github.com/rv192/AICode.git
cd AICode
```

#### 2. 配置代理服务

```bash
cd claude-proxy
cp .env.example .env
# 编辑 .env 文件，填入您的 API 密钥和配置信息
```

**重要的安全配置：**
- 为了增强安全性，您可以在 `.env` 文件中设置 `PROXY_API_KEY`
- 这将为连接到代理的客户端创建认证要求
- 如果设置了此值，请确保在客户端脚本的 `ANTHROPIC_AUTH_TOKEN` 中使用相同的值

#### 3. 启动代理服务

```bash
# 启动容器化代理服务
docker-compose up -d

# 查看服务状态
docker-compose logs -f
```

#### 4. 运行 Claude Code 客户端

```bash
cd ../Claude_Code

# Linux/macOS 系统
chmod +x Claude_code_proxy.sh
./Claude_code_proxy.sh

# Windows 系统
.\Claude_code_proxy.ps1
```

### 方法二：传统脚本部署

#### 1. 克隆项目

```bash
git clone https://github.com/sylearn/AICode.git
cd AICode/Claude_Code
```

#### 2. 运行脚本

##### Linux/macOS 系统

```bash
# 给脚本执行权限
chmod +x Claude_code_proxy.sh

# 运行脚本
./Claude_code_proxy.sh
```

##### Windows 系统

```powershell
# 以管理员身份运行 PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# 运行脚本
.\Claude_code_proxy.ps1
```

#### 3. 按照提示完成配置

脚本会自动检测环境并引导您完成配置过程。

## 💡 功能特性

### 🔍 自动环境检测

- 检测 Node.js 和 npm 是否安装
- 检测 Python 包管理器 uv 是否安装
- 检测 Claude Code 是否已安装
- 检测 Git 是否可用

### 📦 自动依赖安装

- **uv 安装**: 自动从官方源安装 Python 包管理器
- **Claude Code 安装**: 通过 npm 全局安装 Claude Code
- **代理服务安装**: 自动克隆和配置 Claude Code Proxy
- **Docker 支持**: 容器化代理服务，自动管理依赖

### 🔧 智能配置管理

- 自动生成和更新 `.env` 配置文件
- 智能检测本地 IP 地址
- 自动配置代理服务器参数
- 支持自定义模型和 API 配置

### ⚡ 端口冲突处理

- 自动检测端口占用情况
- 智能识别和终止冲突进程
- 支持用户交互式选择处理方式

### 🐳 Docker 部署优势

- **隔离环境**: 容器化代理服务防止依赖冲突
- **便于管理**: 使用 docker-compose 命令简单启停
- **一致部署**: 在不同系统上保持相同环境
- **资源控制**: 内置资源管理和监控
- **快速设置**: 预配置环境，包含所有依赖

## 📋 系统要求

### 基础要求

- **操作系统**: Windows 10+, macOS 10.14+, Linux (Ubuntu 18.04+)
- **网络**: 稳定的互联网连接
- **权限**: 管理员权限（用于安装依赖）

### 部署方法比较

| 功能特性 | Docker 部署 | 传统脚本 |
|---------|------------|---------|
| **设置复杂度** | 简单 | 中等 |
| **依赖管理** | 自动 | 手动检测 |
| **环境隔离** | ✅ 容器化 | ❌ 主机系统 |
| **资源控制** | ✅ 内置 | ❌ 有限 |
| **跨平台** | ✅ 一致性 | ⚠️ 平台特定 |
| **前置条件** | Docker + Docker Compose | Node.js + Git |
| **维护成本** | 低 | 中等 |
| **推荐用于** | 生产环境、团队 | 开发、测试 |

### 依赖软件

| 软件 | 版本要求 | 自动安装 | 说明 |
|------|----------|----------|------|
| Node.js | 16.0+ | ❌ | 需要手动安装 |
| npm | 8.0+ | ✅ | 随 Node.js 安装 |
| Git | 2.0+ | ❌ | 需要手动安装 |
| Docker | 20.0+ | ❌ | 容器化部署必需 |
| Docker Compose | 2.0+ | ❌ | 容器化部署必需 |
| uv | 最新版 | ✅ | 脚本自动安装 |
| Claude Code | 最新版 | ✅ | 脚本自动安装 |

## 🛠️ 详细使用说明

### Docker 部署（推荐）

1. **环境准备**
   - 确保已安装 Docker 和 Docker Compose
   - 准备好您的 OpenAI API Key
   - 准备好您的 API Base URL

2. **配置代理服务**
   - 在 `claude-proxy` 目录下复制 `.env.example` 为 `.env`
   - 编辑 `.env` 文件，填入您的 API 配置

3. **启动服务**
   - 运行 `docker-compose up -d` 启动代理服务
   - 从 `Claude_Code` 目录运行 Claude Code 客户端脚本

### 传统脚本部署

1. **环境准备**
   - 确保已安装 Node.js 和 Git
   - 准备好您的 OpenAI API Key
   - 准备好您的 API Base URL

2. **运行脚本**
   - 下载并运行对应系统的脚本
   - 脚本会自动检测环境并安装缺失的依赖

3. **配置参数**
   - 脚本会提示您输入 API 配置信息
   - 或者直接修改脚本顶部的配置变量

### 后续使用

#### Docker 部署
```bash
# 启动代理服务
cd claude-proxy
docker-compose up -d

# 启动 Claude Code 客户端
cd ../Claude_Code
./Claude_code_proxy.sh  # Linux/macOS
.\Claude_code_proxy.ps1  # Windows
```

#### 传统脚本部署
```bash
# Linux/macOS
./Claude_code_proxy.sh

# Windows
.\Claude_code_proxy.ps1
```

### 停止服务

#### Docker 部署
```bash
# 停止 Claude Code 客户端：按 Ctrl+C
# 停止代理服务
cd claude-proxy
docker-compose down
```

#### 传统脚本部署
按 `Ctrl+C` 停止 Claude Code 客户端，代理服务会自动停止。

## ⚙️ 配置说明

### Docker 配置（.env 文件）

#### 基础配置

```bash
# 代理服务配置
HOST="0.0.0.0"                           # 服务监听地址
PROXY_PORT=8082                           # 代理服务端口
```

#### API 配置

```bash
# OpenAI API 配置
OPENAI_API_KEY=sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
OPENAI_BASE_URL=https://api.openai.com/v1

# 安全配置（可选）
# PROXY_API_KEY=your-secret-auth-key  # 取消注释以启用客户端认证

# 模型配置
BIG_MODEL="gpt-4-turbo"                   # 大模型名称
SMALL_MODEL="gpt-3.5-turbo"              # 小模型名称
```

#### 高级配置

```bash
# 日志和性能
LOG_LEVEL="INFO"                          # 日志级别 (DEBUG, INFO, WARNING, ERROR)
MAX_TOKENS_LIMIT=4096                     # 最大 Token 限制
MIN_TOKENS_LIMIT=1024                     # 最小 Token 限制
REQUEST_TIMEOUT=120                       # 请求超时时间（秒）
MAX_RETRIES=3                            # 最大重试次数
```

### 脚本配置参数

#### 基础配置

```bash
# 脚本配置区域 (在脚本文件顶部)
CLAUDE_COMMAND="claude"                    # Claude Code 命令名
ANTHROPIC_BASE_URL="http://localhost:8082" # 完整的代理服务 URL
```

#### 客户端配置

```bash
# Claude Code 客户端配置
ANTHROPIC_BASE_URL="http://localhost:8082" # 完整的代理服务 URL（支持 http/https）
ANTHROPIC_AUTH_TOKEN="any-value"          # 认证 Token（详见下方说明）
MAX_TOKENS_LIMIT=65535                    # 客户端最大 Token 限制
```

**认证 Token 说明：**
- 如果代理服务器在 .env 文件中设置了 `PROXY_API_KEY`，此值必须完全匹配
- 如果代理服务器未设置 `PROXY_API_KEY`，可以使用任意值
- 默认值："any-value" 适用于代理服务器未配置认证的情况

**URL 配置示例：**
```bash
# 本地 Docker 部署
ANTHROPIC_BASE_URL="http://localhost:8082"

# 远程服务器使用 HTTPS
ANTHROPIC_BASE_URL="https://your-proxy-server.com:8082"

# 自定义端口
ANTHROPIC_BASE_URL="http://192.168.1.100:9000"
```

### 安全配置

#### Docker 代理认证

为您的 Docker 代理服务启用认证：

1. **编辑代理 `.env` 文件：**
```bash
cd claude-proxy
# 取消注释并设置您的认证密钥
PROXY_API_KEY=your-secret-auth-key-here
```

2. **更新客户端脚本：**
```bash
# 在 Claude_code_proxy.sh 或 Claude_code_proxy.ps1 中
ANTHROPIC_AUTH_TOKEN="your-secret-auth-key-here"  # 必须与代理设置匹配
```

3. **安全优势：**
   - 防止未经授权访问您的代理服务
   - 在共享或公共网络上部署时很有用
   - 推荐用于生产环境部署

### 环境变量

脚本会自动设置以下环境变量：

- `CLAUDE_CODE_MAX_OUTPUT_TOKENS`: 最大输出 Token 数
- `ANTHROPIC_BASE_URL`: 代理服务地址
- `ANTHROPIC_AUTH_TOKEN`: 代理认证 Token

## 🔧 故障排除

### 常见问题

#### 1. Docker 问题

**问题**: Docker 服务无法启动

**解决方案**:
```bash
# 检查 Docker 版本
docker --version
docker-compose --version

# 检查 Docker 守护进程是否运行
docker ps

# 如需重启 Docker 服务
sudo systemctl restart docker  # Linux
# 或在 Windows/macOS 上重启 Docker Desktop
```

#### 2. 权限问题

**问题**: 安装依赖时提示权限不足

**解决方案**:
```bash
# Linux/macOS
sudo ./Claude_code_proxy.sh

# Windows (以管理员身份运行 PowerShell)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### 3. API 配置问题

**问题**: API Error (401 Invalid API key)
```log
[L] API Error (401 {"detail":"Invalid API key. Please provide a valid Anthropic API key."}) Retrying in 1 second
...
2025-07-14 16:03:56,450 - WARNING - Invalid API key provided by client
```

**解决方案**:
```bash
# Docker 部署 - 检查 .env 文件
cat claude-proxy/.env

# 传统部署 - 检查代理 .env 文件
cat ~/.claude/proxy/claude-code-proxy/.env
```
确保您的 `OPENAI_API_KEY` 设置正确。如果使用认证，请确保服务器和客户端的 `PROXY_API_KEY` 匹配。

#### 4. 端口冲突

**问题**: 端口 8082 已被占用

**解决方案**:
```bash
# 检查端口占用情况
lsof -i :8082  # Linux/macOS
netstat -ano | findstr :8082  # Windows

# Docker 部署，在 .env 文件中更改端口
PROXY_PORT=8083

# 相应更新 docker-compose.yml
```


### 调试模式

如需调试，可以修改脚本中的日志级别：

```bash
LOG_LEVEL="DEBUG"  # 将日志级别改为 DEBUG
```

### 手动清理

#### Docker 部署清理
```bash
# 停止并删除容器
cd claude-proxy
docker-compose down

# 删除 Docker 镜像（可选）
docker rmi $(docker images -q)

# 清理卷（可选）
docker volume prune
```

#### 传统部署清理
```bash
# 清理 Claude Code Proxy
rm -rf ~/.claude/proxy

# 重新安装 Claude Code
npm uninstall -g @anthropic-ai/claude-code
npm install -g @anthropic-ai/claude-code
```

## 📁 项目结构

```
AICode/
├── Claude_Code/
│   ├── Claude_code_proxy.sh      # Linux/macOS 客户端脚本
│   └── Claude_code_proxy.ps1     # Windows 客户端脚本
├── claude-proxy/                 # Docker 代理服务
│   ├── Dockerfile                # Docker 容器配置
│   ├── docker-compose.yml        # Docker Compose 配置
│   └── .env.example              # 环境变量模板
├── README.md                     # 英文文档
├── README_CN.md                  # 中文文档
├── License                       # MIT 许可证
└── .gitignore                    # Git 忽略文件
```

## 🤝 贡献指南

我们欢迎您的贡献！请遵循以下步骤：

1. Fork 本仓库
2. 创建您的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的修改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开一个 Pull Request

## ⭐ Star 历史

[![Star History Chart](https://api.star-history.com/svg?repos=sylearn/AICode&type=Date)](https://star-history.com/#sylearn/AICode&Date)

---

**感谢您的支持！🙏**
