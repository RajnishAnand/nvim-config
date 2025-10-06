return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons"},

  keys = {
    {
      "<leader>e",
      function() vim.cmd[[NvimTreeToggle]] end,
      desc = "File Explorer"
    }
  },

  config = function()
    require("nvim-tree").setup {

        sort_by = "name",
        disable_netrw = true,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening=true,
        open_on_tab = false,
        hijack_cursor = true,
        sync_root_with_cwd = true,

        diagnostics = {
          enable = true,
          icons = { hint = "", info = "", warning = "", error = "" }
        },

        update_focused_file = { enable = true, update_root = true},
        system_open = { cmd = nil, args = {} },
        filters = { dotfiles = false, custom = {} },
        git = { enable = true, ignore = true, timeout = 500 },

        view = {
          width = 25,
          cursorline = true,
          -- hide_root_folder = false,
          side = "left",
          adaptive_size = true,
          number = false,
          relativenumber = false,
        },
        renderer = {
          add_trailing = false,
          group_empty = false,
          highlight_git = false,
          full_name = false,
          highlight_opened_files = "none",
          root_folder_modifier = ":~",
          indent_markers = {
            enable = true,
            icons = {
              corner = "└ ",
              edge = "│ ",
              item = "│ ",
              none = "  ",
            },
          },
          icons = {
              webdev_colors = true,
              git_placement = "before",
              padding = " ",
              symlink_arrow = " ➛ ",
              show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
              },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                  arrow_closed = "▶",
                  arrow_open = "▼",
                  default = "",
                  open = "",
                  empty = "",
                  empty_open = "",
                  symlink = "",
                  symlink_open = "",
                },
              git = {
                  -- status type
                  untracked = "U",
                  unstaged = "󱨈",
                  staged = "",
                  unmerged = "",
                  ignored = "◌",
                  -- change type
                  renamed = "➜",
                  deleted = "",
                },
            },
          },
          special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        },

        trash = { cmd = "gio trash", require_confirm = true },
        actions = {open_file = { quit_on_open = true,window_picker = { enable = false }}}

      }
  end,
}





