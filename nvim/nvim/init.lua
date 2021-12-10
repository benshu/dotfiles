vim.g.mapleader = ' '

require('benshu.plugins')

vim.o.wildignore = table.concat({
    '__pycache__',
    '*.egg-info',
    '*.o' ,
    '*~',
    '*.pyc',
    '*pycache*',
    '.git',
    '*.jpg',
    '*.jpeg',
    '*.png',
    '*.gif',
    '*.zip',
    '**/tmp/**',
    '**/node_modules/**',
    },
     ','
 )

vim.o.wildmode = 'longest:list:full'
vim.o.wildignorecase = true

vim.o.wildoptions = 'pum,tagfile'

vim.o.pumblend = 20

vim.o.showmode       = false
vim.o.showcmd        = true
vim.o.cmdheight      = 1     -- Height of the command bar
vim.o.incsearch      = true  -- Makes search act like search in modern browsers
vim.o.showmatch      = true  -- show matching brackets when text indicator is over them
vim.o.ignorecase     = true  -- Ignore case when searching...
vim.o.smartcase      = true  -- ... unless there is a capital letter in the query
vim.o.hidden         = true  -- I like having buffers stay around
vim.o.cursorline     = true  -- Highlight the current line
vim.o.equalalways    = false -- I don't like my windows changing all the time
vim.o.splitright     = true  -- Prefer windows splitting to the right
vim.o.splitbelow     = true  -- Prefer windows splitting to the bottom
vim.o.updatetime     = 1000  -- Make updates happen faster
vim.o.hlsearch       = true
vim.o.scrolloff      = 5
vim.o.autoindent     = true
vim.o.cindent        = true
vim.o.tabstop        = 4
vim.o.shiftwidth     = 4
vim.o.softtabstop    = 4
vim.o.expandtab      = true

vim.o.breakindent    = true
vim.o.showbreak      = string.rep(' ', 3) -- Make it so that long lines wrap smartly
vim.o.linebreak      = true

vim.o.modelines      = 1

vim.o.belloff        = 'all'

vim.o.clipboard      = 'unnamedplus'

vim.o.inccommand     = 'nosplit'
vim.o.swapfile       = true
vim.o.undofile       = true
vim.o.shada          = table.concat({ "!", "'1000", "<50", "s10", "h" }, ',')

vim.o.mouse          = 'nv'
vim.o.path           = '.,**'
vim.o.virtualedit    = 'block'
vim.o.synmaxcol      = 1000

vim.o.formatoptions = ''
                    .. 'c'     -- In general, I like it when comments respect textwidth
                    .. 'q'     -- Allow formatting comments w/ gq
                    .. 'r'     -- But do continue when pressing enter.
                    .. 'n'     -- Indent past the formatlistpat, not underneath it.
                    .. 'j'     -- Auto-remove comments if possible.

vim.o.completeopt      = 'menu,preview,menuone,noinsert,noselect'

vim.o.joinspaces = false
vim.o.fillchars  = 'eob:~'
vim.o.showbreak  = '↪'
vim.o.fillchars  = 'vert:│,fold:─'
vim.o.listchars  = 'tab:▏ ,extends:⟫,precedes:⟪,nbsp:␣,trail:·'
vim.o.grepprg    = 'rg --vimgrep --no-heading --smart-case'
vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'

vim.o.termguicolors        = true

vim.wo.relativenumber = true  -- Show line numbers
vim.wo.number         = true  -- But show the actual number for the line we're on
vim.wo.wrap           = false
vim.wo.foldmethod     = 'marker'
vim.wo.foldlevel      = 0

vim.g['far#debug'] = 0
vim.g['completion_trigger_on_delete'] = 1


vim.cmd('colorscheme dracula')

vim.g['netrw_browse_split'] = 4
vim.g['netrw_preview'] = 1
vim.g['netrw_altv'] = '=&spr'
vim.g['netrw_liststyle'] = 3
vim.g['netrw_banner'] = 0
vim.g['netrw_liststyle'] = 3
--]]

vim.api.nvim_set_keymap('n', '<Up>', '<C-y>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<C-e>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Esc><Esc>', '<Esc>:nohlsearch<CR><Esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>lua require("telescope.builtin").builtin()<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua require("telescope.builtin").git_files()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>lua require("telescope.builtin").git_files()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>lua require("telescope.builtin").git_commits()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gbc', '<cmd>lua require("telescope.builtin").git_bcommits()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gbr', '<cmd>lua require("telescope.builtin").git_branches()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>lua require("telescope.builtin").git_status()<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ghi', '<cmd>lua require("telescope.builtin").gh_issues()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pr', '<cmd>lua require("telescope.builtin").gh_pull_request()<cr>', { noremap = true, silent = true })


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  require('completion').on_attach()

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi link LspReferenceRead DraculaFgUnderline
      hi link LspReferenceText DraculaFgUnderline
      hi link LspReferenceWrite DraculaFgUnderline
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}
    opts.on_attach = on_attach

    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    if server.name == 'sumenko_lua' then
        opts.settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = vim.split(package.path, ';'),
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    enable = true,
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    },
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

-- LSP utils setup
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
