#!/usr/bin/env bash
set -euo pipefail

REPO="https://github.com/dracula/zellij.git"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

case "$(uname -s)" in
  Linux*)  THEMES_DIR="${HOME}/.config/zellij/themes" ;;
  Darwin*) THEMES_DIR="${HOME}/Library/Application Support/org.Zellij-Contributors.Zellij/themes" ;;
  *)       echo "Unsupported OS"; exit 1 ;;
esac

mkdir -p "$THEMES_DIR"

git clone --depth 1 "$REPO" "$TMPDIR"
cp "$TMPDIR/dracula.kdl" "$THEMES_DIR/dracula.kdl"

echo "Installed dracula.kdl to $THEMES_DIR"
echo "Add 'theme \"dracula\"' to your zellij config to activate."
