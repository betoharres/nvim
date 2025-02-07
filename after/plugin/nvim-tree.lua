local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = false, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set('n', '<Tab>', ':tabnext<CR>')
	-- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end 

require("nvim-tree").setup({
	on_attach = my_on_attach,
  actions = {
    open_file = {
      quit_on_open = true, -- closes the tree when you open a file
    },
  },
})
vim.keymap.set('n', '<C-n>', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>n', vim.cmd.NvimTreeFindFile)
