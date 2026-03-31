#!/bin/bash
#
# Install AI skills for Qwen Code or Claude
#
# Usage: ./install.sh <qwen|claude> [--local|--global]
#

set -e

SKILLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_FILES=("$SKILLS_DIR"/*.md)

usage() {
    echo "Usage: $0 <qwen|claude> [--local|--global]"
    echo ""
    echo "Install AI skills for the specified AI assistant."
    echo ""
    echo "Arguments:"
    echo "  qwen|claude   Target AI assistant"
    echo "  --local       Install for current project only (default)"
    echo "  --global      Install globally for all projects"
    echo ""
    echo "Examples:"
    echo "  $0 qwen --local     # Install skills for Qwen in current project"
    echo "  $0 claude --global  # Install skills for Claude globally"
    exit 1
}

# Parse arguments
if [ $# -lt 1 ]; then
    usage
fi

TARGET="$1"
SCOPE="--local"

if [ $# -ge 2 ]; then
    SCOPE="$2"
fi

# Validate target
if [ "$TARGET" != "qwen" ] && [ "$TARGET" != "claude" ]; then
    echo "Error: Target must be 'qwen' or 'claude'"
    usage
fi

# Validate scope
if [ "$SCOPE" != "--local" ] && [ "$SCOPE" != "--global" ]; then
    echo "Error: Scope must be '--local' or '--global'"
    usage
fi

# Determine installation directory
if [ "$TARGET" == "qwen" ]; then
    if [ "$SCOPE" == "--local" ]; then
        # For Qwen Code local: copy to current directory's .qwen/skills
        INSTALL_DIR="$(pwd)/.qwen/skills"
        echo "Installing Qwen skills to: $INSTALL_DIR"
        mkdir -p "$INSTALL_DIR"
    else
        # For Qwen Code global: copy to ~/.qwen/skills
        INSTALL_DIR="$HOME/.qwen/skills"
        echo "Installing Qwen skills globally to: $INSTALL_DIR"
        mkdir -p "$INSTALL_DIR"
    fi
else
    # Claude
    if [ "$SCOPE" == "--local" ]; then
        # For Claude local: copy to current directory's .claude/skills
        INSTALL_DIR="$(pwd)/.claude/skills"
        echo "Installing Claude skills to: $INSTALL_DIR"
        mkdir -p "$INSTALL_DIR"
    else
        # For Claude global: copy to ~/.claude/skills
        INSTALL_DIR="$HOME/.claude/skills"
        echo "Installing Claude skills globally to: $INSTALL_DIR"
        mkdir -p "$INSTALL_DIR"
    fi
fi

# Copy skill files
echo ""
echo "Copying skill files..."
for skill_file in "${SKILLS_FILES[@]}"; do
    if [ -f "$skill_file" ]; then
        filename=$(basename "$skill_file")
        # Skip README.md for installation
        if [ "$filename" == "README.md" ]; then
            continue
        fi
        cp "$skill_file" "$INSTALL_DIR/"
        echo "  ✓ Copied: $filename"
    fi
done

echo ""
echo "Installation complete!"
echo ""

# Provide usage instructions
if [ "$TARGET" == "qwen" ]; then
    echo "To use these skills with Qwen Code:"
    echo "  - Reference in prompt: 'Using the <skill-name> skill...'"
    if [ "$SCOPE" == "--global" ]; then
        echo "  - Or use: skill: \"<skill-name>\""
    fi
else
    echo "To use these skills with Claude:"
    echo "  - Reference with @<skill-name>.md in your prompt"
    echo "  - Or copy skill contents into your chat"
fi

echo ""
