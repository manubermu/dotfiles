#!/bin/bash

# DATE: 2020-01-11
# VERSION: 1.9.2

###############################################################################
# Set variables                                                               #
###############################################################################

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

###############################################################################
# Menu                                                                        #
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
    #  (5) Update                                                                 #
    #  (0) Exit                                                                   #
    #                                                                             #
    ###############################################################################
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  echo "Ready to install Homebrew..."            | $DOTFILES_DIR/install/hombrew.sh ;;
    "2")  echo "Ready to install macOS..."               | $DOTFILES_DIR/install/applications.sh ;;
    "3")  echo "Ready to configure macOS"                | $DOTFILES_DIR/system_config/macos.sh ;;
    "4")  echo "Ready to configure extensions"           | $DOTFILES_DIR/system_config/duti/set.sh ;;
    "5")  echo "Ready to update..."                      | $DOTFILES_DIR/update.sh ;;
    "0")  exit                                                                   ;;
     * )  echo "Invalid option!"                                                 ;;
    esac
    sleep 1
done