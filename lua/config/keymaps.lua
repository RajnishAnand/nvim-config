-- keymaps
-- TODO: checkout lazyVim keymaps 
-- https://github.com/LaqqzyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = function (mode, lhs, rhs, desc)
  local opts = { desc = desc , noremap = true };
  vim.keymap.set(mode, lhs, rhs, opts);
end


-- save and exit
map("n", "<leader>w", "<cmd>w<CR>", "Write");
map("n", "<leader>q", "<cmd>q!<CR>", "Quit");

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", "Go to left window" )
map("n", "<C-j>", "<C-w>j", "Go to lower window" )
map("n", "<C-k>", "<C-w>k", "Go to upper window" )
map("n", "<C-l>", "<C-w>l", "Go to right window" )

-- buffer
map("n", "<S-h>", "<cmd>bprevious<cr>", "Prev buffer" )
map("n", "<S-l>", "<cmd>bnext<cr>", "Next buffer" )

-- Clear search with <esc>
map("n", "<leader>uh", "<cmd>noh<cr><esc>", "Clear hlsearch" )

-- lazy
map("n", "<leader>l", "<cmd>Lazy<CR>", "Lazy");

-- fast escape
map('i', 'jk', '<Esc>')
map('t', 'jk', [[<C-\><C-n>]])
