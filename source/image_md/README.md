# SVG Source Descriptions

This directory contains text descriptions used to generate SVG files with `/svg-gen`.

---

## USAGE

```bash
/svg-gen source/image_md/FILENAME.md
```

**Creates:** `source/images/FILENAME.svg`

**Example:**
```bash
# 1. Create description
cat > source/image_md/my-diagram.md <<EOF
Three boxes: Client -> Server -> Database
EOF

# 2. Generate SVG
/svg-gen source/image_md/my-diagram.md

# 3. Use in presentation
# ![](images/my-diagram.svg)
```

**That's it! Keep it simple.**

---

## How It Works

**1:1 Pairing:** Each `.md` file generates a matching `.svg` file:
```
source/image_md/diagram.md    →  source/images/diagram.svg
source/image_md/chart.md      →  source/images/chart.svg
```

**Workflow:**
1. Create `diagram.md` with text description
2. Run `/svg-gen source/image_md/diagram.md`
3. AI generates `source/images/diagram.svg`
4. Edit `diagram.md` later to update
5. `make marp` warns if `.svg` is stale
6. Regenerate: `/svg-gen source/image_md/diagram.md`

## Automatic Staleness Detection

The Makefile checks if any `.md` file is newer than its corresponding `.svg` file:

```bash
$ make marp
Checking image dependencies...
⚠️  WARNING: SVG files may be out of date!

The following SVG files are OLDER than their source .md files:
  source/images/diagram.svg (source: source/image_md/diagram.md)
  source/images/chart.svg (source: source/image_md/chart.md)

Run /svg-gen to regenerate SVG files from updated descriptions.
Press Ctrl+C to cancel, or wait 3 seconds to continue anyway...
```

## Example Workflow

```bash
# 1. Create source description
cat > source/image_md/my-diagram.md <<EOF
# My Architecture Diagram

Three boxes: Client (blue) -> Server (green) -> Database (purple).
Arrows between boxes labeled "HTTP" and "SQL".
EOF

# 2. Generate SVG
/svg-gen source/image_md/my-diagram.md
# Output: source/images/my-diagram.svg

# 3. Build presentation
make marp
# ✓ No warnings

# 4. Later, update description
vim source/image_md/my-diagram.md

# 5. Makefile detects staleness
make marp
# ⚠️  WARNING: my-diagram.svg is out of date!

# 6. Regenerate
/svg-gen source/image_md/my-diagram.md

# 7. Build again
make marp
# ✓ Success!
```

## File Format

Each `.md` file should contain:
- Clear description of what to draw
- Specific colors, sizes, positions
- Text labels to include
- Style preferences

**Good example:**
```markdown
# Architecture Diagram

Three boxes in a row:
- Box 1: "Client" (blue #3498db, white text)
- Box 2: "Server" (green #2ecc71, white text)
- Box 3: "Database" (purple #9b59b6, white text)

Arrows between boxes with labels "HTTP" and "SQL".
ViewBox: 800x400
```

**Bad example:**
```markdown
Draw some boxes
```

## Example Files

See existing files for templates:

**Diagrams:**
- `example-svg-workflow.md` - Workflow diagram with 3 steps

**Data-Driven Charts (Impressive!):**
- `example-chart.md` + `example-chart.csv` - **Multi-series line chart with decoupled data/styling**
  - **CSV:** Pure data only (Time, CPU, Memory, Disk_IO) - 3 lines × 10 points = 30 data points
  - **.md:** ALL styling/colors defined here (blue, red, green lines, fonts, legend, etc.)
  - **Benefit:** Change colors/styling without touching data file!

- `example-chart-simple.md` - Same chart with inline markdown table
  - **Self-contained:** Data embedded in .md file
  - **Benefit:** Single file, no external dependencies

Copy and modify these as starting points for your diagrams.

**Data approaches:**
- **External CSV** (`example-chart.csv` + `example-chart.md`) - True separation of data/presentation, reusable, scalable
- **Inline table** (`example-chart-simple.md`) - Self-contained, good for small datasets

## Tips

- **Descriptive names:** Use `architecture-v1.md`, not `diagram1.md`
- **Version numbers:** Add `-v1`, `-v2` when iterating
- **Be specific:** Include colors (hex codes), sizes, positions, text labels
- **Commit both:** Always commit both `.md` and `.svg` files together

---

## Examples: Ready-to-Use Templates

Copy these examples to create your own diagrams. Modify as needed.

### Example 1: Architecture Diagram

```bash
/svg-gen "Three-box architecture diagram. Box 1: 'Client App' (blue). Box 2: 'API Server' (green).
Box 3: 'Database' (purple). Draw arrows from Client to API to Database. Label arrows with 'HTTP'
and 'SQL'. Use white text on boxes."
```
**Output:** `architecture-3tier.svg`

---

### Example 2: Flow Chart

```bash
/svg-gen "Decision flow chart. Start with 'User Request' oval at top. Rectangle 'Check Auth' below.
Diamond 'Valid?' with Yes/No paths. Yes path goes to 'Process Request' rectangle. No path goes to
'Return 401' rectangle. Both end at 'Response' oval. Use blue for process, red for error."
```
**Output:** `auth-flow.svg`

---

### Example 3: Bar Chart (with color control)

```bash
/svg-gen "Bar chart comparing 3 solutions. X-axis: 'Solution A', 'Solution B', 'Solution C'.
Y-axis: 'Cost ($K)' from 0-100. Bar heights: A=45, B=70, C=30. Bar colors: A=#3498db (blue),
B=#e74c3c (red), C=#2ecc71 (green). Add data labels on top of each bar (white text).
Title: 'Cost Comparison' (color #2c3e50). Background: white."
```
**Output:** `cost-comparison.svg`

