-- Faster updates (used by plugins like gitgutter)
vim.opt.updatetime = 100

-- Limit the maximum number of signs displayed by gitgutter
vim.g.gitgutter_max_signs = 200

vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

vim.g.gitgutter_override_sign_column_highlight = 0
vim.cmd([[
  highlight DiffAdd guifg=black guibg=wheat1
  highlight DiffChange guifg=black guibg=skyblue1
  highlight DiffDelete guifg=black guibg=gray45 gui=none
]])
