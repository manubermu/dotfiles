#!/bin/bash

# Get dotfiles directory to (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"



#####################################
### Install Programs and binaries ###
#####################################

echo
read -p "=> Do you want to install all your scripts inside $DOTFILES_DIR/install? [y/n]: "

if [ "$REPLY" == "y" ]; then

  for INSTALLFILE in "$DOTFILES_DIR"/install/*.sh; do
      [ -f "$INSTALLFILE" ] && . "$INSTALLFILE"
  done

fi


###################
### zsh plugins ###
###################

echo
read -p "=> Do you want to install zsh plugins? [y/n]: "

if [ "$REPLY" == "y" ]; then
	if [ "$0" == *"zsh" ]; then
	    echo "Installing plugins to" $ZSH_CUSTOM

	    # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
	    brew install zsh-syntax-highlighting

	    # https://github.com/zsh-users/zsh-autosuggestions
	    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	else
	    # oh-my-zsh
	    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi
fi

echo
read -p "=> Do you want to modify the Sublime Text 3 extensions? [y/n]: "
if [ "$REPLY" == "y" ]; then
  . "$DOTFILES_DIR/osx/duti/set.sh"
fi