# CLAUDE.md — Project Memory & AI Assistant Workflow

## Role & Expectations

**Primary Role:** AI assistant helping with text-based technical presentation development using Marp framework.

**Key Capabilities:**
- Draft slide content and speaker notes
- Generate tables, charts, and formatting
- Rapid iteration with 1-second rebuild cycle
- Text-based workflow optimization

**Limitations:**
- **Cannot replace domain expertise** - Always verify technical content
- **Math errors are common** - Human must validate calculations
- **No design judgment** - Cannot "pick a winner" without user guidance

---

## Core Documentation

**ALWAYS reference these files BEFORE starting work:**

1. **TODO.md** - Single source of truth for project status
   - Read FIRST before any action
   - Update as tasks complete
   - Never delete completed phases

2. **README_WORKFLOW.md** - How this framework works
   - Directory structure
   - Build commands (`make marp`, `make clean`)
   - Workflow patterns

3. **Makefile** - Build automation and capability discovery
   - `make marp` - Generate HTML + PDF presentation (PRIMARY)
   - `make clean` - Remove generated artifacts
   - `make help` - **IMPORTANT:** Shows ALL commands including image generation
   - Makefile is self-documenting - read it to discover framework capabilities!

---

## TODO.md WORKFLOW RULES

### RULE 1: Task-Driven Development

```
BEFORE any action → Read TODO.md
Action in TODO? → Execute
Action NOT in TODO? → ASK USER
Always ask for clarification if unclear
```

**Never assume.** If user requests something not in TODO.md, ask first.

### RULE 2: Task Checkbox Syntax

```
[ ] = incomplete
[x] = complete
NO emojis in task checkboxes
```

**Emojis ARE allowed (and encouraged!) in:**
- Phase titles: 🔴 🔵 🟢 for status
- Section headers for visual clarity
- Comments and notes

**Emojis NOT allowed in:**
- Task checkboxes (keep them simple: `[ ]` or `[x]`)
- Replacing checkbox syntax (never use ✅ instead of `[x]`)

### RULE 3: Completed Tasks Are Immutable

**Pattern for completed phases:**
```markdown
## <span style="color:green">v1.0.0: Phase Name (complete)</span>
- [x] Task 1
- [x] Task 2
```

**Rules:**
- Use Edit tool for surgical changes only
- NO total rewrites of TODO.md
- NO deletions of completed phases
- Add new sections at bottom
- If major restructuring needed → ASK USER

### RULE 4: Phase Title Format

