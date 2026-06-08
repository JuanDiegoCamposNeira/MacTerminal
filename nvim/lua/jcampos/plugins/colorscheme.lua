return {
  -- 1. Catppuccin (Includes your favorite Frappe flavor)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000
  },

  -- 2. Everforest (Soft, organic warm palette)
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- This makes the background softer and lighter!
      vim.g.everforest_background = "medium" -- Options: "soft", "medium", "hard"
    end
  },

  -- 3. Rosé Pine (Warm pastel tones)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000
  },

  -- 4. Tokyo Night (Includes the 'moon' flavor)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000
  },

  -- Configure LazyVim to start with catppuccin-frappe
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
}
