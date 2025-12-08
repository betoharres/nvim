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
	{ "windwp/nvim-ts-autotag" },

	{ "olrtg/nvim-emmet" },

	{ "nvim-lua/plenary.nvim" },

	-- debugger
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()
			require("dap-go").setup()

			dap.configurations.go = {
				{
					type = "go",
					name = "Debug file (stop on entry)",
					request = "launch",
					program = "${file}",
					stopOnEntry = true,
				},
			}

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	-- lsp
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "mason-org/mason.nvim" },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},

	-- ui
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{ "NTBBloodbath/doom-one.nvim" },
	{ "neanias/everforest-nvim" },
	{ "nvim-lualine/lualine.nvim" },

	-- null-ls (code format)
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"nvimtools/none-ls.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
	},
}
