require("oil").setup({
	-- Id is automatically added at the beginning, and name at the end
	-- See :help oil-columns
	columns = {
		"icon",
		-- "permissions",
		"size",
		"mtime",
	},
  keymaps = {
    ["q"] = { "actions.close", mode = "n" },
  },
})
vim.keymap.set('n', '-', ':Oil --float<CR>')
