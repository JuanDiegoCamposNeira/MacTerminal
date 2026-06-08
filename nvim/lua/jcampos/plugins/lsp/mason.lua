return {
  -- 1. Target the core mason plugin already used by LazyVim
  "mason-org/mason.nvim",
  
  -- 2. Pull in your extra installer package safely as a dependency
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  
  -- 3. Use opts to modify LazyVim's default layout instead of rewriting config
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
  
  -- 4. Set up your extra installer inside a clean configuration step
  config = function(_, opts)
    -- Run LazyVim's internal setup first using your custom UI icons
    require("mason").setup(opts)

    -- Configure your extra tools installer 
    local mason_tool_installer = require("mason-tool-installer")
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",    -- prettier formatter
        "stylua",      -- lua formatter
        "isort",       -- python formatter
        "black",       -- python formatter
        "pylint",
        "eslint_d",
      },
    })
  end,
}