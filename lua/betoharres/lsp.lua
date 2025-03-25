-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

require("mason").setup({})
require("mason-lspconfig").setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = { "lua_ls", "ts_ls", "gopls", "rubocop", "rust_analyzer", "templ", "htmx", "bashls" },
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
})

vim.keymap.set("n", "<leader>e", Show_expanded_diagnostic, { desc = "Show expanded diagnostic" })

-- vim.keymap.set("n", "<leader>d", function()
-- 	vim.diagnostic.setloclist({ open = true })
-- end, { desc = "Open diagnostic location list" })
--
-- -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- -- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
-- --   callback = function()
-- --     local curr_line = vim.api.nvim_win_get_cursor(0)[1] - 1
-- --     local diags = vim.diagnostic.get(0, { lnum = curr_line })
-- --     if #diags > 0 then
-- --       local msg = diags[1].message:gsub("\n", " ") -- flatten the message into one line
-- --       local max_columns = vim.o.columns
-- --       if #msg > max_columns then
-- --         msg = msg:sub(1, max_columns - 3) .. "..."
-- --       end
-- --       vim.api.nvim_echo({ { "Diagnostic: " .. msg, "ErrorMsg" } }, false, {})
-- --     end
-- --   end,
-- -- })
-- -- -- -- -- / || handle error messages ||| --- -- -- -- --
--
-- -- gdscript --
--
-- require("conform").setup({
--   formatters_by_ft = {
--     gdscript = { "gdformat", lsp_format = "fallback" },
--     typescript = { "prettier" },
--     typescriptreact = { "prettier" },
--     javascript = { "prettier" },
--     javascriptreact = { "prettier" },
--     html = { "prettier" },
--     css = { "prettier" },
--   },
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = {"*.gd"},
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf, timeout_ms = 10000  })
--     -- vim.lsp.buf.format({ async = false })
--   end,
-- })
--
-- -- -- gdscript -- --
-- vim.filetype.add({ extension = { templ = "templ" } })
