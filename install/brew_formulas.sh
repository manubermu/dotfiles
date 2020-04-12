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
    duti
    tmux

    ### LANGUAGES ###
    python3
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done
brew cleanup # Remove outdated versions from the cellar.
