-- -- Reserve a space in the gutter
-- -- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- -- here you can setup the language servers
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "ts_ls", "rust_analyzer", "gdscript", "gopls", "rubocop", "tailwindcss", "html", "htmx", "templ"},
})
require'lspconfig'.ts_ls.setup{}
require'lspconfig'.gdscript.setup{}
require'lspconfig'.gdshader_lsp.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.rubocop.setup{}
require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.templ.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.htmx.setup{}
