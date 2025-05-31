#!/bin/bash

# Git profile switcher for personal and work projects
# Applies only to the current local Git repo

# Check if we're in a Git repo
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "❌ Not inside a Git repository. Please run this from a project folder."
  exit 1
fi

# Switch profiles
if [ "$1" == "personal" ]; then
  git config --local user.name "gituser2022"
  git config --local user.email "lakshmiprasanna7@gmail.com"
  echo "✅ Switched to PERSONAL profile."

elif [ "$1" == "work" ]; then
  git config --local user.name "CIOXHEALTH\HPLYerneni"
  git config --local user.email "lakshmi.yerneni@datavant.com"
  echo "✅ Switched to WORK profile."

else
  echo "❌ Invalid option."
  echo "Usage: ./set-git-profile.sh [personal|work]"
  exit 1
fi

# Show where the config is coming from and what it is
echo ""
echo "📍 Current Git identity in this repo:"
git config user.name
git config user.email

echo ""
echo "🔍 Git config source:"
git config --list --show-origin | grep 'user\.\(name\|email\)'

