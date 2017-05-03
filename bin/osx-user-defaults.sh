#!/bin/bash

# ==============================================
# .osx-user-defaults
# for OS X Lion, Mountain Lion and Mavericks
#
# Commands target the current boot drive
#
# Hannes Juutilainen <hjuutilainen@mac.com>
# ==============================================

### Adapted by Gus Hart, May 2017 (Yosemite)

# 
function CFPreferencesAppSynchronize() {
    python - <<END
from Foundation import CFPreferencesAppSynchronize
CFPreferencesAppSynchronize('$1')
END
}

# ==============================================
# Files and folders
# ==============================================

# Show the ~/Library directory
chflags nohidden "${HOME}/Library"

# Don't show the ~/bin directory
chflags hidden "${HOME}/bin"


# ==============================================
# NSGlobalDomain settings
# ==============================================
echo "Setting NSGlobalDomain preferences"

##GH# Locale
##GHdefaults write NSGlobalDomain AppleLocale -string "fi_FI"
##GHdefaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
##GHdefaults write NSGlobalDomain AppleMetricUnits -bool true

##GH# 24-Hour Time
##GHdefaults write NSGlobalDomain AppleICUForce12HourTime -bool false

##GH# Turn off text smoothing for font sizes
##GHdefaults write NSGlobalDomain AppleAntiAliasingThreshold -int 4

##GH# Double-click a window's title bar to minimize
##GHdefaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false

##GH# Use smooth scrolling
##GHdefaults write NSGlobalDomain AppleScrollAnimationEnabled -bool true

##GH# Enable key repeat
##GHdefaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Speed up the key repeat rate higher than what SystemSettings allows
# 2 is the fastest in the systems settings (larger numbers slower)
defaults write -g KeyRepeat -float 1.5
# shorten the delay until repeat
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)


# All controls (Full Keyboard Access)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

##GH# Don't restore windows when quitting or re-opening apps
##GHdefaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Disable smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

##GH# Correct spelling automatically
##GHdefaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true

# Sidebar icon size: Small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1


# ==============================================
# Desktop & Screen Saver
# ==============================================
echo "Setting Desktop & Screen Saver preferences"

# No translucent menu bar
defaults write NSGlobalDomain "AppleEnableMenuBarTransparency" -bool false

# Ask for password after 5 seconds
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5

# Screen Saver: Flurry
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName -string "Flurry" path -string "/System/Library/Screen Savers/Flurry.saver" type -int 0

##GH# Hot corners -> bottom left -> start screen saver
##GHdefaults write com.apple.dock "wvous-bl-corner" -int 5
##GHdefaults write com.apple.dock "wvous-bl-modifier" -int 0

# Reduce transparency of windows
defaults write com.apple.universalaccess reduceTransparency -bool true

# Show percentage in battery icon on menu bar
defaults write com.apple.menuextra.battery ShowPercent YES



# ==============================================
# Mouse
# ==============================================
echo "Setting Mouse preferences"

# Set scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Secondary click:
# Possible values: OneButton, TwoButton, TwoButtonSwapped
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton

##GH# Smart zoom enabled, double-tap with one finger (set to 0 to disable)
##GHdefaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseOneFingerDoubleTapGesture -int 1

##GH# Double-tap with two fingers to Mission Control (set to 0 to disable)
##GHdefaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerDoubleTapGesture -int 3

# Two finger horizontal swipe
# 0 = Swipe between pages with one finger
# 1 = Swipe between pages
# 2 = Swipe between full screen apps with two fingers, swipe between pages with one finger (Default Mode)
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerHorizSwipeGesture -int 1

##GHdefaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseVerticalScroll -int 1
##GHdefaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseMomentumScroll -int 1
##GHdefaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseHorizontalScroll -int 1


# ==============================================
# Trackpad
# ==============================================
echo "Setting Trackpad preferences"

# Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Tap with two fingers to emulate right click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# Enable three finger tap (look up)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2

