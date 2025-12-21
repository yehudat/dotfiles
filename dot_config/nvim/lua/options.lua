require("nvchad.options")

local o = vim.opt
local g = vim.g

-- Leader key (matching vimrc)
g.mapleader = " "
g.maplocalleader = " "

-- Encoding
o.encoding = "utf-8"
o.fileencoding = "utf-8"

-- UI settings
o.number = true
o.ruler = true
o.showcmd = true
o.showmatch = true
o.matchtime = 2
o.showtabline = 2
o.laststatus = 2
o.wrap = false
o.textwidth = 0
o.visualbell = true
o.errorbells = false
o.termguicolors = true
o.guifont = "JetBrainsMonoNFM-Light:h12"
o.linespace = 0
o.lines = 90

-- Search settings
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true

-- Indentation (matching vimrc)
o.softtabstop = 4
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true
o.cindent = false

-- Backspace
o.backspace = "indent,eol,start"

-- History
o.history = 200

-- Backup and swap
o.backup = false
o.writebackup = true
o.swapfile = false

-- Update time for git signs
o.updatetime = 100

-- Folding (matching vimrc)
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = true
o.foldlevel = 99

-- List characters (matching vimrc)
o.listchars = { tab = "▸ ", nbsp = "␣", trail = "·", eol = "¶", precedes = "«", extends = "»" }

-- Ctags path (you may need to adjust this)
if vim.env.VERIF_PROJ_HOME then
  o.tags = vim.env.VERIF_PROJ_HOME .. "/.repo/tags"
end

-- Auto-save on leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.fn.expand("%") ~= "" then
      vim.cmd("update")
    end
  end,
})

-- Restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
})
