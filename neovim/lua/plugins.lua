local packer = require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate'
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = '0.5-compat'
  }

  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'itchyny/lightline.vim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'

  -- use 'shaunsingh/solarized.nvim'
  use 'lifepillar/vim-solarized8'

end)


-- Update packages on file change
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


return packer
