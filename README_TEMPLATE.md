# [Project Name]

**Current Version:** v0.1.0

## Project Overview

[Brief description of your presentation project - what are you presenting and to whom?]

**Objective:** [What is the goal of this presentation?]

**Key Constraints:**
- [Constraint 1]
- [Constraint 2]
- [Constraint 3]

---

## Directory Structure

```
.
├── .claude/                   # Claude Code slash commands
├── docs/                      # Your markdown documentation
├── source/                    # Single source of truth (YAML, Markdown)
│   ├── requirements.yaml      # Machine-readable requirements
│   ├── presentation-marp.md   # Master presentation
│   └── images/                # Images for slides
├── artifacts/                 # Generated outputs (gitignored)
│   ├── presentation-marp.html # Marp HTML output
│   └── presentation-marp.pdf  # Marp PDF export
├── reference/                 # External materials (datasheets, standards)
├── scripts/                   # Automation scripts
└── Makefile                   # Build system
```

---

## Building Presentation

```bash
# Edit slides
vim source/presentation-marp.md

# Generate HTML + PDF
make marp

# Present
firefox artifacts/presentation-marp.html  # Press F11 for fullscreen
```

**Navigation:** Arrow keys, Space=next, Shift+Space=prev

---

## Key Files

**Single Source of Truth:**
- `source/requirements.yaml` - Requirements database
- `source/presentation-marp.md` - Presentation slides (Markdown)

**Generated Artifacts:**
- `artifacts/requirements.md` - Generated from YAML via `/req-yaml-to-md`
- `artifacts/presentation-marp.html` - Interactive HTML presentation
- `artifacts/presentation-marp.pdf` - PDF for distribution

**Documentation:**
- `docs/` - Your analysis documents (Markdown)

---

## Workflow

### Daily Workflow
1. **Start:** Review current tasks in TODO.md
2. **Work:** Focus on current phase
3. **Build:** Run `make marp` to regenerate slides
4. **Review:** Present to yourself, time sections

### AI-Assisted Workflow
1. **Human defines** requirements, architectures, constraints
2. **AI generates** artifacts (BOMs, charts, speaker notes)
3. **Human validates** math, assumptions, calculations
4. **AI refines** based on feedback
5. **Iterate** until verified

**Philosophy:** "Not-Trust, Always Verify"

---

## Project Phases

**Phase 1: Requirements & Analysis**
- [ ] Define requirements in `source/requirements.yaml`
- [ ] Research domain, standards, constraints
- [ ] Document findings in `docs/`

**Phase 2: Solution Development**
- [ ] Develop solution alternatives
- [ ] Create trade-off analysis
- [ ] Document architectures

**Phase 3: Presentation Development**
- [ ] Create slides in `source/presentation-marp.md`
- [ ] Add speaker notes
- [ ] Design visuals, charts

**Phase 4: Practice & Delivery**
- [ ] Practice runs (3+ times)
- [ ] Time presentation
- [ ] Generate final PDF
- [ ] Deliver presentation

---

## Building PDFs

### Presentation (Marp)
```bash
make marp           # Generate HTML + PDF
```

### Documentation (Pandoc)
```bash
make all            # Convert all .md → .pdf
make clean          # Remove generated PDFs
```

---

## Dependencies

**Required:**
```bash
npm install -g @marp-team/marp-cli
```

**Optional (for doc PDFs):**
```bash
# macOS
brew install pandoc

# Ubuntu/Debian
sudo apt-get install pandoc texlive-xetex
```

---

## Customization

**Update these files for your project:**
1. [ ] This README.md (project name, description, dates)
2. [ ] `source/requirements.yaml` (your requirements)
3. [ ] `source/presentation-marp.md` (your slides)
4. [ ] CSS theme in presentation frontmatter
5. [ ] Remove example docs from `docs/`

---

## Project Statistics

**Time Budget:** [X hours over Y days]

**Key Deliverables:**
- [ ] Requirements analysis ([X] requirements)
- [ ] Solution architectures ([X] alternatives)
- [ ] Presentation ([X] slides, [Y] min)
- [ ] Documentation ([X] pages)

---

## Timeline

**[Event Name]:** [Date]

**Milestones:**
- [ ] Week 1: Requirements complete
- [ ] Week 2: Architectures complete
- [ ] Week 3: Presentation draft complete
- [ ] Week 4: Practice & delivery

---

## References

**Framework:** https://github.com/unbedded/marp-presentation-framework

**Tools:**
- Marp: https://marp.app/
- Claude Code: https://claude.ai/claude-code
- Pandoc: https://pandoc.org/

---

**Project Status:** [In Progress / Complete]
**Last Updated:** [Date]
