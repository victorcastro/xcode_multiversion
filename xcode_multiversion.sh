#!/bin/sh

set -euo pipefail

# Set the paths to your Old/New Xcodes
OLD_XCODE="/Applications/Xcode_12.5.app" # "/Applications/Xcode-13.4.1.app"
NEW_XCODE="/Applications/Xcode.app" # To get build number

# Get New Xcode build number
OLD_XCODE_BUILD=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" ${OLD_XCODE}/Contents/Info.plist)
NEW_XCODE_BUILD=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" ${NEW_XCODE}/Contents/Info.plist)

echo The Old Xcode build version is $OLD_XCODE_BUILD
echo The New Xcode build version is $NEW_XCODE_BUILD

# Change Old Xcode build version to New Xcode
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${NEW_XCODE_BUILD}" ${OLD_XCODE}/Contents/Info.plist

# Open Old Xcode (system will check build version and cache it)
open $OLD_XCODE

# Revert Old's Xcode's build version
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${OLD_XCODE_BUILD}" ${OLD_XCODE}/Contents/Info.plist

