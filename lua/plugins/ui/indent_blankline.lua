-- inent_blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    --char = "▏",
    char = "│",
    filetype_exclude = {
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
    },

    show_end_of_line = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
  }
}
