require("nvim-treesitter").setup({
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",
		"yaml",
		"bash",
		"go",
		"gomod",
		"gosum",
		"gowork",
	},
	highlight = { enable = true },
})
