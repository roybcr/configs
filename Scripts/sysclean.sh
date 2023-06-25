#!/bin/sh

echo "Removing orphaned packages..."
yay -Rns "$(yay -Qdtq)" --noconfirm
echo "Clearing package cache..."
yay -Sc --noconfirm
echo "System cleanup complete!"
