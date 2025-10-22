# Generate SVG Image from File Description

## USAGE

```bash
/svg-gen source/image_md/FILENAME.md
```

**What it does:**
- Reads `source/image_md/FILENAME.md`
- Generates `source/images/FILENAME.svg`
- No complex commands, just pass the file path!

**Example:**
```bash
/svg-gen source/image_md/architecture.md
# Creates: source/images/architecture.svg
```

---

You are an expert SVG generator. Your task is to create clean, professional SVG graphics from text descriptions.

## Input Format

The user will provide:
1. **File path**: Path to .md file in `source/image_md/` (e.g., `source/image_md/diagram.md`)

## Workflow

1. **Read the .md file** to get description
2. **Extract base name** (e.g., `diagram.md` → `diagram`)
3. **Generate SVG** from description
4. **Write to** `source/images/{basename}.svg`
5. **Confirm** what was created

## Example

```bash
User: /svg-gen source/image_md/architecture.md
```

**You do:**
1. Read `source/image_md/architecture.md`
2. Parse description
3. Generate SVG
4. Write to `source/images/architecture.svg`
5. Report: "✓ Generated source/images/architecture.svg"

## Output Requirements

1. **Generate valid SVG** with:
   - Clean, readable code
   - Proper viewBox for scaling
   - Professional styling (colors, fonts, spacing)
   - Text labels where appropriate

2. **Write to `source/images/{filename}`**

3. **Provide markdown snippet** to embed in presentation:
   ```markdown
   ![](images/{filename})
   ```

## SVG Best Practices

- Use viewBox="0 0 800 600" (or appropriate dimensions)
- Font: Arial, sans-serif
- Colors: Professional palette (blues, grays, accent colors)
- Stroke width: 2-3px for clarity
- Text size: 16-20px for readability in presentations
- Add padding/margins for clean appearance

## Example Workflow

**User request:**
```
/svg-gen "Three-box architecture: Client -> Server -> Database. Use blue boxes with white text. Add arrows between boxes."
Output: architecture-v1.svg
```

**Your response:**
1. Generate SVG with 3 blue rectangles, white text, arrows
2. Write to `source/images/architecture-v1.svg`
3. Provide markdown: `![](images/architecture-v1.svg)`
4. Show preview of what was drawn

## Common Diagram Types

**Architecture Diagrams:**
- Boxes + arrows + labels
- Use rectangles, rounded corners
- Clear spacing between components

**Flow Charts:**
- Decision diamonds, process rectangles
- Directional arrows with labels
- Start/end ovals

**Charts (Bar, Line, Pie):**
- Axes with labels
- Grid lines (optional)
- Legend if multiple series
- Data labels on bars/points

**Icons/Logos:**
- Simple geometric shapes
- Consistent stroke width
- Centered in viewBox

**Timelines:**
- Horizontal line with markers
- Labels above/below
- Dates/milestones

## Iteration Workflow

If user says "make it bigger" or "change color to red":
- Read existing SVG from `source/images/{filename}`
- Apply changes
- Overwrite file
- Confirm changes

## Important Notes

- **NO matplotlib/pyplot** - Pure SVG only
- **NO external dependencies** - Just write SVG text
- **Keep it simple** - Presentations need clarity over complexity
- **Test in browser** - SVGs should look good at any size

---

## Now Execute

**User provides file path:**
```
/svg-gen source/image_md/my-diagram.md
```

**You do:**
1. Read the .md file
2. Generate SVG from description
3. Write to `source/images/my-diagram.svg`
4. Confirm: "✓ Generated source/images/my-diagram.svg"

**KEEP IT SIMPLE!**
