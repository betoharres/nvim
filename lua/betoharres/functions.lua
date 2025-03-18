function Strip_whitespace()
	-- Save current cursor position (row, col)
	local cur_row, cur_col = unpack(vim.api.nvim_win_get_cursor(0))
	-- Save the current search register
	local old_query = vim.fn.getreg("/")
	-- Perform the substitution
	vim.cmd([[ %s/\s\+$//e ]])
	-- Restore cursor position
	vim.api.nvim_win_set_cursor(0, { cur_row, cur_col })
	-- Restore the search register
	vim.fn.setreg("/", old_query)
end
