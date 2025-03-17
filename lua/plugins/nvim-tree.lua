local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set('n', '<Tab>', ":tabnext<CR>", opts('Tab next'))
	vim.keymap.set('n', 't', api.node.open.tab, opts('Open Tab'))
	vim.keymap.set('n', 'e', api.node.open.preview, opts('Preview'))
	vim.keymap.set('n', 'u', api.node.navigate.parent, opts('Help'))
	vim.keymap.set('n', 'r', api.fs.rename_full, opts('Help'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

return {
  { "nvim-tree/nvim-tree.lua", version = "*", lazy = false, dependencies = { "nvim-tree/nvim-web-devicons", }, 
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 40,
        },
        on_attach = my_on_attach,
        git = { ignore = false },
        filters = { dotfiles = false, custom = { '^.git$' } },
        actions = {
          open_file = {
            quit_on_open = true, -- closes the explorer when opening a file
          },
        },
      }
    end, 
  },
}
