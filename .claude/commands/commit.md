Review all git changes (staged, unstaged, untracked) and commit them incrementally.

## Instructions

1. Run `git status` and `git diff` to see all changes
2. Group related changes by tool/feature
3. For each group, create an atomic commit with format: `[tag] brief description`
   - Tag: lowercase tool name (vim, code, zsh, git, brew, email, etc.)
   - Description: max 6 words, lowercase, no period
4. Stage only the files for each atomic commit
5. Commit each group separately before moving to the next

## Example commits
- `[vim] add plugin and fold config`
- `[code] fix keybindings whitespace`
- `[email] add neomutt mbsync msmtp config`

## Process
1. List all changes with brief description
2. Propose grouping and commit order
3. Execute commits one by one
4. Show final `git log --oneline -n N` where N = number of commits made
