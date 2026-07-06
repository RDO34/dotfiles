-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.transparent")

-- transparent bg
-- vim.cmd([[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
-- ]])

-- ensure truecolor
vim.opt.termguicolors = true

-- force brighter numbers
vim.api.nvim_set_hl(0, "LineNr", { fg = "#B0B0B0" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFA500", bold = true })

-- newer Neovim versions have these too; harmless if absent
pcall(vim.api.nvim_set_hl, 0, "LineNrAbove", { fg = "#9A9A9A" })
pcall(vim.api.nvim_set_hl, 0, "LineNrBelow", { fg = "#9A9A9A" })

-- re-apply if a colorscheme resets highlights
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#B0B0B0" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFA500", bold = true })
    pcall(vim.api.nvim_set_hl, 0, "LineNrAbove", { fg = "#9A9A9A" })
    pcall(vim.api.nvim_set_hl, 0, "LineNrBelow", { fg = "#9A9A9A" })
  end,
})
