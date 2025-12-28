" Fugitive: keep :G status window small
augroup FugitiveStatusResize
  autocmd!
  autocmd FileType fugitive
    \ if exists('b:fugitive_type') && b:fugitive_type ==# 'index' |
    \   execute 'resize 10' |
    \ endif
augroup END
