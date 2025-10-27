# DevContainer Setup Templates

Quick-start templates for consistent development environments across GitHub Codespaces and local Docker containers.

**📦 Repository:** https://github.com/cpark4x/devcontainer-templates

**→ [Team Usage Guide](TEAM_GUIDE.md)** - Quick reference for teams

## What Are DevContainers?

DevContainers provide reproducible development environments defined as code. Think "Dockerfile for development" - specify your tools, extensions, and configuration once, and every developer gets the same setup.

**Benefits:**
- Consistent environment across team members
- No "works on my machine" problems
- New developers productive in minutes
- Same environment locally or in Codespaces

## Available Templates

| Template | Use When | Included Tools | Status |
|----------|----------|----------------|--------|
| [python](templates/python/) | Pure Python projects | Python 3.11, uv, pytest, ruff, Node.js (tooling) | ✅ Ready |
| [node](templates/node/) | Node.js/TypeScript projects | Node 20, pnpm, npm, ESLint, Prettier | ✅ Ready |
| [fullstack](templates/fullstack/) | Python + Node full-stack | Python 3.11 + Node 20 + all tools | ✅ Ready |
| [minimal](templates/minimal/) | Learning/experimentation | Ubuntu 24.04, Git, Make, Claude Code | ✅ Ready |

## Quick Start

### Step 1: Choose Your Template

Browse the [templates](templates/) directory and read each template's README to understand what's included.

**Quick selection:**
- Python projects → [templates/python](templates/python/)
- Node.js projects → [templates/node](templates/node/)
- Full-stack projects → [templates/fullstack](templates/fullstack/)
- Learning/custom → [templates/minimal](templates/minimal/)

### Step 2: Copy to Your Project

```bash
# Copy the template
cp -r templates/python/.devcontainer /path/to/your/project/

# Navigate to your project
cd /path/to/your/project

# Commit the configuration
git add .devcontainer/
git commit -m "Add DevContainer configuration"
git push
```

### Step 3: Use the Container

**Option A: GitHub Codespaces (cloud)**
```bash
# Via GitHub CLI
gh codespace create --repo your-username/your-repo

# Or via GitHub web UI
# Go to your repo → Code button → Codespaces tab → Create
```

**Option B: Local Docker (your machine)**
```bash
# In VS Code with Docker Desktop running
# Press F1 → "Dev Containers: Reopen in Container"
```

### Step 4: Start Developing

Once your container is running, all tools are pre-installed:
```bash
# Verify environment
python --version
claude --version

# Start working
claude
```

## Customizing Templates

After copying a template to your project:

1. **Read the template README:** Each template's README explains customization options
2. **Edit `devcontainer.json`:** Change name, resources, add tools
3. **Update `post-create.sh`:** Add project-specific setup commands
4. **Rebuild container:** Changes take effect after rebuild

Common customizations:
- Container name and resource limits
- Additional tools and extensions
- Port forwarding for web servers
- Project dependency installation

## Helper Script

A convenience script is available to simplify copying templates:

```bash
# Usage: ./scripts/copy-template.sh <template> <target-directory>

# Examples
./scripts/copy-template.sh python ~/my-python-project
./scripts/copy-template.sh node ~/my-react-app
./scripts/copy-template.sh fullstack ~/my-full-stack-app
./scripts/copy-template.sh minimal ~/my-custom-project
```

The script will:
- Validate template exists
- Warn if overwriting existing `.devcontainer/`
- Copy template to your project
- Display next steps

Manual `cp` commands work too if you prefer.

## Project Status

- ✅ **Phase 1: Python template**
  - Complete Python development environment
  - Ready for production use

- ✅ **Phase 2: Additional templates**
  - Node.js/TypeScript template
  - Full-stack template
  - Minimal template for learning
  - All 4 templates ready to use!

- ✅ **Phase 4: Helper script** (current)
  - Template copying automation (`copy-template.sh`)
  - Team usage guide
  - All core features complete!

