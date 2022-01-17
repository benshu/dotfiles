-- Bootstrap packer.nvim [https://github.com/wbthomason/packer.nvim]
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  P = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'tpope/vim-dispatch',
    opt = true,
    cmd = {'Dispatch', 'Make', 'Focus', 'Start'},
  }
  use {
    'andymass/vim-matchup',
    event = 'VimEnter *',
  }
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview',
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make' ,
    config = function()
      require('telescope').load_extension('fzf')
    end
  }
  use {
    'nvim-telescope/telescope-github.nvim',
    config = function()
      require('telescope').load_extension('gh')
    end
  }
  use { "camgraff/telescope-tmux.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use { "pwntester/octo.nvim" }

  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    setup = {
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
      },
      textobjects = {
        enable = true,
      },
    },
    config = function()
        require'nvim-treesitter.configs'.setup {
          ensure_installed = "maintained",
          sync_install = false,
          ignore_install = {},
          highlight = {
            enable = true,
            disable = {},
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
          },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "gnn",
              node_incremental = "grn",
              scope_incremental = "grc",
              node_decremental = "grm",
            },
          },
          textobjects = {
            enable = true,
          },
        }
    end
  }
  use { 'nvim-treesitter/playground' }

  use { 'kyazdani42/nvim-web-devicons' }

  use { 'pechorin/any-jump.vim' }
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
  -- Debug adapter protocol
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "mfussenegger/nvim-dap-python"
  use "nvim-telescope/telescope-dap.nvim"

  -- LSP {{{
  use 'neovim/nvim-lspconfig'
  use 'wbthomason/lsp-status.nvim'
  use 'williamboman/nvim-lsp-installer'
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'
  -- }}}
  use {
      'jremmen/vim-ripgrep',
      config = function()
          vim.g['rg_command'] = 'rg --vimgrep -S' -- enable smartcase
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
use {
    'windwp/nvim-spectre',
    config = function()
        vim.api.nvim_set_keymap('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', { noremap = true, silent = true })
        --  search current word
        vim.api.nvim_set_keymap('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('v', '<leader>s', '<cmd>lua require("spectre").open_visual()<CR>', { noremap = true, silent = true })
        --  search in current file
        vim.api.nvim_set_keymap('n', '<leader>sp', 'viw <cmd>lua require("spectre").open_file_search()<cr>', { noremap = true, silent = true })
    end
}

use 'tpope/vim-characterize'
use 'AndrewRadev/splitjoin.vim'
use 'christoomey/vim-tmux-navigator'
use 'kdheepak/lazygit.nvim'
use 'TimUntersberger/neogit'

end)
