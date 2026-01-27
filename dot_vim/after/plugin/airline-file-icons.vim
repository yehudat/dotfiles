if !exists('g:loaded_airline') | finish | endif
if !exists('*WebDevIconsGetFileTypeSymbol') | finish | endif

" Ensure glyph mode is on
let g:airline_powerline_fonts = 1

" Append icon near filetype section (X)
if !exists('g:airline_section_x')
  let g:airline_section_x = ''
  endif

  " Add icon + filetype (keeps your existing section_x content)
  let g:airline_section_x = g:airline_section_x . ' %{WebDevIconsGetFileTypeSymbol()} %{&filetype}'

