return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  
  -- 1. Use keys/init for custom shortcuts so they don't break config
  init = function()
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,

  -- 2. Pass your options inside the opts table instead of a config function
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      liquid = { "prettier" },
      lua = { "stylua" },
      python = { "isort", "black" },
    },

    -- format_on_save = {
    --   lsp_fallback = true,
    --   async = false,
    --   timeout_ms = 1000,
    -- },
  },
}