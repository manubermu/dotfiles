#!/bin/bash

echo
echo "**************************"
echo "*** Homebrew formulas ***"
echo "*************************"
echo

formulas=(

    ### TOOLS ###
    wget
    cmake
    git
    git-lfs
    dockutil # Add/remove dock icons
    bash-completion2

    ### LANGUAGES ###
    python3
)

brew link --force openssl

brew install "${formulas[@]}"
brew cleanup # Remove outdated versions from the cellar.