##GH# Disable three finger drag
##GHdefaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool false

# Zoom in or out
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool true

##GH# Smart zoom, double-tap with two fingers
##GHdefaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool true

# Rotate
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool true

# Notification Center
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3

# Swipe between pages with two fingers
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true

# Swipe between full-screen apps
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 2

# Enable other multi-finger gestures
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int 2

defaults write com.apple.dock showMissionControlGestureEnabled -bool true
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
defaults write com.apple.dock showDesktopGestureEnabled -bool true
defaults write com.apple.dock showLaunchpadGestureEnabled -bool true


##GH# ==============================================
##GH# Activity Monitor
##GH# ==============================================
##GHecho "Setting Activity Monitor preferences"
##GH
##GH# Show main window on launch
##GHdefaults write com.apple.ActivityMonitor OpenMainWindow -bool true
##GH
##GH# Dock icon = CPU Usage
##GHdefaults write com.apple.ActivityMonitor IconType -int 5
##GH
##GH# Show all processes
##GHdefaults write com.apple.ActivityMonitor ShowCategory -int 100
##GH
##GH# Mountain Lion: Sort by CPU usage
##GHdefaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
##GHdefaults write com.apple.ActivityMonitor SortDirection -int 0
##GH
##GH# Mavericks: Add the "% CPU" column to the Disk and Network tabs
##GHdefaults write com.apple.ActivityMonitor "UserColumnsPerTab v4.0" -dict \
##GH    '0' '( Command, CPUUsage, CPUTime, Threads, IdleWakeUps, PID, UID )' \
##GH    '1' '( Command, anonymousMemory, Threads, Ports, PID, UID, ResidentSize )' \
##GH    '2' '( Command, PowerScore, 12HRPower, AppSleep, graphicCard, UID )' \
##GH    '3' '( Command, bytesWritten, bytesRead, Architecture, PID, UID, CPUUsage )' \
##GH    '4' '( Command, txBytes, rxBytes, txPackets, rxPackets, PID, UID, CPUUsage )'
##GH
##GH# Mavericks: Sort by CPU usage in Disk and Network tabs
##GHdefaults write com.apple.ActivityMonitor UserColumnSortPerTab -dict \
##GH    '0' '{ direction = 0; sort = CPUUsage; }' \
##GH    '1' '{ direction = 0; sort = ResidentSize; }' \
##GH    '2' '{ direction = 0; sort = 12HRPower; }' \
##GH    '3' '{ direction = 0; sort = CPUUsage; }' \
##GH    '4' '{ direction = 0; sort = CPUUsage; }'
##GH
##GH# Select the Network tab
##GHdefaults write com.apple.ActivityMonitor SelectedTab -int 4
##GH
##GH# Update Frequency: Often (2 sec)
##GHdefaults write com.apple.ActivityMonitor UpdatePeriod -int 2
##GH
##GH# Mavericks: Show Data in the Disk graph (instead of IO)
##GHdefaults write com.apple.ActivityMonitor DiskGraphType -int 1
##GH
##GH# Mavericks: Show Data in the Network graph (instead of packets)
##GHdefaults write com.apple.ActivityMonitor NetworkGraphType -int 1


##GH# ==============================================
##GH# Contacts (Address Book)
##GH# ==============================================
##GHecho "Setting Contacts preferences"
##GH
##GH# Address format
##GHdefaults write com.apple.AddressBook ABDefaultAddressCountryCode -string "fi"
##GH
##GH# Display format "Last, First"
##GHdefaults write com.apple.AddressBook ABNameDisplay -int 1
##GH
##GH# Sort by last name
##GHdefaults write com.apple.AddressBook ABNameSortingFormat -string "sortingLastName sortingFirstName"


# ==============================================
# Calendar (iCal)
# ==============================================
echo "Setting Calendar preferences"

# Show week numbers (10.8 only)
defaults write com.apple.iCal "Show Week Numbers" -bool true

# Show 7 days
defaults write com.apple.iCal "n days of week" -int 7

