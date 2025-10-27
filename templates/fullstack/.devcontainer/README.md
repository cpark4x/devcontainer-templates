# Full-Stack DevContainer Configuration

This directory contains the DevContainer configuration that defines your development environment.

## What's Included

**Python Stack:**
- Python 3.11 + uv (fast package manager)
- Ruff (linting/formatting)

**Node.js Stack:**
- Node.js LTS + pnpm (for frontend)
- npm, yarn available

**Shared Tools:**
- Claude Code CLI (AI assistant)
- GitHub CLI (`gh`)
- Make, Git, Vim
- Docker-in-Docker

**Resources:**
- 2 CPU cores, 8GB RAM, 32GB storage
- Auto-stops after 30 minutes idle (saves costs)

**Configuration:**
- Git auto-push enabled
- Post-creation status report
- Optimized uv cache location

## Quick Customization

### Change Container Name
Edit `devcontainer.json`:
```json
{
  "name": "your-project-name"
}
```

### Adjust Resources
```json
{
  "hostRequirements": {
    "cpus": 4,
    "memory": "16gb",
    "storage": "64gb"
  }
}
```

### Add Tools
Browse [available features](https://github.com/devcontainers/features) and add to `features` section.

### Add VS Code Extensions
Add to `customizations.vscode.extensions` array in `devcontainer.json`.

### Project-Specific Setup
Edit `post-create.sh` to add commands for both backend and frontend:
```bash
echo "📦  Installing backend dependencies..."
cd backend && uv sync && cd ..

echo "📦  Installing frontend dependencies..."
cd frontend && pnpm install && cd ..
```

## Port Forwarding

To expose ports (e.g., frontend + API):

1. Uncomment `forwardPorts` in `devcontainer.json`:
```json
"forwardPorts": [3000, 8000],
```

2. Optionally configure port behavior:
```json
"portsAttributes": {
  "3000": {
    "label": "Frontend",
    "onAutoForward": "notify"
  },
  "8000": {
    "label": "API",
    "onAutoForward": "openBrowser"
  }
}
```

## Documentation

- [Devcontainer Specification](https://containers.dev/)
- [GitHub Codespaces Docs](https://docs.github.com/en/codespaces)
- [Available Features](https://github.com/devcontainers/features)
