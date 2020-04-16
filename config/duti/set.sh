#!/bin/bash

# DATE: 2020-04-16
# VERSION: 1.0

# Set default handlers/programs for file-types
# Dependency: duti (brew install duti)

###############################################################################
# Launch script                                                               #
###############################################################################

DUTI_DIR=$DOTFILES_DIR/config/duti

###############################################################################
# INNA                                  							          #
###############################################################################

#while read -r ext; do
#  duti -s com.colliderli.iina "$ext" all
#done <"${DUTI_DIR}/iina.txt"

###############################################################################
# Sublime Text                                                                #
###############################################################################

while read -r ext; do
  duti -s com.sublimetext.3 "$ext" all
done <"${DUTI_DIR}/sourcecode.txt"
