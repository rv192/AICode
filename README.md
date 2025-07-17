# 🤖 AI Utility Scripts Collection
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-blue.svg)](https://github.com)
[![Shell](https://img.shields.io/badge/Shell-Bash%20%7C%20PowerShell-green.svg)](https://github.com)

[🇨🇳 Chinese](./README_CN.md) | [🇺🇸 English](./README.md)

A comprehensive collection of practical AI-related scripts designed to simplify AI development workflows and automate common tasks.

## 🔧 Claude Code Automated Deployment Tool

### 🚀 Features Overview

This is a comprehensive toolset for automating the deployment of Claude Code and Claude Code Proxy, now with enhanced Docker support:

- ✅ **Auto Dependency Installation** - Detects and installs uv, npm, and Claude Code
- 🔄 **Proxy Service Management** - Automatically installs and configures Claude Code Proxy
- 🐳 **Docker Support** - Containerized proxy service for easy deployment and management
- 🚀 **One-Click Start** - Configures environment variables and starts the services
- ⚡ **Port Conflict Handling** - Intelligently detects and resolves port occupation issues
- 🔧 **Configuration Management** - Automatically configures the .env file and environment variables
- 🌐 **Cross-Platform Support** - Supports Windows, macOS, and Linux

### 🖥️ System Support

| System | Script File | Description |
|---|---|---|
| 🐧 **Linux/macOS** | `Claude_code_proxy.sh` | Bash script for Unix-like systems |
| 🪟 **Windows** | `Claude_code_proxy.ps1` | PowerShell script for Windows |
| 🐳 **Docker** | `docker-compose.yml` | Containerized proxy service deployment |

## 🚀 Quick Start

### Method 1: Docker Deployment (Recommended)

#### 1. Clone the Project

```bash
git clone https://github.com/sylearn/AICode.git
cd AICode
```

#### 2. Configure the Proxy Service

```bash
cd claude-proxy
cp .env.example .env
# Edit .env file with your API keys and configuration
```

**Important Security Configuration:**
- For enhanced security, you can set `PROXY_API_KEY` in the `.env` file
- This creates an authentication requirement for clients connecting to the proxy
- If set, make sure to use the same value in your client scripts' `ANTHROPIC_AUTH_TOKEN`

#### 3. Start the Proxy Service

```bash
# Start the containerized proxy service
docker-compose up -d

# Check service status
docker-compose logs -f
```

#### 4. Run Claude Code Client

```bash
cd ../Claude_Code

# For Linux/macOS
chmod +x Claude_code_proxy.sh
./Claude_code_proxy.sh

# For Windows
.\Claude_code_proxy.ps1
```

### Method 2: Traditional Script Deployment

#### 1. Clone the Project

```bash
git clone https://github.com/sylearn/AICode.git
cd AICode/Claude_Code
```

#### 2. Run the Script

##### For Linux/macOS

```bash
# Grant execution permission to the script
chmod +x Claude_code_proxy.sh

# Run the script
./Claude_code_proxy.sh
```

##### For Windows

```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Run the script
.\Claude_code_proxy.ps1
```

#### 3. Follow the Prompts to Complete Configuration

The script will automatically detect your environment and guide you through the configuration process.

## 💡 Features

### 🔍 Automatic Environment Detection

- Checks if Node.js and npm are installed
- Checks if the Python package manager uv is installed
- Checks if Claude Code is already installed
- Checks if Git is available

### 📦 Automatic Dependency Installation

- **uv Installation**: Automatically installs the Python package manager from the official source
- **Claude Code Installation**: Installs Claude Code globally via npm
- **Proxy Service Installation**: Automatically clones and configures Claude Code Proxy
- **Docker Support**: Containerized proxy service with automatic dependency management

### 🔧 Smart Configuration Management

- Automatically generates and updates the `.env` configuration file
- Intelligently detects the local IP address
- Automatically configures proxy server parameters
- Supports custom model and API configurations

### ⚡ Port Conflict Handling

- Automatically detects port usage status
- Intelligently identifies and terminates conflicting processes
- Supports interactive user choices for handling conflicts

### 🐳 Docker Deployment Advantages

- **Isolated Environment**: Containerized proxy service prevents dependency conflicts
- **Easy Management**: Simple start/stop with docker-compose commands
- **Consistent Deployment**: Same environment across different systems
- **Resource Control**: Built-in resource management and monitoring
- **Quick Setup**: Pre-configured environment with all dependencies included

## 📋 System Requirements

### Basic Requirements

- **Operating System**: Windows 10+, macOS 10.14+, Linux (Ubuntu 18.04+)
- **Network**: A stable internet connection
- **Permissions**: Administrator privileges (for installing dependencies)

### Deployment Method Comparison

| Feature | Docker Deployment | Traditional Script |
|---------|------------------|-------------------|
| **Setup Complexity** | Simple | Moderate |
| **Dependency Management** | Automatic | Manual detection |
| **Environment Isolation** | ✅ Containerized | ❌ Host system |
| **Resource Control** | ✅ Built-in | ❌ Limited |
| **Cross-platform** | ✅ Consistent | ⚠️ Platform-specific |
| **Prerequisites** | Docker + Docker Compose | Node.js + Git |
| **Maintenance** | Low | Moderate |
| **Recommended for** | Production, Teams | Development, Testing |

### Software Dependencies

| Software | Version Requirement | Auto-Install | Notes |
|---|---|---|---|
| Node.js | 16.0+ | ❌ | Requires manual installation |
| npm | 8.0+ | ✅ | Installed with Node.js |
| Git | 2.0+ | ❌ | Requires manual installation |
| Docker | 20.0+ | ❌ | Required for containerized deployment |
| Docker Compose | 2.0+ | ❌ | Required for containerized deployment |
| uv | Latest | ✅ | Script will install automatically |
| Claude Code | Latest | ✅ | Script will install automatically |

## 🛠️ Detailed Usage Instructions

### Docker Deployment (Recommended)

1.  **Prepare Your Environment**
    -   Ensure Docker and Docker Compose are installed
    -   Have your OpenAI API Key ready
    -   Have your API Base URL ready

2.  **Configure the Proxy Service**
    -   Copy `.env.example` to `.env` in the `claude-proxy` directory
    -   Edit the `.env` file with your API configuration

3.  **Start Services**
    -   Run `docker-compose up -d` to start the proxy service
    -   Run the Claude Code client script from the `Claude_Code` directory

### Traditional Script Deployment

1.  **Prepare Your Environment**
    -   Ensure Node.js and Git are installed
    -   Have your OpenAI API Key ready
    -   Have your API Base URL ready

2.  **Run the Script**
    -   Download and run the script for your operating system
    -   The script will auto-detect the environment and install any missing dependencies

3.  **Configure Parameters**
    -   The script will prompt you to enter API configuration details
    -   Alternatively, you can directly modify the configuration variables at the top of the script

### Subsequent Use

#### Docker Deployment
```bash
# Start proxy service
cd claude-proxy
docker-compose up -d

# Start Claude Code client
cd ../Claude_Code
./Claude_code_proxy.sh  # Linux/macOS
.\Claude_code_proxy.ps1  # Windows
```

#### Traditional Script Deployment
```bash
# Linux/macOS
./Claude_code_proxy.sh

# Windows
.\Claude_code_proxy.ps1
```

### Stopping the Services

#### Docker Deployment
```bash
# Stop Claude Code client: Press Ctrl+C
# Stop proxy service
cd claude-proxy
docker-compose down
```

#### Traditional Script Deployment
Press `Ctrl+C` to stop the Claude Code client, and the proxy service will stop automatically.

## ⚙️ Configuration Details

### Docker Configuration (.env file)

#### Basic Configuration

```bash
# Proxy service configuration
HOST="0.0.0.0"                           # Service listening address
PROXY_PORT=8082                           # Proxy service port
```

#### API Configuration

```bash
# OpenAI API configuration
OPENAI_API_KEY=sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
OPENAI_BASE_URL=https://api.openai.com/v1

# Security configuration (optional)
# PROXY_API_KEY=your-secret-auth-key  # Uncomment to enable client authentication

# Model configuration
BIG_MODEL="gpt-4-turbo"                   # Large model name
SMALL_MODEL="gpt-3.5-turbo"              # Small model name
```

#### Advanced Configuration

```bash
# Logging and performance
LOG_LEVEL="INFO"                          # Log level (DEBUG, INFO, WARNING, ERROR)
MAX_TOKENS_LIMIT=4096                     # Max token limit
MIN_TOKENS_LIMIT=1024                     # Min token limit
REQUEST_TIMEOUT=120                       # Request timeout (seconds)
MAX_RETRIES=3                            # Max retries
```

### Script Configuration Parameters

#### Basic Configuration

```bash
# Script Configuration Area (at the top of the script file)
CLAUDE_COMMAND="claude"                    # Claude Code command name
ANTHROPIC_BASE_URL="http://localhost:8082" # Complete proxy service URL
```

#### Client Configuration

```bash
# Claude Code client configuration
ANTHROPIC_BASE_URL="http://localhost:8082" # Complete proxy service URL (supports http/https)
ANTHROPIC_AUTH_TOKEN="any-value"          # Authentication token (see notes below)
MAX_TOKENS_LIMIT=65535                    # Max token limit for client
```

**Authentication Token Notes:**
- If the proxy server has `PROXY_API_KEY` set in its .env file, this value must match exactly
- If the proxy server does not have `PROXY_API_KEY` set, any value can be used
- Default: "any-value" works when proxy has no authentication configured

**URL Configuration Examples:**
```bash
# Local Docker deployment
ANTHROPIC_BASE_URL="http://localhost:8082"

# Remote server with HTTPS
ANTHROPIC_BASE_URL="https://your-proxy-server.com:8082"

# Custom port
ANTHROPIC_BASE_URL="http://192.168.1.100:9000"
```

### Security Configuration

#### Docker Proxy Authentication

To enable authentication for your Docker proxy service:

1. **Edit the proxy `.env` file:**
```bash
cd claude-proxy
# Uncomment and set your authentication key
PROXY_API_KEY=your-secret-auth-key-here
```

2. **Update client scripts:**
```bash
# In Claude_code_proxy.sh or Claude_code_proxy.ps1
ANTHROPIC_AUTH_TOKEN="your-secret-auth-key-here"  # Must match proxy setting
```

3. **Security Benefits:**
   - Prevents unauthorized access to your proxy service
   - Useful when deploying on shared or public networks
   - Recommended for production deployments

### Environment Variables

The script will automatically set the following environment variables:

- `CLAUDE_CODE_MAX_OUTPUT_TOKENS`: Max output tokens
- `ANTHROPIC_BASE_URL`: Proxy service address
- `ANTHROPIC_AUTH_TOKEN`: Proxy authentication token

## 🔧 Troubleshooting

### Common Issues

#### 1. Docker Issues

**Issue**: Docker service not starting

**Solution**:
```bash
# Check Docker status
docker --version
docker-compose --version

# Check if Docker daemon is running
docker ps

# Restart Docker service if needed
sudo systemctl restart docker  # Linux
# or restart Docker Desktop on Windows/macOS
```

#### 2. Permission Issues

**Issue**: Permission denied error during dependency installation

**Solution**:
```bash
# Linux/macOS
sudo ./Claude_code_proxy.sh

# Windows (Run PowerShell as Administrator)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### 3. API Configuration Issues

**Issue**: API Error (401 Invalid API key)
```log
[L] API Error (401 {"detail":"Invalid API key. Please provide a valid Anthropic API key."}) Retrying in 1 second
...
2025-07-14 16:03:56,450 - WARNING - Invalid API key provided by client
```

**Solution**:
```bash
# For Docker deployment - check your .env file
cat claude-proxy/.env

# For traditional deployment - check proxy .env file
cat ~/.claude/proxy/claude-code-proxy/.env
```
Make sure your `OPENAI_API_KEY` is correctly set. If using authentication, ensure `PROXY_API_KEY` matches between server and client.

#### 4. Port Conflicts

**Issue**: Port 8082 already in use

**Solution**:
```bash
# Check what's using the port
lsof -i :8082  # Linux/macOS
netstat -ano | findstr :8082  # Windows

# For Docker deployment, change port in .env file
PROXY_PORT=8083

# Update docker-compose.yml accordingly
```


### Debug Mode

To enable debugging, you can change the log level in the script:

```bash
LOG_LEVEL="DEBUG"  # Change the log level to DEBUG
```

### Manual Cleanup

#### Docker Deployment Cleanup
```bash
# Stop and remove containers
cd claude-proxy
docker-compose down

# Remove Docker images (optional)
docker rmi $(docker images -q)

# Clean up volumes (optional)
docker volume prune
```

#### Traditional Deployment Cleanup
```bash
# Clean up Claude Code Proxy
rm -rf ~/.claude/proxy

# Reinstall Claude Code
npm uninstall -g @anthropic-ai/claude-code
npm install -g @anthropic-ai/claude-code
```

## 📁 Project Structure

```
AICode/
├── Claude_Code/
│   ├── Claude_code_proxy.sh      # Linux/macOS client script
│   └── Claude_code_proxy.ps1     # Windows client script
├── claude-proxy/                 # Docker-based proxy service
│   ├── Dockerfile                # Docker container configuration
│   ├── docker-compose.yml        # Docker Compose configuration
│   └── .env.example              # Environment variables template
├── README.md                     # English documentation
├── README_CN.md                  # Chinese documentation
├── License                       # MIT License
└── .gitignore                    # Git ignore file
```

## 🤝 Contribution Guide

We welcome your contributions! Please follow these steps:

1.  Fork this repository
2.  Create your feature branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=sylearn/AICode&type=Date)](https://star-history.com/#sylearn/AICode&Date)

---

**Thank you for your support! 🙏**
