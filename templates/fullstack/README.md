# Full-Stack DevContainer Template

Complete DevContainer setup optimized for full-stack development with Python backend and Node.js frontend, Claude Code pre-installed.

## What's This For?

This template provides a fully configured full-stack development environment that runs in GitHub Codespaces or locally with Docker. It's designed for projects requiring both Python (backend) and Node.js (frontend) capabilities in a single environment.

## Included Tools

### Python Stack
- **Python 3.11** - Modern Python with latest features
- **uv** - Fast Python package manager (replaces pip/poetry)
- **Ruff** - Lightning-fast Python linter and formatter

### Node.js Stack
- **Node.js 20 LTS** - For frontend frameworks and build tools
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

### Node.js/TypeScript Development
- ESLint - JavaScript/TypeScript linting
- Prettier - Code formatting
- Jest Runner - Test execution

### General Development
- Better comments
- Markdown preview with Mermaid
- TOML support
- Spell checker
- Makefile tools

## When to Use

✅ **Use this template when:**
- Building full-stack applications with Python backend + JavaScript frontend
- FastAPI/Flask/Django backend with React/Vue/Svelte frontend
- Monorepo projects with both Python and Node.js code
- Projects requiring both Python and Node.js tooling
- Need AI assistance for both backend and frontend work

❌ **Consider other templates when:**
- Pure Python project → Use `python` template
- Pure Node.js project → Use `node` template
- Just learning/experimenting → Use `minimal` template
- Need specialized tools (Rust, Go, etc.) → Create custom template

## Resource Allocation

**Default:**
- 2 CPU cores
- 8GB RAM
- 32GB storage

**Auto-stop:** 30 minutes idle (saves costs)

These are sensible defaults. Adjust in `.devcontainer/devcontainer.json` if needed.

## Typical Project Structure

```
project/
├── backend/               # Python backend
│   ├── pyproject.toml
│   ├── src/
│   └── tests/
├── frontend/              # Node.js frontend
│   ├── package.json
│   ├── src/
│   └── tests/
├── .devcontainer/         # This configuration
└── README.md
```

## Customization

### Container Name
Edit `.devcontainer/devcontainer.json`:
```json
{
  "name": "my-project-name",
  "runArgs": ["--name=my_project_devcontainer"]
}
```

### Install Dependencies
Update `.devcontainer/post-create.sh`:
```bash
echo ""
echo "📦  Installing backend dependencies..."
cd backend && uv sync && cd ..

echo ""
echo "📦  Installing frontend dependencies..."
cd frontend && pnpm install && cd ..
```

### Port Forwarding
Uncomment and customize in `devcontainer.json`:
```json
"forwardPorts": [3000, 8000],
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

### Add More Extensions
Add to `customizations.vscode.extensions` array in `devcontainer.json`.

### Remove Docker-in-Docker
If you don't need to run containers, remove this feature from `devcontainer.json` to save resources:
```json
// Remove this line:
"ghcr.io/devcontainers/features/docker-in-docker:2": {}
```

### Add Database Tools
Example: PostgreSQL
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
cp -r templates/fullstack/.devcontainer /path/to/your/project/

# Navigate to your project
cd /path/to/your/project

# Commit the configuration
git add .devcontainer/
git commit -m "Add Full-Stack DevContainer configuration"
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
   node --version
   pnpm --version
   claude --version
   ```

2. **Install backend dependencies:**
   ```bash
   cd backend
   uv sync
   # or
   uv pip install -r requirements.txt
   ```

3. **Install frontend dependencies:**
   ```bash
   cd frontend
   pnpm install
   ```

4. **Start developing with Claude Code:**
   ```bash
   claude
   ```

## Common Stack Combinations

This template works great with:

### Python Backend Options
- **FastAPI** - Modern async API framework
- **Flask** - Lightweight web framework
- **Django** - Full-featured web framework
- **Litestar** - High-performance ASGI framework

### Node.js Frontend Options
- **React** - Component-based UI library
- **Vue** - Progressive framework
- **Svelte** - Compiler-based framework
- **Angular** - Full framework
- **Next.js** - React with SSR
- **Nuxt** - Vue with SSR
- **SvelteKit** - Svelte with SSR

### Example Combinations
- FastAPI + React + TypeScript
- Django + Vue + Vite
- Flask + Svelte + SvelteKit
- Litestar + Next.js

## Running Both Services

### Option 1: Separate Terminals
```bash
# Terminal 1: Backend
cd backend
uv run uvicorn main:app --reload --port 8000

# Terminal 2: Frontend
cd frontend
pnpm dev
```

### Option 2: Process Manager (Recommended)
Create a `Makefile`:
```makefile
.PHONY: dev
dev:
	make -j2 dev-backend dev-frontend

.PHONY: dev-backend
dev-backend:
	cd backend && uv run uvicorn main:app --reload --port 8000

.PHONY: dev-frontend
dev-frontend:
	cd frontend && pnpm dev
```

Then run: `make dev`

### Option 3: Docker Compose
If using Docker-in-Docker feature:
```yaml
# docker-compose.yml
services:
  backend:
    build: ./backend
    ports:
      - "8000:8000"

  frontend:
    build: ./frontend
    ports:
      - "3000:3000"
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

### Port Conflicts
Ensure backend and frontend use different ports (e.g., 8000 and 3000).

## Next Steps

- Customize `.devcontainer/devcontainer.json` for your project
- Read `.devcontainer/README.md` for detailed configuration options
- Add project-specific setup to `.devcontainer/post-create.sh`
- Explore [available DevContainer features](https://github.com/devcontainers/features)

## Learn More

- [DevContainer Specification](https://containers.dev/)
- [GitHub Codespaces Docs](https://docs.github.com/en/codespaces)
- [FastAPI Documentation](https://fastapi.tiangolo.com/)
- [React Documentation](https://react.dev/)
- [uv Documentation](https://docs.astral.sh/uv/)
- [pnpm Documentation](https://pnpm.io/)
- [Claude Code](https://claude.ai/claude-code)
