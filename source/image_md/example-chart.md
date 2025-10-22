# System Performance Over Time (Multi-Series Line Chart)

Line chart showing system performance metrics over time with 3 different series.

---

## Data Source

**File:** `example-chart.csv`

**Structure:**
- X-axis: `Time` column (values 0-9)
- Y-axis: Three metrics (CPU_Utilization, Memory_Usage, Disk_IO)

**CSV is pure data - NO styling, NO colors, just measurements.**

---

## Chart Styling (Defined Here)

**Title:** "System Performance Monitor"
- Font: Arial, bold, 20px
- Color: #2c3e50 (dark gray)
- Position: Centered at top

**Lines (3 series):**

1. **CPU_Utilization** line:
   - Color: #3498db (blue)
   - Stroke width: 3px
   - Label: "CPU (%)"
   - Legend color: #3498db

2. **Memory_Usage** line:
   - Color: #e74c3c (red)
   - Stroke width: 3px
   - Label: "Memory (%)"
   - Legend color: #e74c3c

3. **Disk_IO** line:
   - Color: #2ecc71 (green)
   - Stroke width: 3px
   - Label: "Disk I/O (%)"
   - Legend color: #2ecc71

**Axes:**
- X-axis: "Time (seconds)", range 0-9, tick marks every 1 second
- Y-axis: "Usage (%)", range 0-100, tick marks every 20%
- Grid lines: Light gray (#ecf0f1), dashed
- Axis color: #95a5a6 (gray)
- Label font: Arial, 14px, #2c3e50

**Legend:**
- Position: Top-right corner
- Background: White with light border (#bdc3c7)
- Font: Arial, 12px
- Show color squares next to each label

**Overall:**
- ViewBox: 800x500
- Background: White
- Padding: 40px all sides
- Professional, clean appearance

---

## Instructions for AI

1. Read data from `example-chart.csv` in same directory
2. Parse Time column for x-axis values (0-9)
3. Parse three metric columns for y-axis values
4. Draw three separate lines using colors defined above
5. Add data points (small circles) at each measurement
6. Add legend showing all three series with their colors
7. Add grid lines for readability
8. Make it presentation-ready with proper spacing and labels

**Key Point:** CSV contains only raw data. This file defines ALL visual styling.
