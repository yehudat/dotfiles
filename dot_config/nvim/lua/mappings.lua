require("nvchad.mappings")

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Remove default NvChad mappings that conflict
-- (uncomment if needed)
-- nomap("n", "<leader>ff")

--------------------------------------------------------------------------------
-- File/Buffer navigation (matching CtrlP from vimrc)
--------------------------------------------------------------------------------
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files (MRU)" })
map("n", "<leader>ft", "<cmd>Telescope tags<CR>", { desc = "Find tags" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })

-- Buffer management (matching vimrc)
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Buffer delete" })
map("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Buffer next" })
map("n", "<leader>bp", "<cmd>bp<CR>", { desc = "Buffer prev" })

--------------------------------------------------------------------------------
-- NvimTree (matching NERDTree from vimrc)
--------------------------------------------------------------------------------
map("n", "<leader>nt", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>nf", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

--------------------------------------------------------------------------------
-- Ctags navigation (matching vimrc <C-d> for go to definition)
--------------------------------------------------------------------------------
map("n", "<C-d>", "<C-]>", { desc = "Go to tag definition" })

--------------------------------------------------------------------------------
-- Symbols Outline (matching Tagbar from vimrc)
--------------------------------------------------------------------------------
map("n", "<M-t>", "<cmd>Outline<CR>", { desc = "Toggle Outline (Tagbar)" })

--------------------------------------------------------------------------------
-- Git (gitsigns mappings are in plugins/init.lua on_attach)
-- These match vimrc: ]h [h <Leader>ha hr hv
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- EasyAlign (matching vimrc)
--------------------------------------------------------------------------------
map("x", "<leader>ea", "<Plug>(EasyAlign)", { desc = "EasyAlign" })
map("n", "<leader>ea", "<Plug>(EasyAlign)", { desc = "EasyAlign" })

--------------------------------------------------------------------------------
-- IndentLine toggle (matching vimrc)
--------------------------------------------------------------------------------
map("n", "<leader>il", "<cmd>IBLToggle<CR>", { desc = "Toggle indent lines" })

--------------------------------------------------------------------------------
-- Test mappings (matching vim-test from vimrc)
--------------------------------------------------------------------------------
map("n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Test nearest" })
map("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Test file" })
map("n", "<leader>ts", function() require("neotest").run.run({ suite = true }) end, { desc = "Test suite" })
map("n", "<leader>tl", function() require("neotest").run.run_last() end, { desc = "Test last" })
map("n", "<leader>tv", function() require("neotest").output.open({ enter = true }) end, { desc = "Test output" })

--------------------------------------------------------------------------------
-- Diff options (matching vimrc)
--------------------------------------------------------------------------------
map("n", "<leader>iw", "<cmd>set diffopt+=iwhite<CR>", { desc = "Diff ignore whitespace" })
map("n", "<leader>ic", "<cmd>set diffopt+=icase<CR>", { desc = "Diff ignore case" })
map("n", "dg", "<cmd>diffget 1<CR>", { desc = "Diff get from left" })
map("n", "dl", "<cmd>diffget 3<CR>", { desc = "Diff get from right" })

--------------------------------------------------------------------------------
-- Utility mappings (matching vimrc)
--------------------------------------------------------------------------------
-- Change directory to current file
map("n", "<leader>cd", "<cmd>cd %:p:h<CR><cmd>pwd<CR>", { desc = "CD to file dir" })

-- Copy full path to clipboard
map("n", "<leader>fp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  print("Copied: " .. vim.fn.expand("%:p"))
end, { desc = "Copy file path" })

-- Remove Windows ^M
map("n", "<leader>mw", [[mmHmt:%s/<C-V><CR>/\r/ge<CR>'tzt'm]], { desc = "Remove Windows ^M" })

-- Retab (note: conflicts with <leader>ft for tags in vimrc - using <leader>rt)
map("n", "<leader>rt", "<cmd>retab<CR>", { desc = "Retab buffer" })

-- Reindent file
map("n", "<M-i>", "mzgg=G`z", { desc = "Reindent file" })

-- Toggle list chars (matching vimrc <Leader>hc)
map("n", "<leader>hc", "<cmd>set list!<CR>", { desc = "Toggle list chars" })

--------------------------------------------------------------------------------
-- Comment.nvim (NERDCommenter equivalent)
-- Matching vimrc: <Leader>cc to toggle
--------------------------------------------------------------------------------
map("n", "<leader>cc", function() require("Comment.api").toggle.linewise.current() end, { desc = "Toggle comment" })
map("v", "<leader>cc", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment" })

--------------------------------------------------------------------------------
-- Surround.nvim (vim-surround equivalent)
-- Same commands: ys, cs, ds + text object
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Copilot (if you need custom mappings)
--------------------------------------------------------------------------------
-- Default mappings should work, but you can customize here

--------------------------------------------------------------------------------
-- Diffview (vim-dirdiff replacement)
--------------------------------------------------------------------------------
map("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", { desc = "Diffview open" })
map("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "Diffview close" })
map("n", "<leader>dh", "<cmd>DiffviewFileHistory %<CR>", { desc = "File history" })
