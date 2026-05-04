#!/usr/bin/env bash
set -e
# moonpi-bootstrap.sh
# Installs MoonPi and its dependencies on Raspberry Pi OS Bookworm.
# Usage:
#   curl -sL https://poonpirate.github.io/moonpi-apt/moonpi-bootstrap.sh | bash

echo "🌙 MoonPi installer starting…"

# Install moonlight-embedded if not already present
if ! command -v moonlight >/dev/null 2>&1; then
  echo "🎮 Installing Moonlight Embedded…"
  curl -1sLf 'https://dl.cloudsmith.io/public/moonlight-game-streaming/moonlight-embedded/setup.deb.sh' \
    | sudo -E bash
  sudo apt install -y moonlight-embedded
else
  echo "✅ Moonlight Embedded already installed."
fi

# Add MoonPi apt source (trusted, no GPG signing)
echo "📋 Adding MoonPi apt repository…"
echo "deb [arch=armhf trusted=yes] https://poonpirate.github.io/moonpi-apt bookworm main" \
  | sudo tee /etc/apt/sources.list.d/moonpi.list

# Install MoonPi
echo "📦 Installing MoonPi…"
sudo apt update
sudo apt install -y moonpi

echo "🚀 MoonPi installed! Reboot to start the launcher automatically."
