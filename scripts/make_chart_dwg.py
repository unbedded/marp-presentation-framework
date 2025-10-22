#!/usr/bin/env python3
"""
Generate chart images using matplotlib.

Alternative to /svg-gen for when you need matplotlib's features:
- Complex statistical plots
- Scientific visualizations
- Existing matplotlib code

Usage:
    python3 scripts/make_chart_dwg.py source/image_md/data.csv output-name

Example:
    python3 scripts/make_chart_dwg.py source/image_md/example-chart.csv example-chart-mpl

Output:
    source/images/example-chart-mpl.png
"""

import sys
import csv
import matplotlib.pyplot as plt
import matplotlib
from pathlib import Path

# Use non-interactive backend
matplotlib.use('Agg')


def read_csv_data(csv_path):
    """Read CSV file and return data."""
    data = {'labels': [], 'values': [], 'colors': []}

    with open(csv_path, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            # Support flexible column names
            label_key = next((k for k in row.keys() if k.lower() in ['category', 'item', 'label', 'name']), None)
            value_key = next((k for k in row.keys() if k.lower() in ['value', 'score', 'amount']), None)
            color_key = next((k for k in row.keys() if k.lower() == 'color'), None)

            if label_key and value_key:
                data['labels'].append(row[label_key])
                data['values'].append(float(row[value_key]))
                if color_key:
                    data['colors'].append(row[color_key])

    # Default colors if not specified
    if not data['colors']:
        data['colors'] = ['#3498db', '#e74c3c', '#2ecc71', '#f39c12', '#9b59b6']

    return data


def create_bar_chart(data, output_path, title="Chart"):
    """Create a bar chart using matplotlib."""
    fig, ax = plt.subplots(figsize=(8, 6))

    # Create bars
    bars = ax.bar(data['labels'], data['values'], color=data['colors'][:len(data['labels'])])

    # Add data labels on top of bars
    for bar in bars:
        height = bar.get_height()
        ax.text(bar.get_x() + bar.get_width()/2., height,
                f'{height:.0f}',
                ha='center', va='bottom', fontweight='bold', fontsize=12)

    # Styling
    ax.set_ylabel('Value', fontsize=12, fontweight='bold')
    ax.set_title(title, fontsize=14, fontweight='bold', pad=20)
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.grid(axis='y', alpha=0.3, linestyle='--')
    ax.set_axisbelow(True)

    # Adjust layout
    plt.tight_layout()

    # Save
    plt.savefig(output_path, dpi=150, bbox_inches='tight')
    print(f"✓ Created: {output_path}")

    plt.close()


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        print("\nError: Missing CSV file path")
        sys.exit(1)

    csv_path = Path(sys.argv[1])

    if not csv_path.exists():
        print(f"Error: File not found: {csv_path}")
        sys.exit(1)

    # Determine output name
    if len(sys.argv) >= 3:
        output_name = sys.argv[2]
    else:
        output_name = csv_path.stem + "-mpl"

    output_path = Path("source/images") / f"{output_name}.png"
    output_path.parent.mkdir(parents=True, exist_ok=True)

    # Read data and create chart
    try:
        data = read_csv_data(csv_path)
        title = csv_path.stem.replace('-', ' ').replace('_', ' ').title()
        create_bar_chart(data, output_path, title)

        print(f"\nUsage in presentation:")
        print(f"![](images/{output_name}.png)")

    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
