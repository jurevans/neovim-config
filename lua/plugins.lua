return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'williamboman/mason.nvim'   
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'

  -- Hrsh7th Code Completion Suite
  use 'hrsh7th/nvim-cmp' 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'                             
  use 'hrsh7th/cmp-path'                              
  use 'hrsh7th/cmp-buffer'                            
  use 'hrsh7th/vim-vsnip'

  -- File explorer tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  -- Color Scheme
  -- use { 'scottmckendry/cyberdream.nvim' }
  -- use { "folke/tokyonight.nvim" }
  -- use { "catppuccin/nvim", as = "catppuccin" }
  use { "rebelot/kanagawa.nvim" }

  -- Treesitter
  use {
    -- recommended packer way of installing it is to run this function,
    -- copied from documentation
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- Telescope used to fuzzy search files
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Lualine information / Status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Delete current buffer without disrupting layout
  use {'ojroques/nvim-bufdel'}

  -- Buffer line
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}


  -- Commenting
  use {'numToStr/Comment.nvim'}

  -- Null-LS - Format on save
  use { "stevearc/conform.nvim"  }
end)
