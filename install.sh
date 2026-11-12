#!/usr/bin/env bash
set -e

# S-Bros Skills Installer
# Installs skills into workspace (.agents/skills/) or global (~/.gemini/antigravity-cli/skills/)

REPO_URL="https://github.com/Brosfeer/s-bros-skills.git"
SKILL_TARGET="$1"

if [ -z "$SKILL_TARGET" ]; then
    echo "Usage: install.sh <skill-name | --global>"
    echo ""
    echo "Examples:"
    echo "  install.sh s-bros-bot      # Installs s-bros-bot into .agents/skills/ in current project"
    echo "  install.sh --global        # Installs all skills to ~/.gemini/antigravity-cli/skills/"
    exit 0
fi

if [ "$SKILL_TARGET" = "--global" ]; then
    TARGET_DIR="$HOME/.gemini/antigravity-cli/skills/s-bros-skills"
    echo "Installing all S-Bros skills globally to $TARGET_DIR..."
    if [ -d "$TARGET_DIR/.git" ]; then
        cd "$TARGET_DIR" && git pull origin main
    else
        git clone "$REPO_URL" "$TARGET_DIR"
    fi
    echo "Done! All skills are now available globally."
    exit 0
fi

DEST_DIR=".agents/skills/$SKILL_TARGET"
echo "Installing skill '$SKILL_TARGET' into $DEST_DIR..."
mkdir -p "$DEST_DIR"

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

git clone --depth 1 "$REPO_URL" "$TMP_DIR"

if [ ! -d "$TMP_DIR/skills/$SKILL_TARGET" ]; then
    echo "Error: Skill '$SKILL_TARGET' not found in repository."
    echo "Available skills:"
    ls -1 "$TMP_DIR/skills"
    exit 1
fi

cp -r "$TMP_DIR/skills/$SKILL_TARGET"/* "$DEST_DIR/"
echo "Successfully installed '$SKILL_TARGET' into $DEST_DIR"