**Major Phases (## headings):**
```markdown
## <span style="color:(green|blue|red)">v1.0.0: Phase Name (status)</span>
```

**Minor Phases (### headings):**
```markdown
### <span style="color:(green|blue|red)">v1.1.0: Subphase Name (status)</span>
```

**Status Colors:**
- 🔴 `red` = Planned (not started)
- 🔵 `blue` = In Progress (current phase - ONLY ONE at a time)
- 🟢 `green` = Complete (all tasks [x])

### RULE 5: Phase Gate Validation

**BEFORE starting new phase:**
```
1. Check current phase in TODO.md
2. Verify all tasks are [x]
3. If incomplete tasks found:
   → STOP + COMPLAIN + LIST + ASK USER
```

**Output format when blocked:**
```
❌ Phase v1.0.0 incomplete - cannot start v1.1.0
Unchecked tasks:
  [ ] Create backup slides
  [ ] Practice dry run #3
Action? (mark complete / defer / proceed anyway)
```

---

## FILE ORGANIZATION

**Source Files (EDIT THESE):**
- `source/presentation.md` - Main presentation (Markdown)
- `source/images/` - Images for slides
- `docs/` - Additional documentation
- `TODO.md` - Project status (single source of truth)

**Generated Files (DO NOT EDIT DIRECTLY):**
- `artifacts/presentation.html` - HTML slides (regenerate with `make marp`)
- `artifacts/presentation.pdf` - PDF export (regenerate with `make marp`)
- `artifacts/*.pdf` - Documentation PDFs (regenerate with `make all`)

**Reference Files:**
- `README.md` - Framework overview (for users)
- `README_WORKFLOW.md` - Detailed workflow guide
- `EXAMPLE-README.md` - Working example (LAM interview case study)
- `CUSTOMIZE.md` - Customization checklist
- `CLAUDE.md` - This file (AI assistant rules)

---

## GIT WORKFLOW

### When to Commit

**DO commit when:**
- ✅ User explicitly says "commit" or "git commit"
- ✅ User completes a logical unit of work and asks to save
- ✅ Phase is complete and user says to commit

**DO NOT commit when:**
- ❌ User is still iterating on slides
- ❌ User hasn't asked to commit
- ❌ Build is broken (`make marp` fails)
- ❌ TODO.md shows incomplete tasks in current phase

**GOLDEN RULE:** When in doubt, ASK before committing.

### Commit Message Format

```
type(scope): Brief description (≤72 chars)

Detailed explanation if needed (wrap at 80 chars)

Related to TODO.md phase vX.X.X

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Types:**
- `feat` - New feature (new slide section, new content)
- `fix` - Bug fix (typo, broken link, formatting issue)
- `docs` - Documentation only
- `refactor` - Restructure without changing content
- `style` - CSS/formatting changes
- `chore` - Maintenance (update TODO.md, regenerate artifacts)

**Examples:**
```bash
# Good commit messages
git commit -m "feat(v1.2.0): Add trade-off analysis slides with comparison table"
git commit -m "fix(slides): Correct power calculation in actuator comparison"
git commit -m "docs(TODO): Mark phase v1.1.0 complete, start v1.2.0"

# Bad commit messages
git commit -m "update"
git commit -m "fixed stuff"
git commit -m "wip"
```

### Before Committing - Checklist

```bash
# 1. Verify build works
make marp

# 2. Check TODO.md is up to date
cat TODO.md  # Verify current phase status

# 3. Review changes
git status
git diff

# 4. Stage files
git add source/presentation-marp.md TODO.md

# 5. Commit with good message
git commit -m "type(scope): Description"

# 6. Push (if ready)
git push origin main
```

---

## PRESENTATION SLIDE RULES

### TAKEAWAY Format (CRITICAL)

**RULE:** Every slide TAKEAWAY must be a single punchy sentence **≤80 characters**.

**Format:**
```markdown
> **TAKEAWAY:** <single sentence under 80 chars>
```

**Why 80 chars?**
- TAKEAWAYs appear in highlighted box at bottom of slide
- Long TAKEAWAYs overflow and get cut off
- Short = punchy, memorable, impactful
- Forces ONE key message per slide

**Examples:**

✅ **GOOD** (69 chars):
```markdown
> **TAKEAWAY:** SOL_ECO wins on cost: $536 BOM via 40% actuator savings.
```

❌ **BAD** (149 chars - WAY TOO LONG):
```markdown
> **TAKEAWAY:** No COTS actuators exist (bistable, <7mm dia) - ALL architectures violate 2mo timeline. Portfolio shows cost trade-offs when timeline is impossible.
```

✅ **FIXED** (68 chars):
```markdown
> **TAKEAWAY:** NO COTS actuators - ALL architectures violate 2mo timeline.
```

**Enforcement:** Before committing, verify all TAKEAWAYs are ≤80 chars.

### Speaker Notes Format

**RULE:** Every slide SHOULD include speaker notes to guide delivery.

**Format:**
```markdown
---

# Slide Title

[slide content here]

> **TAKEAWAY:** [key message]

<!-- Speaker notes: [What to say, emphasize, or reference during this slide] -->
```

### Emojis and Icons (AVOID IN SLIDES)

**RULE:** Do NOT use emojis or Unicode icons in `source/presentation.md` slide content.

**Why:** Emojis render inconsistently in Marp HTML/PDF output:
- May appear as boxes or missing glyphs
- Font support varies across browsers/systems
- PDF export often breaks emoji rendering

**Where emojis are OK:**
- ✅ `TODO.md` phase titles (Markdown only, not rendered by Marp)
- ✅ `README.md` and other documentation
- ✅ Git commit messages

**Where emojis are NOT OK:**
- ❌ `source/presentation.md` slide content
- ❌ Slide titles or bullet points
- ❌ TAKEAWAY messages

**Instead of emojis, use:**
- Text symbols: `✓` → `[✓]` or `DONE`
- Color-coded text: Use CSS styling
- SVG icons: Create `source/images/icon.svg` and embed as image

**What to include:**
- Key talking points (what to emphasize verbally)
- Timing guidance (e.g., "30 seconds", "1 minute deep-dive")
- References to backup slides or docs
- Strategic framing (how to position this content)
- Transitions to next slide

**Example:**
```markdown
<!-- Speaker notes: Walk through each architecture (30 seconds each). Emphasize this is honest engineering - all 3 are over budget, but we have cost-down strategies. Reference backup slide 5 if asked about detailed BOM breakdown. Transition: "Let's dive into the trade-offs..." -->
```

### Section Break Slides

Use section breaks to visually separate major topics:

```markdown
---

<!-- _class: section-break -->

# Part 2: Main Topic Area

![bg right:40% 80%](https://via.placeholder.com/400x300/2980b9/ffffff?text=Section+2)

<!-- Speaker notes: Brief pause (10 seconds). Transition from previous section. -->
```

---

## MAKEFILE WORKFLOW

### Primary Commands

```bash
# Generate presentation (HTML + PDF)
make marp
# Output: artifacts/presentation.html, artifacts/presentation.pdf

# Clean generated files
make clean
# Removes: artifacts/presentation.html, artifacts/presentation.pdf, artifacts/images/

# Rebuild (clean + build)
make rebuild

# Show all commands (ALWAYS CHECK THIS to discover capabilities!)
make help
# Displays: build targets, image generation commands, requirements
```

### Image Generation Commands (from `make help`)

The Makefile documents image generation in `make help`:

```bash
# SVG from text (recommended)
/svg-gen source/image_md/FILE.md

# matplotlib charts (alternative)
python3 scripts/make_chart_dwg.py source/image_md/data.csv output-name
```

**See documentation:**
- `source/image_md/README.md` - SVG generation guide
- `scripts/README.md` - matplotlib script usage

### Build Verification

**ALWAYS run `make marp` after editing slides:**
```bash
# Edit slides
vim source/presentation.md

# Rebuild (takes 1 second!)
make marp

# View in browser
firefox artifacts/presentation.html
```

**If build fails:**
1. Read error message carefully
2. Check for Markdown syntax errors
3. Verify images exist in `source/images/`
4. Check YAML frontmatter is valid
5. Ask user for help if stuck

---

## AI WORKFLOW PRINCIPLES

### "Not-Trust, Always Verify"

```
┌─────────────────┐
│ Human defines   │
│ structure       │ → Outline slides, set objectives
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ AI generates    │
│ content         │ → Draft slides, tables, speaker notes
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Human validates │
│ & corrects      │ → Check facts, verify math, test timing
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ AI refines      │
│ based on        │ → Fix errors, improve wording
│ feedback        │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Iterate until   │
│ verified        │ → make marp → Present → Refine
└─────────────────┘
```

### What AI Does Well

✅ **Drafting slide content** - Fast iteration from outline
✅ **Formatting tables** - Complex Markdown tables, alignment
✅ **Generating speaker notes** - Structure talking points
✅ **Creating examples** - Code blocks, sample data
✅ **Rapid iteration** - 1-second rebuild enables fast refinement

### What AI Struggles With

❌ **Domain expertise** - Verify technical claims independently
❌ **Math accuracy** - ALWAYS check calculations yourself
❌ **Design judgment** - Cannot pick "best" option without context
❌ **Cost sourcing** - May hallucinate part numbers, prices
❌ **Strategic framing** - Needs human guidance on positioning

### Best Practices

1. **Human defines strategy, AI executes tactics**
   - You: "Create slide comparing 3 architectures by cost, timeline, risk"
   - AI: Generates table, formats, adds speaker notes
   - You: Verify data, adjust messaging

2. **Iterate fast, validate thoroughly**
   - Use AI for rapid drafting (`make marp` = 1 second)
   - Spend time on validation (dry runs, fact-checking)
   - Don't skip human review to save time

3. **Document AI usage transparently**
   - In presentations: "I used Claude Code for slide generation"
   - In commits: "Co-Authored-By: Claude <noreply@anthropic.com>"
   - In README: Show "AI-Assisted Workflow" section

4. **Ask clarifying questions**
   - If task is ambiguous → ASK USER
   - If technical claim is uncertain → FLAG FOR REVIEW
   - If TODO.md doesn't cover it → ASK BEFORE PROCEEDING

---

## COMMON WORKFLOWS

### Daily Workflow

```bash
# 1. Start session - Check status
cat TODO.md  # What phase am I in?

# 2. Edit slides
vim source/presentation.md

# 3. Rebuild and view
make marp
firefox artifacts/presentation.html

# 4. Update TODO.md as tasks complete
vim TODO.md  # Mark [x] for completed tasks

# 5. Commit when user asks
git add source/presentation.md TODO.md
git commit -m "feat(v1.2.0): Add X slides"
git push
```

### Phase Completion Workflow

**When phase is complete (all tasks [x], title green):**

1. **Verify completion:**
   ```bash
   cat TODO.md  # Check all tasks [x] in current phase
   make marp    # Verify build works
   ```

2. **Update TODO.md:**
   ```markdown
   ## <span style="color:green">v1.2.0: Phase Name (complete)</span>
   ```

3. **Ask user if ready to commit:**
   ```
   Phase v1.2.0 complete. Ready to commit?
   ```

4. **Commit (if user approves):**
   ```bash
   git add TODO.md source/presentation.md
   git commit -m "feat(v1.2.0): Complete phase - [brief description]"
   git push
   ```

5. **Preview next phase:**
   ```
   Next phase: v1.3.0 - [Phase Name]
   Tasks:
   - [ ] Task 1
   - [ ] Task 2
   ```

### Handling Errors

**Build fails:**
```bash
# 1. Read error output carefully
make marp

# 2. Check common issues
# - Markdown syntax errors
# - Missing images
# - Invalid YAML frontmatter

# 3. Fix and retry
vim source/presentation.md
make marp

# 4. If stuck, ask user for help
```

**Git conflicts:**
```bash
# 1. Show status to user
git status

# 2. Ask user how to proceed
# (Don't automatically resolve conflicts)
```

---

## DECISION FRAMEWORK

### When User Asks for Help

1. **Check TODO.md** - Is this task in current phase?
2. **Check README_WORKFLOW.md** - How does this workflow work?
3. **Check Makefile** - What build commands are available?
4. **Execute task** - Follow best practices above
5. **Verify** - Run `make marp`, check output
6. **Update TODO.md** - Mark task [x] if complete

### When Unclear

**Provide options with trade-offs:**
```
Option A: [Description]
  Pros: [...]
  Cons: [...]

Option B: [Description]
  Pros: [...]
  Cons: [...]

Which approach do you prefer?
```

**Don't guess. ASK.**

---

## EXAMPLES FROM SUCCESSFUL PROJECT

**See EXAMPLE-README.md** for complete working example:
- LAM Research EE interview (7-hour technical deep-dive)
- 40+ slides with speaker notes
- 80% offer probability
- 39.5h total time (1.5-2× faster than traditional approach)

**Key lessons:**
- "Not-Trust, Always Verify" caught critical errors
- TODO.md phase management kept project on track
- 1-second rebuild cycle enabled rapid iteration
- Speaker notes captured strategic framing decisions
- Git workflow maintained clean history

---

## COMMON MISTAKES TO AVOID

❌ **Don't commit without being asked**
❌ **Don't skip TODO.md updates**
❌ **Don't assume domain knowledge is correct**
❌ **Don't edit generated files in artifacts/** (regenerate instead)
❌ **Don't delete completed phases from TODO.md**
❌ **Don't use emojis in task checkboxes** (only in phase titles)
❌ **Don't use emojis in source/presentation.md slides** (render poorly in Marp)
❌ **Don't create TAKEAWAY messages >80 characters**
❌ **Don't skip `make marp` verification after changes**

✅ **Do read TODO.md before every action**
✅ **Do ask when unclear**
✅ **Do verify builds with `make marp`**
✅ **Do update TODO.md as tasks complete**
✅ **Do reference README_WORKFLOW.md for guidance**
✅ **Do keep speaker notes concise and actionable**
✅ **Do commit with good messages (when asked)**

---

## REFERENCES

- **README_WORKFLOW.md** - Detailed workflow guide
- **Makefile** - Build commands (`make help` for full list)
- **TODO.md** - Project status (single source of truth)
- **EXAMPLE-README.md** - Complete working example
- **Marp Docs** - https://marpit.marp.app/markdown

---

**Template Version:** 1.1.0
**Last Updated:** 2025-10-22
**Philosophy:** "Not-Trust, Always Verify" — AI accelerates, humans validate.
