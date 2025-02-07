vim.g.mapleader = " "
vim.keymap.set("i", 'jk', '<ESC>')
vim.keymap.set("n", '<leader>q', ':q<Enter>')
vim.keymap.set("n", '<leader>w', ':w<Enter>')
vim.keymap.set("n", ';', ':')
vim.keymap.set("n", ',', '<C-W><C-W>')
vim.keymap.set("n", 'gv', 'ggVG$')
vim.keymap.set("n", '<leader>p', '"+P')
vim.keymap.set("n", '<leader>P', '\"_dP')
vim.keymap.set("v", '<leader>y', '"+y')

vim.keymap.set("n", '<C-j>', ':m .+1<CR>==')
vim.keymap.set("n", '<C-k>', ':m .-2<CR>==')
vim.keymap.set("v", '<C-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set("v", '<C-k>', ":m '<-2<CR>gv=gv")

vim.keymap.set("n", '<Tab>', ':tabnext<CR>')
vim.keymap.set("n", '<leader><Tab>', ':tabnew<CR>')
vim.keymap.set("n", '<S-Tab>', ':tabprevious<CR>')

vim.keymap.set("n", '<leader>=', '<C-w>=')
vim.keymap.set("n", '<leader>+', '<C-w>_<C-w><bar>')
vim.keymap.set("n", 'C-r', '"hy:%s/<C-r>h/<C-r>h/g<left><left>')

vim.keymap.set('n', '<leader><leader>', '<C-^>', { noremap = true, silent = true })

-- Fugitive
vim.keymap.set('n', '<leader>gd', ':Gdiff<CR>')
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>')

vim.keymap.set('n', '<leader>sh', '<Plug>(GitGutterStageHunk)', { noremap = false })

-- search and replace in visual mode
vim.keymap.set('v', '<C-r>', '"hy:%s/<C-r>h/<C-r>h/gI<left><left><left>')

vim.keymap.set('x', 'v', '<Plug>(expand_region_expand)', { silent = true })
vim.keymap.set("n", ']c', ':GitGutterNextHunk<CR>zz')
vim.keymap.set("n", '[c', ':GitGutterPrevHunk<CR>zz')
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>j', ':GFiles --others --exclude-standard --cached<CR>')
vim.keymap.set('n', '<leader>J', vim.cmd.Files)
vim.keymap.set('n', '<leader>c', vim.cmd.Commands)
vim.keymap.set('n', '<leader>a', vim.cmd.Ag)

local function strip_whitespace()
  -- Save current cursor position (row, col)
  local cur_row, cur_col = unpack(vim.api.nvim_win_get_cursor(0))
  -- Save the current search register
  local old_query = vim.fn.getreg('/')
  -- Perform the substitution
  vim.cmd([[ %s/\s\+$//e ]])
  -- Restore cursor position
  vim.api.nvim_win_set_cursor(0, {cur_row, cur_col})
  -- Restore the search register
  vim.fn.setreg('/', old_query)
end
vim.keymap.set('n', '<leader>ss', strip_whitespace, { desc = "Strip trailing whitespace" })
