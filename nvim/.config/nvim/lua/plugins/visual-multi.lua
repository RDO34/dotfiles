-- ~/.config/nvim/lua/plugins/visual-multi.lua
return {
  {
    "mg979/vim-visual-multi",
    branch = "master", -- make sure to use the main branch
    init = function()
      -- Optional: tweak keybindings to be VS Code / Sublime-like
      -- vim.g.VM_maps = {
      --   ["Find Under"] = "<C-d>", -- select next occurrence
      --   ["Find Subword Under"] = "<C-d>", -- same as above but for part of a word
      --   ["Select All"] = "<C-a>", -- select all occurrences
      --   ["Skip Region"] = "<C-x>", -- skip current
      --   ["Remove Region"] = "<C-p>", -- go back to previous
      -- }

      -- Optional UI tweaks
      vim.g.VM_theme = "purplegray" -- or "ocean", "neon", etc.
      vim.g.VM_show_warnings = 0
    end,
  },
}
