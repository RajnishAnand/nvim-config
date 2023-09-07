-- bufferline.nvim
-- https://github.com/akinsho/bufferline.nvim

return {
  "akinsho/bufferline.nvim",
  dependencies = {"nvim-tree/nvim-web-devicons"},
  event = "VeryLazy",

  keys = {
    { "<leader>bd", "<Cmd>bdelete<CR>", desc = "Delete current buffer"},
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  },

  opts = {
    options = {
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      numbers = "none",
      close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"

      offsets = {
        {
            filetype = "NvimTree",
            text = function () return "NvimTree" end, --  TODO: change this to cwd instead
            highlight = "Directory",
            text_align = "center",  -- "left" | "center" | "right"
            separator = true
        }
      },

      separator_style = "thin",  -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
      always_show_bufferline = true,
      -- sort_by = 'insert_at_end',     -- add custom logic,
    },
  },
}

