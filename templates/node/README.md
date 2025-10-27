# Node.js DevContainer Template

Complete DevContainer setup optimized for Node.js/TypeScript development with Claude Code pre-installed.

## What's This For?

This template provides a fully configured Node.js development environment that runs in GitHub Codespaces or locally with Docker. It's designed for pure JavaScript/TypeScript projects including frontend applications, APIs, and full-stack Node.js systems.

## Included Tools

### Node.js Stack
- **Node.js 20 LTS** - Long-term support release
- **npm** - Standard Node.js package manager
- **pnpm** - Fast, disk-efficient package manager

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

### Node.js/TypeScript Development
- ESLint - JavaScript/TypeScript linting
- Prettier - Code formatting
- Jest Runner - Test execution

### General Development
- Better comments
- Markdown preview with Mermaid
- Spell checker
- Makefile tools

## When to Use

✅ **Use this template when:**
- Building pure Node.js/TypeScript projects
- Frontend applications (React, Vue, Svelte, Angular, etc.)
- Node.js APIs and services (Express, Fastify, NestJS, etc.)
- Full JavaScript/TypeScript stack
- CLI tools and build systems

❌ **Consider other templates when:**
- Need Python → Use `python` template
- Need both Python and Node → Use `fullstack` template
- Just learning/experimenting → Use `minimal` template
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

### Add Node Packages
Add a `package.json`, then update `.devcontainer/post-create.sh`:
```bash
echo ""
echo "📦  Installing project dependencies..."
pnpm install
# or
npm install
```

### Port Forwarding
Uncomment and customize in `devcontainer.json`:
```json
"forwardPorts": [3000, 5173],
"portsAttributes": {
  "3000": {
    "label": "Dev Server",
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
cp -r templates/node/.devcontainer /path/to/your/project/

# Navigate to your project
cd /path/to/your/project

# Commit the configuration
git add .devcontainer/
git commit -m "Add Node.js DevContainer configuration"
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
   node --version
   pnpm --version
   claude --version
   ```

2. **Install your project dependencies:**
   ```bash
   pnpm install
   # or
   npm install
   ```

3. **Start developing with Claude Code:**
   ```bash
   claude
   ```

## Common Frameworks

This template works great with:

### Frontend Frameworks
- **React** - `pnpm create vite my-app --template react-ts`
- **Vue** - `pnpm create vite my-app --template vue-ts`
- **Svelte** - `pnpm create vite my-app --template svelte-ts`
- **Angular** - `npx @angular/cli new my-app`
- **Next.js** - `pnpm create next-app`

### Backend Frameworks
- **Express** - `pnpm add express`
- **Fastify** - `pnpm add fastify`
- **NestJS** - `pnpm add @nestjs/core`
- **Hono** - `pnpm add hono`

### Full-Stack Frameworks
- **Next.js** - `pnpm create next-app`
- **Remix** - `pnpm create remix`
- **SvelteKit** - `pnpm create svelte`
- **Nuxt** - `pnpm dlx nuxi init`

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
- [Node.js Documentation](https://nodejs.org/docs/)
- [pnpm Documentation](https://pnpm.io/)
- [Claude Code](https://claude.ai/claude-code)
