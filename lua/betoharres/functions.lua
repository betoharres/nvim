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

-- Function to show expanded diagnostic in a bottom split with controlled height
function Show_expanded_diagnostic()
	-- Get the current line (0-indexed)
	local curr_line = vim.api.nvim_win_get_cursor(0)[1] - 1

	-- Get all diagnostics for the current line
	local diagnostics = vim.diagnostic.get(0, { lnum = curr_line })
	if vim.tbl_isempty(diagnostics) then
		vim.notify("No diagnostics on this line", vim.log.levels.INFO)
		return
	end

	-- Prepare diagnostic lines
	local lines = {}
	for _, diag in ipairs(diagnostics) do
		-- Split the message into lines to handle multiline messages
		local msg_lines = vim.split(diag.message, "\n")
		-- table.insert(lines, string.format("%d:", i))
		vim.list_extend(lines, msg_lines)
		table.insert(lines, "")
	end

	-- Create bottom split with a fixed small height
	vim.cmd("botright 10new")

	-- Set up buffer
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	-- Configure buffer options
	vim.bo.buftype = "nofile"
	vim.bo.filetype = "ruby"
	vim.bo.bufhidden = "wipe"
	vim.bo.swapfile = false
	vim.bo.modifiable = false
end

require("lualine").setup()

require("nvim-ts-autotag").setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},

	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if one of the "opts" global settings
	-- doesn't work well in a specific filetype
	-- per_filetype = {
	-- 	["html"] = {
	-- 		enable_close = true, -- Auto close tags
	-- 		enable_rename = true, -- Auto rename pairs of tags
	-- 		enable_close_on_slash = false, -- Auto close on trailing </
	-- 	},
	-- },
	aliases = {
		["typescriptreact"] = "html",
	},
})

-- vim.api.nvim_create_autocmd("WinClosed", {
-- 	callback = function(tbl)
-- 		if vim.api.nvim_buf_is_valid(tbl.buf) then
-- 			vim.api.nvim_buf_delete(tbl.buf, {})
-- 		end
-- 	end,
-- 	group = vim.api.nvim_create_augroup("barbar_close_buf", {}),
-- })
