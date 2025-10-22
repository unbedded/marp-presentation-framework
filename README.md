# Marp Presentation Framework

**AI-optimized presentation framework for technical content.** Text-driven workflow (YAML → Markdown → HTML/PDF) enables rapid iteration with 1-second rebuilds. Includes automation tools, requirements traceability, and verification workflows.

---

## Why This Framework?

**Problem:** PowerPoint is binary, version-control hostile, and difficult to collaborate on with AI.

**Solution:** 100% text-based presentation system (Markdown + YAML) optimized for AI-assisted workflows.

**Key Benefits:**
- ✅ **1-second rebuild cycle** - Edit Markdown, run `make marp`, see results instantly
- ✅ **Version control friendly** - Diff slides like code, collaborate via git
- ✅ **AI-optimized** - Text-based = Claude Code can read/write everything
- ✅ **YAML-driven content** - Single source of truth for requirements, architectures, BOMs
- ✅ **Automated workflows** - Slash commands for requirements tracing, BOM generation, rubric evaluation
- ✅ **No lock-in** - Export to HTML, PDF, or PPTX (if needed)

---

## Quick Start

### 1. Use This Template

**Option A: GitHub Template (Recommended)**
```bash
# On GitHub: Click "Use this template" button
# Clone your new repo
git clone git@github.com:YOUR-USERNAME/YOUR-PROJECT.git
cd YOUR-PROJECT
```

**Option B: Manual Clone**
```bash
git clone git@github.com:unbedded/marp-presentation-framework.git YOUR-PROJECT
cd YOUR-PROJECT
rm -rf .git
git init
git add .
git commit -m "Initial commit from marp-presentation-framework template"
```

### 2. Install Dependencies

```bash
# Marp CLI (required)
npm install -g @marp-team/marp-cli

# Pandoc (optional, for PDF generation from Markdown docs)
# macOS:
brew install pandoc

# Ubuntu/Debian:
sudo apt-get install pandoc texlive-xetex
```

### 3. Customize Your Project

```bash
# Copy template README to your project README
cp README_TEMPLATE.md README.md

# Edit your presentation
vim source/presentation-marp.md

# Generate slides
make marp

# View in browser
firefox artifacts/presentation-marp.html  # or chrome, safari
```

### 4. Customize YAML Databases (Optional)

If using requirements tracking and architecture automation:

```bash
# Edit YAML databases
vim source/requirements.yaml      # Your requirements
vim source/architectures.yaml     # Your solution architectures
vim source/parts.csv              # Bill of materials

# Generate artifacts
/req-yaml-to-md                   # Requirements → Markdown
/arch-gen                         # Architectures → BOMs + charts
```

---

## Example Project

**See `EXAMPLE-README.md`** for a complete case study: LAM Research EE interview preparation (7-hour technical presentation, 80% offer success rate, 3 architectures, 17 requirements, 40+ slides).

This example demonstrates:
- YAML-driven requirements database (9 ground truth + 6 assumptions + 2 standards)
- 3 complete architectures with real BOMs
- Power analysis, EMI calculations, timeline planning
- AI-assisted workflow with human verification
- "Not-Trust, Always Verify" discipline catching critical errors

**Time saved:** 1.5-2× faster than traditional approach (39.5h vs 60-80h estimated)

---

## Directory Structure

