local cmp = require('cmp')
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
	mapping = cmp.mapping.preset.insert({
		-- Navigate between completion items
		['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
		['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		-- Scroll up and down in the completion documentation
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		--
		-- ['<Tab>'] = cmp.mapping.complete(),
		['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
		-- -- Go to previous item
		['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
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
		--
		--
		--
	}),
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
})

