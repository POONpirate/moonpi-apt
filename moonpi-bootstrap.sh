#!/usr/bin/env bash
set -e
# moonpi-bootstrap.sh
# Installs MoonPi on Raspberry Pi OS Bookworm, skipping Moonlight install.
# Use this if Moonlight is already installed on your system.
# Usage:
#   curl -sL https://poonpirate.github.io/moonpi-apt/moonpi-bootstrap.sh | bash

echo "🌙 MoonPi installer starting…"

# Add MoonPi apt source (trusted, no GPG signing)
echo "📋 Adding MoonPi apt repository…"
echo "deb [arch=armhf trusted=yes] https://poonpirate.github.io/moonpi-apt bookworm main" \
  | sudo tee /etc/apt/sources.list.d/moonpi.list

# Install MoonPi
echo "📦 Installing MoonPi…"
sudo apt update
sudo apt install -y moonpi

echo "🚀 MoonPi installed!"
