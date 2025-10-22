# Marp Presentation Framework - Workflow Guide

---

## TL;DR

**Edit text → Build in 1 second → Present.** Edit `source/presentation.md` (Markdown), run `make marp`, open `artifacts/presentation.html` in browser. Version control friendly, AI-optimized, no PowerPoint lock-in.

**3 files to customize:** `README.md` (your project), `TODO.md` (your phases), `source/presentation.md` (your slides). **2 reference files:** This guide + `CLAUDE.md` (AI rules).

---

## Quick Start

```bash
# Edit slides
vim source/presentation.md

# Build presentation (HTML + PDF)
make marp

# Present
firefox artifacts/presentation.html  # Press F11 for fullscreen
```

**Navigation:** Arrow keys, Space=next, Shift+Space=prev

---

## Directory Structure

```
.
├── source/                    # YOUR CONTENT (edit these)
│   ├── presentation.md        # Main presentation (Markdown)
│   ├── images/                # Generated SVG images
│   └── image_md/              # SVG source descriptions (.md → .svg)
├── artifacts/                 # GENERATED (don't edit directly)
│   ├── presentation.html      # HTML slides (regenerate with 'make marp')
│   ├── presentation.pdf       # PDF export
│   └── images/                # Copied from source/images/
├── docs/                      # Additional documentation (optional)
├── reference/                 # External materials (optional)
├── TODO.md                    # Project task tracking (CUSTOMIZE THIS)
├── README.md                  # Project README (CUSTOMIZE THIS)
├── README_WORKFLOW.md         # This file (workflow guide - don't change)
├── CLAUDE.md                  # AI assistant rules (reference - don't change)
└── Makefile                   # Build automation (4 targets)
```

**Golden Rule:** Edit `source/`, run `make marp`, present from `artifacts/`.

**3 Files to Customize for Your Project:**
1. **README.md** - Replace with your project info
2. **TODO.md** - Update with your phases/tasks
3. **source/presentation.md** - Your slides

