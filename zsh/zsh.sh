#!/bin/bash

# DATE: 2020-04-16
# VERSION: 1.0

###############################################################################
# Install zsh                                                                 #
###############################################################################

if [ "$0" == *"zsh" ]; then
	# Download Zsh plugins
	printf "⚙️ Download Zsh plugins...\n"
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	brew install zsh-syntax-highlighting

	# Update Zsh settings
	printf "⚙️ Update Zsh settings...\n"
	sudo rm -rf ~/.zshrc > /dev/null 2>&1
	cp $DOTFILES_DIR/zsh/.zshrc ~/.zshrc
else
	# Install Oh-My-Zsh
	printf "⚙️ Install Zsh...\n"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
