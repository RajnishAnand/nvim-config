return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
    defaults = {
      mode =  "n" ,
      prefix = "<leader>",
      [ "u" ] = { name = "+Ui" },
      [ "f" ] = { name = "+Find" },
      [ "x" ] = { name = "+Diagnostics/quickfix" },
      [ "s" ] = { name = "+Search" },
      [ "b" ] = { name = "+Buffer" },

      [ "q" ] = { "<cmd>q<CR>", "Exit" },
      [ "w" ] = { "<cmd>w<CR>", "Save" },
   },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
