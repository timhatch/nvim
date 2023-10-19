-- ALE Linting
vim.g["ale_virtualtext_cursor"]             = "current"
vim.g["ale_warn_about_trailing_whitespace"] = 0
vim.g["ale_fix_on_save"]                    = 1
vim.cmd([[
  let g:ale_fixers = { "*": ["remove_trailing_lines", "trim_whitespace"] }
]])
-- Use neovim disgnostics API
vim.g["ale_use_diagnostics_api"] = 1
