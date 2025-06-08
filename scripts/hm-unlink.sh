#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/projects/nix-config"
DOTFILES="$REPO/dotfiles"

declare -A FILES=(
  [".zshrc"]="zsh/.zshrc"
)

echo "🔓 Unlinking and copying dotfiles from $DOTFILES to $HOME"

for target in "${!FILES[@]}"; do
  source_path="$DOTFILES/${FILES[$target]}"
  dest_path="$HOME/$target"

  if [[ -L "$dest_path" ]]; then
    echo "🧹 Removing symlink: $dest_path"
    rm "$dest_path"
  elif [[ -f "$dest_path" ]]; then
    echo "⚠️  Warning: $dest_path exists and is not a symlink — skipping"
    continue
  fi

  echo "📋 Copying $source_path → $dest_path"
  cp "$source_path" "$dest_path"
done
