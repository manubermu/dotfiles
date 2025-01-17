#!/bin/bash

# Entering as Root
printf "🔑 Enter root password...\n"
sudo -v

# Keep alive Root
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Configure Git                                                               #
###############################################################################

printf "💻 Configuring Git...\n"
sudo rm -rf ~/.gitconfig ~/.gitignore > /dev/null 2>&1
cp "$DOTFILES_DIR/config/git/.gitconfig" ~
cp "$DOTFILES_DIR/config/git/.gitignore" ~
git config --global core.excludesfile ~/.gitignore

###############################################################################
# Setup Folders                                                               #
###############################################################################

git_folders=(
  github
)

printf "🗂 Creating folders...\n"
for FOLDER in "${git_folders[@]}"
do
	mkdir -p "$HOME/Documents/dev/$FOLDER"
done

###############################################################################
# Configure Python                                                            #
###############################################################################

printf "🐍 Installing Python package manager (uv)...\n"
curl -LsSf https://astral.sh/uv/install.sh | sh

###############################################################################
# Configure macOS: Dock                                                       #
###############################################################################

printf "🚀 Configuring Dock...\n"
dockutil --no-restart --remove all
dockutil --no-restart --add '/Applications/Safari.app'
dockutil --no-restart --add '/Applications/Mail.app'
dockutil --no-restart --add '/Applications/Calendar.app'
dockutil --no-restart --add '/Applications/Slack.app'
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Ghostty.app"
dockutil --add '~/Downloads' --view grid --display folder --allhomes

###############################################################################
# Configure macOS: Finder                                                     #
###############################################################################

printf "📂 Configuring Finder...\n"

# Show/Hide settings
defaults write -g AppleShowAllExtensions -bool false
defaults write com.apple.finder AppleShowAllFiles false
chflags nohidden ~/Library
defaults write com.apple.finder ShowPathbar -bool true

# View settings
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Performance & Behavior
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Desktop & Window settings
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Time Machine
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
# Configure macOS: Safari                                                     #
###############################################################################

printf "🧭 Configuring Safari...\n"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

###############################################################################
# Apply Changes                                                               #
###############################################################################

printf "🔄 Restarting affected applications...\n"
for app in "Address Book" "Calendar" "Contacts" "Dock" "Finder" "Mail" "SystemUIServer" "iCal"; do
    killall "${app}" &> /dev/null
done

killall SystemUIServer
