(TeX-add-style-hook
 "amelia"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "letterpaper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("amsmath" "reqno") ("hyperref" "pdftex" "bookmarksopen=true" "bookmarksnumbered=true" "pdfstartview=FitH" "breaklinks=true" "urlbordercolor={0 1 0}" "citebordercolor={0 0 1}")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "fontenc"
    "Rd"
    "Sweave"
    "upquote"
    "graphicx"
    "epstopdf"
    "natbib"
    "setspace"
    "fullpage"
    "caption"
    "amsmath"
    "amsthm"
    "amssymb"
    "enumerate"
    "dcolumn"
    "url"
    "tikz"
    "color"
    "hyperref"
    "vmargin")
   (TeX-add-symbols
    '("adjparbox" 2)
    "obs"
    "mis"
    "Amelia"
    "AmeliaII"
    "AmeliaView")
   (LaTeX-add-labels
    "sec:intro"
    "sec:what"
    "eq:norm"
    "eq:mar"
    "sec:versions"
    "sec:install"
    "sec:win-install"
    "sec:lin-install"
    "sec:guide"
    "fig:hist1"
    "sec:saving"
    "sec:parallel"
    "sec:trans"
    "sec:ord"
    "sec:nom"
    "sec:log"
    "fig:logshist"
    "sec:sqrt"
    "sec:lgstc"
    "sec:idvars"
    "sec:tscs"
    "fig:tcomp"
    "sec:lags"
    "sec:prior"
    "fig:tcomp2"
    "sec:obspri"
    "fig:bcomp"
    "sec:diag"
    "sec:overimpute"
    "f:oi2"
    "f:oi-bad"
    "sec:overdisperse"
    "f:overgood"
    "sec:tscsplots"
    "fig:tsplot1"
    "sec:missmaps"
    "fig:missmap"
    "sec:postimptrans"
    "sec:analysis"
    "sec:out"
    "sec:menu"
    "sec:step1"
    "f:splash"
    "f:file"
    "sec:step2"
    "f:main"
    "f:context"
    "sec:optsmenu"
    "f:opts"
    "sec:numopts"
    "f:numopts"
    "sec:refdistpri"
    "sec:refrangepri"
    "sec:step3"
    "sec:diagdiag"
    "sec:sessions")
   (LaTeX-add-environments
    "Com"
    "prop"
    "thm")
   (LaTeX-add-bibliographies)))

