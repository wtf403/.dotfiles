#!/usr/bin/env bash

# ~/.osx — http://mths.be/osx

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Startup mute
sudo nvram StartupMute=%01

###############################################################################
# General UI/UX                                                               #
###############################################################################

echo "Set computer name (as done via System Preferences → Sharing)"
sudo scutil --set ComputerName "MaxMac"
sudo scutil --set HostName "MaxMac"
sudo scutil --set LocalHostName "MaxMac"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "MaxMac"

echo "Disable the sound effects on boot"
sudo nvram SystemAudioVolume=" "

echo "Menu bar: hide the Time Machine, Volume, User, and Bluetooth icons"
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
  defaults write "${domain}" dontAutoLoad -array \
  "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
  "/System/Library/CoreServices/Menu Extras/Volume.menu" \
  "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
  "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
  "/System/Library/CoreServices/Menu Extras/User.menu"
done
defaults write com.apple.systemuiserver menuExtras -array \
"/System/Library/CoreServices/Menu Extras/Battery.menu" \
"/System/Library/CoreServices/Menu Extras/Clock.menu"

echo "Set highlight color to graphite"
defaults write NSGlobalDomain AppleHighlightColor -string "0.780400 0.815700 0.858800"

echo "Set sidebar icon size to medium"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

echo "Show scrollbars only when scrolling\n"
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

echo "Increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#echo "Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Display ASCII control characters using caret notation in standard text views"
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

echo "Disable the crash reporter"
defaults write com.apple.CrashReporter DialogType -string "none"

echo "Set Help Viewer windows to non-floating mode"
defaults write com.apple.helpviewer DevMode -bool true

echo "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo "Restart automatically if the computer freezes"
systemsetup -setrestartfreeze off

echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

echo "Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2

echo "Set language and text formats"
defaults write NSGlobalDomain AppleLanguages -array "en" "us"
defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Cantimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

echo "Set the timezone; see `systemsetup -listtimezones` for other values"
systemsetup -settimezone "Europe/Moscow" > /dev/null

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# Screen                                                                      #
###############################################################################

echo "Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

echo "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png"

echo "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

echo "Enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo "Enable HiDPI display modes (requires restart)"
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

echo "Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

echo "Finder: disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true

echo "Set the user directory as the default location for new Finder windows"
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

echo "Hide icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

echo "Finder: don't show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "Finder: allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Enable spring loading for directories"
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

echo "Remove the spring loading delay for directories"
defaults write NSGlobalDomain com.apple.springing.delay -float 0

echo "Delete all .DS_Store files"
# sudo find / -name ".DS_Store" -depth -exec rm {} \;

echo "Avoid creating .DS_Store files for the current user from now on"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Disable disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

echo "Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

#echo " Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 20" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 20" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 20" ~/Library/Preferences/com.apple.finder.plist

echo "Increase the size of icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 60" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 60" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 60" ~/Library/Preferences/com.apple.finder.plist

echo "Use column view in all Finder windows by default"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

echo "Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo "Empty Trash securely by default"
defaults write com.apple.finder EmptyTrashSecurely -bool true

echo "Show the ~/Library folder"
chflags nohidden ~/Library

echo "Expand the following File Info panes: “General”, “Open with”, and “Sharing & Permissions”"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
General -bool true \
OpenWith -bool true \
Privileges -bool true

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

echo "Enable highlight hover effect for the grid view of a stack (Dock)"
defaults write com.apple.dock mouse-over-hilite-stack -bool true

echo "Set the icon size of Dock items to 40 pixels"
defaults write com.apple.dock tilesize -int 40

echo "Change minimize/maximize window effect"
defaults write com.apple.dock mineffect -string "scale"

echo "Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true

echo "Enable spring loading for all Dock items"
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

echo "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

echo "Wipe all (default) app icons from the Dock"
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array ""

echo "Speed up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.1

echo "Group windows by application in Mission Control"
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool true

echo "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

echo "Don’t show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true

echo "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo "Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0

echo "Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Make Dock icons of hidden applications translucent"
defaults write com.apple.dock showhidden -bool true

echo "Make Dock more transparent"
defaults write com.apple.dock hide-mirror -bool true

echo "Reset Launchpad, but keep the desktop wallpaper intact"
find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

echo "Add iOS Simulator to Launchpad"
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app" "/Applications/iOS Simulator.app"

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

echo "Privacy: don’t send search queries to Apple"
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

echo "Press Tab to highlight each item on a web page"
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

echo "Prevent Safari from opening ‘safe’ files automatically after downloading"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

echo "Disable hitting the Backspace key to go to the previous page in history"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool false

echo "Hide Safari’s bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo "Hide Safari’s sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

echo "Disable Safari’s thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Make Safari’s search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo "Remove useless icons from Safari’s bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

echo "Enable the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

echo "Add a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

###############################################################################
# Mail                                                                        #
###############################################################################

echo "Disable send and reply animations in Mail.app"
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

echo "Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

echo "Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app"
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

echo "Display emails in threaded mode, sorted by date (oldest at the top)"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

echo "Disable inline attachments (just show the icons)"
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

echo "Disable automatic spell checking"
defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

echo "Only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

echo "Don’t display the annoying prompt when quitting iTerm"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

###############################################################################
# Time Machine                                                                #
###############################################################################

echo "Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Disable local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal

###############################################################################
# Activity Monitor                                                            #
###############################################################################

echo " Show the main window when launching Activity Monitor"
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

echo " Visualize CPU usage in the Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5

echo " Show all processes in Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0

echo " Sort Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

echo "Enable the debug menu in Address Book"
defaults write com.apple.addressbook ABShowDebugMenu -bool true

echo "Enable the debug menu in iCal (pre-10.8)"
defaults write com.apple.iCal IncludeDebugMenu -bool true

echo "Use plain text mode for new TextEdit documents"
defaults write com.apple.TextEdit RichText -int 0

echo "Open and save files as UTF-8 in TextEdit"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

echo "Enable the debug menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

###############################################################################
# Mac App Store                                                               #
###############################################################################

echo " Enable the WebKit Developer Tools in the Mac App Store"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

echo " Enable Debug Menu in the Mac App Store"
defaults write com.apple.appstore ShowDebugMenu -bool true

###############################################################################
# Messages                                                                    #
###############################################################################

echo " Disable automatic emoji substitution (i.e. use plain text smileys)"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

echo " Enable smart quotes"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool true

echo " Enable continuous spell checking"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool true

###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

echo " Allow installing user scripts via GitHub Gist or Userscripts.org"
defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"

echo "Turn off chrome back/forwark navigation"
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

###############################################################################
# Archive utility                                                             #
###############################################################################

echo " Move archive files to trash after expansion"
# Delete directly: "/dev/null"
# Leave alone (default) "."
defaults write com.apple.archiveutility dearchive-move-after -string "~/.Trash"

###############################################################################
# Kill affected applications                                                  #
###############################################################################

echo "Restart affected applications"
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
"Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
"Terminal" "iCal"; do
  killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."


# Unstable Bluetooth issue https://gist.github.com/xbeta/e60fddd012e95202bbbe
sudo defaults delete /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt
defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid

# NoTunes replacement Music.app with open.spotify.com
defaults write digital.twisted.noTunes replacement /Users/maxkiselev/bin/macos-defaults/spotify.webloc

# Change hammerspoon config path
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
