-- Disable LazyVim defaults that are superseded by your own choices.
-- These plugins are imported by `LazyVim/LazyVim` but you've picked replacements:
--   * file explorer  -> snacks.explorer
--   * fuzzy picker   -> snacks.picker
--   * session mgr    -> auto-session
--   * indent guides  -> snacks.indent
return {
	{ "nvim-neo-tree/neo-tree.nvim", enabled = false },
	{ "ibhagwan/fzf-lua", enabled = false },
	{ "nvim-telescope/telescope.nvim", enabled = false },
	{ "folke/persistence.nvim", enabled = false },
	{ "lukas-reineke/indent-blankline.nvim", enabled = false },
}
