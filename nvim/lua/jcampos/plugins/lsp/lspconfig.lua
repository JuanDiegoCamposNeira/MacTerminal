return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

				opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		-- 1. Modern LazyVim automatically injects capabilities via blink.cmp.
		-- We can fetch the capabilities using standard Neovim native methods.
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-------------------------------------------------------------
		-- Change the Diagnostic symbols in the sign column (gutter)
		-------------------------------------------------------------
		local severity = vim.diagnostic.severity

		vim.diagnostic.config({
			signs = {
				text = {
					[severity.ERROR] = "",
					[severity.WARN] = "",
					[severity.HINT] = "⚑",
					[severity.INFO] = "",
				},
			},
		})

		-------------------------------------------------------------
		-- LSP CONFIG
		-------------------------------------------------------------
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "emmet_ls", "graphql" },
			handlers = {
				-- The first entry (without a key) is the default handler
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- Next, target specific servers
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
									disable = { "missing-fields" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,

				["emmet_ls"] = function()
					require("lspconfig").emmet_ls.setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				end,

				["graphql"] = function()
					require("lspconfig").graphql.setup({
						capabilities = capabilities,
						filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
					})
				end,
			},
		})
	end,
}
