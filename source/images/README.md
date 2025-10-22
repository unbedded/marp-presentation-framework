# Images Directory

Put your presentation images here. The Makefile automatically copies them to `artifacts/images/` during build.

## Creating Images with AI

### Option 1: Generate SVG from Text (Recommended)

Use the `/svg-gen` slash command:

```bash
# 1. Create description
cat > source/image_md/diagram.md <<EOF
Three-box architecture: Client -> Server -> Database
EOF

# 2. Generate
/svg-gen source/image_md/diagram.md

# Output: source/images/diagram.svg
```

**Benefits:**
- ✓ Text-based (version control friendly)
- ✓ No dependencies (no matplotlib/pyplot)
- ✓ Scales perfectly
- ✓ Easy to iterate ("make boxes bigger", "change color to red")

### Where to Store SVG Sources?

**Recommended: Paired .md files in `source/image_md/`**

Each SVG has a matching `.md` source file:
```
source/image_md/diagram.md    →  source/images/diagram.svg
source/image_md/chart.md      →  source/images/chart.svg
```

**Workflow:**
1. Create `source/image_md/diagram.md` with text description
2. Run `/svg-gen source/image_md/diagram.md`
3. AI generates `source/images/diagram.svg`
4. Both files committed to git

**Automatic staleness detection:**
When you run `make marp`, the Makefile checks if any `.md` file is newer than its `.svg` file:

```
⚠️  WARNING: SVG files may be out of date!

The following SVG files are OLDER than their source .md files:
  source/images/diagram.svg (source: source/image_md/diagram.md)

Run /svg-gen to regenerate SVG files from updated descriptions.
Press Ctrl+C to cancel, or wait 3 seconds to continue anyway...
```

**See:** `source/image_md/README.md` for detailed workflow guide

### Option 2: Add Existing Images

Just copy PNG, JPG, or SVG files to this directory.

---

## Example Files

**Placeholder SVG files included for demonstration:**

- `placeholder-logo.svg` - Title slide logo
- `section-1.svg` - Section break (Topic 1)
- `section-2.svg` - Section break (Topic 2)
- `backup.svg` - Backup section
- `example-chart.svg` - Sample chart
- `example-svg-workflow.svg` - Shows SVG generation workflow

**Example prompts:**

```markdown
## example-svg-workflow.svg
SVG generation workflow diagram. Three steps: Text Description (blue) →
AI Generates (green) → Visual Output (purple).

## placeholder-logo.svg
Simple presentation screen icon. Blue rectangle with white lines.

## example-chart.svg
Sample bar chart. Three bars (40, 60, 80). Blue bars with data labels on top.
```

**See:** `source/image_md/README.md` for 10+ ready-to-use templates

---

## Usage in Slides

Reference images using relative paths in `source/presentation.md`:

```markdown
![](images/your-image.png)
```

The Makefile automatically copies this directory to `artifacts/images/` during build.

---

## Tips

- **Naming:** Use descriptive names (`architecture-v1.svg`, not `img1.svg`)
- **Versions:** Add `-v1`, `-v2` when iterating on designs
- **Size:** SVG files are tiny (<10KB), no size concerns
- **Iteration:** Easy to regenerate with `/svg-gen` + updated description
