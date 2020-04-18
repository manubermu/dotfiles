#!/bin/bash

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

printf "🗒 Setting Sublime Text extensions...\n"
while read -r ext; do
  duti -s com.sublimetext.3 "$ext" all
done <"${DUTI_DIR}/sourcecode.txt"
