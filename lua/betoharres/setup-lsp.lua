-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { 'lua_ls', 'ts_ls', 'gopls', 'rubocop', 'rust_analyzer', 'templ', 'htmx', 'bashls' },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  },
})

-- require('lspconfig').tailwindcss.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { "templ", "astro", "javascript", "typescript", "react" },
--     settings = {
--       tailwindCSS = {
--         includeLanguages = {
--           templ = "html",
--         },
--       },
--     },
-- }

-- local cmp = require('cmp')
-- cmp.setup({
-- 	sources = {
-- 		{ name = 'nvim_lsp' },
-- 		{ name = 'buffer',  option = {} },
-- 	},

-- 	snippet = {
-- 		expand = function(args)
-- 			vim.snippet.expand(args.body)
-- 		end,
-- 	},
-- 	preselect = 'item',
-- 	completion = {
-- 		completeopt = 'menu,menuone,noinsert'
-- 	},
-- })
--
-- -- format on save
-- local buffer_autoformat = function(bufnr)
-- 	local group = 'lsp_autoformat'
-- 	vim.api.nvim_create_augroup(group, { clear = false })
-- 	vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
-- 	vim.api.nvim_create_autocmd('BufWritePre', {
-- 		buffer = bufnr,
-- 		group = group,
-- 		desc = 'LSP format on save',
-- 		callback = function(args)
-- 			-- note: do not enable async formatting
-- 			vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
--       require("conform").format({ bufnr = args.buf })
-- 		end,
-- 	})
-- end
-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	callback = function(event)
-- 		local id = vim.tbl_get(event, 'data', 'client_id')
-- 		local client = id and vim.lsp.get_client_by_id(id)
-- 		if client == nil then
-- 			return
-- 		end
-- 		-- make sure there is at least one client with formatting capabilities
-- 		if client.supports_method('textDocument/formatting') then
-- 			buffer_autoformat(event.buf)
-- 		end
-- 	end
-- })
--
-- -- format on leader f
-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	callback = function(event)
-- 		local opts = { buffer = event.buf }
-- 		vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
-- 			vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
--       require("conform").format({ bufnr = event.buf })
-- 		end, opts)
-- 	end
-- })
--
-- require 'nvim-treesitter.configs'.setup {
-- 	config = function()
-- 		local configs = require("nvim-treesitter.configs")
-- 		build = ":TSUpdate",
-- 				configs.setup({
-- 					ensure_installed = {
-- 						'lua',
-- 						'typescript',
-- 						'gdscript',
-- 						'ruby',
-- 						'rust',
-- 						'go',
-- 						'html',
-- 						'css',
-- 						'templ',
-- 						'vim',
--             'sql',
-- 						'markdown',
-- 					},
-- 					sync_install = false,
--           auto_install = true,
-- 					highlight = { enable = true },
-- 					indent = { enable = true },
-- 					-- autotag = { enable = true },
-- 				})
-- 	end
-- }
--
-- -- -- -- -- -- ||| handle error messages ||| --- -- -- -- -- -- --
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
-- 	vim.lsp.diagnostic.on_publish_diagnostics,
-- 	{
-- 		virtual_text = false,
-- 		signs = true,
-- 		update_in_insert = false,
-- 		underline = true,
-- 	}
-- )
--
-- -- Function to show expanded diagnostic in a bottom split
-- local function show_expanded_diagnostic()
-- 	-- Get the current line (0-indexed)
-- 	local curr_line = vim.api.nvim_win_get_cursor(0)[1] - 1
-- 	-- Get all diagnostics for the current line
-- 	local diagnostics = vim.diagnostic.get(0, { lnum = curr_line })
-- 	if vim.tbl_isempty(diagnostics) then
-- 		vim.notify("No diagnostics on this line", vim.log.levels.INFO)
-- 		return
-- 	end
-- 	-- Concatenate messages from all diagnostics on the line.
-- 	local lines = {}
-- 	for i, diag in ipairs(diagnostics) do
-- 		table.insert(lines, ("Diagnostic %d:"):format(i))
-- 		for _, line in ipairs(vim.split(diag.message, "\n")) do
-- 			table.insert(lines, "  " .. line)
-- 		end
-- 		table.insert(lines, "") -- blank line between diagnostics
-- 	end
-- 	-- Open a new bottom split
-- 	vim.cmd("botright new")
-- 	local buf = vim.api.nvim_get_current_buf()
-- 	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
-- 	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
-- 	vim.api.nvim_buf_set_option(buf, "filetype", "markdown") -- Optional: set filetype for syntax highlight
-- 	vim.api.nvim_buf_set_option(buf, "modifiable", false)
-- 	vim.api.nvim_buf_set_option(buf, "modified", false)
-- end
--
-- vim.keymap.set("n", "<leader>e", show_expanded_diagnostic, { desc = "Show expanded diagnostic" })
-- vim.keymap.set("n", "<leader>d", function()
-- 	vim.diagnostic.setloclist({ open = true })
-- end, { desc = "Open diagnostic location list" })
--

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
--
-- vim.filetype.add({ extension = { templ = "templ" } })
--
