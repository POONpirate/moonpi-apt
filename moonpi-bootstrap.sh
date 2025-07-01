#!/bin/bash
set -e

echo "🌙 Setting up MoonPi repo and installing dependencies..."

# Check if Moonlight is installed
if ! command -v moonlight >/dev/null 2>&1; then
    echo "🎮 Installing Moonlight Embedded..."
    curl -1sLf 'https://dl.cloudsmith.io/public/moonlight-game-streaming/moonlight-embedded/setup.deb.sh' | sudo -E bash
    sudo apt install -y moonlight-embedded
else
    echo "✅ Moonlight Embedded already installed."
fi

# Add MoonPi GitHub-hosted APT repo
echo "deb [arch=armhf trusted=yes] https://poonpirate.github.io/moonpi-apt stable main" | sudo tee /etc/apt/sources.list.d/moonpi.list

# Update APT and install MoonPi
sudo apt update
sudo apt install -y moonpi

echo "🚀 MoonPi setup complete! Run 'moonpi' to launch."
