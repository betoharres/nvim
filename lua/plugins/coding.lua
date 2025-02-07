return {
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' }, options = {'--no'} },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },
  { "sitiom/nvim-numbertoggle" },
  { "terryma/vim-expand-region" },
  { "nvim-tree/nvim-tree.lua" },
  { "airblade/vim-gitgutter" },
  { "mbbill/undotree" },
  { "monaqa/dial.nvim", event = "VeryLazy" },

}
