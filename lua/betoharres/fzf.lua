vim.g.fzf_history_dir = "~/.fzf-history"
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.api.nvim_create_user_command("GFiles", function(opts)
      vim.fn["fzf#vim#gitfiles"](opts.args, { options = "--no-preview" }, opts.bang and 1 or 0)
    end, { bang = true, nargs = "?" })
  end,
})

