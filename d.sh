#!/bin/bash

echo "🚀 Optimizing macOS for maximum speed..."

# Kill heavy processes
echo "🛑 Stopping unnecessary background tasks..."
sudo pkill -9 WindowServer
sudo pkill -9 Spotlight
sudo pkill -9 mds
sudo pkill -9 mds_stores
sudo pkill -9 PhotoLibrary
sudo pkill -9 QuickLook

# Disable transparency and animations
echo "🎨 Disabling UI effects for better performance..."
defaults write com.apple.universalaccess reduceTransparency -bool true
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.finder DisableAllAnimations -bool true
killall Dock
killall Finder

# Disable Spotlight indexing (massive CPU usage)
echo "🔍 Disabling Spotlight..."
sudo mdutil -a -i off
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

# Lower VNC resolution for speed boost
echo "📺 Lowering display resolution for VNC..."
sudo systemsetup -setdisplaysleep Never
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool false

# Free up RAM and purge system cache
echo "🧹 Freeing up memory..."
sudo purge

# Disable other background daemons
echo "🚫 Disabling background services..."
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.analyticsd.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.sysdiagnose.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.softwareupdated.plist

# Final check
echo "✅ Optimization complete! Restarting important services..."
killall Dock
killall Finder

echo "🚀 Done! macOS should now be much faster."
