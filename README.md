# GitHub Copilot in code-server

这个项目提供了一个一键式安装脚本来设置代码服务器中的GitHub Copilot。按照以下步骤在代码服务器环境中安装和配置GitHub Copilot

### 已经过测试的功能
1. 代码补全
2. Copilot Chat

## 一键安装
```bash
curl -fsSL https://ghproxy.cn/https://github.com/HG-ha/github-copilot_in_code-server/blob/main/setup_github_copilot.sh | sh
```

##  手动安装

1. 安装code-server
   1. 在Termux中安装
      ```bash
      pkg update -y
      pkg install tur-repo
      pkg install code-server
      ```
   2. 通过proot-distro环境安装
      ```bash
      pkg install proot-distro
      proot-distro install debian
      proot-distro login debian
      curl -fsSL https://code-server.dev/install.sh | sh
      ```

2. **安装github copilot**:
   ```bash
   curl -L -o copilot-1.271.0.vsix https://ghproxy.cn/https://github.com/HG-ha/github-copilot_in_code-server/raw/main/copilot-1.271.0.vsix
   code-server --install-extension copilot-1.271.0.vsix
   ```

3. **安装github copilot chat**:
   ```bash
   curl -L -o copilot-chat-0.22.2024103102.vsix "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/GitHub/vsextensions/copilot-chat/0.22.2024103102/vspackage"
   code-server --install-extension copilot-chat-0.22.2024103102.vsix
   ```

## 可能出现的问题
1. 无法完整显示github copilot
2. 每次打开新文件都需要手动开启一次copilot
3. 顶部没有github copilot图标
