#!/bin/bash

###############################################################################
# Variables                                                                   #
###############################################################################

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

###############################################################################
# Change permissions                                                          #
###############################################################################

for DEFAULTS_FILE in "$DOTFILES_DIR"/install/*.sh; do
    chmod +x $DEFAULTS_FILE
done

for DEFAULTS_FILE in "$DOTFILES_DIR"/config/*.sh; do
    chmod +x $DEFAULTS_FILE
done

for DEFAULTS_FILE in "$DOTFILES_DIR"/config/duti/*.sh; do
    chmod +x $DEFAULTS_FILE
done

for DEFAULTS_FILE in "$DOTFILES_DIR"/sh/*.sh; do
    chmod +x $DEFAULTS_FILE
done

###############################################################################
# Options                                                                     #
###############################################################################

while :
do
    clear
    cat<<EOF
    ###############################################################################
    #                                                                             #
    #  Please enter your choice:                                                  #
    #                                                                             #
    #  (1) Install Homebrew                                                       #
    #  (2) Install Applications                                                   #
    #  (3) Configure macOS                                                        #
    #  (4) Configure extensions                                                   #
    #  (5) Install/Configure zsh                                                  #
    #  (0) Exit                                                                   #
    #                                                                             #
    ###############################################################################
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  echo "Installing Homebrew..."                  | $DOTFILES_DIR/install/hombrew.sh ;;
    "2")  echo "Installing macOS's applications..."      | $DOTFILES_DIR/install/applications.sh ;;
    "3")  echo "Configuring macOS's settings..."         | $DOTFILES_DIR/config/macos.sh ;;
    "4")  echo "Configuring extensions..."               | $DOTFILES_DIR/config/duti/set.sh ;;
    "5")  echo "Installing and configuring zsh..."       | $DOTFILES_DIR/zsh/zsh.sh ;;
    "0")  exit                                                                   ;;
     * )  echo "Oops! Invalid option!"                                                 ;;
    esac
    sleep 1
done