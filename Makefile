# Makefile for Marp Presentation Framework
# Converts source/presentation.md → artifacts/presentation.html + .pdf

# ============================================================================
# PRESENTATION GENERATION (Marp)
# ============================================================================

# Default target - build presentation
.DEFAULT_GOAL := marp

# Generate presentation (HTML + PDF)
marp: source/presentation.md
	@echo "Checking image dependencies..."
	@STALE_COUNT=0; \
	if [ -d source/image_md ]; then \
		for md_file in source/image_md/*.md; do \
			if [ -f "$$md_file" ] && [ "$$(basename "$$md_file")" != "README.md" ]; then \
				base=$$(basename "$$md_file" .md); \
				svg_file="source/images/$${base}.svg"; \
				if [ -f "$$svg_file" ] && [ "$$md_file" -nt "$$svg_file" ]; then \
					if [ $$STALE_COUNT -eq 0 ]; then \
						echo "⚠️  WARNING: SVG files may be out of date!"; \
						echo ""; \
						echo "The following SVG files are OLDER than their source .md files:"; \
					fi; \
					echo "  $$svg_file (source: $$md_file)"; \
					STALE_COUNT=$$((STALE_COUNT + 1)); \
				fi \
			fi \
		done; \
		if [ $$STALE_COUNT -gt 0 ]; then \
			echo ""; \
			echo "Run /svg-gen to regenerate SVG files from updated descriptions."; \
			echo "Press Ctrl+C to cancel, or wait 3 seconds to continue anyway..."; \
			sleep 3; \
		fi \
	fi
	@echo "Generating presentation with Marp..."
	@mkdir -p artifacts/images
	@cp -f source/images/* artifacts/images/ 2>/dev/null || true
	@marp --no-stdin source/presentation.md -o artifacts/presentation.html --allow-local-files
	@marp --no-stdin source/presentation.md -o artifacts/presentation.pdf --allow-local-files --pdf
	@echo "✓ artifacts/presentation.html generated (HTML presentation)"
	@echo "✓ artifacts/presentation.pdf generated (PDF for distribution)"
	@echo ""
	@echo "Next steps:"
	@echo "  1. Present: firefox artifacts/presentation.html (press F11 for fullscreen)"
	@echo "  2. Edit: vim source/presentation.md (then 'make marp' to regenerate)"
	@echo "  3. Share PDF: artifacts/presentation.pdf"
	@echo ""
	@echo "Navigation: Arrow keys, Space=next, Shift+Space=prev"

# Clean generated files
clean:
	rm -f artifacts/presentation.html artifacts/presentation.pdf
	rm -rf artifacts/images
	@echo "Cleaned presentation files and images"

# Rebuild (clean + build)
rebuild: clean marp

# Help
help:
	@echo "Marp Presentation Framework - Makefile"
	@echo "======================================"
	@echo ""
	@echo "Targets:"
	@echo "  make marp       - Generate HTML + PDF presentation (default)"
	@echo "  make clean      - Remove generated files"
	@echo "  make rebuild    - Clean and rebuild"
	@echo "  make help       - Show this help"
	@echo ""
	@echo "Files:"
	@echo "  Source:  source/presentation.md"
	@echo "  Output:  artifacts/presentation.html, artifacts/presentation.pdf"
	@echo ""
	@echo "Image Generation:"
	@echo "  /svg-gen source/image_md/FILE.md      - Generate SVG (recommended)"
	@echo "  python3 scripts/make_chart_dwg.py ... - Generate PNG (matplotlib)"
	@echo "  See: source/image_md/README.md and scripts/README.md"
	@echo ""
	@echo "Requirements:"
	@echo "  npm install -g @marp-team/marp-cli"

.PHONY: marp clean rebuild help
