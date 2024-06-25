#!/bin/bash

set -eufo pipefail

trap 'killall Dock' EXIT

declare -a remove_labels=(
	Launchpad
	Safari
	Messages
	Mail
	Maps
	Photos
	FaceTime
	Calendar
	Contacts
	Freeform
	TV
	Music
	Keynote
	Numbers
	Pages
	"App Store"
)

for label in "${remove_labels[@]}"; do
	/opt/homebrew/bin/dockutil --no-restart --remove "${label}" || true
done

declare -a add_apps=(
  "/System/Applications/System Settings.app"
  "/System/Applications/Utilities/Activity Monitor.app"
  "/Applications/iTerm.app"
  "/System/Applications/Notes.app"
  "/System/Applications/Reminders.app"
  # "/Applications/Google Chrome.app" # not installed yet -> will be installed with Company Portal
)

for app in "${add_apps[@]}"; do
	/opt/homebrew/bin/dockutil --no-restart --allhomes --remove "${app}" || true
done
for app in "${add_apps[@]}"; do
	/opt/homebrew/bin/dockutil --no-restart --allhomes --position beginning --add "${app}" || true
done