**Color palette:**
- Blue: `#3498db`
- Red: `#e74c3c`
- Green: `#2ecc71`
- Orange: `#f39c12`
- Purple: `#9b59b6`
- Gray: `#95a5a6`
- Dark text: `#2c3e50`

---

### Example 4: Timeline

```bash
/svg-gen "Horizontal timeline with 4 milestones. Left to right: 'Research (Week 1)',
'Design (Week 2-3)', 'Implementation (Week 4-6)', 'Testing (Week 7)'. Use circles for milestones
connected by a line. Color code: green=complete, blue=in progress, gray=planned."
```
**Output:** `project-timeline.svg`

---

### Example 5: System Block Diagram

```bash
/svg-gen "Block diagram of embedded system. Top row: 'Sensors' (3 small boxes).
Middle: 'Microcontroller' (large blue box). Bottom left: 'Power Supply' (yellow box).
Bottom right: 'Actuators' (2 boxes). Draw connections from Sensors to MCU, Power to MCU,
MCU to Actuators. Label signal types."
```
**Output:** `embedded-system.svg`

---

### Example 6: Pie Chart

```bash
/svg-gen "Pie chart showing time allocation. 4 slices: 'Development 40%' (blue), 'Testing 25%' (green),
'Documentation 20%' (orange), 'Meetings 15%' (red). Add legend. Title: 'Time Breakdown'."
```
**Output:** `time-allocation.svg`

---

### Example 7: Network Topology

```bash
/svg-gen "Network diagram. Center: 'Router' (large gray box). Connected devices around it:
'Laptop' (top-left), 'Desktop' (top-right), 'Server' (bottom-left), 'Printer' (bottom-right).
Draw lines from each device to router. Label with IP addresses."
```
**Output:** `network-topology.svg`

---

### Example 8: State Machine

```bash
/svg-gen "State machine with 3 states. Circle 1: 'Idle' (gray). Circle 2: 'Running' (green).
Circle 3: 'Error' (red). Arrows: Idle->Running (label: start), Running->Idle (label: stop),
Running->Error (label: fault), Error->Idle (label: reset)."
```
**Output:** `state-machine.svg`

---

### Example 9: Before/After Comparison

```bash
/svg-gen "Two-panel comparison. Left panel titled 'Before': messy diagram with overlapping boxes.
Right panel titled 'After': clean organized 3-layer stack. Use red for before, green for after.
Add arrow between panels labeled 'Refactoring'."
```
**Output:** `refactoring-comparison.svg`

---

### Example 10: Icon Set

```bash
/svg-gen "Create 4 simple icons in a row. Icon 1: Check mark (green circle). Icon 2: Warning triangle
(yellow). Icon 3: Error X (red circle). Icon 4: Info 'i' (blue circle). Size: 100x100 each.
Space them evenly."
```
**Output:** `status-icons.svg`

---

### Example 11: Multi-Series Line Chart (Impressive!)

**THE KEY INSIGHT:** Decouple data from presentation!

**Approach 1: External CSV** (data/styling separated, reusable, scalable)

**Step 1: Create pure data file (NO colors, NO styling)**
```bash
cat > source/image_md/system-perf.csv <<EOF
Time,CPU_Utilization,Memory_Usage,Disk_IO
0,20,35,15
1,25,38,18
2,30,42,22
3,35,45,25
4,45,50,30
5,55,58,35
6,50,55,32
7,45,52,28
8,40,48,25
9,35,42,20
EOF
```

**Step 2: Create styling file (ALL colors/fonts/presentation defined here)**
```bash
cat > source/image_md/system-perf.md <<EOF
# System Performance Over Time

Multi-series line chart showing 3 metrics over 10 time points.

**Data source:** system-perf.csv (pure data, no styling)

**Lines:**
- CPU_Utilization: Color #3498db (blue), stroke 3px
- Memory_Usage: Color #e74c3c (red), stroke 3px
- Disk_IO: Color #2ecc71 (green), stroke 3px

**Axes:**
- X-axis: "Time (seconds)", range 0-9
- Y-axis: "Usage (%)", range 0-100
- Grid lines: Light gray (#ecf0f1), dashed

**Legend:** Top-right, white background

ViewBox: 800x500, padding 40px
EOF
```

**Step 3: Generate**
```bash
/svg-gen source/image_md/system-perf.md
```

**Benefits:**
- ✅ CSV contains ONLY data (can export from database, Excel, sensors)
- ✅ .md contains ONLY presentation (change colors without touching data)
- ✅ Reuse same CSV for multiple chart styles
- ✅ Scales to 1000s of data points

---

**Approach 2: Inline Table** (self-contained, good for small datasets)

```bash
cat > source/image_md/system-perf-inline.md <<EOF
# System Performance (Inline)

| Time | CPU | Memory | Disk |
|------|-----|--------|------|
| 0    | 20  | 35     | 15   |
| 1    | 25  | 38     | 18   |
...

**Lines:**
- CPU: #3498db (blue)
- Memory: #e74c3c (red)
- Disk: #2ecc71 (green)

Multi-series line chart from table above.
EOF
```

**See real examples:** `example-chart.md` (CSV) and `example-chart-simple.md` (inline table)

---

## Best Practices for Descriptions

✅ **Do:**
- Be specific about colors (use hex codes: `#3498db`)
- Mention text labels explicitly
- Specify shapes (rectangle, circle, diamond, arrow)
- Include dimensions if important (viewBox: 800x400)
- Break complex diagrams into layers (background, boxes, arrows, text)
- Use professional color palette (blues, grays, greens)
- For CSV data: Paste inline OR reference file path

❌ **Don't:**
- Use vague descriptions ("draw some boxes")
- Forget to specify colors
- Omit text labels
- Make diagrams too complex (split into multiple simpler ones)