# Week starts on monday
defaults write com.apple.iCal "first day of week" -int 1

# Show event times
defaults write com.apple.iCal "Show time in Month View" -bool true


##GH# ==============================================
##GH# Disable CD & DVD actions
##GH# ==============================================
##GHecho "Setting CD & DVD preferences"
##GH
##GH# Disable blank CD automatic action.
##GHdefaults write com.apple.digihub com.apple.digihub.blank.cd.appeared -dict action 1
##GH
##GH# Disable music CD automatic action.
##GHdefaults write com.apple.digihub com.apple.digihub.cd.music.appeared -dict action 1
##GH
##GH# Disable picture CD automatic action.
##GHdefaults write com.apple.digihub com.apple.digihub.cd.picture.appeared -dict action 1
##GH
##GH# Disable blank DVD automatic action.
##GHdefaults write com.apple.digihub com.apple.digihub.blank.dvd.appeared -dict action 1
##GH
##GH# Disable video DVD automatic action.
##GHdefaults write com.apple.digihub com.apple.digihub.dvd.video.appeared -dict action 1


##GH# ==============================================
##GH# Archive Utility
##GH# ==============================================
##GHecho "Setting Archive Utility preferences"
##GH
##GH# Move archives to trash after extraction
##GHdefaults write com.apple.archiveutility "dearchive-move-after" -string "~/.Trash"
##GH
##GH# Don't reveal extracted items
##GHdefaults write com.apple.archiveutility "dearchive-reveal-after" -bool false

##GH# ==============================================
##GH# f.lux
##GH# ==============================================
##GHecho "Setting f.lux preferences"
##GHFLUX_DOMAIN="org.herf.Flux"
##GH
##GH# Location, center of Jyväskylä, Finland
##GHdefaults write "${FLUX_DOMAIN}" location "62.242603,25.747257"
##GHdefaults write "${FLUX_DOMAIN}" locationTextField "Jyv\\U00e4skyl\\U00e4"
##GHdefaults write "${FLUX_DOMAIN}" locationType "L"
##GH
##GH# Sunset temperature
##GHdefaults write "${FLUX_DOMAIN}" lateColorTemp -int 6500
##GH
##GH# Bedtime temperature
##GHdefaults write "${FLUX_DOMAIN}" nightColorTemp -int 3400
##GH
##GH# Wake up at 6.30
##GHdefaults write "${FLUX_DOMAIN}" wakeTime -int 390
##GH
##GH# Sleep late on weekends
##GHdefaults write "${FLUX_DOMAIN}" sleepLate -bool true
##GH
##GHCFPreferencesAppSynchronize "${FLUX_DOMAIN}"

# ==============================================
# Finder
# ==============================================
echo "Setting Finder preferences"

# Expand the "Open with" and "Sharing & Permissions" panes
defaults write com.apple.finder FXInfoPanesExpanded -dict OpenWith -bool true Privileges -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# New window points to home
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show all filename extensions
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use column view
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show hidden files as well in Finder
defaults write com.apple.finder AppleShowAllFiles YES

# Enable "Quit Finder"
# Enable
defaults write com.apple.finder QuitMenuItem -bool true

CFPreferencesAppSynchronize "com.apple.finder"

# ==============================================
# Dock
# ==============================================
echo "Setting Dock preferences"

# Position (left, bottom, right)
defaults write com.apple.dock orientation -string "bottom"

# To purge the dock of all the default app icons and start fresh
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others
# Set dock to autohide
defaults write com.apple.dock autohide -bool true

# Set icon size for dock icon
defaults write com.apple.dock tilesize -int 34

##GH# ==============================================
##GH# Safari & WebKit
##GH# ==============================================
##GHecho "Setting Safari & WebKit preferences"
##GH
##GH# Appearance
##GH
##GH# Show status bar
##GHdefaults write com.apple.Safari ShowStatusBar -bool true
##GH
##GH# Show favorites bar
##GHdefaults write com.apple.Safari ShowFavoritesBar -bool true
##GHdefaults write com.apple.Safari "ShowFavoritesBar-v2" -bool true
##GH
##GH# Don't show tab bar
##GHdefaults write com.apple.Safari AlwaysShowTabBar -bool false


