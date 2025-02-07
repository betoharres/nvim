-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

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
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

require('lspconfig').ts_ls.setup{}
require('lspconfig').gdscript.setup{}
require('lspconfig').gdshader_lsp.setup{}
require('lspconfig').gopls.setup{}
require('lspconfig').rubocop.setup{}
require('lspconfig').tailwindcss.setup{}
require('lspconfig').templ.setup{}
require('lspconfig').html.setup{}
require('lspconfig').htmx.setup{}

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer', option = {}},
  },
  mapping = cmp.mapping.preset.insert({
    -- Navigate between completion items
    ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

    -- `Enter` key to confirm completion
    -- ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<CR>'] = cmp.mapping.confirm({select = true}),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),

    --
    --
    -- Ctrl+Space to trigger completion menu
    -- ['<Tab>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    -- Simple tab complete
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   local col = vim.fn.col('.') - 1
    --
    --   if cmp.visible() then
    --     cmp.select_next_item({behavior = 'select'})
    --   elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    --     fallback()
    --   else
    --     cmp.complete()
    --   end
    -- end, {'i', 's'}),
    --
    -- -- Go to previous item
    -- ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    --
    --
    --

  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
})

-- format on save
local buffer_autoformat = function(bufnr)
  local group = 'lsp_autoformat'
  vim.api.nvim_create_augroup(group, {clear = false})
  vim.api.nvim_clear_autocmds({group = group, buffer = bufnr})

  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = bufnr,
    group = group,
    desc = 'LSP format on save',
    callback = function()
      -- note: do not enable async formatting
      vim.lsp.buf.format({async = false, timeout_ms = 10000})
    end,
  })
end
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil then
      return
    end

    -- make sure there is at least one client with formatting capabilities
    if client.supports_method('textDocument/formatting') then
      buffer_autoformat(event.buf)
    end
  end
})

-- format on leader f
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = {buffer = event.buf}
    vim.keymap.set({'n', 'x'}, '<leader>f', function()
      vim.lsp.buf.format({async = false, timeout_ms = 10000})
    end, opts)
  end
})
