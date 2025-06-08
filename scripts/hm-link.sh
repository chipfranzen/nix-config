#!/usr/bin/env bash
set -euo pipefail

echo "🔒 Re-linking dotfiles via Home Manager"
home-manager switch --flake ~/projects/nix-config#chip
