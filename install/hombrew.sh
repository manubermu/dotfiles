#!/bin/bash

# DATE: 2020-04-16
# VERSION: 1.0

# Entering as Root
printf "Enter root password...\n"
sudo -v

# Keep alive Root
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Install dependencies                                                        #
###############################################################################

# Install XCode Command Line Tools
printf "🛠 Installing XCode CL tools...\n"
xcode-select --install

###############################################################################
# Homebrew installation                                                       #
###############################################################################

printf "🍺 Check Brew...\n"
if hash brew 2>/dev/null; then
    printf "🍺 Homebrew is already installed...\n"
else
	printf "🍺 Installing Homebrew...\n"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

###############################################################################
# Cleanup                                                                     #
###############################################################################

# Cleanup
printf "🍺 Cleanup...\n"
brew doctor && brew update && brew cleanup && brew upgrade && brew cask upgrade
