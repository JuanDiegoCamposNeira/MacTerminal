return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- Last release is way too old and out of date
  build = ":TSUpdate",
  event = { "LazyFile", "BufReadPost", "BufNewFile" },
  dependencies = {
    -- LazyVim already includes nvim-ts-autotag natively in newer versions, 
    -- but keeping it here guarantees it runs with your settings!
    "windwp/nvim-ts-autotag",
  },
  -- Use opts instead of a config block to safely merge with LazyVim
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "prisma",
      "markdown",
      "markdown_inline",
      "svelte",
      "graphql",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
      "c",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
  -- Tell LazyVim how to apply the settings without using the old 'configs' module
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}