# Minimal DevContainer Configuration

This directory contains a bare-bones DevContainer configuration for learning and experimentation.

## What's Included

**Absolute Basics:**
- Ubuntu 24.04 base system
- Git - Version control
- Make - Build automation
- Vim - Terminal editor
- Claude Code CLI - AI assistant
- GitHub CLI (`gh`) - GitHub integration

**Resources:**
- 2 CPU cores, 4GB RAM, 16GB storage
- Minimal footprint for quick startup
- Auto-stops after 30 minutes idle

## This Is Your Starting Point

This template is **intentionally minimal**. Add tools as you need them!

### Adding Language Runtimes

**Python:**
```json
"features": {
  "ghcr.io/devcontainers/features/python:1": {
    "version": "3.11"
  }
}
```

**Node.js:**
```json
"features": {
  "ghcr.io/devcontainers/features/node:1": {
    "version": "lts"
  }
}
```

**Go:**
```json
"features": {
  "ghcr.io/devcontainers/features/go:1": {
    "version": "latest"
  }
}
```

**Rust:**
```json
"features": {
  "ghcr.io/devcontainers/features/rust:1": {}
}
```

### Adding VS Code Extensions

Add to `customizations.vscode.extensions`:
```json
"extensions": [
  "anthropic.claude-code",
  "github.codespaces",
  "ms-python.python",  // Your additions here
  "dbaeumer.vscode-eslint"
]
```

### Adding Databases

**PostgreSQL:**
```json
"features": {
  "ghcr.io/devcontainers/features/postgres:1": {}
}
```

**MySQL:**
```json
"features": {
  "ghcr.io/devcontainers/features/mysql:1": {}
}
```

**Redis:**
```json
"features": {
  "ghcr.io/devcontainers/features/redis:1": {}
}
```

## Available Features

Browse all available tools:
- [DevContainer Features Catalog](https://github.com/devcontainers/features)
- [Community Features](https://containers.dev/features)

## Quick Customization

### Increase Resources
Edit `devcontainer.json`:
```json
{
  "hostRequirements": {
    "cpus": 4,
    "memory": "8gb",
    "storage": "32gb"
  }
}
```

### Port Forwarding
```json
"forwardPorts": [3000, 8000]
```

### Add Setup Commands
Edit `post-create.sh` to add initialization commands.

## When to Use This Template

✅ **Perfect for:**
- Learning DevContainers
- Experimenting with tools before committing
- Documentation-only repositories
- Custom environments (add exactly what you need)
- Lightweight general-purpose development

❌ **Use specialized templates for:**
- Production Python development → `python` template
- Production Node.js development → `node` template
- Full-stack projects → `fullstack` template

## Documentation

- [Devcontainer Specification](https://containers.dev/)
- [GitHub Codespaces Docs](https://docs.github.com/en/codespaces)
- [Available Features](https://github.com/devcontainers/features)
