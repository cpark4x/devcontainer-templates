# Team Guide: Using DevContainer Templates

Quick reference for teams using these DevContainer templates across projects.

## For Team Members

### Getting Started (5 minutes)

**1. Clone this repository once:**
```bash
git clone https://github.com/cpark4x/devcontainer-templates.git ~/devcontainer-templates
```

**2. Copy template to your project:**
```bash
# For Python project
cp -r ~/devcontainer-templates/templates/python/.devcontainer ~/my-project/

# For Node.js project
cp -r ~/devcontainer-templates/templates/node/.devcontainer ~/my-project/

# For full-stack project
cp -r ~/devcontainer-templates/templates/fullstack/.devcontainer ~/my-project/

# For learning/custom
cp -r ~/devcontainer-templates/templates/minimal/.devcontainer ~/my-project/
```

**3. Open in container:**
- **GitHub Codespaces:** `gh codespace create --repo your-org/your-repo`
- **Local Docker:** Open in VS Code → F1 → "Dev Containers: Reopen in Container"

**4. Start working:**
```bash
# Verify environment
python --version    # Python projects
node --version      # Node projects
claude --version    # All projects

# Start developing
claude
```

---

## Template Selection Guide

| Your Project Type | Template | Typical Use Cases |
|-------------------|----------|-------------------|
| Python API | [python](templates/python/) | FastAPI, Flask, Django |
| Python CLI | [python](templates/python/) | Command-line tools, automation |
| React/Vue/Svelte | [node](templates/node/) | Frontend applications |
| Express/Fastify | [node](templates/node/) | Node.js APIs |
| Backend + Frontend | [fullstack](templates/fullstack/) | FastAPI+React, Django+Vue |
| Learning/Docs | [minimal](templates/minimal/) | Experimentation, documentation |

---

## Common Customizations

### Update Container Name
Edit `.devcontainer/devcontainer.json`:
```json
{
  "name": "my-project-name",
  "runArgs": ["--name=my_project_devcontainer"]
}
```

### Add Port Forwarding
For web servers, uncomment in `devcontainer.json`:
```json
"forwardPorts": [8000, 3000],
"portsAttributes": {
  "8000": {
    "label": "Backend API",
    "onAutoForward": "notify"
  },
  "3000": {
    "label": "Frontend",
    "onAutoForward": "openBrowser"
  }
}
```

### Install Project Dependencies
Add to `.devcontainer/post-create.sh`:
```bash
# Python projects
echo "📦  Installing dependencies..."
uv pip install -r requirements.txt
# or
uv sync

# Node projects
echo "📦  Installing dependencies..."
pnpm install
```

### Add Database Tools
Add to `features` section in `devcontainer.json`:
```json
"features": {
  // ... existing features ...
  "ghcr.io/devcontainers/features/postgres:1": {},
  "ghcr.io/devcontainers/features/redis:1": {}
}
```

---

## Team Best Practices

### 1. Commit DevContainer Config to Your Repo
```bash
git add .devcontainer/
git commit -m "Add DevContainer configuration"
git push
```

**Why:** Ensures entire team uses the same environment.

### 2. Document Project-Specific Setup
Add a `.devcontainer/README.md` in your project with:
- Project-specific dependencies
- Environment variables needed
- Database setup instructions
- Testing commands

### 3. Keep Templates Updated
Periodically pull updates from the template repo:
```bash
cd ~/devcontainer-templates
git pull
```

Then re-copy templates to projects as needed.

### 4. Share Customizations
If you customize a template in a useful way, consider:
- Sharing with the team
- Contributing back to this repo
- Documenting in your project's `.devcontainer/README.md`

---

## Troubleshooting

### Container Won't Build
1. **Check Docker is running** (local only)
2. **Review logs:** `cat /tmp/devcontainer-post-create.log`
3. **Rebuild:** F1 → "Dev Containers: Rebuild Container"

### Tool Not Available
1. **Check `devcontainer.json`** - Is the tool listed in features?
2. **Rebuild container** after adding features
3. **Check feature docs:** [DevContainer Features](https://github.com/devcontainers/features)

### Slow Performance
1. **Increase resources** in `hostRequirements`
2. **Remove unused features** (e.g., Docker-in-Docker if not needed)
3. **Use local containers** instead of Codespaces for heavy workloads

### "Works in my container" Problems
If something works in your container but not a teammate's:
1. **Check git status:** Ensure `.devcontainer/` is committed
2. **Compare configs:** `diff` your devcontainer.json with theirs
3. **Rebuild both containers:** Start fresh
4. **Check dependencies:** Are all dependencies in requirements.txt / package.json?

---

## Managing Codespaces (Cost Control)

### List All Codespaces
```bash
gh codespace list
```

### Stop a Codespace (Saves Money!)
```bash
gh codespace stop --codespace <name>
```

**Auto-stop:** Codespaces stop after 30 minutes of inactivity. But explicitly stopping saves you from forgetting.

### Delete When Done
```bash
gh codespace delete --codespace <name>
```

**Cost tip:** Delete Codespaces you're not actively using. You can always create a new one from your repo.

### Monitor Usage
Check your GitHub billing settings regularly:
- [GitHub Codespaces Billing](https://github.com/settings/billing)

---

## Getting Help

### Template Issues
- **This repo:** [GitHub Issues](https://github.com/cpark4x/devcontainer-templates/issues)
- **General DevContainers:** [VS Code DevContainers Docs](https://code.visualstudio.com/docs/devcontainers/containers)
- **Codespaces:** [GitHub Codespaces Docs](https://docs.github.com/en/codespaces)

### Team Support
- Ask in your team Slack/Discord
- Check your project's `.devcontainer/README.md` for project-specific guidance
- Share solutions - document what worked!

---

## Quick Commands Reference

```bash
# Copy template to project
cp -r ~/devcontainer-templates/templates/TEMPLATE/.devcontainer ~/my-project/

# Create Codespace
gh codespace create --repo org/repo

# Connect to existing Codespace
gh codespace code --codespace <name>

# Stop Codespace
gh codespace stop --codespace <name>

# Delete Codespace
gh codespace delete --codespace <name>

# List all Codespaces
gh codespace list

# Rebuild container (local)
# VS Code: F1 → "Dev Containers: Rebuild Container"
```

---

## Template Maintenance

### Updating Your Local Copy
```bash
cd ~/devcontainer-templates
git pull
```

### Applying Updates to Projects
After pulling template updates:
```bash
# Review changes
cd ~/devcontainer-templates
git log --oneline -5

# Copy updated template to project
cp -r templates/python/.devcontainer ~/my-project/.devcontainer-new
cd ~/my-project
# Review differences
diff -r .devcontainer .devcontainer-new
# Apply if desired
mv .devcontainer .devcontainer-old
mv .devcontainer-new .devcontainer
```

---

## Contributing Improvements

Found a useful customization? Share it!

1. **Fork this repo**
2. **Make your changes** to the appropriate template
3. **Test thoroughly** (both Codespaces and local Docker)
4. **Submit a PR** with:
   - Clear description of improvement
   - Why it helps the team
   - Any trade-offs or considerations

---

**Questions?** Ask your team lead or file an issue in this repo.

**Happy coding!** 🚀
