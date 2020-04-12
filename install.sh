#!/bin/bash

# Get dotfiles directory to (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Homebrew installation
if hash brew 2>/dev/null; then
    echo "Brew is already installed"
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#################################################
### Add Symbolic links to configuration files ###
#################################################

add_config_symbolic_links () {
	ln -sfv "$DOTFILES_DIR/config/git/.gitconfig" ~
	ln -sfv "$DOTFILES_DIR/config/git/.gitignore" ~
}

read -p "=> Do you want to add symbolic links? [y/n]: "
if [ "$REPLY" == "y" ]; then
  clear # clear the screen
  add_config_symbolic_links
fi

#####################################
### Install Programs and binaries ###
#####################################

read -p "=> Do you want to install all your scripts inside $DOTFILES_DIR/install? [y/n]: "

if [ "$REPLY" == "y" ]; then

  for INSTALLFILE in "$DOTFILES_DIR"/install/*.sh; do
      [ -f "$INSTALLFILE" ] && . "$INSTALLFILE"
  done

fi

######################
### SET UP FOLDERS ###
######################

echo
read -p "=> Do you want to create dev folders? [y/n]: "
if [ "$REPLY" == "y" ]; then
  . "$DOTFILES_DIR/system/documents.sh"
fi

echo
read -p "=> Do you want to modify the Dock? [y/n]: "
if [ "$REPLY" == "y" ]; then
  . "$DOTFILES_DIR/osx/launch.sh"
fi