" Global indentation policy: 4 spaces = 1 indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

augroup EnforceFourSpaces
  autocmd!
  autocmd FileType * setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
augroup END

augroup MakefileTabs
  autocmd!
  autocmd FileType make setlocal noexpandtab
augroup END
