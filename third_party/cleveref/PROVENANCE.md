# Bundled cleveref package

Upstream: <https://ctan.org/pkg/cleveref>

Version: 0.21.4 (2018-03-27), by Toby Cubitt.

Downloaded from <https://mirrors.ctan.org/macros/latex/contrib/cleveref.zip>
on 2026-10-07. `cleveref.dtx`, `cleveref.ins`, and `README` are unmodified
upstream files. The project-root `cleveref.sty` is generated from these sources
without modification using `latex cleveref.ins`.

The package is distributed under the LaTeX Project Public License, version 1.2
or any later version. The licence notice is included in `cleveref.dtx` and the
upstream `README`; licence text is available at
<https://www.latex-project.org/lppl/>.

To regenerate the style file, from this directory:

```sh
latex -interaction=nonstopmode -halt-on-error cleveref.ins
cp cleveref.sty ../../cleveref.sty
```
