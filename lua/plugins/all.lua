return {
	-- coding
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-abolish" },
	{ "junegunn/fzf.vim", dependencies = { "junegunn/fzf" }, options = { "--no" } },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{ "terryma/vim-expand-region" },
	{ "airblade/vim-gitgutter" },
	{ "sitiom/nvim-numbertoggle" },
	{ "mbbill/undotree" },
	{ "monaqa/dial.nvim", event = "VeryLazy" },
	{ "joerdav/templ.vim" },

	{ "nvim-lua/plenary.nvim" },
	{ "darakian/mini_markdown" },

	-- debugger
	{ "mfussenegger/nvim-dap" },

	-- lsp
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	-- {'stevearc/conform.nvim'},

	-- ui
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{ "NTBBloodbath/doom-one.nvim" },

	-- null-ls (code format)
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
	},
}