**Reference Files (don't change):**
- `README_WORKFLOW.md` - This workflow guide
- `CLAUDE.md` - AI assistant rules

---

## Makefile Commands

```bash
make marp        # Build presentation (default)
make clean       # Remove generated files
make rebuild     # Clean + build
make help        # Show help
```

**Build process:**
1. Copies `source/images/*` → `artifacts/images/`
2. Converts `source/presentation.md` → `artifacts/presentation.html`
3. Exports `artifacts/presentation.pdf`

---

## Creating Diagrams (SVG Generation)

### Why SVG from Text?

**Problem:** matplotlib/pyplot requires Python dependencies, generates binary PNG, hard to version control.

**Solution:** Generate SVG directly from text descriptions using AI.

**Alternative:** For complex statistical plots, use `scripts/make_chart_dwg.py` (matplotlib). See `scripts/README.md`.

**Benefits:**
- ✅ Text-based (git-friendly)
- ✅ No dependencies (no matplotlib/pyplot)
- ✅ Scales perfectly at any size
- ✅ 1-second iteration cycle

### Usage

```bash
# 1. Create description file
cat > source/image_md/architecture.md <<EOF
Three-box architecture: Client -> Server -> Database.
Blue boxes, white text, arrows between.
EOF

# 2. Generate SVG
/svg-gen source/image_md/architecture.md

# Output: source/images/architecture.svg
```

**That's it! Simple file path, no complex commands.**

### Example Descriptions

See `source/image_md/README.md` for 10+ ready-to-use templates:

**Architecture Diagram:**
```
/svg-gen "Three-box architecture. Box 1: 'Client App' (blue). Box 2: 'API Server' (green).
Box 3: 'Database' (purple). Arrows from Client to API to Database. Label arrows with 'HTTP' and 'SQL'."
```

**Flow Chart:**
```
/svg-gen "Decision flow. Start oval -> 'Check Auth' rectangle -> 'Valid?' diamond.
Yes path to 'Process' rectangle. No path to 'Error 401' rectangle. Blue for process, red for error."
```

**Bar Chart:**
```
/svg-gen "Bar chart comparing 3 solutions. X-axis: A, B, C. Y-axis: Cost ($K) 0-100.
Bar heights: A=45, B=70, C=30. Blue bars. Add data labels on top."
```

**Timeline:**
```
/svg-gen "Horizontal timeline. 4 milestones: 'Research (Week 1)', 'Design (Week 2-3)',
'Implementation (Week 4-6)', 'Testing (Week 7)'. Green=complete, blue=in progress, gray=planned."
```

### Source File Storage (Paired .md/.svg)

**Recommended:** Pair each `.svg` with a `.md` source file:

```
source/image_md/diagram.md    →  source/images/diagram.svg
source/image_md/chart.md      →  source/images/chart.svg
```

**Benefits:**
- 1:1 pairing - clear which source generates which output
- **Makefile automatically checks staleness** - warns if `.md` is newer than `.svg`
- Easy to regenerate with `/svg-gen`
- Both files committed to git

**Workflow:**
1. Create `source/image_md/architecture.md` with description
2. Run `/svg-gen source/image_md/architecture.md`
3. Generates `source/images/architecture.svg`
4. Later, edit `architecture.md`
5. `make marp` warns: "architecture.svg is out of date"
6. Regenerate: `/svg-gen source/image_md/architecture.md`

**See:** `source/image_md/README.md` for detailed guide

### Iteration Workflow

```bash
# Generate initial version
/svg-gen "Three boxes with arrows"
# Output: diagram-v1.svg

# Iterate with changes
/svg-gen "Make boxes bigger, change arrows to red"
# Overwrites: diagram-v1.svg

# Or create new version
/svg-gen "Same diagram but horizontal layout"
# Output: diagram-v2.svg
```

---

## TODO.md Workflow

**Status tracking:** `TODO.md` is the single source of truth for project progress.

**Phase structure:**
```markdown
## <span style="color:red">v1.0.0: Phase Name (planned)</span>
- [ ] Task 1
- [ ] Task 2

## <span style="color:blue">v1.1.0: Phase Name (in progress)</span>
- [x] Task 1
- [ ] Task 2

## <span style="color:green">v1.2.0: Phase Name (complete)</span>
- [x] Task 1
- [x] Task 2
```

**Status colors:**
- 🔴 Red = Planned (not started)
- 🔵 Blue = In Progress (current phase)
- 🟢 Green = Complete (all tasks done)

**Rules:**
- Only ONE phase "in progress" at a time
- Mark tasks `[x]` as you complete them
- Never delete completed phases (keep history)

---

## AI-Assisted Workflow (Claude Code)

This framework is optimized for AI collaboration. See `CLAUDE.md` for detailed rules.

### "Not-Trust, Always Verify" Loop

```
Human defines structure → AI generates content → Human validates → Iterate
```

**What AI does well:**
- Draft slide content
- Format tables and lists
- Generate speaker notes
- Quick iterations (1-second rebuild!)

**What to verify:**
- Domain-specific accuracy
- Math calculations
- Technical claims
- Design decisions

**Before every AI session:**
1. AI reads `TODO.md` (what phase are we in?)
2. AI executes tasks from current phase
3. AI updates `TODO.md` as tasks complete
4. AI verifies build (`make marp`)

---

## Customizing Presentation

### Edit Slides

```bash
vim source/presentation.md
```

**Key sections to customize:**
- Title slide: Your name, project, date
- Agenda: Your topics
- Content slides: Replace placeholders with your content
- Speaker notes: Add your talking points

### Customize CSS Theme

Edit YAML frontmatter in `source/presentation.md`:

```yaml
style: |
  section {
    font-size: 24px;         # Adjust font size
    background: #ffffff;     # Background color
  }
  h1 {
    color: #2c3e50;          # Heading color
    border-bottom: 3px solid #3498db;
  }
```

### Add Images

**Generate diagrams:** See "Creating Diagrams (SVG Generation)" section above for `/svg-gen` workflow.

**Add existing images:**
1. Put images in `source/images/`
2. Reference in slides: `![](images/your-image.png)`
3. Makefile automatically copies to `artifacts/images/` during build

---

## Git Workflow

**When to commit:**
- ✅ After completing a logical unit of work
- ✅ When phase is complete (all tasks `[x]` in TODO.md)
- ✅ Before major changes (so you can revert if needed)

**Commit message format:**
```
type(scope): Brief description

Details if needed

Related to TODO.md phase vX.X.X
```

**Example:**
```bash
git add source/presentation.md TODO.md
git commit -m "feat(v1.2.0): Add trade-off analysis slides"
git push
```

---

## Presentation Tips

### Before Presenting - Verification Checklist

**Build & Content:**
- [ ] `make marp` succeeds without errors
- [ ] All images load in HTML (`artifacts/presentation.html`)
- [ ] No template placeholders remain (`[Project Name]`, `[TODO]`)
- [ ] Speaker notes present on all slides (View Source to check)
- [ ] PDF exports correctly (`artifacts/presentation.pdf`)

**Timing & Practice:**
- [ ] Practice run #1 completed (record timing)
- [ ] Practice run #2 completed (check flow)
- [ ] Practice run #3 completed (final polish)
- [ ] Total timing within target ±10%
- [ ] Each slide takes 30-60 seconds

**Technical:**
- [ ] Navigation works (Arrow keys, Space, F11)
- [ ] Backup slides prepared for Q&A
- [ ] HTML tested in target browser

### During Presentation

- **F11** = Fullscreen
- **Arrow keys / Space** = Navigate slides
- **Esc** = Exit fullscreen
- **Jump to backup slides** = Use arrow keys

### Speaker Notes

View source of `artifacts/presentation.html` to see speaker notes:
```html
<!-- Speaker notes: What to say during this slide -->
```

**Best practices:**
- Write what to SAY, not what's on the slide
- Use takeaway boxes: `> **TAKEAWAY:**` for key messages
- Target 30-60 seconds per slide
- Practice out loud 3+ times

---

## Troubleshooting

### Build fails
```bash
make clean
make marp
# Read error message carefully
```

### Images not showing
- Check images exist in `source/images/`
- Use relative paths: `![](images/file.png)`
- Verify Makefile copied them: `ls artifacts/images/`

### Slides overflow with text
- Reduce font size in CSS
- Split into 2 slides
- Use shorter bullet points

---

## Common Mistakes to Avoid

❌ **Don't leave template placeholders** (`[Project Name]`, `[TODO]`, `[EXAMPLE]`)
❌ **Don't skip verification** (always check AI-generated content)
❌ **Don't ignore speaker notes** (they're your script!)
❌ **Don't use binary formats** (PPTX) for version control
❌ **Don't skip practice runs** (timing matters!)

