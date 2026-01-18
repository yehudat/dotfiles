# ~/.config/qutebrowser/config.py
#
# Vim-motion-first qutebrowser configuration (macOS-friendly).
# Goals:
# - Strong Normal/Insert discipline
# - hjkl-centric navigation
# - Tabs behave like buffers
# - Minimal UI noise
# - Automatically punt Google Workspace URLs to Chrome (you won't use them in qute)

import re
import subprocess
from qutebrowser.api import interceptor

config.load_autoconfig(False)

# -----------------------------
# Fonts: "terminal-like" defaults
# -----------------------------
NERDFONT = 'JetBrainsMono Nerd Font'

c.fonts.default_family = NERDFONT
c.fonts.default_size = '14pt'
c.fonts.hints = f'bold 14pt {NERDFONT}'

c.fonts.statusbar = NERDFONT
c.fonts.tabs.selected = f'bold 14pt {NERDFONT}'
c.fonts.tabs.unselected = f'14pt {NERDFONT}'
c.fonts.prompts = NERDFONT
c.fonts.messages.info = NERDFONT
c.fonts.messages.warning = NERDFONT
c.fonts.messages.error = NERDFONT

# Readability baseline
c.zoom.default = '110%'

# -----------------------------
# UI / minimalism
# -----------------------------
c.statusbar.show = 'always'
c.colors.statusbar.normal.bg = '#2e3440'
c.colors.statusbar.normal.fg = '#eceff4'
c.colors.statusbar.insert.bg = '#a3be8c'
c.colors.statusbar.insert.fg = '#2e3440'
c.colors.statusbar.command.bg = '#5e81ac'
c.colors.statusbar.command.fg = '#eceff4'
c.colors.statusbar.caret.bg = '#b48ead'
c.colors.statusbar.caret.fg = '#eceff4'

c.scrolling.smooth = False
c.scrolling.bar = 'never'
c.tabs.show = 'multiple'
c.completion.height = '30%'
c.completion.shrink = True
c.content.autoplay = False

# -----------------------------
# Vim-like mode discipline
# -----------------------------
c.input.insert_mode.auto_enter = True
c.input.insert_mode.auto_load = True

# Esc reliably leaves any non-normal mode
config.bind('<Escape>', 'mode-leave', mode='insert')
config.bind('<Escape>', 'mode-leave', mode='caret')
config.bind('<Escape>', 'mode-leave', mode='command')
config.bind('<Escape>', 'mode-leave', mode='hint')

# -----------------------------
# Hints: home-row friendly
# -----------------------------
c.hints.chars = 'asdfghjkl'
c.hints.mode = 'letter'
c.hints.auto_follow = 'unique-match'

# -----------------------------
# Search: Vim semantics
# -----------------------------
c.search.wrap = True
c.search.incremental = True
config.bind('/', 'cmd-set-text /')
config.bind('?', 'cmd-set-text ?')

# -----------------------------
# Remove arrow keys (force hjkl)
# -----------------------------
config.bind('<Up>', 'nop')
config.bind('<Down>', 'nop')
config.bind('<Left>', 'nop')
config.bind('<Right>', 'nop')

# -----------------------------
# History + tabs as buffers
# -----------------------------
config.bind('<Ctrl-[>', 'back')
config.bind('<Ctrl-]>', 'forward')
config.bind('<Ctrl+6>', 'undo') # restores last closed tab/window
config.bind('H', 'nop')
config.bind('L', 'nop')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('Ctrl-Shift-H', 'tab-move -')
config.bind('Ctrl-Shift-L', 'tab-move +')

config.bind('<Ctrl-w>', 'nop')
c.aliases['q'] = 'tab-close'
c.aliases['qa'] = 'quit'

config.bind('d', 'nop')
config.bind('s', 'nop')

# -----------------------------
# Vim scrolling / paging
# -----------------------------
config.bind('<Ctrl-d>', 'nop')
config.bind('<Ctrl-u>', 'nop')
config.bind('{', 'scroll-page 0 -0.5')
config.bind('}', 'scroll-page 0 0.5')

config.bind('gg', 'scroll-to-perc 0')
config.bind('G',  'scroll-to-perc 100')

# -----------------------------
# Caret mode as "visual mode"
# -----------------------------
config.bind('v', 'mode-enter caret')
config.bind('V', 'mode-enter caret ;; selection-toggle')

# Yank URL / title (Vim-ish)
config.bind('yy', 'yank')
config.bind('yt', 'yank title')

# -----------------------------
# Command-line ergonomics
# -----------------------------
config.bind(':', 'cmd-set-text :')
config.bind(';', 'cmd-set-text :')   # comment out if you dislike it
config.bind('<Ctrl-p>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl-n>', 'completion-item-focus next', mode='command')

# -----------------------------
# Downloads & files
# -----------------------------
c.downloads.position = 'bottom'
c.downloads.remove_finished = 15000

# -----------------------------
# Privacy-ish defaults (reasonable, not extreme)
# -----------------------------
c.content.cookies.accept = 'no-3rdparty'
c.content.geolocation = False
c.content.notifications.enabled = False

# -----------------------------
# External-app handoff: Google Workspace -> Chrome (robust)
# -----------------------------
# Intercept navigation to Google Workspace domains and open in Chrome instead.
GOOGLE_RE = re.compile(
    r'^https://('
    r'accounts\.google\.com|'
    r'mail\.google\.com|'
    r'docs\.google\.com|'
    r'drive\.google\.com|'
    r'calendar\.google\.com|'
    r'meet\.google\.com|'
    r'admin\.google\.com|'
    r'console\.cloud\.google\.com'
    r')(/|$)'
)

def _open_in_chrome(url: str) -> None:
    # If you'd prefer Chrome not to steal focus, add "-g" after "open".
    subprocess.Popen(["open", "-a", "Google Chrome", url])

@interceptor.register
def open_google_in_chrome(info: interceptor.Request) -> None:
    url = info.request_url.toString()
    if GOOGLE_RE.match(url):
        _open_in_chrome(url)
        info.block()

# Manual "punt to Chrome" for any page
config.bind(',gc', 'spawn -d open -a "Google Chrome" {url}')

# -----------------------------
# Quality-of-life
# -----------------------------
c.auto_save.session = True

# New tabs open next to current (buffer-local feel)
c.tabs.new_position.unrelated = 'next'
c.tabs.new_position.related = 'next'

# Keep focus when opening in background tabs
c.tabs.background = True
