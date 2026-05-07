#!/usr/bin/env bash
set -e
# moonpi-moonlight-qt-bootstrap.sh
# Installs Moonlight Qt and MoonPi on Raspberry Pi OS Bookworm.
# Usage:
#   curl -sL https://poonpirate.github.io/moonpi-apt/moonpi-moonlight-qt-bootstrap.sh | bash

echo "🌙 MoonPi installer starting…"

# Install moonlight-qt if not already present
if ! command -v moonlight-qt >/dev/null 2>&1; then
  echo "🎮 Installing Moonlight Qt…"
  curl -1sLf 'https://dl.cloudsmith.io/public/moonlight-game-streaming/moonlight-qt/setup.deb.sh' \
    | sudo -E bash
  sudo apt install -y moonlight-qt
else
  echo "✅ Moonlight Qt already installed."
fi

# Add MoonPi apt source (trusted, no GPG signing)
echo "📋 Adding MoonPi apt repository…"
echo "deb [arch=armhf trusted=yes] https://poonpirate.github.io/moonpi-apt bookworm main" \
  | sudo tee /etc/apt/sources.list.d/moonpi.list

# Install MoonPi
echo "📦 Installing MoonPi…"
sudo apt update
sudo apt install -y moonpi

echo "🚀 MoonPi installed!"
