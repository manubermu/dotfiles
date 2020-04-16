#!/bin/bash

###############################################################################
# Launch script                                                               #
###############################################################################

# Entering as Root
printf "Enter root password...\n"
sudo -v

# Keep alive Root
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Add Symbolic links to configuration files                                   #
###############################################################################

ln -sfv "$DOTFILES_DIR/config/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/config/git/.gitignore" ~
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
# macOS Config                                                                #
###############################################################################

# Finder                                                                      

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# "expand save dialog by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

# Time Machine                                                                

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

# Sublime Text                                                                

# Install Sublime Text settings
cp -r init/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null

# Transmission.app                                                            

# Use `~/Documents/Torrents` to store incomplete downloads
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

# Use `~/Downloads` to store completed downloads
defaults write org.m0k.transmission DownloadLocationConstant -bool true

# Don’t prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false

# Don’t prompt for confirmation before removing non-downloading active transfers
defaults write org.m0k.transmission CheckRemoveDownloading -bool true

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

# IP block list.
# Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true

# Randomize port on launch
defaults write org.m0k.transmission RandomPort -bool true

# Dock 
# Source: https://github.com/webpro/dotfiles/blob/c55045c692088105dce3545637d8ab80f120908f/osx/dock.sh
# More info: https://jamfnation.jamfsoftware.com/discussion.html?id=16773

dockutil --no-restart --remove all
#dockutil --no-restart --add '/Applications/Skype.app'
#dockutil --no-restart --add '/Applications/Slack.app'


# Add space to System configuration
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type='spacer-tile';}'

dockutil --no-restart --add '/Applications/Calendar.app'
dockutil --no-restart --add '/Applications/Safari.app'

# Add space to System configuration
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type='spacer-tile';}'

dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Sublime Text.app"

# Add space to System configuration
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type='spacer-tile';}'

#dockutil --no-restart --add '/Applications/System Preferences.app'

# The following adds ~/Downloads as a grid stack displayed as a folder for every user's dock on that machine:
dockutil --add '/Applications' --view grid --display folder --allhomes
dockutil --add '~/Downloads' --view grid --display folder --allhomes

killall Dock

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Address Book" "Calendar" "Contacts" "Dock" "Finder" "Mail" "SystemUIServer" "iCal"; do
    killall "${app}" &> /dev/null
done

killall SystemUIServer