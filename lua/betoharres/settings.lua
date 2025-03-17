vim.opt.clipboard:append("unnamedplus")
vim.opt.termguicolors = true
vim.cmd.colorscheme "doom-one"

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
	tab = '  ', -- two spaces between single quotes
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

vim.opt.complete:append("kspell")  -- Autocomplete with spell-check
vim.opt.diffopt:append("vertical") -- Always use vertical diffs

-- show markdown characters
vim.opt.conceallevel = 0
