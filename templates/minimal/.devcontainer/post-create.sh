#!/usr/bin/env bash
set -euo pipefail

# Post-Create Setup Script (Minimal)
# Runs automatically after Codespace container is created
# Basic Git configuration and status report

# Log file for troubleshooting
LOG_FILE="/tmp/devcontainer-post-create.log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "========================================="
echo "Post-create script starting at $(date)"
echo "========================================="

echo ""
echo "🔧  Configuring Git..."
git config --global push.autoSetupRemote true
echo "    ✅ Git configured"

# Add your own setup commands here as you build out your environment
# This template is intentionally minimal - customize as needed!

echo ""
echo "========================================="
echo "✅  Setup complete at $(date)"
echo "========================================="
echo ""
echo "📋 Minimal Environment Ready:"
echo "  • Git: $(git --version | cut -d' ' -f3)"
echo "  • Make: $(make --version 2>&1 | head -n 1 | cut -d' ' -f3)"
echo "  • Vim: $(vim --version 2>&1 | head -n 1 | cut -d' ' -f5)"
echo "  • Claude CLI: $(claude --version 2>&1 || echo 'NOT INSTALLED')"
echo ""
echo "💡 This is a minimal starting point. Add tools as needed!"
echo "💡 Logs saved to: $LOG_FILE"
echo ""
