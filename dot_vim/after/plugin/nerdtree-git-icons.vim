" nerdtree-git-plugin: don't show [flags] wrappers
let g:NERDTreeGitStatusWithFlags = 0

" nerdtree-git-plugin — custom git status glyphs
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ 'Modified'  : '',
  \ 'Staged'    : '',
  \ 'Untracked' : '',
  \ 'Renamed'   : '󰜴',
  \ 'Deleted'   : '',
  \ 'Dirty'     : '',
  \ 'Clean'     : '󰈸',
  \ 'Ignored'   : '',
  \ 'Unmerged'  : '󰀦',
  \ 'Unknown'   : ''
  \ }

function! s:NerdTreeGitColors() abort
  highlight! NERDTreeGitStatusUntracked ctermfg=1 ctermbg=NONE   " red
  highlight! NERDTreeGitStatusDirty     ctermfg=1 ctermbg=NONE   " red
  highlight! NERDTreeGitStatusStaged    ctermfg=2 ctermbg=NONE   " green
  highlight! NERDTreeGitStatusModified  ctermfg=3 ctermbg=NONE   " yellow
  highlight! NERDTreeGitStatusRenamed   ctermfg=6 ctermbg=NONE   " cyan
  highlight! NERDTreeGitStatusDeleted   ctermfg=1 ctermbg=NONE   " red  guifg=#7B3F00
  highlight! NERDTreeGitStatusUnmerged  ctermfg=9 cterm=bold
endfunction

call s:NerdTreeGitColors()

augroup nerdtree_git_colors
  autocmd!
  autocmd ColorScheme * call s:NerdTreeGitColors()
  autocmd FileType nerdtree call s:NerdTreeGitColors()
augroup END
