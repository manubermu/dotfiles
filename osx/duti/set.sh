#!/usr/bin/env bash

# Set default handlers/programs for file-types
# Dependency: duti (brew install duti)

DUTI_DIR=$DOTFILES_DIR/dotfiles/macos/duti

# IINA (media files)
#while read -r ext; do
#  duti -s com.colliderli.iina "$ext" all
#done <"${DUTI_DIR}/iina.txt"

# Sublime Text
while read -r ext; do
  duti -s com.apple.TextEdit "$ext" all
done <"${DUTI_DIR}/sourcecode.txt"