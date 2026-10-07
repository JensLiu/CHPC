# Run make from src/ (or make -C src from the project root).
PDFLATEX ?= pdflatex
BIBTEX ?= bibtex
OUT_DIR := $(abspath $(CURDIR)/../output/pdf)

.PHONY: all pdf figures clean
all: pdf

pdf:
	mkdir -p "$(OUT_DIR)"
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error -file-line-error -output-directory="$(OUT_DIR)" main.tex
	cd "$(OUT_DIR)" && BIBINPUTS="$(CURDIR):" $(BIBTEX) main
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error -file-line-error -output-directory="$(OUT_DIR)" main.tex
	$(PDFLATEX) -interaction=nonstopmode -halt-on-error -file-line-error -output-directory="$(OUT_DIR)" main.tex

# Optional: pre-generated PDFs are included, so this is not needed to build.
figures:
	python3 ../scripts/generate-example-figures.py

# Remove only generated LaTeX intermediates; retain the report PDF and sources.
clean:
	python3 -c 'from pathlib import Path; extensions = {".aux", ".bbl", ".blg", ".log", ".out", ".toc", ".lof", ".lot", ".lol", ".fls", ".fdb_latexmk", ".synctex.gz"}; folder = Path("../output/pdf"); [p.unlink() for p in folder.glob("main.*") if any(p.name.endswith(ext) for ext in extensions)]'
