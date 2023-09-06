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
      { "<leader>u", desc = "+Ui"},
      { "<leader>x", desc = "+Diagnostics/quickfix" },
      { "<leader>s", desc = "+Search" },
   },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
