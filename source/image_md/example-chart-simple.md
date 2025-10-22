# System Performance Over Time (Inline Data)

Line chart showing system performance metrics - same chart as example-chart.md but with inline data.

---

## Data (Inline Markdown Table)

| Time | CPU_Utilization | Memory_Usage | Disk_IO |
|------|----------------|--------------|---------|
| 0    | 20             | 35           | 15      |
| 1    | 25             | 38           | 18      |
| 2    | 30             | 42           | 22      |
| 3    | 35             | 45           | 25      |
| 4    | 45             | 50           | 30      |
| 5    | 55             | 58           | 35      |
| 6    | 50             | 55           | 32      |
| 7    | 45             | 52           | 28      |
| 8    | 40             | 48           | 25      |
| 9    | 35             | 42           | 20      |

**Data is self-contained in this file. Colors and styling defined below.**

---

## Chart Styling

**Title:** "System Performance Monitor (Inline Data)"
- Font: Arial, bold, 20px, color #2c3e50

**Lines (3 series):**
1. **CPU_Utilization**: Color #3498db (blue), stroke 3px, label "CPU (%)"
2. **Memory_Usage**: Color #e74c3c (red), stroke 3px, label "Memory (%)"
3. **Disk_IO**: Color #2ecc71 (green), stroke 3px, label "Disk I/O (%)"

**Axes:**
- X-axis: "Time (seconds)", range 0-9
- Y-axis: "Usage (%)", range 0-100
- Grid lines: Light gray (#ecf0f1), dashed

**Legend:**
- Position: Top-right
- Background: White with border (#bdc3c7)
- Show color squares next to labels

**Overall:**
- ViewBox: 800x500
- Background: White
- Padding: 40px all sides

---

## Instructions for AI

1. Parse the markdown table above
2. Use Time column for x-axis (0-9)
3. Plot three lines: CPU_Utilization, Memory_Usage, Disk_IO
4. Apply colors defined above for each line
5. Add data points (small circles) at each measurement
6. Add legend and grid lines
7. Make it presentation-ready

**Comparison with example-chart.md:**
- This version: Data embedded in .md file (self-contained, ~10 rows)
- example-chart.md: Data in separate .csv file (reusable, scalable to 1000s of rows)
