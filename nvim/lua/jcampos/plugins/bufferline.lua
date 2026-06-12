return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer", -- This changes the title text over NvimTree
					separator = true,
					text_align = "left",
				},
			},
			mode = "tabs",
			diagnostics = "nvim_lsp",
			separator_style = "slant",
		},
	},
}
