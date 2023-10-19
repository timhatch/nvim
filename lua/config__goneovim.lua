-- Neovide doesn't respond to MacOS' fullscreen shortcut
-- Simulate the desired behaviour by setting neovide_fullscreen
if vim.g.goneovim then
  vim.api.nvim_set_keymap("n", "<C-D-f>", "<cmd>lua toggleFullscreen()<CR>",
    { noremap = true, silent = true })
end

function toggleFullscreen()
  print("toggle")
  print(vim.g.goneovimfullscreen) --  = not vim.g.goneovimfullscreen
end

-- Basic MacOS File menu actions (Save/Quit)
if vim.g.goneovim then
  vim.keymap.set("n", "<D-q>", "<cmd>qa<cr>", { silent = true })
  vim.keymap.set({ "i", "v", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>")
end

-- Basic MacOS Edit menu actions (Copy/Paste/Undo/Redo)
-- n.b. Command-Shift-z isn't recognised to use Command-Control-z for redo
if vim.g.goneovim then
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
