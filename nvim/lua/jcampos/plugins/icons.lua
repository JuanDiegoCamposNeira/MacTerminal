-- Make mini.icons the single source of truth for filetype icons.
-- Other plugins (bufferline, lualine, trouble, ...) still declare
-- `nvim-web-devicons` as a dep; the mock makes them transparently
-- read from mini.icons instead.
return {
	{
		"nvim-mini/mini.icons",
		lazy = false,
		opts = {},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
}