```
.
├── .claude/                   # Claude Code slash commands
│   └── commands/
│       ├── req-yaml-to-md.md  # Generate requirements.md from YAML
│       ├── req-audit.md       # Requirements SMART compliance checker
│       ├── req-trace.md       # Requirements traceability matrix
│       └── arch-gen.md        # Generate architecture docs + BOMs
├── docs/                      # Your markdown documentation
│   ├── requirements-policy.md # How to write requirements (SMART criteria)
│   └── ...                    # Other analysis docs
├── source/                    # Single source of truth (YAML, master docs)
│   ├── requirements.yaml      # Machine-readable requirements (SSOT)
│   ├── architectures.yaml     # Solution architectures
│   ├── parts.csv              # Bill of materials (Digikey PNs, costs)
│   ├── presentation-marp.md   # Master presentation (Markdown)
│   └── images/                # Images for slides
├── artifacts/                 # Generated outputs (gitignored except important ones)
│   ├── requirements.md        # Auto-generated from YAML
│   ├── presentation-marp.html # Marp HTML output
│   ├── presentation-marp.pdf  # Marp PDF export
│   ├── bom/                   # Generated BOMs (versioned)
│   └── rubric-reports/        # AI evaluation reports (versioned)
├── reference/                 # Immutable external materials
│   ├── datasheets/            # Component datasheets
│   └── standards/             # ADA, FCC, ISO standards
├── scripts/                   # Automation scripts
│   ├── generate_arch_artifacts.py  # YAML → BOMs + docs
│   └── plot_tradeoff_charts.py     # Generate comparison charts
├── style/                     # LaTeX styling for PDF generation
│   └── table-style.tex
├── .gitignore                 # Git ignore patterns
├── Makefile                   # Build system (make marp, make all)
├── README.md                  # This file (template usage guide)
├── README_TEMPLATE.md         # Starter README for your project
└── EXAMPLE-README.md          # Complete working example (LAM interview)
```

**Directory Organization Rules:**
1. **`docs/`** = Markdown files YOU write (analysis, documentation)
2. **`reference/`** = Downloaded/external materials (IMMUTABLE)
3. **`source/`** = Single source of truth (YAML, master Markdown)
4. **`artifacts/`** = Generated outputs (regenerate with `make` commands)

---

## Core Workflows

### Presentation Workflow (Marp)

**Fast iteration loop:**
```bash
# Edit Markdown source
vim source/presentation-marp.md

# Regenerate (1 second!)
make marp

# Present
firefox artifacts/presentation-marp.html  # Press F11 for fullscreen
```

**Presentation structure:**
- Markdown source with YAML frontmatter (theme, size, pagination)
- CSS styling in frontmatter (customize colors, fonts, tables)
- Speaker notes in HTML comments `<!-- Speaker notes here -->`
- Takeaway boxes using blockquote syntax `> **TAKEAWAY:** Key message`

**Navigation:**
- Arrow keys, Space = next slide, Shift+Space = previous
- Browser print → Save as PDF for distribution

### Requirements Workflow (YAML → Markdown)

**1. Define requirements in YAML:**
```yaml
# source/requirements.yaml
requirements:
  - id: PRD-FUNC-001
    title: "Single Line Braille Display"
    source: "PDF p.9"
    priority: "P0-Critical"
    acceptance_criteria:
      - "32 braille cells"
      - "6 dots per cell"
    verification: "Visual inspection + functional test"
```

**2. Generate documentation:**
```bash
/req-yaml-to-md          # Generate artifacts/requirements.md
/req-audit               # Validate SMART compliance
/req-trace               # Generate traceability matrix
```

### Architecture Workflow (YAML → BOMs + Charts)

**1. Define architectures and parts:**
```yaml
# source/architectures.yaml
architectures:
  - id: ARCH_A
    name: "Economy Wired"
    subsystems: [SS-CONTROL, SS-ACTUATOR, SS-COMM-USB]

# source/parts.csv
Part_Number,Description,Unit_Price_1000,Leadtime_Weeks
STM32F407VGT6,MCU 168MHz,12.50,4
```

**2. Generate artifacts:**
```bash
/arch-gen                # Generate BOMs + comparison charts
```

**Output:**
- `artifacts/bom/arch-a-bom.csv` - Bill of materials
- `artifacts/architecture-comparison-matrix.md` - Trade-off analysis
- `source/images/architecture-cost-comparison.png` - Cost charts

---

## AI-Assisted Workflow

This framework is optimized for collaboration with Claude Code (or other AI assistants).

### The "Not-Trust, Always Verify" Loop

```
┌─────────────────┐
│ Human defines   │
│ requirements    │ → source/requirements.yaml (SSOT)
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ AI generates    │
│ artifacts       │ → /req-yaml-to-md → artifacts/requirements.md
└────────┬────────┘   /arch-gen → BOMs, charts
         │
         ▼
┌─────────────────┐
│ Human validates │
│ & corrects      │ → Check math, verify assumptions
└────────┬────────┘   Cross-reference sources
         │
         ▼
┌─────────────────┐
│ AI refines      │
│ based on        │ → Update calculations
│ feedback        │   Fix errors
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Iterate until   │
│ verified        │ → Whiteboard check, sanity test
└─────────────────┘
```

