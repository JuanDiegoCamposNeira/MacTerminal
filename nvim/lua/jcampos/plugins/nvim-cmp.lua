-- LazyVim uses blink.cmp as its completion engine; nvim-cmp is no longer active.
-- This file configures blink.cmp to match the keymaps from the previous nvim-cmp setup.
return {
	"saghen/blink.cmp",
	opts = {
		keymap = {
			preset = "default",
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
		completion = {
			-- Don't auto-select the first item (mirrors nvim-cmp's select = false)
			list = {
				selection = { preselect = false },
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},
	},
}
