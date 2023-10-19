local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Fuzzy finders
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.4' })

-- Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'

-- CSV Manipulation
Plug 'chrisbra/csv.vim'

-- Linting
Plug 'dense-analysis/ale'
Plug 'tweekmonster/gofmt.vim'
Plug 'windwp/nvim-autopairs'

-- Git
Plug 'lewis6991/gitsigns.nvim'

-- Color scheme
Plug 'nvim-lualine/lualine.nvim'
Plug 'folke/tokyonight.nvim'

vim.call('plug#end')

require('nvim-autopairs').setup()
