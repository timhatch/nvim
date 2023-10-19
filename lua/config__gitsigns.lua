-- gitsigns
require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then return "]c" end
      vim.schedule(function() gs.next_hunk() end)
      return "<Ignore>"
    end, {expr=true})

    map("n", "[c", function()
      if vim.wo.diff then return "[c" end
      vim.schedule(function() gs.prev_hunk() end)
      return "<Ignore>"
    end, {expr=true})

    -- Actions
    map("n", "<leader>hs", gs.stage_hunk)
    map("n", "<leader>hr", gs.reset_hunk)
    map("n", "<leader>hu", gs.undo_stage_hunk)
    map("n", "<leader>hS", gs.stage_buffer)
    map("n", "<leader>hR", gs.reset_buffer)
    map("n", "<leader>hp", gs.preview_hunk)

    -- Text object
    map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end
})

-- Handle simple commits from within neovim
-- via :Commit
vim.cmd("command! -nargs=0 Commit lua gitCommit()")
-- via <leader>gc
vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>lua gitCommit()<CR>",
  { noremap = true, silent = true})

-- Simple function to commit
function gitCommit()
  local gitRoot = isGitRoot(currentFile)

  if gitRoot then
    local commitMessage = vim.fn.input("Enter Commit Message: ")

    vim.cmd(":new")
    vim.fn.termopen("git commit -m '" .. commitMessage .. "'", { cwd = gitRoot })
  else
    print("CWD must be the root of a git repository")
  end
end

-- Is the CWD the repository root
function isGitRoot()
  local currentPath = vim.fn.getcwd()
  if vim.fn.isdirectory(currentPath .. "./git") then
    return currentPath
  end
  return nil
end
