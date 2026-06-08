local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Import settings is:
	-- 1. LazyVim plugins
	-- 2. LazyVim Plugins Extras
	-- 3. My own plugins

	-- 1, LazyVim Core Plugins
	{ "LazyVim/LazyVim", import = "lazyvim.plugins" },

	{ import = "jcampos.plugins" },
	{ import = "jcampos.plugins.lsp" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
