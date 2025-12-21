return {
  -- Treesitter (replaces vim-polyglot, provides better syntax)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css", "json", "yaml",
        "python", "bash", "markdown", "markdown_inline", "xml",
        "c", "cpp", "verilog", "systemverilog",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- Git signs (replaces vim-gitgutter)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      max_file_length = 500,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = vim.keymap.set
        local opts = { buffer = bufnr }

        -- Navigation (matching vimrc ]h [h)
        map("n", "]h", gs.next_hunk, opts)
        map("n", "[h", gs.prev_hunk, opts)

        -- Actions (matching vimrc <Leader>ha, hr, hv)
        map("n", "<leader>ha", gs.stage_hunk, opts)
        map("n", "<leader>hr", gs.reset_hunk, opts)
        map("n", "<leader>hv", gs.preview_hunk, opts)
        map("n", "<leader>hb", gs.blame_line, opts)
      end,
    },
  },

  -- Nvim-tree (replaces NERDTree)
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
      renderer = {
        highlight_git = true,
        icons = { show = { git = true } },
      },
    },
  },

  -- Telescope (replaces CtrlP)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    opts = function()
      return require("configs.telescope")
    end,
  },

  -- Comment.nvim (replaces NERDCommenter) - already in NvChad
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {},
  },

  -- Surround (replaces vim-surround)
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- Autopairs (replaces vim-autoclose) - already in NvChad
  {
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },

  -- Easy align (same plugin works in neovim)
  {
    "junegunn/vim-easy-align",
    event = "VeryLazy",
  },

  -- Indent blank line (replaces indentLine) - already in NvChad
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = { char = "│" },
      scope = { enabled = true },
    },
  },

  -- Tagbar replacement - symbols outline
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    opts = {},
  },

  -- Fugitive (git wrapper - same plugin)
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiff", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
  },

  -- Neotest (replaces vim-test)
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python"),
        },
      })
    end,
  },

  -- Copilot
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },

  -- Matchup (replaces matchit)
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Indent object (same plugin)
  {
    "michaeljsmith/vim-indent-object",
    event = "VeryLazy",
  },

  -- Diffview (replaces vim-dirdiff)
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  },

  -- MRU via Telescope oldfiles
  -- (built into telescope)

  -- Airline theme replacement - handled by NvChad statusline

  -- Devicons - already in NvChad

  -- Tmux integration (seamless pane navigation)
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<CR>" },
      { "<C-j>", "<cmd>TmuxNavigateDown<CR>" },
      { "<C-k>", "<cmd>TmuxNavigateUp<CR>" },
      { "<C-l>", "<cmd>TmuxNavigateRight<CR>" },
    },
  },
}