✅ **Do start simple** - Add complexity as needed
✅ **Do practice out loud** - Time yourself, refine wording
✅ **Do commit frequently** - After each major section
✅ **Do use git branches** for major changes
✅ **Do document assumptions** and verification steps

---

## Pro Tips

### AI-Assisted Workflow
1. Keep source files text-based (Markdown, YAML, CSV)
2. Verify AI outputs - always check math, assumptions
3. Document AI usage - be transparent in presentation
4. Use "Not-Trust, Always Verify" discipline

### Version Control
1. Commit frequently - after each slide section
2. Semantic versioning - v1.0.0 = initial, v1.1.0 = minor, v2.0.0 = major
3. Meaningful messages - "Add trade-off analysis slide" not "Update"
4. Use branches for experiments

### Before Sharing
- [ ] Git pushed: `git push origin main`
- [ ] README.md reflects your project (not template)
- [ ] No sensitive data (credentials, API keys)
- [ ] License clear (update if needed)
- [ ] Contact info updated (your name/email)

---

## References

**Tools:**
- Marp: https://marp.app/
- Template: https://github.com/unbedded/marp-presentation-framework
- Claude Code: https://claude.ai/claude-code

**Framework Documentation:**
- `CLAUDE.md` - AI assistant workflow rules
- `TODO.md` - Project task tracking template

---

**Last Updated:** 2025-10-22
