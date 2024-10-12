#!/bin/sh
set -e

echo "Activating feature 'fsd42-go'"

# Install Golang
GO_VERSION=${GOVERSION:-1.23}
echo "Installing Golang version $GO_VERSION"
curl -sSL https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz | tar -C /usr/local -xz
echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/profile

# Install Node.js
NODE_VERSION=${NODEVERSION:-lts}
echo "Installing Node.js version $NODE_VERSION"
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
. ~/.nvm/nvm.sh
nvm install $NODE_VERSION
nvm use $NODE_VERSION

# Install Zsh and Oh My Zsh if requested
if [ "${INSTALLZSH}" = "true" ]; then
    echo "Installing and configuring Zsh"
    apt-get update && apt-get install -y zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s $(which zsh)
fi

# Install GitHub CLI
echo "Installing GitHub CLI"
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt update && apt install gh -y

# Install Go Task
echo "Installing Go Task"
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin

# Install VS Code extensions
echo "Installing VS Code extensions"
code --install-extension golang.Go
code --install-extension ms-azuretools.vscode-docker
code --install-extension jinliming2.vscode-go-template

echo "FSD42 Golang Dev Container setup complete"
