-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

require('lualine').setup {
  options = {
    theme = 'PaperColor',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { {'b:gitsigns_head', icon = ''}, },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding' },
    lualine_y = { {'progress', padding = 2 } },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
