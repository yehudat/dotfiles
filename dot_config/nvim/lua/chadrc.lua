---@type ChadrcConfig
local M = {}

-- Theme (closest to PaperColor)
M.base46 = {
  theme = "one_light",  -- light theme similar to PaperColor
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    -- Match your vim diff colors
    DiffAdd = { bg = "#bada9f" },
    DiffChange = { bg = "#e5d5ac" },
    DiffDelete = { fg = "#ff8080", bg = "#ffb0b0" },
    DiffText = { bg = "#8cbee2" },
    NonText = { fg = "gray25" },
  },
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "round",
    -- Match airline section Z: %p%% Ln:%l/Cn:%v
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "cwd" },
  },
  tabufline = {
    enabled = true,
    lazyload = false,
  },
}

M.nvdash = {
  load_on_startup = false,
}

return M
