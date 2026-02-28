echo "Updating packages..."
if [ -n "$TERMUX_VERSION" ]; then
    pkg update -y || { echo "Failed to update packages"; exit 1; }
    echo "Installing tur-repo..."
    pkg install tur-repo || { echo "Failed to install tur-repo"; exit 1; }
else
    echo "Skipping package update and tur-repo installation for non-Termux environment"
fi

echo "Checking if code-server is already installed..."
if ! command -v code-server &> /dev/null
then
    echo "code-server not found, installing..."
    if [ -n "$TERMUX_VERSION" ]; then
        pkg install -y code-server || { echo "Failed to install code-server"; exit 1; }
    else
        curl -fsSL https://code-server.dev/install.sh | sh || { echo "Failed to install code-server"; exit 1; }
    fi
else
    echo "code-server is already installed"
fi

echo "Downloading GitHub Copilot extension..."
curl -L -o copilot-1.271.0.vsix https://ghproxy.cn/https://github.com/HG-ha/github-copilot_in_code-server/raw/main/copilot-1.271.0.vsix || { echo "Failed to download copilot extension"; exit 1; }

echo "Installing GitHub Copilot extension..."
code-server --install-extension copilot-1.271.0.vsix || { echo "Failed to install copilot extension"; exit 1; }

echo "Downloading GitHub Copilot Chat extension..."
curl -L -o copilot-chat-0.22.2024103102.vsix "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/GitHub/vsextensions/copilot-chat/0.22.2024103102/vspackage" || { echo "Failed to download copilot-chat extension"; exit 1; }

echo "Installing GitHub Copilot Chat extension..."
code-server --install-extension copilot-chat-0.22.2024103102.vsix || { echo "Failed to install copilot-chat extension"; exit 1; }

echo "Setup completed successfully!"
