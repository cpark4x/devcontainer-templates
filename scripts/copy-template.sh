#!/bin/bash
set -euo pipefail

# DevContainer Template Copier
# Simple helper to copy templates to your project

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/../templates"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

usage() {
    echo "Usage: $0 <template> <target-directory>"
    echo ""
    echo "Available templates:"
    echo "  python      - Python 3.11, uv, Node.js tooling"
    echo "  node        - Node.js 20, pnpm, TypeScript, ESLint"
    echo "  fullstack   - Python + Node.js (both stacks)"
    echo "  minimal     - Ubuntu 24.04, Git, Make, Claude Code"
    echo ""
    echo "Examples:"
    echo "  $0 python ~/my-python-project"
    echo "  $0 node ~/my-react-app"
    echo "  $0 fullstack ~/my-full-stack-app"
    echo "  $0 minimal ~/my-custom-project"
    exit 1
}

# Check arguments
if [ $# -ne 2 ]; then
    usage
fi

TEMPLATE=$1
TARGET_DIR=$2
TEMPLATE_PATH="$TEMPLATE_DIR/$TEMPLATE"

# Validate template exists
if [ ! -d "$TEMPLATE_PATH" ]; then
    echo -e "${RED}❌ Template '$TEMPLATE' not found${NC}"
    echo ""
    echo "Available templates:"
    for dir in "$TEMPLATE_DIR"/*; do
        if [ -d "$dir" ]; then
            basename "$dir"
        fi
    done
    exit 1
fi

# Warn if overwriting
if [ -d "$TARGET_DIR/.devcontainer" ]; then
    echo -e "${YELLOW}⚠️  $TARGET_DIR/.devcontainer already exists${NC}"
    read -p "Overwrite? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Cancelled."
        exit 0
    fi
    echo -e "${BLUE}🗑️  Removing existing .devcontainer...${NC}"
    rm -rf "$TARGET_DIR/.devcontainer"
fi

# Create target directory if needed
mkdir -p "$TARGET_DIR"

# Copy template
echo -e "${BLUE}📋 Copying $TEMPLATE template to $TARGET_DIR/.devcontainer${NC}"
cp -r "$TEMPLATE_PATH/.devcontainer" "$TARGET_DIR/.devcontainer"

# Success message
echo ""
echo -e "${GREEN}✅ Template copied successfully!${NC}"
echo ""
echo "Next steps:"
echo "  1. Review $TARGET_DIR/.devcontainer/devcontainer.json"
echo "  2. Customize for your project (see template README)"
echo "  3. Open in VS Code and rebuild container"
echo ""
echo "Commands:"
echo "  # Local Docker"
echo "  cd $TARGET_DIR"
echo "  code ."
echo "  # Then: F1 → 'Dev Containers: Reopen in Container'"
echo ""
echo "  # GitHub Codespaces"
echo "  gh codespace create --repo your-username/your-repo"
echo ""
echo "Template documentation: $TEMPLATE_PATH/README.md"
