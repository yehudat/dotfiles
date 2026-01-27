"" Airline: show git branch + (ahead/behind/diverged) + stash count
"" Requires: git in PATH. Works best if you're in a git repo.

"if !exists('g:loaded_airline') | finish | endif

"" --- Choose glyphs (replace with your Starship glyphs) ---
"let s:glyph_ahead    = '⇡'
"let s:glyph_behind   = '⇣'
"let s:glyph_diverged = ''
"let s:glyph_stash    = '≡'

"" --- Helpers ---
"function! s:git_root() abort
  "let l:root = systemlist('git rev-parse --show-toplevel 2>/dev/null')
  "return (v:shell_error == 0 && len(l:root)) ? l:root[0] : ''
"endfunction

"function! s:git_ab_counts() abort
  "" returns: [ahead, behind], or ['',''] if unknown
  "let l:out = systemlist('git rev-list --left-right --count @{upstream}...HEAD 2>/dev/null')
  "if v:shell_error != 0 || empty(l:out) | return [0, 0] | endif
  "let l:parts = split(l:out[0])
  "if len(l:parts) != 2 | return [0, 0] | endif
  "return [str2nr(l:parts[0]), str2nr(l:parts[1])]
"endfunction

"function! s:git_stash_count() abort
  "let l:out = systemlist('git stash list 2>/dev/null | wc -l | tr -d " "')
  "return (v:shell_error == 0 && len(l:out)) ? str2nr(l:out[0]) : 0
"endfunction

"function! AirlineGitMetrics() abort
  "if empty(s:git_root()) | return '' | endif

  "let [l:ahead, l:behind] = s:git_ab_counts()
  "let l:stash = s:git_stash_count()

  "let l:s = ''

  "" diverged vs ahead/behind
  "if l:ahead > 0 && l:behind > 0
    "let l:s .= printf('%s%d/%d ', s:glyph_diverged, l:ahead, l:behind)
  "else
    "if l:ahead  > 0 | let l:s .= printf('%s%d ', s:glyph_ahead,  l:ahead)  | endif
    "if l:behind > 0 | let l:s .= printf('%s%d ', s:glyph_behind, l:behind) | endif
  "endif

  "if l:stash > 0
    "let l:s .= printf('%s%d ', s:glyph_stash, l:stash)
  "endif

  "return substitute(l:s, '\s\+$', '', '')
"endfunction

"" Put it next to branch (section B is usually the Git/branch area)
"if !exists('g:airline_section_b') || empty(g:airline_section_b)
  "let g:airline_section_b = '%{airline#extensions#branch#get_head()}'
"endif
"let g:airline_section_b .= ' %{AirlineGitMetrics()}'

