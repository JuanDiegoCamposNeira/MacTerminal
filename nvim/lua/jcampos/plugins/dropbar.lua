-- VSCode-style breadcrumb bar (winbar) showing path + symbol context.
-- Requires Neovim 0.10+.
return {
	"Bekaboo/dropbar.nvim",
	version = "*",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		bar = {
			enable = function(buf, win, _)
				if
					not vim.api.nvim_buf_is_valid(buf)
					or not vim.api.nvim_win_is_valid(win)
					or vim.fn.win_gettype(win) ~= ""
					or vim.wo[win].diff
					or vim.api.nvim_win_get_config(win).zindex
				then
					return false
				end
				local ft = vim.bo[buf].filetype
				local skip = { "snacks_dashboard", "snacks_layout_box", "alpha", "lazy", "mason", "TelescopePrompt" }
				return not vim.tbl_contains(skip, ft)
			end,
		},
	},
	keys = {
		{
			"<leader>;",
			function()
				require("dropbar.api").pick()
			end,
			desc = "Pick breadcrumb (dropbar)",
		},
	},
}
