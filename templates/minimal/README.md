# Minimal DevContainer Template

Bare essentials DevContainer setup for learning, experimentation, and custom environments.

## What's This For?

This template provides the absolute minimum for a functional development environment in GitHub Codespaces or Docker. It's intentionally sparse - you add only what you need.

## Included Tools

**Absolute Basics:**
- **Ubuntu 24.04** - Clean, modern Linux base
- **Git** - Version control
- **Make** - Build automation
- **Vim** - Terminal editor
- **Claude Code CLI** - AI pair programmer
- **GitHub CLI** - Manage repos, PRs, and Codespaces

**That's it.** No language runtimes, no databases, no frameworks. Just the essentials.

## VSCode Extensions

**Minimal Set:**
- Anthropic Claude Code - AI assistance
- GitHub Codespaces - Codespace integration

**Add more as needed!**

## When to Use

✅ **Use this template when:**
- Learning DevContainers and want to understand the basics
- Experimenting with tools before committing to a stack
- Building documentation-only repositories
- Need a custom setup (add exactly what you need)
- Want lightweight, fast-starting environment
- Prototyping or exploring new technologies

❌ **Use specialized templates when:**
- Production Python development → Use `python` template
- Production Node.js development → Use `node` template
- Full-stack projects → Use `fullstack` template
- You know exactly what stack you need → Use appropriate template

## Resource Allocation

**Default:**
- 2 CPU cores
- 4GB RAM (half of other templates)
- 16GB storage (half of other templates)

**Auto-stop:** 30 minutes idle (saves costs)

Intentionally minimal for fast startup and low cost. Increase as needed.

## This Is a Starting Point

The power of this template is its simplicity. Start here and add only what you need.

### Adding Language Runtimes

**Want Python?**
Edit `.devcontainer/devcontainer.json`:
```json
"features": {
  // ... existing features ...
  "ghcr.io/devcontainers/features/python:1": {
    "version": "3.11"
  }
}
```

**Want Node.js?**
```json
"features": {
  "ghcr.io/devcontainers/features/node:1": {
    "version": "lts",
    "pnpmVersion": "latest"
  }
}
```

**Want Go?**
```json
"features": {
  "ghcr.io/devcontainers/features/go:1": {
    "version": "latest"
  }
}
```

**Want Rust?**
```json
"features": {
  "ghcr.io/devcontainers/features/rust:1": {}
}
```

**Want multiple?**
Add them all! That's how the `fullstack` template works.

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

**MongoDB:**
```json
"features": {
  "ghcr.io/devcontainers/features/mongo:1": {}
}
```

**Redis:**
```json
"features": {
  "ghcr.io/devcontainers/features/redis:1": {}
}
```

### Adding VS Code Extensions

Edit `.devcontainer/devcontainer.json`:
```json
"vscode": {
  "extensions": [
    "anthropic.claude-code",
    "github.codespaces",
    // Add your extensions:
    "ms-python.python",
    "dbaeumer.vscode-eslint",
    "esbenp.prettier-vscode"
  ]
}
```

### Adding Docker Support

```json
"features": {
  "ghcr.io/devcontainers/features/docker-in-docker:2": {}
}
```

## Customization Examples

### Example 1: Basic Python Environment
```json
{
  "features": {
    "ghcr.io/jungaretti/features/make:1": {},
    "ghcr.io/jungaretti/features/vim:1": {},
    "ghcr.io/devcontainers/features/python:1": {
      "version": "3.11"
    },
    "ghcr.io/anthropics/devcontainer-features/claude-code:1": {},
    "ghcr.io/devcontainers/features/github-cli:1": {}
  }
}
```

### Example 2: Web Development (Node.js + Python)
```json
{
  "features": {
    "ghcr.io/jungaretti/features/make:1": {},
    "ghcr.io/devcontainers/features/python:1": {
      "version": "3.11"
    },
    "ghcr.io/devcontainers/features/node:1": {
      "version": "lts"
    },
    "ghcr.io/anthropics/devcontainer-features/claude-code:1": {},
    "ghcr.io/devcontainers/features/github-cli:1": {}
  }
}
```

