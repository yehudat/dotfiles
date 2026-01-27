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
  \ 'Unknown'   : ''
  \ }

function! s:NerdTreeGitColors() abort
  highlight! NERDTreeGitStatusModified  ctermfg=1  guifg=#8B0000
  highlight! NERDTreeGitStatusStaged    ctermfg=2  guifg=#00A651
  highlight! NERDTreeGitStatusUntracked ctermfg=9  guifg=#8B0000
  highlight! NERDTreeGitStatusRenamed   ctermfg=3  guifg=#7B3F00
  highlight! NERDTreeGitStatusDeleted   ctermfg=9  guifg=#E00032
  highlight! NERDTreeGitStatusDirty     ctermfg=3  guifg=#7B3F00
endfunction

call s:NerdTreeGitColors()

augroup nerdtree_git_colors
  autocmd!
  autocmd ColorScheme * call s:NerdTreeGitColors()
  autocmd FileType nerdtree call s:NerdTreeGitColors()
augroup END
