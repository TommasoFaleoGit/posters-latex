# Conference posters repository

This repository contains a collection of LaTeX posters presented at various conferences.

Each poster lives in its own self-contained folder that bundles everything needed to
reproduce it: the LaTeX source, a local document class and bibliography style, and all
figure/data assets. This keeps every poster buildable on its own, without depending on
the rest of the repository.

## Posters

| Folder                                                        | Title                                                                             | Authors                                                                                                 | Venue          |
| ------------------------------------------------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | -------------- |
| [`Poster_Quantum_Torino_LaTeX/`](Poster_Quantum_Torino_LaTeX/) | Optimised spectral purity of unfiltered photons via pump and nonlinearity shaping | T. Faleo, C. L. Morrison, R. Beignon, F. Graffitti, V. Remesh, S. Frick, A. Fedrizzi, G. Weihs, R. Keil | Quantum Torino |

## Repository layout

Each poster folder follows the same structure:

```
Poster_<Name>_LaTeX/
├── main.tex          # Poster source (entry point)
├── uibkpost.cls      # Poster document class (bundled locally)
├── stefan.bst        # Bibliography style (bundled locally)
├── pics/             # Figures (PDF / PNG)
├── _images/          # Logos, QR codes and other branding assets
├── tikz/             # Standalone TikZ/pgfplots figure sources
└── data/             # Raw data used to generate plots
```

The compiled `main.pdf` is committed alongside each poster, so the final result can be
viewed directly without rebuilding.

## Building a poster with this layout

The posters must be compiled with **LuaLaTeX**. From inside a poster folder, the
simplest option is to let `latexmk` drive LuaLaTeX:

```bash
cd Poster_Quantum_Torino_LaTeX
latexmk -lualatex main.tex
```

Or run `lualatex` directly:

```bash
cd Poster_Quantum_Torino_LaTeX
lualatex main.tex
```

Because the document class (`uibkpost.cls`) and bibliography style (`stefan.bst`) are
included in the folder, no extra installation is required beyond a working LaTeX
distribution (e.g. TeX Live or MiKTeX).

Auxiliary build files (`*.aux`, `*.log`, `*.fdb_latexmk`, …) are ignored via
[`.gitignore`](.gitignore); figure and PDF assets are kept under version control.
