vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use {'andymass/vim-matchup', event = 'VimEnter *'}
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex', 'py', 'yaml', 'lua'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = {
          {'nvim-lua/popup.nvim'},
          {'nvim-lua/plenary.nvim'}
      }
  }
  use {
      'nvim-telescope/telescope-github.nvim',
      config = function()
          require('telescope').load_extension('gh')
      end
  }
  use {'nvim-treesitter/nvim-treesitter', opt = true}
  use {'pechorin/any-jump.vim', opt = true}
  use {
      "folke/which-key.nvim",
      config = function()
          require("which-key").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
              spelling = {
                  enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                  suggestions = 20, -- how many suggestions should be shown in the list?
              },
          }
      end
  }
  use {
    'nvim-lua/completion-nvim',
    requires = {
        { 'hrsh7th/vim-vsnip', opt = true },
        { 'hrsh7th/vim-vsnip-integ', opt = true },
    }
  }
  -- LSP {{{
  use 'neovim/nvim-lspconfig'
  use 'wbthomason/lsp-status.nvim'
  use 'anott03/nvim-lspinstall'
  -- }}}
  use {
      'jremmen/vim-ripgrep',
      config = function()
          vim.g['rg_command'] = 'gr --vimgrep -S' -- enable smartcase
          vim.g['rg_highlight'] = 'true'
          vim.g['rg_window_location'] = 'right'
      end
  }
  use {
      'brooth/far.vim',
      config = function()
          vim.g['far#source'] = 'rgnvim'
          vim.g['far#limit'] = 10000
          vim.g['far#ignore_files'] = {
              '/home/hagay/.local/share/nvim/site/pack/packer/start/far.vim/farignore',
              './.gitignore',
              './.rgignore',
          }
      end
  }

  -- use {'pwntester/octo.nvim',}
  use { 'norcalli/nvim-colorizer.lua',
      config = function()
          require('colorizer').setup()
      end
  }
  use {'dracula/vim', as = 'dracula'}

  use 'godlygeek/tabular'        -- Quickly align text by pattern
  use 'tpope/vim-fugitive'       -- Git
  use 'tpope/vim-surround'       -- Surround text objects easily
  use 'tpope/vim-commentary'     -- Easily comment out lines or objects
  use 'tpope/vim-repeat'         -- Repeat actions better
  use 'tpope/vim-abolish'        -- Cool things with words!
  use 'tpope/vim-characterize'
  use 'AndrewRadev/splitjoin.vim'
  use 'christoomey/vim-tmux-navigator'
  use 'kdheepak/lazygit.nvim'
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'
end)
