vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use { "kylechui/nvim-surround", tag = "*" }
	use { "windwp/nvim-autopairs", event = "InsertEnter" }
	use { "sitiom/nvim-numbertoggle" }
	use { "catppuccin/nvim", as = "catppuccin" }
	use { "mbbill/undotree" }
	use { "tpope/vim-fugitive" }
	use { "nvim-tree/nvim-tree.lua" }
	use { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' }, options = {'--no'} }
	use { "terryma/vim-expand-region" }
	use { "airblade/vim-gitgutter" }
	use({ "stevearc/oil.nvim" })
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v4.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
		}
	}
end)