### Example 3: Data Science
```json
{
  "features": {
    "ghcr.io/devcontainers/features/python:1": {
      "version": "3.11"
    },
    "ghcr.io/devcontainers/features/postgres:1": {},
    "ghcr.io/anthropics/devcontainer-features/claude-code:1": {},
    "ghcr.io/devcontainers/features/github-cli:1": {}
  },
  "vscode": {
    "extensions": [
      "anthropic.claude-code",
      "ms-python.python",
      "ms-toolsai.jupyter"
    ]
  }
}
```

## Quick Start

### Option 1: Copy to Your Project (Recommended)
```bash
# From this repo
cp -r templates/minimal/.devcontainer /path/to/your/project/

# Navigate to your project
cd /path/to/your/project

# Customize devcontainer.json for your needs
# Then commit
git add .devcontainer/
git commit -m "Add Minimal DevContainer configuration"
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

1. **Verify basics:**
   ```bash
   git --version
   make --version
   claude --version
   ```

2. **Add tools as needed:**
   - Edit `.devcontainer/devcontainer.json`
   - Press F1 → "Dev Containers: Rebuild Container"

3. **Start developing with Claude Code:**
   ```bash
   claude
   ```

## Learning Path

**If you're new to DevContainers:**

1. **Start here** - Understand the minimal setup
2. **Add one tool** - Try adding Python or Node.js
3. **Rebuild container** - See how features work
4. **Add extensions** - Customize VS Code
5. **Graduate** - Move to specialized template when ready

## Browse Available Tools

Explore what you can add:
- [DevContainer Features Catalog](https://github.com/devcontainers/features)
- [Community Features](https://containers.dev/features)
- [VS Code Extensions](https://marketplace.visualstudio.com/)

Common additions:
- Language runtimes (Python, Node, Go, Rust, Java, etc.)
- Databases (PostgreSQL, MySQL, MongoDB, Redis)
- Tools (Docker, kubectl, terraform, aws-cli)
- Editors (neovim, emacs)

## Increase Resources

Edit `.devcontainer/devcontainer.json`:
```json
{
  "hostRequirements": {
    "cpus": 4,
    "memory": "8gb",
    "storage": "32gb"
  }
}
```

## Port Forwarding

```json
"forwardPorts": [3000, 8000],
"portsAttributes": {
  "3000": {
    "label": "Dev Server",
    "onAutoForward": "openBrowser"
  }
}
```

## Troubleshooting

### Check Post-Create Logs
```bash
cat /tmp/devcontainer-post-create.log
```

### Rebuild Container
After adding features:
- VS Code: F1 → "Dev Containers: Rebuild Container"
- GitHub Codespaces: Recreate the Codespace

### Something Not Working?
Start fresh - delete `.devcontainer/` and copy template again.

## Philosophy

This template embodies "ruthless simplicity":
- Start with nothing
- Add only what you need
- Understand each addition
- Keep it maintainable

## When to Upgrade to Specialized Templates

**Signs you should use `python` template:**
- Using Python extensively
- Need uv for fast dependency management
- Want Python-specific extensions pre-configured

**Signs you should use `node` template:**
- Using Node.js extensively
- Need pnpm and modern tooling
- Want JavaScript/TypeScript extensions pre-configured

**Signs you should use `fullstack` template:**
- Need both Python and Node.js regularly
- Building APIs + frontends
- Want both toolchains fully configured

## Next Steps

- Browse [available features](https://github.com/devcontainers/features)
- Customize `.devcontainer/devcontainer.json` for your needs
- Read `.devcontainer/README.md` for quick reference
- Experiment - it's fast to rebuild!

## Learn More

- [DevContainer Specification](https://containers.dev/)
- [GitHub Codespaces Docs](https://docs.github.com/en/codespaces)
- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [Claude Code](https://claude.ai/claude-code)
