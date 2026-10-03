local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


return require('packer').startup(function(use)
  use "lukas-reineke/indent-blankline.nvim" -- indentation guide
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter', -- syntax highlighting
    branch = 'main',
    run = ':TSUpdate'
  }
  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require 'treesitter-context'.setup{}
    end
  }
  -- colorschemes
  use 'scottmckendry/cyberdream.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'shaunsingh/nord.nvim'
  use 'olivercederborg/poimandres.nvim'
  use ({ 'projekt0n/github-nvim-theme' })
  use 'nyoom-engineering/oxocarbon.nvim'
  use 'folke/tokyonight.nvim'
  use 'iruzo/matrix-nvim'
  use 'catppuccin/nvim'
  -- colorschemes

  -- snippets
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })
  use "rafamadriz/friendly-snippets"
  -- snippets

  -- autocompletion
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'onsails/lspkind.nvim'
  -- autocompletion

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'} -- UFO for code folding

  use 'nvim-tree/nvim-web-devicons' -- icons

  use 'nvim-tree/nvim-tree.lua' -- navigate between files

  use 'nvim-lualine/lualine.nvim' -- lualine

  use 'lewis6991/gitsigns.nvim' -- git integration

  use 'szw/vim-maximizer' -- maximize current window

  use 'OXY2DEV/markview.nvim' -- markdown preview inside the buffer (don't lazy-load)

  use {
    'nvim-telescope/telescope.nvim',
    -- or, branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- lsp plugins 
  use {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'};
  use {'neovim/nvim-lspconfig'};
  use {'hrsh7th/cmp-nvim-lsp'};
  use {'hrsh7th/nvim-cmp'};
  -- lsp plugins 
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {"williamboman/mason.nvim"} -- mason
  use {"williamboman/mason-lspconfig.nvim"} --mason-lspconfig
  use {'kenn7/vim-arsync',
  requires = {
      {'prabirshrestha/async.vim'}
    }
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
