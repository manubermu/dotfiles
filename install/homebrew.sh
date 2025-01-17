#!/bin/bash

# Entering as Root
printf "🔑 Enter root password...\n"
sudo -v

# Keep alive Root
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Install dependencies                                                        #
###############################################################################

# Install XCode Command Line Tools
printf "🛠 Installing XCode Command Line Tools...\n"
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
else
    printf "✅ XCode Command Line Tools already installed\n"
fi

###############################################################################
# Homebrew installation                                                       #
###############################################################################

printf "🍺 Checking for Homebrew...\n"
if command -v brew &>/dev/null; then
    printf "✅ Homebrew already installed\n"
else
    printf "🍺 Installing Homebrew...\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

###############################################################################
# Cleanup                                                                     #
###############################################################################

printf "🧹 Running Homebrew maintenance...\n"
if ! brew doctor && brew update && brew cleanup && brew upgrade; then
    printf "❌ Homebrew maintenance encountered some issues\n"
    exit 1
fi

printf "✅ Homebrew setup completed successfully!\n"
