#!/bin/bash

# Entering as Root
printf "🔑 Enter root password...\n" 
sudo -v

# Keep alive Root
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Install apps                                                                #
###############################################################################

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    printf "❌ Homebrew is not installed. Please install it first.\n"
    exit 1
fi

# Install Homebrew apps
printf "📲 Installing Applications...\n"
if ! brew bundle --file="$DOTFILES_DIR/install/profile/Brewfile"; then
    printf "❌ Failed to install some applications\n"
    exit 1
fi

printf "✅ Applications installed successfully\n"

###############################################################################
# Launch applications for initial setup                                        #
###############################################################################

# Applications that need manual setup
applications_to_open=(
    "spotify"     # Connect account
    "bitwarden"   # Login and setup
    "raycast"     # Initial setup and permissions
)

printf "🚀 Opening applications for setup...\n"
for app in "${applications_to_open[@]}"; do
    printf "=> Opening %s...\n" "$app"
    if ! open -a "$app" &>/dev/null; then
        printf "❌ Failed to open %s\n" "$app"
    fi
done

###############################################################################
# Cleanup                                                                     #
###############################################################################

printf "🧹 Cleaning up Homebrew...\n"
if ! brew doctor && brew update && brew cleanup && brew upgrade; then
    printf "❌ Cleanup encountered some issues\n"
    exit 1
fi

printf "✅ Setup completed successfully!\n"
