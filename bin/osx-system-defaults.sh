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

##GH # Show input menu on login (so you can tell if it's dvorak or not
defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

##GH Show any password hints
defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 1

##GH# Allow fast user switching
##GHdefaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool true

##GH# Hide users with UID under 500
##GHdefaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool YES


# ==============================================
# Set keyboard preferences
# ==============================================
defaults write /Library/Preferences/com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID "com.apple.keylayout.US"
##GH defaults write /Library/Preferences/com.apple.HIToolbox AppleDefaultAsciiInputSource -dict InputSourceKind "Keyboard Layout" "KeyboardLayout ID" -int 17 "KeyboardLayout Name" Finnish

# Delete the default layouts (US)
defaults delete /Library/Preferences/com.apple.HIToolbox AppleEnabledInputSources

# Enable Finnish layout
defaults write /Library/Preferences/com.apple.HIToolbox AppleEnabledInputSources -array '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 17; "KeyboardLayout Name" = Finnish; }'
defaults write /Library/Preferences/com.apple.HIToolbox AppleInputSourceHistory -array '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 17; "KeyboardLayout Name" = Finnish; }'
defaults write /Library/Preferences/com.apple.HIToolbox AppleSelectedInputSources -array '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 17; "KeyboardLayout Name" = Finnish; }'

# Enable key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool FALSE

# Set keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Set scroll direction
defaults write /Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -bool false


# ==============================================
# Time Machine
# ==============================================

# Don't offer new disks for backup
defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true


# ==============================================
# Make links to useful apps
# ==============================================

# Archive Utility
ln -s "/System/Library/CoreServices/Archive Utility.app" "/Applications/Utilities/Archive Utility.app"

# Directory Utility
ln -s "/System/Library/CoreServices/Directory Utility.app" "/Applications/Utilities/Directory Utility.app"

# Screen Sharing
ln -s "/System/Library/CoreServices/Screen Sharing.app" "/Applications/Utilities/Screen Sharing.app"

# Ticket Viewer
ln -s "/System/Library/CoreServices/Ticket Viewer.app" "/Applications/Utilities/Ticket Viewer.app"


echo "Done. Note that these changes require a restart to take effect."
