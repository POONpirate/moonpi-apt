#!/bin/bash
# prepare_deb_workspace.sh
# Usage:
#   ./prepare_deb_workspace.sh [src_dir] [dest_dir]

set -e

# Default paths
DEFAULT_SRC="/mnt/c/Users/kelly/Onedrive/Documents/moonpi-apt"
DEFAULT_DEST="$HOME/moonpi-apt"

# Use arguments if provided, otherwise fall back to defaults
SRC_DIR="${1:-$DEFAULT_SRC}"
DEST_DIR="${2:-$DEFAULT_DEST}"

echo ">> Cleaning up old workspace at: $DEST_DIR"
rm -rf "$DEST_DIR"

echo ">> Copying project from: $SRC_DIR"
cp -r "$SRC_DIR" "$DEST_DIR" || {
    echo "!! Error copying project." >&2
    exit 1
}

rm $DEST_DIR/prepare-moonpi-apt.sh

dos2unix $DEST_DIR/conf/distributions

dpkg-scanpackages $DEST_DIR/pool /dev/null | gzip -9c > $DEST_DIR/dists/stable/main/binary-armhf/Packages.gz

cp $DEST_DIR/dists/stable/main/binary-armhf/Packages.gz /mnt/c/Users/kelly/Onedrive/Documents/moonpi-apt/dists/stable/main/binary-armhf/Packages.gz
