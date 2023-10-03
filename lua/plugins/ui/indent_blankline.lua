-- inent_blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = { char = "│" },

    scope = {
      enabled = true,
      char = "│",
      show_start = false,
    },

    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        -- "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      }
    },
  }
}
