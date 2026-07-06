-- lua/config/transparent.lua
local transparent_groups = {
  -- core
  "Normal",
  "NormalNC",
  "SignColumn",
  "LineNr",
  "FoldColumn",
  "CursorLine",
  "CursorLineNr",
  "EndOfBuffer",

  -- floats & borders
  "NormalFloat",
  "FloatBorder",
  "FloatTitle",

  -- menus & popups
  "Pmenu",
  "PmenuSel",
  "PmenuSbar",
  "PmenuThumb",

  -- telescope
  "TelescopeNormal",
  "TelescopeBorder",

  -- which-key
  "WhichKeyNormal",
  "WhichKeyFloat",

  -- lazy/mason/noice (common in LazyVim stacks)
  "LazyNormal",
  "MasonNormal",
  "NoicePopup",
  "NoiceCmdlinePopup",

  -- cmp (falls back to Pmenu but some themes define these)
  "CmpPmenu",
  "CmpPmenuBorder",

  -- neo-tree (file explorer used by LazyVim)
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeFloatNormal",
  "NeoTreeFloatBorder",
}

local function clear_bg()
  for _, group in ipairs(transparent_groups) do
    -- safe even if group doesn't exist
    pcall(vim.api.nvim_set_hl, 0, group, { bg = "none", ctermbg = "none" })
  end
end

-- run now (for first load)
clear_bg()

-- and again every time colorscheme changes (themes re-apply highlights)
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("ForceTransparentBG", { clear = true }),
  callback = clear_bg,
})
