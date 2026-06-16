return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"mason-org/mason-lspconfig.nvim", -- must load before lspconfig handlers run
		"saghen/blink.cmp", -- needed to build enhanced capabilities
	},

	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- Navigation (gd, gD, gr, gI, gy) are handled by snacks.lua pickers

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		-- Pull capabilities from blink.cmp (LazyVim's completion engine)
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "⚑",
					[vim.diagnostic.severity.INFO] = "",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"emmet_ls",
				"graphql",
				"vtsls", -- TypeScript / JavaScript / React
				"pyright", -- Python / Django (type checking)
				"ruff", -- Python linting + formatting diagnostics
				"html",
				"cssls",
				"tailwindcss",
			},

			handlers = {
				-- Default handler for any server not listed below
				function(server_name)
					lspconfig[server_name].setup({ capabilities = capabilities })
				end,

				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
									disable = { "missing-fields" },
								},
								completion = { callSnippet = "Replace" },
							},
						},
					})
				end,

				["emmet_ls"] = function()
					lspconfig.emmet_ls.setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"htmldjango", -- Django templates
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
					lspconfig.graphql.setup({
						capabilities = capabilities,
						filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
					})
				end,

				["pyright"] = function()
					lspconfig.pyright.setup({
						capabilities = capabilities,
						settings = {
							pyright = {
								disableOrganizeImports = true, -- Let Ruff organize imports
							},
							python = {
								analysis = {
									typeCheckingMode = "basic",
									autoSearchPaths = true,
									useLibraryCodeForTypes = true,
									diagnosticMode = "openFilesOnly",
								},
							},
						},
					})
				end,

				["ruff"] = function()
					lspconfig.ruff.setup({
						capabilities = capabilities,
						on_init = function(client, _)
							client.server_capabilities.hoverProvider = false
						end,
					})
				end,

				["tailwindcss"] = function()
					lspconfig.tailwindcss.setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"htmldjango",
							"css",
							"scss",
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"svelte",
						},
						settings = {
							tailwindCSS = {
								-- Teach Tailwind to treat Django templates as HTML
								includeLanguages = { htmldjango = "html" },
							},
						},
					})
				end,
			},
		})
	end,
}
