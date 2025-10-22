# Scripts Directory

Utility scripts for the presentation framework.

---

## make_chart_dwg.py

Generate chart images using matplotlib (Python).

### Usage

```bash
python3 scripts/make_chart_dwg.py <csv-file> [output-name]
```

**Example:**
```bash
python3 scripts/make_chart_dwg.py source/image_md/example-chart.csv my-chart
# Creates: source/images/my-chart.png
```

### When to Use This vs /svg-gen

| Feature | /svg-gen (SVG) | matplotlib (PNG) |
|---------|----------------|------------------|
| **Format** | Text-based SVG | Binary PNG |
| **Version control** | ✅ Git-friendly | ❌ Binary diffs |
| **Dependencies** | ❌ None | ⚠️ Python + matplotlib |
| **Iteration speed** | ✅ 1 second | ⚠️ Slower |
| **Scalability** | ✅ Perfect at any size | ❌ Fixed resolution |
| **Best for** | Simple charts, diagrams | Complex statistical plots |

**Recommendation:** Use `/svg-gen` for most cases. Use matplotlib only when you need:
- Complex statistical plots (violin plots, heatmaps, contours)
- Scientific visualizations (3D plots, LaTeX equations)
- Existing matplotlib code to integrate

### Requirements

```bash
pip install matplotlib
```

### CSV Format

CSV should have these column patterns (case-insensitive):

**Labels:** `Category`, `Item`, `Label`, or `Name`
**Values:** `Value`, `Score`, or `Amount`
**Colors:** `Color` (optional, hex codes like `#3498db`)

**Example CSV:**
```csv
Category,Value,Color
Option A,45,#3498db
Option B,70,#e74c3c
Option C,30,#2ecc71
```

### Output

- PNG image at 150 DPI
- Saved to `source/images/{output-name}.png`
- Professional styling with grid, labels, title
- Automatic data labels on bars

### Customization

Edit `scripts/make_chart_dwg.py` to:
- Change chart type (line, scatter, etc.)
- Adjust styling (colors, fonts, sizes)
- Add more matplotlib features (legends, annotations)

---

## Future Scripts

Add more utility scripts here as needed:
- `convert_pptx_images.py` - Extract images from PowerPoint
- `optimize_images.py` - Compress PNG/JPG files
- `generate_thumbnails.py` - Create preview images