##GH# General settings
##GH
##GH# Safari opens with: A new window
##GHdefaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false
##GH
##GH# New windows open with: Empty Page
##GHdefaults write com.apple.Safari NewWindowBehavior -int 1
##GH
##GH# New tabs open with: Empty Page
##GHdefaults write com.apple.Safari NewTabBehavior -int 1
##GH
##GH# Homepage
##GHdefaults write com.apple.Safari HomePage -string "about:blank"
##GH
##GH# Don't open "safe" files after downloading
##GHdefaults write com.apple.Safari AutoOpenSafeDownloads -bool false
##GH
##GH
##GH# Tabs settings
##GH
##GH# Open pages in tabs instead of windows: automatically
##GHdefaults write com.apple.Safari TabCreationPolicy -int 1
##GH
##GH# Don't make new tabs active
##GHdefaults write com.apple.Safari OpenNewTabsInFront -bool false
##GH
##GH# Command-clicking a link creates tabs
##GHdefaults write com.apple.Safari CommandClickMakesTabs -bool true
##GH
##GH
##GH# Autofill settings
##GH
##GH# Don't remember passwords
##GHdefaults write com.apple.Safari AutoFillPasswords -bool true
##GH
##GH
##GH# Security settings
##GH
##GH# Warn About Fraudulent Websites
##GHdefaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true
##GH
##GH# Enable plug-ins
##GHdefaults write com.apple.Safari WebKitPluginsEnabled -bool true
##GHdefaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool true
##GH
##GH# Enable Java
##GHdefaults write com.apple.Safari WebKitJavaEnabled -bool true
##GHdefaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool true
##GH
##GH# Enable JavaScript
##GHdefaults write com.apple.Safari WebKitJavaScriptEnabled -bool true
##GHdefaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptEnabled -bool true
##GH
##GH# Block pop-up windows
##GHdefaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
##GHdefaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
##GH
##GH# Reading list
##GHdefaults write com.apple.Safari com.apple.Safari.ReadingListFetcher.WebKit2PluginsEnabled -bool false
##GHdefaults write com.apple.Safari com.apple.Safari.ReadingListFetcher.WebKit2LoadsImagesAutomatically -bool false
##GHdefaults write com.apple.Safari com.apple.Safari.ReadingListFetcher.WebKit2LoadsSiteIconsIgnoringImageLoadingPreference -bool true
##GHdefaults write com.apple.Safari com.apple.Safari.ReadingListFetcher.WebKit2JavaScriptEnabled -bool false
##GH
##GH
##GH# Privacy settings
##GH
##GH# Cookies and website data
##GH# - Always block
##GH#defaults write com.apple.Safari WebKitStorageBlockingPolicy -int 2
##GH#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2StorageBlockingPolicy -int 2
##GH
##GH# Website use of location services
##GH# 0 = Deny without prompting
##GH# 1 = Prompt for each website once each day
##GH# 2 = Prompt for each website one time only
##GHdefaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 0
##GH
##GH# Do not track
##GHdefaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
##GH
##GH
##GH# Notifications
##GH
##GH# Don't even ask about the push notifications
##GHdefaults write com.apple.Safari CanPromptForPushNotifications -bool false
##GH
##GH
##GH# Extensions settings
##GH
##GH# Update extensions automatically
##GHdefaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true
##GH
##GH
##GH# Advanced settings
##GH
##GH# Disable Safari’s thumbnail cache for History and Top Sites
##GHdefaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
##GH
##GH# Make Safari’s search banners default to Contains instead of Starts With
##GHdefaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
##GH
##GH# Enable the Develop menu and the Web Inspector in Safari
##GHdefaults write com.apple.Safari IncludeDevelopMenu -bool true
##GHdefaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
##GHdefaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
##GH
##GH# Add a context menu item for showing the Web Inspector in web views
##GHdefaults write NSGlobalDomain WebKitDeveloperExtras -bool true
##GH
##GHCFPreferencesAppSynchronize "com.apple.Safari"


