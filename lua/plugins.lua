local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Color scheme
Plug 'nvim-lualine/lualine.nvim'
Plug 'NLKNguyen/papercolor-theme'

-- Fuzzy finders
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.4' })

-- Syntax highlighting
Plug 'hit9/vim-go-syntax'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components'
Plug 'chrisbra/csv.vim'

-- Linting
Plug 'dense-analysis/ale'
Plug 'tweekmonster/gofmt.vim'
Plug 'windwp/nvim-autopairs'

-- Git
Plug 'lewis6991/gitsigns.nvim'

vim.call('plug#end')

require('nvim-autopairs').setup {}