### What AI Does Well

✅ **BOM Generation:** Map architectures × subsystems × parts = BOMs in minutes
✅ **Chart Plotting:** Spider charts, cost bars, timeline comparisons
✅ **Speaker Notes:** Technical derivations, step-by-step math
✅ **Iteration Speed:** 1-second slide rebuild enables rapid refinement
✅ **Requirements Matrix:** Generate traceability reports

### What AI Struggles With

❌ **Domain Knowledge:** May make unrealistic assumptions (verify with first principles)
❌ **Math Verification:** Always work calculations independently
❌ **Design Judgment:** Can't "pick a winner" - needs human prioritization
❌ **Cost Sourcing:** May hallucinate part numbers (cross-check Digikey/Mouser)

### Best Practices

1. **Human Defines Strategy, AI Executes Tactics**
   - You pick architectures, AI generates BOMs
   - You validate physics, AI formats slides

2. **Never Trust, Always Verify**
   - AI math errors are common (check calculations)
   - Cross-check against datasheets, standards
   - Work independently before accepting results

3. **Iterate Quickly, Validate Slowly**
   - Use AI for fast iteration (`make marp` = 1 second)
   - Spend time on validation (whiteboard math, dry runs)

4. **Document AI Usage Transparently**
   - Disclose in presentations: "I used Claude Code + 500 lines of Python"
   - Explain workflow: "AI drafted, I validated"
   - Show verification: "Here's where I caught errors"

---

## Building PDFs

### Presentation PDFs (Marp)

```bash
# Generate HTML + PDF
make marp

# Output:
# artifacts/presentation-marp.html (interactive)
# artifacts/presentation-marp.pdf (distribution)
```

### Documentation PDFs (Pandoc)

```bash
# Convert all Markdown docs to PDF
make all

# Convert specific doc
make artifacts/requirements.pdf

# Clean generated PDFs
make clean
```

---

## Customization Guide

See **`CUSTOMIZE.md`** for detailed checklist of what to change when starting a new project.

**Quick checklist:**
1. [ ] Copy `README_TEMPLATE.md` → `README.md`
2. [ ] Update project name, description, dates
3. [ ] Edit `source/requirements.yaml` with your requirements
4. [ ] Edit `source/presentation-marp.md` with your slides
5. [ ] Customize CSS theme in presentation frontmatter
6. [ ] Update `.gitignore` if needed (add project-specific ignores)
7. [ ] Remove example files from `docs/` directory
8. [ ] Update `Makefile` targets if needed

---

## Troubleshooting

### Marp CLI not found
```bash
npm install -g @marp-team/marp-cli
```

### PDF generation fails
```bash
# Install Pandoc + LaTeX
brew install pandoc          # macOS
sudo apt install pandoc texlive-xetex  # Linux
```

### Images not showing in HTML
- Images must be in same directory as `.md` file OR use absolute paths
- Marp copies images to `artifacts/images/` automatically
- Use relative paths: `![](images/chart.png)`

### Slides overflow with text
- Reduce font size in CSS: `font-size: 20px` → `font-size: 18px`
- Split slide into 2 slides
- Use `<style scoped>` for per-slide font adjustments

---

## Contributing

This is a template repository. If you've improved the framework:

1. Fork this repo
2. Make your improvements
3. Submit PR with description of what you added
4. Good additions: new slash commands, better CSS themes, automation scripts

---

## License

MIT License - Use freely for your presentations.

---

## Credits

**Developed by:** Spencer Barrett
**Based on:** LAM Research EE interview preparation project (Oct 2025)
**Tools:** Marp, Claude Code (Anthropic), Python, Pandoc
**Outcome:** 7-hour technical interview, 80% offer probability, 1.5-2× productivity gain vs traditional approach

**Philosophy:** "Not-Trust, Always Verify" - AI is a force multiplier, not a replacement for engineering judgment.

---

## Next Steps

1. **Read `EXAMPLE-README.md`** - See complete working example
2. **Copy `README_TEMPLATE.md`** - Start your project README
3. **Edit `source/presentation-marp.md`** - Create your slides
4. **Run `make marp`** - Generate and present!

**Questions?** See detailed workflow documentation in `EXAMPLE-README.md` or open an issue.