##GH# ==============================================
##GH# Disk Utility
##GH# ==============================================
##GHecho "Setting Disk Utility preferences"
##GH
##GH# Enable the debug menu in Disk Utility
##GHdefaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
##GHdefaults write com.apple.DiskUtility advanced-image-options -bool true
##GH
##GHCFPreferencesAppSynchronize "com.apple.DiskUtility"

# ==============================================
# Skim
# ==============================================
echo "Setting Skim preferences"

#Skim (3rd party app for pdf viewing)
# Removes the dialog and defaults to auto reload.
defaults write -app Skim SKAutoReloadFileUpdate -boolean true

# ==============================================
# Terminal
# ==============================================
echo "Setting Terminal preferences"

# ----------------------------------------------
# Create a new "Basic Improved" profile
# ----------------------------------------------
defaults write com.apple.Terminal "Window Settings" -dict-add "Ocean" "
<dict>
    <key>Font</key>
    <data>
    62706c69 73743030 d4010203 04050618 19582476 65727369 6f6e5824 6f626a65 63747359 24617263 68697665 72542474 6f701200 0186a0a4 07081112 55246e75 6c6cd409 0a0b0c0d 0e0f1056 4e535369 7a65584e 5366466c 61677356 4e534e61 6d655624 636c6173 73234030 00000000 00001010 80028003 564d6f6e 61636fd2 13141516 5a24636c 6173736e 616d6558 24636c61 73736573 564e5346 6f6e74a2 1517584e 534f626a 6563745f 100f4e53 4b657965 64417263 68697665 72d11a1b 54726f6f 74800108 111a232d 32373c42 4b525b62 69727476 787f848f 989fa2ab bdc0c500 00000000 00010100 00000000 00001c00 00000000 00000000 00000000 0000c7 
    </data>
    <key>FontWidthSpacing</key>
    <real>1.004032258064516</real>
    <key>ProfileCurrentVersion</key>
    <real>2.0499999999999998</real>
    <key>columnCount</key>
    <integer>100</integer>
    <key>name</key>
    <string>Ocean</string>
    <key>rowCount</key>
    <integer>45</integer>
    <key>shellExitAction</key>
    <integer>1</integer>
    <key>type</key>
    <string>Window Settings</string>
</dict>
"

# Shell opens with: /bin/bash
defaults write com.apple.Terminal Shell -string "/bin/bash"

# Set the "Ocean" as the default
defaults write com.apple.Terminal "Startup Window Settings" -string "Ocean"
defaults write com.apple.Terminal "Default Window Settings" -string "Ocean"

##GH CFPreferencesAppSynchronize "com.apple.Terminal"


# ==============================================
# Kill affected applications
# ==============================================

function killallApps() {
    killall "Finder" > /dev/null 2>&1
    killall "SystemUIServer" > /dev/null 2>&1
    killall "Dock" > /dev/null 2>&1

    appsToKill=(
#    "Activity Monitor"
#    "BBEdit"
    "Calendar"
    "Contacts"
    "Dashboard"
#    "Disk Utility"
#    "Safari"
    "Skim"
    "System Preferences"
#    "TextWrangler"
#    "Xcode"
    )

    for app in "${appsToKill[@]}"
    do
        killall "${app}" > /dev/null 2>&1
        if [[ $? -eq 0 ]]; then
            # We just killed an app so restart it
            open -a "${app}"
        fi
    done

    echo "Note that some of these changes require a logout/restart to take effect."
}

printf "Restart the affected applications? (y/n): "
read killallReply
if [[ $killallReply =~ ^[Yy]$ ]]; then
    killallApps
fi

exit 0
