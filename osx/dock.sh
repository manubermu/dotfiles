#!/bin/bash

# Warning:
# Double quotes Whenever you use $HOME in the path
# Single quotes for the rest of the applications

# Source: https://github.com/webpro/dotfiles/blob/c55045c692088105dce3545637d8ab80f120908f/osx/dock.sh
# More info: https://jamfnation.jamfsoftware.com/discussion.html?id=16773

dockutil --no-restart --remove all
#dockutil --no-restart --add '/Applications/Skype.app'
#dockutil --no-restart --add '/Applications/Slack.app'


# Add space to System configuration
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type='spacer-tile';}'

dockutil --no-restart --add '/Applications/Calendar.app'
dockutil --no-restart --add '/Applications/Safari.app'

# Add space to System configuration
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type='spacer-tile';}'

dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Sublime Text.app"

# Add space to System configuration
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type='spacer-tile';}'

#dockutil --no-restart --add '/Applications/System Preferences.app'

# The following adds ~/Downloads as a grid stack displayed as a folder for every user's dock on that machine:
dockutil --add '/Applications' --view grid --display folder --allhomes
dockutil --add '~/Downloads' --view grid --display folder --allhomes

killall Dock