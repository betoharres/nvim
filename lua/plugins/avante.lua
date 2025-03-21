-- avante slows down <leader>a (find grep)
return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	opts = {
		output = {
			filetype = "Avante",
			enable_markdown_rendering = true,
		},
		-- add any opts here
		-- for example
		mappings = {
			ask = "<leader>vv",
			edit = "<leader>ve", -- edit
			refresh = "<leader>vr", -- refresh
			focus = "<leader>vf", -- refresh
			select_model = "<leader>v?", -- refresh
			toggle = {
				default = "<leader>vt",
				debug = "<leader>vd",
				hint = "<leader>vh",
				suggestion = "<leader>vs",
				repomap = "<leader>vR",
			},
			files = {
				add_current = "<leader>vc", -- Add current buffer to selected files
			},
		},
		provider = "openai",
		openai = {
			endpoint = "https://api.openai.com/v1",
			model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
			timeout = 30000, -- timeout in milliseconds
			temperature = 0, -- adjust if needed
			max_tokens = 4096,
			-- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		-- "zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			main = "render-markdown",
			name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}

-- mappings = {
--   ---@class AvanteConflictMappings
--   diff = {
--     ours = "co",
--     theirs = "ct",
--     all_theirs = "ca",
--     both = "cb",
--     cursor = "cc",
--     next = "]x",
--     prev = "[x",
--   },
--   suggestion = {
--     accept = "<M-l>",
--     next = "<M-]>",
--     prev = "<M-[>",
--     dismiss = "<C-]>",
--   },
--   jump = {
--     next = "]]",
--     prev = "[[",
--   },
--   submit = {
--     normal = "<CR>",
--     insert = "<C-s>",
--   },
--   -- NOTE: The following will be safely set by avante.nvim
--   ask = "<leader>aa",
--   edit = "<leader>ae",
--   refresh = "<leader>ar",
--   focus = "<leader>af",
--   toggle = {
--     default = "<leader>at",
--     debug = "<leader>ad",
--     hint = "<leader>ah",
--     suggestion = "<leader>as",
--     repomap = "<leader>aR",
--   },
--   sidebar = {
--     apply_all = "A",
--     apply_cursor = "a",
--     retry_user_request = "r",
--     edit_user_request = "e",
--     switch_windows = "<Tab>",
--     reverse_switch_windows = "<S-Tab>",
--     remove_file = "d",
--     add_file = "@",
--     close = { "<Esc>", "q" },
--   },
--   files = {
--     add_current = "<leader>ac", -- Add current buffer to selected files
--   },
--   select_model = "<leader>a?", -- Select model command
-- },
