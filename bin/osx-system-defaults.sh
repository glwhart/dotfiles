#!/bin/bash

# ==============================================
# .osx-system-defaults
# for OS X Mountain Lion (10.8.x)
#
# Commands target the current boot drive
#
# Hannes Juutilainen <hjuutilainen@mac.com>
# ==============================================

### Adapted by Gus Hart, May 2017 (Yosemite)
### Need to run this with su privileges

# ==============================================
# Computer and Network names
# ==============================================

# Replace the last string with the desired name
defaults write /Library/Preferences/SystemConfiguration/preferences.plist LocalHostName "GLWH"
defaults write /Library/Preferences/SystemConfiguration/preferences.plist ComputerName "GLWH"

# ==============================================
# Date & Time
# ==============================================

/usr/sbin/systemsetup -settimezone "America/Denver"
/usr/sbin/systemsetup -setnetworktimeserver "time.apple.com"
/usr/sbin/systemsetup -setusingnetworktime on


# ==============================================
# Set energy preferences
# ==============================================

##GH# From <https://github.com/rtrouton/rtrouton_scripts/>
##GHIS_LAPTOP=`/usr/sbin/system_profiler SPHardwareDataType | grep "Model Identifier" | grep "Book"`
##GHif [[ "$IS_LAPTOP" != "" ]]; then
##GH    pmset -b sleep 15 disksleep 10 displaysleep 5 halfdim 1
##GH    pmset -c sleep 0 disksleep 0 displaysleep 30 halfdim 1
##GHelse
##GH    pmset sleep 0 disksleep 0 displaysleep 30 halfdim 1
##GHfi


##GH Not really sure what to do with the ALF stuff...

##GH# ==============================================
##GH# Application layer firewall
##GH# ==============================================
##GH
##GH# Enable ALF
##GHdefaults write /Library/Preferences/com.apple.alf globalstate -int 1
##GH
##GH# Allow signed apps
##GHdefaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool true
##GH
##GH# Enable logging
##GHdefaults write /Library/Preferences/com.apple.alf loggingenabled -bool true
##GH
##GH# Disable stealth mode
##GHdefaults write /Library/Preferences/com.apple.alf stealthenabled -bool false


# ==============================================
# Ambient light sensor
# ==============================================

# Display -> Automatically adjust brightness
defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool true

# Keyboard -> Adjust keyboard brightness in low light
defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool true
defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Keyboard Dim Time" -int 300


# ==============================================
# Login window
# ==============================================

# Display login window as: Name and password
defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool true

# Show shut down etc. buttons
defaults write /Library/Preferences/com.apple.loginwindow PowerOffDisabled -bool false

# Show input menu on login (so you can tell if it's dvorak or not)
defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

# Show any password hints
defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 1

##GH# Allow fast user switching
##GHdefaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool true

##GH# Hide users with UID under 500
##GHdefaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool YES


# ==============================================
# Set keyboard preferences
# ==============================================
defaults write /Library/Preferences/com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID "com.apple.keylayout.US"

# Delete the default layouts (US)
defaults delete /Library/Preferences/com.apple.HIToolbox AppleEnabledInputSources

# Enable Dvorak and US layout
defaults write /Library/Preferences/com.apple.HIToolbox AppleEnabledInputSources -array '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>0</integer><key>KeyboardLayout Name</key><string>U.S.</string></dict>'

defaults write /Library/Preferences/com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>16300</integer><key>KeyboardLayout Name</key><string>Dvorak</string></dict>'

# Enable key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool FALSE

# Set keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# shorten the delay until repeat
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)

##GH# Set scroll direction
##GHdefaults write /Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -bool false


# ==============================================
# Time Machine
# ==============================================

# Don't offer new disks for backup
defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true


##GH# ==============================================
##GH# Make links to useful apps
##GH# ==============================================
##GH
##GH# Archive Utility
##GHln -s "/System/Library/CoreServices/Archive Utility.app" "/Applications/Utilities/Archive Utility.app"
##GH
##GH# Directory Utility
##GHln -s "/System/Library/CoreServices/Directory Utility.app" "/Applications/Utilities/Directory Utility.app"
##GH
##GH# Screen Sharing
##GHln -s "/System/Library/CoreServices/Screen Sharing.app" "/Applications/Utilities/Screen Sharing.app"
##GH
##GH# Ticket Viewer
##GHln -s "/System/Library/CoreServices/Ticket Viewer.app" "/Applications/Utilities/Ticket Viewer.app"
##GH
##GH
##GHecho "Done. Note that these changes require a restart to take effect."
