local buffer_autoformat = function(bufnr)
  local group = 'lsp_autoformat'
  vim.api.nvim_create_augroup(group, { clear = false })
  vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = bufnr,
    group = group,
    desc = 'LSP format on save',
    callback = function()
      -- Never request typescript-language-server for formatting
      vim.lsp.buf.format {
        async = false,
        timeout_ms = 10000,
        -- ts_ls formatting sucks
        filter = function(client) return client.name ~= "ts_ls" end
      }
    end,
  })
end

require("mason-null-ls").setup({
  ensure_installed = { "stylua", "jq", "golines", "prettier", "eslint", "rubocop" }
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- js format
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.golines.with({
      extra_args = { "--max-len=80" } -- Adjust maximum line length as needed
    }),
    require("none-ls.diagnostics.eslint")
  },
  on_attach = function(_, buf)
    buffer_autoformat(buf)
  end
})

-- default neovim way to autoformat; commented out because of null-ls
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(event)
--     local id = vim.tbl_get(event, 'data', 'client_id')
--     local client = id and vim.lsp.get_client_by_id(id)
--     if client == nil then
--       return
--     end
--     -- make sure there is at least one client with formatting capabilities
--     if client.supports_method('textDocument/formatting') then
--       buffer_autoformat(event.buf)
--     end
--   end
-- })
