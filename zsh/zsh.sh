#!/bin/bash

###############################################################################
# Install zsh                                                                 #
###############################################################################

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
    printf "🛠 Installing Zsh...\n"
    brew install zsh
fi

# Install Oh-My-Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    printf "⚙️ Installing Oh-My-Zsh...\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
fi

# Install/Update Zsh plugins
printf "🔌 Installing/Updating Zsh plugins...\n"

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    cd "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" && git pull
fi

# zsh-syntax-highlighting
if ! brew list zsh-syntax-highlighting &>/dev/null; then
    brew install zsh-syntax-highlighting
else
    brew upgrade zsh-syntax-highlighting
fi

# Install Starship prompt
printf "🚀 Installing Starship prompt...\n"
if ! command -v starship &> /dev/null; then
    curl -sS https://starship.rs/install.sh | sh
else
    curl -sS https://starship.rs/install.sh | sh
fi

# Update Zsh configuration
printf "⚙️ Updating Zsh configuration...\n"
if [ -f "$HOME/.zshrc" ]; then
    printf "📦 Backing up existing .zshrc to .zshrc.backup...\n"
    cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

cp "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# Set zsh as default shell if it isn't already
if [ "$SHELL" != "$(which zsh)" ]; then
    printf "🔄 Setting Zsh as default shell...\n"
    chsh -s "$(which zsh)"
fi

printf "✅ Zsh setup completed successfully!\n"
