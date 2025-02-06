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
