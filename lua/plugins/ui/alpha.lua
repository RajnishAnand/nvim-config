-- alpha-nvim
-- https://github.com/goolord/alpha-nvim

return {
  "goolord/alpha-nvim",
  event = "VimEnter",

  config = function()
    local dashboard = require("alpha.themes.dashboard")
    -- FIX: Find how to get username in termux 
    local username = "@" .. (vim.env.USER or vim.env.USERNAME or "user")
    local logo = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }
    dashboard.section.header.val = logo
    dashboard.section.footer.val = username

    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("l", "  Last Session", "<cmd>lua require('persistence').load() <CR>"),
      dashboard.button("r", "󰄉  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "󰊄  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e " .. vim.fn.stdpath("config") .." <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    -- vim.cmd([[autocmd User AlphaReady echo 'ready']])

    require("alpha").setup(dashboard.opts)
  end,

  keys = { { "<leader>a", "<cmd>Alpha<CR>", desc =  "Alpha (dashboard)" } }
}
