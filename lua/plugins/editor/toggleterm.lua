-- toggleterm.nvim
-- https://github.com/akinsho/toggleterm.nvim

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  event = "VeryLazy",
  opts = {
    --[[ things you want to change go here]]
    size = 20,
	  open_mapping = [[<c-t>]],
	  hide_numbers = true,
	  shade_filetypes = {},
	  shade_terminals = true,
	  shading_factor = 2,
	  start_in_insert = true,
	  insert_mappings = true,
	  persist_size = true,
	  direction = "float",
	  close_on_exit = true,
	  shell = vim.o.shell,
	  float_opts = {
	  	border = "curved",
	  	winblend = 0,
	  	highlights = {
	  		border = "Normal",
	  		background = "Normal",
	  	},
	  }
  },

  config = function (_, opts) 
    require("toggleterm").setup(opts);

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()');
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    local Terminal = require("toggleterm.terminal").Terminal

    -- lazygit
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    function _LAZYGIT_TOGGLE() lazygit:toggle() end

    -- nodejs: Interpreter
    local node = Terminal:new({ cmd = "node", hidden = true })
    function _NODE_TOGGLE() node:toggle() end

    -- ncdu: NCurses Disk Usage
    local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
    function _NCDU_TOGGLE() ncdu:toggle() end
    
    -- htop: process viewer
    local htop = Terminal:new({ cmd = "htop", hidden = true })
    function _HTOP_TOGGLE() htop:toggle() end
    
    --   nnn: file manager
    local nnn = Terminal:new({ cmd = "nnn", hidden = true })
    function _NNN_TOGGLE() nnn:toggle() end
    
    -- python: Interpreter
    local python = Terminal:new({ cmd = "python", hidden = true })
    function _PYTHON_TOGGLE() python:toggle() end

  end,

  keys = {
    { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node" },
    { "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc = "lazygit" },
    { "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", desc = "NCDU" },
    { "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop" },
    { "<leader>to", "<cmd>lua _NNN_TOGGLE()<cr>", desc = "Nnn" },
    { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python" },
    -- terminal 
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating Terminal" },
    { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal Terminal" },
    { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc =  "Vertical Terminal" },
  }
}





