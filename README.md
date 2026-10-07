# Data Cache Optimisation report

A modular academic LaTeX template with a title page, abstract, contents,
numbered chapters, running headers, linked citations, and a bibliography.
It includes examples of C code, mathematics, definitions, figures with
subfigures, tables, footnotes, and cross-references.

## Start writing

1. Edit `src/report-info.tex` for your name, institution, course, and report title.
2. Write in `src/sections/`. Each chapter is a separate file.
3. Add papers to `src/references.bib`. Seven entries from the existing reading
   list are already included. The incomplete page range for Carr (1996) is
   deliberately omitted; fill it in when you verify the publication record.
4. Store source snippets in `src/code/` and images in `src/figures/`.
5. Replace all illustrative prose, synthetic results, and `\todo{...}` reminders.
   Remove the LaTeX guide appendix by commenting out its `\input` in `main.tex`.

The example prose is scaffolding for your report, not a completed literature
review. The example figures are original teaching diagrams. Table 5.1 contains
synthetic values, not experimental findings.

## Build

The Makefile is in `src/`. From the project root:

```sh
make
```

Alternatively, run `make` directly from `src/`.

The compiled report is `output/pdf/main.pdf`. The build runs pdfLaTeX, BibTeX,
and two more pdfLaTeX passes to resolve citations and cross-references.
You do not need `latexmk`, Biber, Pygments, or shell escape.

Without Make, run these commands **from `src/`**:

```sh
pdflatex -interaction=nonstopmode -halt-on-error main.tex
bibtex main
pdflatex -interaction=nonstopmode -halt-on-error main.tex
pdflatex -interaction=nonstopmode -halt-on-error main.tex
```

That workflow writes `main.pdf` into `src/` instead. For Overleaf, upload the
contents of `src/`, select `main.tex`, and use pdfLaTeX with BibTeX.

## Useful writing patterns

```tex
\citet{wolfLam1991locality} describe a locality algorithm.
Related work examines loop transformations
\citep{wolfLam1991locality,mckinleyCarrTseng1996}.

See \cref{fig:access-pattern,eq:row-major}.
\Cref{lst:baseline} shows the original loop order.

\lstinputlisting[language=C,caption={My kernel.},label={lst:kernel}]
  {code/my-kernel.c}
```

The appendix contains further copyable examples. Citation keys are defined in
`references.bib`; label names are defined next to the corresponding content.

Use `\cref{label}` to insert the object type and number automatically, for
example `listing 1.1` or `equation (5.1)`. Use `\Cref{label}` at the start of
a sentence, and comma-separated labels for multiple references. Do not prefix
these commands with a manually written `Figure`, `Listing`, or `Equation`.
Bibliographic references continue to use `\citet` and `\citep`.
For a numbered code reference, give the listing both a `caption` and a `label`.
Without a caption, its label can refer to the preceding section counter instead.

## Layout and packages

The default is an 11-point A4, single-sided report with 28 mm margins and numeric
citations. Customise `src/preamble.tex` for layout, code colours, and notation.
The bibliography uses `plainnat` with `natbib`. To switch to author-year
citations, replace `numbers,square,sort&compress` in the `natbib` options with
`authoryear,round` and rebuild.

Included packages cover:

- Typography/layout: `fontenc`, `inputenc`, `microtype`, `geometry`, `setspace`,
  `fancyhdr` (`lmodern` with T1 encoding is used if available; otherwise the
  template uses Computer Modern with OT1 encoding).
- Mathematics: `amsmath`, `amssymb`, `mathtools`, `amsthm`, `extarrows`.
- Lists: `enumitem`, with compact bullet-list spacing and per-list overrides.
- Graphics: `graphicx`, `caption`, `subcaption`, `float`.
- Tables: `booktabs`, `array`, `tabularx`, `longtable`.
- Code: `listings`, `xcolor`, `textcomp`.
- Citations/links: `natbib`, `url`, `hyperref`, `cleveref`.

`cleveref.sty`, `enumitem.sty`, and `extarrows.sty` are bundled locally because
the installed TeX distribution may not include them. Their upstream notices and
provenance are under the corresponding directories in `third_party/`; keep
those files with the project when sharing it. The unmodified `enumitem.sty`
includes its licence text.

These are standard TeX Live packages. Figures are bundled as vector PDFs, so
Python is not required to compile the report. To edit and regenerate the example
diagrams, install Matplotlib and run `make -C src figures`. `make -C src clean`
removes LaTeX intermediates while keeping the built PDF.

## Suggested report structure

- Introduction: motivation, scope, research questions.
- Background: locality, access functions, dependence notation, cost models.
- Literature review: paper summaries and a critical comparison.
- Worked example: transformations, legality, access patterns, profitability.
- Evaluation: methods used in the papers or your own experiments.
- Conclusion: answers to the research questions and future work.

For a purely literature-based report, adapt the evaluation chapter to compare
the papers' evidence. Lists of figures and tables can be enabled in `main.tex`.
