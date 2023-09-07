-- keymaps
-- TODO: checkout lazyVim keymaps 
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = function (mode, lhs, rhs, desc)
  opts = { desc = desc , remap = true };
  vim.keymap.set(mode, lhs, rhs, opts);
end


-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", "Go to left window" )
map("n", "<C-j>", "<C-w>j", "Go to lower window" )
map("n", "<C-k>", "<C-w>k", "Go to upper window" )
map("n", "<C-l>", "<C-w>l", "Go to right window" )

-- buffer
map("n", "<S-h>", "<cmd>bprevious<cr>", "Prev buffer" )
map("n", "<S-l>", "<cmd>bnext<cr>", "Next buffer" )

-- Clear search with <esc>
-- map("n", "<esc>", "<cmd>noh<cr><esc>", "Escape and clear hlsearch" )

-- lazy
map("n", "<leader>l", "<cmd>Lazy<CR>", "Lazy") 
