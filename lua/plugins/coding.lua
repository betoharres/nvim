return {
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' }, options = {'--no'} },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },
  { "sitiom/nvim-numbertoggle" },
  { "terryma/vim-expand-region" },
  { "airblade/vim-gitgutter" },
  { "mbbill/undotree" },
  { "mfussenegger/nvim-dap" },
  { "monaqa/dial.nvim", event = "VeryLazy" },
  { "nvim-tree/nvim-tree.lua", version = "*", lazy = false, dependencies = { "nvim-tree/nvim-web-devicons", } },
}
