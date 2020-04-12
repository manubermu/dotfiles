#!/bin/bash

echo
echo "**************************"
echo "*** Brew cask programs ***"
echo "**************************"
echo
echo "INSTALLING MAC Applications..."
echo

# Install Caskroom
brew tap caskroom/cask
brew tap caskroom/versions

applications_to_install=(

    # Essentials
    iterm2
    keka # zips, rar, and more
    rectangle # resize windows
    #superduper # Recoveries
    Bitwarden # password
    ticktick # to-do app
    appcleaner

    # Browsers
    firefox

    # Cloud storage
    #dropbox
    #google-drive

    # Text Editors
    sublime-text3

    # Dev

    # Messages
    skype
    slack
    telegram

    # Multimedia
    iina
    #vlc
    spotify
    transmission

    ### OTHERS ###
    # mactracker
    # cyberduck # FTP
    # transmit # FTP. Paid application
    # little-snitch # Network analyzer
    # hammerspoon # This is a tool for powerful automation of OS X
    # spark # Shortcuts manager
    # android-file-transfer
    # cheatsheet
    # virtualbox #  virtualization software
    # duet # Ipad to screen
    # bitbar
    # gpgtools # GPG Keychain and more GPG stuff
    # sqlitestudio # See SQL squemas
    # kindle
    # send-to-kindle
    # simpless
    # clamxav # antivirus
    # easyfind # finder with steroids
)

brew cask install install --appdir="~/Applications" "${applications_to_install[@]}"

########################################################
### Launch the following applications to set them up ###
########################################################

applications_to_open=(
    #flux # Setup day to wake up
    #dropbox # Start Syncing files
    spotify # Connect account
    #"little-snitch"
    #"Google chrome" # Setup google account
    #"google drive" # Start Syncing files
)

for i in "${applications_to_open[@]}"
do
    echo "=> Opening:" $i
    open -a "$i"
done

brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*