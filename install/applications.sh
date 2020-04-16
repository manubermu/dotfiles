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
# Install apps                                                                #
###############################################################################

# Install Homebrew apps
printf "📦 Installing Apps...\n"
brew bundle $DOTFILES_DIR/install/profile/Brewfile

###############################################################################
# Launch the following applications to set them up                            #
###############################################################################

applications_to_open=(
    spotify # Connect account
)

for i in "${applications_to_open[@]}"
do
    echo "=> Opening:" $i
    open -a "$i"
done

# Cleanup
printf "📦 Cleanup and final touches...\n"
brew doctor && brew update && brew cleanup && brew upgrade && brew cask upgrade && mas upgrade
