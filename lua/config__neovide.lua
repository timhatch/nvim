-- Neovide doesn't respond to MacOS' fullscreen shortcut
-- Simulate the desired behaviour by setting neovide_fullscreen
if vim.g.neovide then
  -- vim.g.neovide_remember_window_size = true
  vim.api.nvim_set_keymap("n", "<C-D-f>", "<cmd>lua toggleFullscreen()<CR>",
    { noremap = true, silent = true })
end

function toggleFullscreen()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end

-- Launching Neovide.app from the CLI `neovide` alias creates a NEOVIDE_CWD environment variable
-- which we can use to set the CWD
if vim.fn.getenv("NEOVIDE_CWD") then
  vim.fn.chdir(vim.fn.getenv("NEOVIDE_CWD"))
end

-- Basic MacOS File menu actions (Save/Quit)
-- if vim.fn.has("macunix") == 1 then
if vim.g.neovide then
  vim.keymap.set("n", "<D-q>", "<cmd>qa<cr>", { silent = true })
  vim.keymap.set({ "i", "v", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>")
end

-- Basic MacOS Edit menu actions (Copy/Paste/Undo/Redo)
-- n.b. Command-Shift-z isn't recognised to use Command-Control-z for redo
-- if vim.fn.has("macunix") == 1 then
if vim.g.neovide then
  -- Copy/Paste
  vim.keymap.set("v", "<D-c>", '"+y')                       -- Copy on visual mode
  vim.keymap.set({"n", "v", "i"}, "<D-v>", '<Esc>"+P')      -- Paste n|v|i modes
  vim.keymap.set("t", "<D-v>", "<C-R>+")                    -- Paste terminal mode
  vim.keymap.set({"c", "!"}, "<D-v>", "<C-R>+<Space><BS>")  -- Paste command mode

  -- Undo/Redo
  vim.keymap.set({"n", "i"}, "<D-z>", "<Esc>: u<CR>", { silent = true })  -- Undo
  vim.keymap.set("n", "<C-D-z>", "<C-r>", { silent = true })              -- Redo

  -- Select All
  vim.keymap.set({"n", "v", "i", "c"}, "<D-a>", "<Esc>ggVG", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<D-a>", "<C-\\><C-n>ggVG", { noremap = true, silent = true })
end

-- Defaults for all systems, insert replace with F12 since some keyboard dont have it
-- vim.keymap.set({"n", "v"}, "<S-F12>", '"+P')        -- Paste normal|visual mode
-- vim.keymap.set("i", "<S-F12>", '<ESC>l"+Pli')       -- Paste insert mode
-- vim.keymap.set("c", "<S-F12>", "<C-R>+<Space><BS>") -- Paste command mode
-- vim.keymap.set("t", "<S-F12>", "<C-R>+")            -- Paste terminal mode
-- vim.keymap.set("!", "<S-F12>", "<C-R>+<Space><BS>") -- Paste on :! mode
