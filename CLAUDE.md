# Chezmoi Dotfiles Repository

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Commit Convention

- Format: `[tag] brief description`
- Tag: lowercase tool/config name (e.g., `vim`, `zsh`, `code`, `git`, `brew`)
- Description: max 6 words, lowercase, no period
- Make atomic commits - one feature/fix per commit

Examples:
```
[vim] add plugin and fold config
[code] fix keybindings whitespace
[zsh] add network list alias
[email] add neomutt mbsync msmtp config
```

## Repository Structure

- `dot_*` - Dotfiles (becomes `~/.filename`)
- `private_dot_*` - Private dotfiles with restricted permissions
- `dot_config/` - XDG config directory (`~/.config/`)
- `dot_vscode/` - VSCode user config (`~/.vscode/`)
- `private_Library/` - macOS Library files
- `run_once_*.sh.tmpl` - One-time setup scripts
- `symlink_*` - Symlink targets
- `empty_*` - Empty placeholder files

## Tool Tags

| Tag | Description |
|-----|-------------|
| `vim` | Vim/Neovim configuration |
| `code` | VSCode settings, keybindings, extensions |
| `zsh` | Zsh shell configuration |
| `git` | Git configuration |
| `brew` | Homebrew Brewfile |
| `starship` | Starship prompt |
| `iterm` | iTerm2 settings |
| `chezmoi` | Chezmoi-specific files |
| `email` | Email clients (neomutt, mbsync, msmtp) |
| `ssh` | SSH configuration |

## Workflow

1. Edit files in this repo (chezmoi source)
2. Review changes: `chezmoi diff`
3. Apply changes: `chezmoi apply`
4. Commit atomically per feature/tool
