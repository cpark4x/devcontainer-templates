# Node.js DevContainer Configuration

This directory contains the DevContainer configuration that defines your development environment.

## What's Included

**Core Tools:**
- Node.js 20 LTS
- npm (standard package manager)
- pnpm (fast, disk-efficient package manager)
- Claude Code CLI (AI assistant)
- GitHub CLI (`gh`)
- Make, Git, Vim

**Resources:**
- 2 CPU cores, 8GB RAM, 32GB storage
- Auto-stops after 30 minutes idle (saves costs)

**Configuration:**
- Git auto-push enabled
- Post-creation status report

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
Edit `post-create.sh` to add commands (e.g., `pnpm install`).

## Port Forwarding

To expose ports (e.g., web server, API):

1. Uncomment `forwardPorts` in `devcontainer.json`:
```json
"forwardPorts": [3000, 5173],
```

2. Optionally configure port behavior:
```json
"portsAttributes": {
  "3000": {
    "label": "Development Server",
    "onAutoForward": "notify"
  },
  "5173": {
    "label": "Vite",
    "onAutoForward": "openBrowser"
  }
}
```

## Documentation

- [Devcontainer Specification](https://containers.dev/)
- [GitHub Codespaces Docs](https://docs.github.com/en/codespaces)
- [Available Features](https://github.com/devcontainers/features)
