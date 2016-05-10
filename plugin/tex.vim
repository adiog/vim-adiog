" tex support {{{
iab cA \mathcal{A}
iab cB \mathcal{B}
iab cC \mathcal{C}
iab cD \mathcal{D}
iab cE \mathcal{E}
iab cF \mathcal{F}
iab cG \mathcal{G}
iab cH \mathcal{H}
iab cI \mathcal{I}
iab cJ \mathcal{J}
iab cK \mathcal{K}
iab cL \mathcal{L}
iab cM \mathcal{M}
iab cN \mathcal{N}
iab cO \mathcal{O}
iab cP \mathcal{P}
iab cQ \mathcal{Q}
iab cR \mathcal{R}
iab cS \mathcal{S}
iab cT \mathcal{T}
iab cU \mathcal{U}
iab cV \mathcal{V}
iab cW \mathcal{W}
iab cX \mathcal{X}
iab cY \mathcal{Y}
iab cZ \mathcal{Z}

iab bA \mathbb{A}
iab bB \mathbb{B}
iab bC \mathbb{C}
iab bD \mathbb{D}
iab bE \mathbb{E}
iab bF \mathbb{F}
iab bG \mathbb{G}
iab bH \mathbb{H}
iab bI \mathbb{I}
iab bJ \mathbb{J}
iab bK \mathbb{K}
iab bL \mathbb{L}
iab bM \mathbb{M}
iab bN \mathbb{N}
iab bO \mathbb{O}
iab bP \mathbb{P}
iab bQ \mathbb{Q}
iab bR \mathbb{R}
iab bS \mathbb{S}
iab bT \mathbb{T}
iab bU \mathbb{U}
iab bV \mathbb{V}
iab bW \mathbb{W}
iab bX \mathbb{X}
iab bY \mathbb{Y}
iab bZ \mathbb{Z}

iab tE \begin{equation*}<CR>\end{equation*}<UP><END>
iab tA \begin{align*}<CR>\end{align*}<UP><END>
iab tR \begin{array*}<CR>\end{array*}<UP><END>
iab tH \frac{1}{2}
iab tC \begin{cases}\end{cases}<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
iab tD \begin{definition}<CR>\end{definition}<UP><END>
iab tI \begin{itemize}<CR>\end{itemize}<UP><END>
iab tU \begin{enumerate}<CR>\end{enumerate}<UP><END>
iab tT \begin{theorem}<CR>\end{theorem}<UP><END>
iab tP \begin{proof}<CR>\end{proof}<UP><END>
iab tL \limits_{}<LEFT>
iab tIt \int\limits_{t_0}^{t_1}
iab tIT \int\limits_{0}^{T}
iab tF \frac{}{}<LEFT><LEFT><LEFT>
iab tN \|\|\|\|_2<LEFT><LEFT><LEFT><LEFT>
iab t< \langle
iab t> \rangle
iab t+ ^{+}
iab t- ^{-}

" }}}
" conceal support {{{
if has('conceal')
  " may be adgms
  let g:tex_conceal="adgm"
  set conceallevel=2
  "  highlight! link Conceal texMathSymbol
endif
" }}}
" colors - highlight {{{
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

"highlight! link Conceal texMathSymbol

" }}}
