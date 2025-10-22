# Customization Checklist

When starting a new project from this template, follow this checklist to customize it for your needs.

---

## Essential (Do This First)

### 1. Project Basics
- [ ] **Copy template README:** `cp README_TEMPLATE.md README.md`
- [ ] **Update README.md:**
  - [ ] Change `[Project Name]` to your project name
  - [ ] Update project description and objective
  - [ ] Set timeline/milestones
  - [ ] Update key constraints
- [ ] **Initialize git (if not done):**
  ```bash
  git init
  git add .
  git commit -m "Initial commit from marp-presentation-framework template"
  ```

### 2. Presentation Content
- [ ] **Edit `source/presentation-marp.md`:**
  - [ ] Update title slide (name, project, date)
  - [ ] Replace example slides with your content
  - [ ] Customize CSS theme in YAML frontmatter (optional)
  - [ ] Add your images to `source/images/`

### 3. Test Build
- [ ] **Run `make marp`** to verify setup works
- [ ] **Open `artifacts/presentation-marp.html`** in browser
- [ ] Verify slides render correctly

---

## Optional (If Using YAML Workflows)

### 4. Requirements Database
- [ ] **Edit `source/requirements.yaml`:**
  - [ ] Remove example requirements
  - [ ] Add your requirements (use SMART criteria)
  - [ ] Set priority levels (P0-Critical, P1-High, P2-Medium)
- [ ] **Generate docs:** Run `/req-yaml-to-md`
- [ ] **Verify:** Check `artifacts/requirements.md`

### 5. Architecture Database
- [ ] **Edit `source/architectures.yaml`:**
  - [ ] Remove example architectures
  - [ ] Define your solution alternatives
- [ ] **Edit `source/parts.csv`:**
  - [ ] Remove example parts
  - [ ] Add your Bill of Materials (Digikey PNs, costs)
- [ ] **Generate docs:** Run `/arch-gen`
- [ ] **Verify:** Check `artifacts/bom/*.csv`

### 6. Slash Commands
- [ ] **Review `.claude/commands/`** - keep only what you need
- [ ] **Optional:** Create custom slash commands for your project

---

## Cleanup (Remove Template Examples)

### 7. Remove Example Documentation
- [ ] **Delete example files from `docs/`:**
  ```bash
  rm docs/_obsolete/*  # If exists
  # Review and remove other example docs
  ```
- [ ] **Keep framework docs:**
  - Keep: `docs/requirements-policy.md` (SMART criteria)
  - Keep: `docs/interview-rubric.md` (if applicable)

### 8. Clean Reference Materials
- [ ] **Empty `reference/` directory:**
  ```bash
  rm -rf reference/*
  mkdir -p reference/{datasheets,standards,app-notes}
  ```
- [ ] **Add your datasheets, standards**

### 9. Scripts
- [ ] **Review `scripts/` directory** - keep only what you need
- [ ] **Delete unused scripts:**
  - Delete if not using: `generate_arch_artifacts.py`
  - Delete if not using: `plot_tradeoff_charts.py`

---

## Customization (Make It Yours)

### 10. CSS Theme (Optional)
Edit `source/presentation-marp.md` YAML frontmatter:

```yaml
---
style: |
  section {
    font-size: 24px;         # Adjust font size
    background: #ffffff;     # Change background color
  }
  h1 {
    color: #2c3e50;          # Change heading color
    border-bottom: 3px solid #3498db;  # Accent color
  }
  table thead th {
    background-color: #2980b9 !important;  # Table header color
  }
  blockquote {
    background-color: #eaf4fb;  # Takeaway box color
    border-left: 5px solid #2980b9;
  }
---
```

### 11. Gitignore (Optional)
- [ ] **Review `.gitignore`** - add project-specific patterns
- [ ] **Common additions:**
  ```
  # Project-specific
  *.backup
  secrets.yaml

  # IDE-specific
  .vscode/settings.json
  ```

### 12. Makefile Targets (Optional)
- [ ] **Review `Makefile`** - add custom targets if needed
- [ ] **Example custom target:**
  ```makefile
  .PHONY: deploy
  deploy: marp
  	rsync -av artifacts/ user@server:/var/www/presentation/
  ```

---

## Verification Checklist

### Before First Presentation
- [ ] **Build works:** `make marp` succeeds
- [ ] **No template placeholders:** Search for `[Project Name]`, `[TODO]`, `[EXAMPLE]`
- [ ] **Git clean:** `git status` shows only intended files
- [ ] **Images load:** All images render in HTML
- [ ] **Navigation works:** Arrow keys advance slides
- [ ] **Speaker notes present:** View source, check HTML comments
- [ ] **PDF exports:** `artifacts/presentation-marp.pdf` renders correctly

### Before Sharing
- [ ] **Git pushed:** `git push origin main`
- [ ] **README accurate:** README.md reflects your project (not template)
- [ ] **No sensitive data:** No credentials, API keys in repo
- [ ] **License clear:** Update LICENSE file if needed
- [ ] **Contact info updated:** Your name/email in relevant files

---

## Pro Tips

### AI-Assisted Workflow
1. **Keep source files text-based** (Markdown, YAML, CSV)
2. **Use slash commands** for automation (requirements → docs)
3. **Verify AI outputs** - always check math, assumptions
4. **Document AI usage** - be transparent in presentation

### Version Control
1. **Commit frequently** - after each slide section
2. **Semantic versioning** - v1.0.0 = initial, v1.1.0 = minor, v2.0.0 = major
3. **Meaningful messages** - "Add trade-off analysis slide" not "Update"

### Presentation Best Practices
1. **Speaker notes** - Write what to SAY, not what's on slide
2. **Takeaway boxes** - Use `> **TAKEAWAY:**` for key messages
3. **30-second rule** - Each slide should take 30-60 seconds
4. **Practice 3+ times** - Time yourself, refine wording

---

## Common Mistakes to Avoid

❌ **Don't:** Leave template placeholders (`[Project Name]`, `[TODO]`)
❌ **Don't:** Commit generated artifacts (HTML/PDF) if not needed
❌ **Don't:** Skip verification step (always check AI-generated content)
❌ **Don't:** Use binary formats (PPTX) for version control
❌ **Don't:** Ignore speaker notes (they're your script!)

✅ **Do:** Start simple, add complexity as needed
✅ **Do:** Keep YAML as single source of truth
✅ **Do:** Practice presentation out loud (timing matters!)
✅ **Do:** Use git branches for major changes
✅ **Do:** Document assumptions and verification steps

---

## Need Help?

**Framework Issues:** https://github.com/unbedded/marp-presentation-framework/issues

**Marp Docs:** https://marpit.marp.app/markdown

**Example Project:** See `EXAMPLE-README.md` for complete LAM Research case study

---

**Estimated Time to Customize:** 30-60 minutes for basic setup, 2-4 hours for full YAML workflow

**Next Step:** Copy `README_TEMPLATE.md` to `README.md` and start editing!
