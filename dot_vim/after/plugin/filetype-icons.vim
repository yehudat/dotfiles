" ---- Filetype icons (vim-devicons) for DE/DV ----
if !exists('*WebDevIconsGetFileTypeSymbol')
  finish
endif

" Choose your glyphs
let s:ICON_SV = ''
let s:ICON_V = ''

" Extension-based icons (covers NERDTree, CtrlP, etc.)
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = get(g:, 'WebDevIconsUnicodeDecorateFileNodesExtensionSymbols', {})
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sv']  = s:ICON_SV
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svh'] = s:ICON_SV
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['v']   = s:ICON_V
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vh']  = s:ICON_V

" Filetype-based fallback (covers cases where extension mapping is not used)
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = get(g:, 'WebDevIconsUnicodeDecorateFileNodesExactSymbols', {})
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['systemverilog'] = s:ICON_SV
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['verilog']       = s:ICON_V

