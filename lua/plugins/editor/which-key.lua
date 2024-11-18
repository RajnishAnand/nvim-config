
return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  opts = {
    preset = "classic",
    plugins = { spelling = true },
    win = {
      no_overlap = false,
      border = "single", -- none, single, double, shadow
    },

    spec = {
      {
        mode =  "n" ,
         { "<leader>u", group = "+Ui" },
         { "<leader>c", group = "+LSP", icon="" },
         { "<leader>f", group = "+Find" },
         { "<leader>x", group = "+Diagnostics/quickfix" },
         -- { "<leader>s", group = " +Search" },
         { "<leader>b", group = "+Buffer" },
         { "<leader>t", group = "+Terminal" },
      },
      -- {
        -- Nested mappings are allowed and can be added in any order
        -- Most attributes can be inherited or overridden on any level
        -- There's no limit to the depth of nesting
        -- mode = { "n", "v" }, -- NORMAL and VISUAL mode
        -- { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
        -- { "<leader>w", "<cmd>w<cr>", desc = "Write", },
      -- }
    }

  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Local Keymaps",
    },
  },
}
