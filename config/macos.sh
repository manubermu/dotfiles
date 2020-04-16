#!/bin/bash

# DATE: 2020-04-16
# VERSION: 1.0

###############################################################################
# Launch script                                                               #
###############################################################################

# Entering as Root
printf "Enter root password...\n"
sudo -v

# Keep alive Root
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Configure Git                                                               #
###############################################################################

sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.gitignore > /dev/null 2>&1
cp "$DOTFILES_DIR/config/git/.gitconfig" ~
cp "$DOTFILES_DIR/config/git/.gitignore" ~
git config --global core.excludesfile ~/.gitignore

###############################################################################
# Setup Folders                                                               #
###############################################################################

git_folders=(
  Github
)
printf "📦 Creating folders...\n"
for FOLDER in "${git_folders[@]}"
do
	mkdir -p "$HOME/Documents/$FOLDER" # -p => creates parent directory if not exists
done

###############################################################################
# Configure Python                                                            #
###############################################################################

# ⚙️ Download Python libraries [1/1]
printf "⚙️ Download Python libraries...\n"
pip3 install jupyter
pip3 install numpy
pip3 install pandas
pip3 install requests
pip3 install virtualenv

###############################################################################
# Configure macOS: Dock                                                       #
###############################################################################

printf "⚙️ Configuring Dock...\n"
dockutil --no-restart --remove all
dockutil --no-restart --add '/Applications/Calendar.app'
dockutil --no-restart --add '/Applications/Safari.app'
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Sublime Text.app"
dockutil --add '/Applications' --view grid --display folder --allhomes
dockutil --add '~/Downloads' --view grid --display folder --allhomes

###############################################################################
# Configure macOS: Finder                                                     #
###############################################################################

printf "⚙️ Configuring Finder...\n"
printf "⚙️ Finder: show file extension\n"
defaults write -g AppleShowAllExtensions -bool true
printf "⚙️ Finder: show hidden files\n"
defaults write com.apple.finder AppleShowAllFiles true
printf "⚙️ Finder: show Library folder\n"
chflags nohidden ~/Library
printf "⚙️ Finder: show path bar\n"
defaults write com.apple.finder ShowPathbar -bool true
printf "⚙️ Finder: set list view by default\n"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
printf "⚙️ Finder: keep folders on top\n"
defaults write com.apple.finder _FXSortFoldersFirst -bool true
printf "⚙️ Finder: disable creation of metadata files on Network and USB\n"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
printf "⚙️ Finder: remove open-with duplicates\n"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
printf "⚙️ Finder: show HD icons on Desktop\n"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
printf "⚙️ Finder: show full path\n"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
printf "⚙️ Finder: turn off window opening animation\n"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
printf "⚙️ Finder: turn off file info animation\n"
defaults write com.apple.finder DisableAllAnimations -bool true
printf "⚙️ Finder: Enable AirDrop over Ethernet and on unsupported Macs running Lion\n"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
printf "⚙️ Finder: Expand save dialog by default\n"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
printf "⚙️ Finder: Prevent Time Machine from prompting to use new hard drives as backup volume\n"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
# Configure macOS: Transmission.app                                           #
###############################################################################

printf "⚙️ Transmission: Use `~/Documents/Torrents` to store incomplete downloads\n"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"
printf "⚙️ Transmission: Use `~/Downloads` to store completed downloads\n"
defaults write org.m0k.transmission DownloadLocationConstant -bool true
printf "⚙️ Transmission: Don’t prompt for confirmation before downloading\n"
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false
printf "⚙️ Transmission: Don’t prompt for confirmation before removing non-downloading active transfers\n"
defaults write org.m0k.transmission CheckRemoveDownloading -bool true
printf "⚙️ Transmission: Trash original torrent files\n"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
printf "⚙️ Transmission: Hide the donate message\n"
defaults write org.m0k.transmission WarningDonate -bool false
printf "⚙️ Transmission: Hide the legal disclaimer\n"
defaults write org.m0k.transmission WarningLegal -bool false

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Address Book" "Calendar" "Contacts" "Dock" "Finder" "Mail" "SystemUIServer" "iCal"; do
    killall "${app}" &> /dev/null
done

killall SystemUIServer