- 🚧 **Future enhancements** (optional)
  - Template validation tools
  - Shared utility library
  - Template comparison matrix

## Template Structure

Each template contains:
```
template-name/
├── .devcontainer/
│   ├── devcontainer.json    # Container configuration
│   ├── post-create.sh        # Setup script
│   └── README.md            # Configuration details
└── README.md                # Template guide
```

## When to Use Each Template

### Python Template
**Use when:**
- Building Python applications (FastAPI, Django, Flask)
- Creating Python CLI tools
- Need uv for fast dependency management
- Python project that needs Node.js tooling

**Don't use when:**
- Pure Node.js/TypeScript project → use [node](templates/node/)
- Need both Python and Node equally → use [fullstack](templates/fullstack/)

### Node Template
**Use when:**
- Pure Node.js/TypeScript projects
- Frontend apps (React, Vue, Svelte, Angular)
- Node.js APIs and services
- JavaScript-based CLI tools

**Don't use when:**
- Need Python → use [python](templates/python/)
- Need both Python and Node → use [fullstack](templates/fullstack/)

### Full-Stack Template
**Use when:**
- Python backend + Node.js frontend
- FastAPI/Flask/Django + React/Vue
- Monorepo with backend + frontend
- Projects requiring both ecosystems

**Don't use when:**
- Pure Python → use [python](templates/python/)
- Pure Node.js → use [node](templates/node/)
- Just learning → use [minimal](templates/minimal/)

### Minimal Template
**Use when:**
- Learning DevContainers
- Documentation-only repositories
- Experimenting before choosing a stack
- Custom tool setup (add your own)

**Don't use when:**
- Production development → use specific stack template

## Managing Codespaces

```bash
# List all your Codespaces
gh codespace list

# Connect to a Codespace
gh codespace code --codespace <name>

# Stop a Codespace (saves costs)
gh codespace stop --codespace <name>

# Delete a Codespace
gh codespace delete --codespace <name>
```

**Cost management:** Codespaces auto-stop after 30 minutes of inactivity. Always stop or delete when done to avoid charges.

## Troubleshooting

### Container Won't Build
1. Check Docker Desktop is running (local)
2. Review `.devcontainer/devcontainer.json` for syntax errors
3. Check post-create logs: `cat /tmp/devcontainer-post-create.log`

### Tool Not Available
1. Verify tool is listed in `devcontainer.json` features
2. Rebuild container: F1 → "Dev Containers: Rebuild Container"
3. Check feature documentation: [DevContainer Features](https://github.com/devcontainers/features)

### Performance Issues
1. Increase resources in `hostRequirements`
2. Remove unused features (e.g., Docker-in-Docker)
3. Use local containers instead of Codespaces for heavy workloads

## Learn More

**DevContainers:**
- [DevContainer Specification](https://containers.dev/)
- [Available Features](https://github.com/devcontainers/features)
- [VS Code DevContainers](https://code.visualstudio.com/docs/devcontainers/containers)

**GitHub Codespaces:**
- [Codespaces Documentation](https://docs.github.com/en/codespaces)
- [Codespaces Pricing](https://docs.github.com/en/billing/managing-billing-for-github-codespaces/about-billing-for-github-codespaces)

**Tools:**
- [Claude Code](https://claude.ai/claude-code)
- [uv (Python package manager)](https://docs.astral.sh/uv/)
- [GitHub CLI](https://cli.github.com/)

## Contributing

Want to create a new template? See the [template guidelines](docs/template-guidelines.md) (coming in Phase 3).

Have improvements to existing templates? Submit a PR with:
- Clear description of the change
- Why it improves the template
- Tested in both Codespaces and local Docker

## License

This repository is provided as-is for creating development environments. Individual tools and features are subject to their own licenses.

---

**Current Version:** Phase 1 (Python template only)
**Last Updated:** 2025-01-27
