return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			offsets = {
				{
					filetype = "snacks_layout_box",
					text = "File Explorer",
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
