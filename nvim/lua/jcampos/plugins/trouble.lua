return {
	"folke/trouble.nvim",

	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },

	cmd = "Trouble",

	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
		{ "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Open trouble workspace diagnostics" },
		{ "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
		{ "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Open todos in trouble" },
	},
}
