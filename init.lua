-- Plugins
require('plugins')
require('config__treesitter')
require('config__ale')        -- ALE Linter options
require('config__gitsigns')   -- Git status and in-app commits
require('config__telescope')  -- Telescope TUI
require('config__neovide')    -- Neovide/MacOS functionality
require('config__lualine')

-- Themes/Colors layout
require('tokyonight').setup({
  style = 'night',
  keywords = { italic = false},
})
vim.cmd [[colo tokyonight]]

-- Window behaviour
vim.opt.splitright = true   -- Open vertical splits to RHS
vim.opt.splitbelow = true   -- Open horizontal splits below
vim.opt.signcolumn = "yes"  -- Show a sign column e.g. for git markings
vim.opt.showmode   = false  -- Suppress status in the command line
vim.cmd [[hi VertSplit ctermbg=0 ctermfg=DarkGray guibg=bg guifg=#333333]]

-- Special characters
vim.opt.tabstop     = 2     -- 1 tab = 2 spaces
vim.opt.shiftwidth  = 2     -- Indentation rule
vim.opt.softtabstop = 2     --
vim.opt.expandtab   = true  -- Expand tabs to spaces
vim.opt.list        = true
vim.opt.listchars   = {tab = '▸ ', eol = '¬', trail = '·' } -- Show hard tabs, returns &
                                                            -- traiing spaces
-- Custom Commands
vim.cmd [[command! S :%s/\s\+$//e]]           -- Strip trailing spaces
vim.cmd [[command! G %!gofmt -w %]]           -- Format go files
vim.cmd [[command! J %!python -m json.tool]]  -- Use the python json.tool to format files
vim.cmd [[command! CWD :cd %:p:h]]            -- Change Working Directory
vim.cmd [[command! Q :q]]                     -- Case insensitive quit
vim.cmd [[command! W :w]]                     -- Case insensitive save

-- GUI options
vim.o.guifont = "Source Code Pro:h10"

-- goneovim doesn't recognise <M-3>
-- vim.api.nvim_set_keymap('i', '<D-3>', '#', { noremap = true, silent = true })
