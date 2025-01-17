#!/bin/bash

###############################################################################
# Variables                                                                     #
###############################################################################

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

###############################################################################
# Helper functions                                                              #
###############################################################################

print_message() {
    echo -e "${BLUE}==>${NC} $1"
}

print_error() {
    echo -e "${RED}Error:${NC} $1"
}

print_success() {
    echo -e "${GREEN}Success:${NC} $1"
}

execute_script() {
    local script=$1
    local message=$2
    
    if [[ -f "$script" ]]; then
        print_message "$message"
        bash "$script"
        if [ $? -eq 0 ]; then
            print_success "Operation completed successfully"
        else
            print_error "Operation failed"
            read -n1 -r -p "Press any key to continue..."
        fi
    else
        print_error "Script not found: $script"
        read -n1 -r -p "Press any key to continue..."
    fi
}

###############################################################################
# Change permissions                                                            #
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
# Options                                                                       #
###############################################################################

while :
do
    clear
    cat << EOF
╔════════════════════════════════════════════════════════════════════════════╗
║                           macOS Setup Script                               ║
╠════════════════════════════════════════════════════════════════════════════╣
║                                                                            ║
║  1. Install Homebrew                                                       ║
║  2. Install Applications                                                   ║
║  3. Configure macOS                                                        ║
║  4. Install/Configure zsh                                                  ║
║                                                                            ║
║  0. Exit                                                                   ║
║                                                                            ║
╚════════════════════════════════════════════════════════════════════════════╝

EOF
    read -n1 -s -r -p "Please enter your choice [0-4]: " REPLY
    echo
    
    case "$REPLY" in
        "1")  execute_script "$DOTFILES_DIR/install/homebrew.sh" "Installing Homebrew..." ;;
        "2")  execute_script "$DOTFILES_DIR/install/applications.sh" "Installing macOS applications..." ;;
        "3")  execute_script "$DOTFILES_DIR/config/macos.sh" "Configuring macOS settings..." ;;
        "4")  execute_script "$DOTFILES_DIR/zsh/zsh.sh" "Installing and configuring zsh..." ;;
        "0")  echo "Goodbye!"; exit 0 ;;
        * )   print_error "Invalid option. Please try again."
              sleep 1 ;;
    esac
done