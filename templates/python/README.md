# Python DevContainer Template

Complete DevContainer setup optimized for Python development with Claude Code pre-installed.

## What's This For?

This template provides a fully configured Python development environment that runs in GitHub Codespaces or locally with Docker. It's designed for Python projects that may also need Node.js tooling (for build tools, documentation, etc.).

## Included Tools

### Python Stack
- **Python 3.11** - Modern Python with latest features
- **uv** - Fast Python package manager (replaces pip/poetry)
- **Ruff** - Lightning-fast Python linter and formatter

### Node.js Stack (for tooling)
- **Node.js LTS** - For build tools and documentation generators
- **pnpm** - Fast, disk-efficient package manager
- **npm** - Standard package manager

### AI & Development Tools
- **Claude Code CLI** - AI pair programmer in your terminal
- **GitHub CLI** - Manage repos, PRs, and Codespaces
- **Make** - Build automation
- **Git** - Version control
- **Vim** - Terminal editor
- **Docker-in-Docker** - Run containers from within the devcontainer

## VSCode Extensions

### AI Assistants
- Anthropic Claude Code
- GitHub Copilot

### Python Development
- Python extension pack
- Ruff linter/formatter
- Python debugger

### General Development
- Better comments
- Markdown preview with Mermaid
- TOML support
- Spell checker
- Makefile tools

## When to Use

✅ **Use this template when:**
- Building pure Python applications
- Python projects that need Node.js tooling (docs, build scripts)
- Working with FastAPI, Django, Flask, or CLI tools
- Need uv for fast dependency management
- Want Claude Code for AI assistance

❌ **Consider other templates when:**
- Pure Node.js/TypeScript project → Use `node` template (Phase 2)
- Full-stack app with equal Python/Node → Use `fullstack` template (Phase 2)
- Just learning/experimenting → Use `minimal` template (Phase 2)
- Need specialized tools (Rust, Go, etc.) → Create custom template

## Resource Allocation

**Default:**
- 2 CPU cores
- 8GB RAM
- 32GB storage

**Auto-stop:** 30 minutes idle (saves costs)

These are sensible defaults. Adjust in `.devcontainer/devcontainer.json` if needed.

## Customization

### Container Name
Edit `.devcontainer/devcontainer.json`:
```json
{
  "name": "my-project-name",
  "runArgs": ["--name=my_project_devcontainer"]
}
```

### Add Python Packages
Add a `pyproject.toml` or `requirements.txt`, then update `.devcontainer/post-create.sh`:
```bash
echo ""
echo "📦  Installing project dependencies..."
uv pip install -r requirements.txt
# or
uv sync
```

### Port Forwarding
Uncomment and customize in `devcontainer.json`:
```json
"forwardPorts": [8000],
"portsAttributes": {
  "8000": {
    "label": "API",
    "onAutoForward": "openBrowser"
  }
}
```

### Add More Extensions
Add to `customizations.vscode.extensions` array in `devcontainer.json`.

### Remove Docker-in-Docker
If you don't need to run containers, remove this feature from `devcontainer.json` to save resources:
```json
// Remove this line:
"ghcr.io/devcontainers/features/docker-in-docker:2": {}
```

### Add Database Tools
Example: PostgreSQL client
```json
"features": {
  // ... existing features ...
  "ghcr.io/devcontainers/features/postgres:1": {}
}
```

## Quick Start

### Option 1: Copy to Your Project (Recommended)
```bash
# From this repo
cp -r templates/python/.devcontainer /path/to/your/project/

# Navigate to your project
cd /path/to/your/project

# Commit the configuration
git add .devcontainer/
git commit -m "Add Python DevContainer configuration"
git push
```

### Option 2: Create Codespace
```bash
# Via GitHub CLI
gh codespace create --repo your-username/your-repo

# Or via VS Code
# Press F1 → "Codespaces: Create New Codespace"
```

### Option 3: Use Locally with Docker
```bash
# In VS Code with Docker Desktop running
# Press F1 → "Dev Containers: Reopen in Container"
```

## After Setup

Once your container is running:

1. **Verify tools are installed:**
   ```bash
   python --version
   uv --version
   claude --version
   ```

2. **Install your project dependencies:**
   ```bash
   uv pip install -r requirements.txt
   # or
   uv sync
   ```

3. **Start developing with Claude Code:**
   ```bash
   claude
   ```

## Troubleshooting

### Check Post-Create Logs
```bash
cat /tmp/devcontainer-post-create.log
```

### Rebuild Container
If something goes wrong:
- VS Code: F1 → "Dev Containers: Rebuild Container"
- GitHub Codespaces: Recreate the Codespace

### Tool Not Found
Make sure the tool is listed in `devcontainer.json` features section.

## Next Steps

- Customize `.devcontainer/devcontainer.json` for your project
- Read `.devcontainer/README.md` for detailed configuration options
- Add project-specific setup to `.devcontainer/post-create.sh`
- Explore [available DevContainer features](https://github.com/devcontainers/features)

## Learn More

- [DevContainer Specification](https://containers.dev/)
- [GitHub Codespaces Docs](https://docs.github.com/en/codespaces)
- [uv Documentation](https://docs.astral.sh/uv/)
- [Claude Code](https://claude.ai/claude-code)
