#!/bin/bash

###############################################################################
# General                                                                     #
###############################################################################

# Disable startup sound
sudo nvram StartupMute=%01

sudo scutil --set ComputerName "$COMPUTER_NAME" && \
sudo scutil --set HostName "$HOSTNAME" && \
sudo scutil --set LocalHostName "$HOSTNAME" && \
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$HOSTNAME"

defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

###############################################################################
# Finder                                                                      #
###############################################################################

defaults write com.apple.finder ShowPathbar -bool false
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
defaults write -g NSNavRecentPlacesLimit -int 5
defaults write -g AppleShowAllExtensions -bool false
defaults write com.apple.finder AppleShowAllFiles false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false
defaults write com.apple.finder QuitMenuItem -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXPreferredViewStyle -string "icnv"
chflags nohidden ~/Library

###############################################################################
# Dock                                                                        #
###############################################################################

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock magnification -int 1
defaults write com.apple.dock largesize -int 84
defaults write com.apple.dock "show-recents" -int 0

###############################################################################
# Activity Monitor                                                            #
###############################################################################

defaults write com.apple.ActivityMonitor OpenMainWindow -int 1
defaults write com.apple.ActivityMonitor UpdatePeriod -int 5

###############################################################################
# Kill/restart affected system applications and services                      #
###############################################################################

# Restart affected applications if `--no-restart` flag is not present.
if [[ ! ($* == *--no-restart*) ]]; then
  for app in "cfprefsd" "SystemUIServer"; do
    killall "${app}" > /dev/null 2>&1
  done
fi
