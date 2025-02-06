require("betoharres.remap")
vim.opt.clipboard:append("unnamedplus")

-- For convenience, assign the "opt" table to a local variable.
local opt = vim.opt

-- Backspace deletes like most programs in insert mode
opt.backspace = "2"

-- Disable backup files
opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.history = 50

-- Show the cursor position, show incomplete commands,
-- do incremental searching, always display the status line
opt.ruler = true
opt.showcmd = true
opt.incsearch = true
opt.hlsearch = false
opt.cursorline = true
opt.laststatus = 2

opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.shiftround = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.list = true
vim.opt.listchars = {
  tab = '  ',  -- two spaces between single quotes
  trail = '·',
  nbsp = '·',
}

vim.g.have_nerd_font = true

-- Automatically :write before running commands
opt.autowrite = true

-- Spell checking in American English and Brazilian Portuguese
opt.spelllang = { "en_us", "pt_br" }

vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.numberwidth = 1       -- Set the minimum column width

-- Use one space, not two, after punctuation when joining lines
opt.joinspaces = false

-- Wrap text at 80 characters
opt.textwidth = 80

-- Highlight the column after textwidth
-- colorcolumn can accept a string like "81" or relative notation
-- but using "+1" directly is a Vimscript feature. The Lua equivalent:
opt.colorcolumn = "+1"
-- or if you want an absolute column, for example, column 81:
-- opt.colorcolumn = "81"

vim.opt.complete:append("kspell")    -- Autocomplete with spell-check
vim.opt.diffopt:append("vertical")   -- Always use vertical diffs

-- show markdown characters
vim.opt.conceallevel = 0

-- Enable the sign column
vim.opt.signcolumn = "yes"

-- Faster updates (used by plugins like gitgutter)
vim.opt.updatetime = 100

-- Limit the maximum number of signs displayed by gitgutter
vim.g.gitgutter_max_signs = 200

vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

vim.g.gitgutter_override_sign_column_highlight = 0
vim.cmd([[
  highlight DiffAdd guifg=black guibg=wheat1
  highlight DiffChange guifg=black guibg=skyblue1
  highlight DiffDelete guifg=black guibg=gray45 gui=none
]])

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

-- Replicate the behavior of InsertTabWrapper in Lua:
local function insert_tab_wrapper()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%w') == nil then
    -- At the beginning of the line or not on a word: insert a literal tab
    return '\t'
  else
    -- Otherwise trigger completion with <C-n>
    -- (uncomment if you want that behavior):
    -- return vim.api.nvim_replace_termcodes('<C-n>', true, false, true)
    -- For now, let's just insert a literal tab:
    return '\t'
  end
end

-- Create an insert-mode mapping with an "expr" option
-- so it evaluates our Lua function's return value:
vim.keymap.set('i', '<Tab>', insert_tab_wrapper, { expr = true })
