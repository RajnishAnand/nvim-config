-- lualine.nvim
-- https://github.com/nvim-lualine/lualine.nvim
-- https://www.lazyvim.org/plugins/ui#lualinenvim

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }
}

local filetype = {"filetype", colored = false, icon = { align = 'right' }}
local branch = { "branch", icons_enabled = true, icon = "",}
local location = { "location", padding = 0 }

-- progress bar
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local line_ratio = current_line / total_lines
  return math.ceil(line_ratio*100).."﹪"
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()

    return {
      options = {
        icons_enabled = true,
        globalstatus = true,
        always_divide_middle = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
      },

      sections = {
        lualine_a = { branch },
        lualine_b = { "mode" },
        lualine_c = { diagnostics, diff },
        lualine_x = { "encoding", "fileformat", filetype },
        lualine_y = { location },
        lualine_z = { progress },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {"lazy", "nvim-tree" },
    }
  end
}



