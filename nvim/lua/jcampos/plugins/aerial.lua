-- VSCode-style symbols outline panel on the right.
return {
	"stevearc/aerial.nvim",
	version = "*",
	cmd = { "AerialToggle", "AerialOpen", "AerialNavToggle" },
	keys = {
		{ "<leader>a", "<cmd>AerialToggle!<cr>", desc = "Toggle outline (aerial)" },
		{ "<leader>A", "<cmd>AerialNavToggle<cr>", desc = "Outline nav (aerial)" },
		{ "{", "<cmd>AerialPrev<cr>", desc = "Prev symbol (aerial)" },
		{ "}", "<cmd>AerialNext<cr>", desc = "Next symbol (aerial)" },
	},
	opts = {
		backends = { "lsp", "treesitter", "markdown", "man" },
		layout = {
			default_direction = "right",
			min_width = 28,
		},
		attach_mode = "global",
		filter_kind = false,
		show_guides = true,
		guides = {
			mid_item = "├ ",
			last_item = "└ ",
			nested_top = "│ ",
			whitespace = "  ",
		},
	},
}
