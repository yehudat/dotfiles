# Vim to Neovim/NvChad Mapping Reference

This document maps your original vimrc keybindings to their Neovim equivalents.

## Plugin Equivalents

| Vim Plugin | Neovim Equivalent | Notes |
|------------|-------------------|-------|
| vim-airline | NvChad statusline | Built into NvChad |
| vim-devicons | nvim-web-devicons | Built into NvChad |
| NERDTree | nvim-tree.lua | Similar functionality |
| NERDCommenter | Comment.nvim | Different keybindings |
| CtrlP | telescope.nvim | More features |
| vim-gitgutter | gitsigns.nvim | Same keybindings preserved |
| Tagbar | outline.nvim | Similar functionality |
| vim-surround | nvim-surround | Same commands |
| vim-autoclose | nvim-autopairs | Automatic |
| indentLine | indent-blankline.nvim | Similar |
| vim-easy-align | vim-easy-align | Same plugin |
| vim-fugitive | vim-fugitive | Same plugin |
| vim-test | neotest | Different API |
| matchit | vim-matchup | Enhanced version |
| vim-polyglot | treesitter | Better parsing |
| vim-dirdiff | diffview.nvim | More features |
| SimpylFold | treesitter folding | Built-in |
| copilot.vim | copilot.vim | Same plugin |
| PaperColor | one_light | Similar light theme |

## Keybinding Changes

### File/Buffer Navigation

| Vim | Neovim | Action |
|-----|--------|--------|
| `<Leader>ff` | `<Leader>ff` | Find files (CtrlP → Telescope) |
| `<Leader>fb` | `<Leader>fb` | Find buffers |
| `<Leader>ft` | `<Leader>ft` | Find tags |
| `:MRU` | `<Leader>fo` | Recent files (oldfiles) |
| `<Leader>bd` | `<Leader>bd` | Delete buffer |
| `<Leader>bn` | `<Leader>bn` | Next buffer |
| - | `<Leader>bp` | Previous buffer (new) |
| - | `<Leader>fg` | Live grep (new) |

### Git (Gitsigns)

| Vim | Neovim | Action |
|-----|--------|--------|
| `]h` | `]h` | Next hunk |
| `[h` | `[h` | Previous hunk |
| `<Leader>ha` | `<Leader>ha` | Stage hunk |
| `<Leader>hr` | `<Leader>hr` | Reset/undo hunk |
| `<Leader>hv` | `<Leader>hv` | Preview hunk |
| - | `<Leader>hb` | Blame line (new) |

### File Tree

| Vim | Neovim | Action |
|-----|--------|--------|
| `<Leader>nt` | `<Leader>nt` | Toggle file tree |
| - | `<Leader>nf` | Focus file tree (new) |

### Tags/Symbols

| Vim | Neovim | Action |
|-----|--------|--------|
| `<C-d>` | `<C-d>` | Go to tag definition |
| `<M-t>` | `<M-t>` | Toggle Tagbar/Outline |

### Alignment

| Vim | Neovim | Action |
|-----|--------|--------|
| `<Leader>ea` | `<Leader>ea` | EasyAlign (visual/normal) |

### Comments (PRESERVED)

| Vim (NERDCommenter) | Neovim (Comment.nvim) | Action |
|---------------------|----------------------|--------|
| `<Leader>cc` | `<Leader>cc` | Toggle line comment |
| Visual `<Leader>cc` | `<Leader>cc` | Toggle selection comment |
| - | `gcc` | Default Comment.nvim (also works) |

### Testing (CHANGED)

| Vim (vim-test) | Neovim (neotest) | Action |
|----------------|------------------|--------|
| `<Leader>tn` | `<Leader>tn` | Test nearest |
| `<Leader>tf` | `<Leader>tf` | Test file |
| `<Leader>ts` | `<Leader>ts` | Test suite |
| `<Leader>tl` | `<Leader>tl` | Test last |
| `<Leader>tv` | `<Leader>tv` | Test visit/output |

### Indent Lines

| Vim | Neovim | Action |
|-----|--------|--------|
| `<Leader>il` | `<Leader>il` | Toggle indent lines |

### Diff Mode

| Vim | Neovim | Action |
|-----|--------|--------|
| `<Leader>iw` | `<Leader>iw` | Ignore whitespace |
| `<Leader>ic` | `<Leader>ic` | Ignore case |
| `dg` | `dg` | Diffget from left |
| `dl` | `dl` | Diffget from right |
| `:DirDiff` | `<Leader>dv` | Open diffview |
| - | `<Leader>dc` | Close diffview (new) |
| - | `<Leader>dh` | File history (new) |

### Utilities

| Vim | Neovim | Action |
|-----|--------|--------|
| `<Leader>cd` | `<Leader>cd` | CD to file directory |
| `<Leader>fp` | `<Leader>fp` | Copy file path |
| `<Leader>mw` | `<Leader>mw` | Remove Windows ^M |
| `<Leader>ft` | `<Leader>rt` | Retab (CHANGED - conflict) |
| `<M-i>` | `<M-i>` | Reindent file |
| `<Leader>hc` | `<Leader>hc` | Toggle list chars |

### Surround (same commands)

| Command | Action |
|---------|--------|
| `ys<motion><char>` | Add surround |
| `cs<old><new>` | Change surround |
| `ds<char>` | Delete surround |

## NvChad Default Mappings

NvChad adds useful defaults you may want to learn:

| Mapping | Action |
|---------|--------|
| `<Leader>th` | Change theme |
| `<Leader>ch` | Cheatsheet |
| `<C-n>` | Toggle NvimTree |
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<Leader>x` | Close buffer |
| `<Leader>/` | Toggle comment |
| `<Leader>h` | Horizontal terminal |
| `<Leader>v` | Vertical terminal |

## Known Conflicts

1. **`<Leader>ft`**: In vimrc this was mapped to both CtrlPTag and retab.
   - Neovim: `<Leader>ft` = Find tags, `<Leader>rt` = Retab

## First-Time Setup

1. Apply with chezmoi: `chezmoi apply`
2. Open neovim: `nvim`
3. Wait for lazy.nvim to install plugins
4. Run `:MasonInstallAll` for LSP servers
5. Run `:Lazy sync` to update plugins
