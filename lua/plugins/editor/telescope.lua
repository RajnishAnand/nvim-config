return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  tag = '0.1.2',
  dependencies = { "nvim-lua/plenary.nvim"},
  -- version = false, -- telescope did only one release, so use HEAD for now
  keys = {
    -- find 
      {"<leader>f", desc= "+Find"},
      { "<leader>fb", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>fc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },

    -- search
    --
    -- { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
    -- { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    -- { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    -- { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    -- { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
    -- { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
    -- { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
    -- { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    -- { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    -- { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    -- { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    -- { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    -- { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    -- { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
    -- { "<leader>sw", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
    -- { "<leader>sW", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
    -- { "<leader>sw", Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
    -- { "<leader>sW", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      -- mappings = {
      --   i = {
      --     ["<c-t>"] = function(...)
      --       return require("trouble.providers.telescope").open_with_trouble(...)
      --     end,
      --     ["<a-t>"] = function(...)
      --       return require("trouble.providers.telescope").open_selected_with_trouble(...)
      --     end,
      --     ["<a-i>"] = function()
      --       local action_state = require("telescope.actions.state")
      --       local line = action_state.get_current_line()
      --       Util.telescope("find_files", { no_ignore = true, default_text = line })()
      --     end,
      --     ["<a-h>"] = function()
      --       local action_state = require("telescope.actions.state")
      --       local line = action_state.get_current_line()
      --       Util.telescope("find_files", { hidden = true, default_text = line })()
      --     end,
      --     ["<C-Down>"] = function(...)
      --       return require("telescope.actions").cycle_history_next(...)
      --     end,
      --     ["<C-Up>"] = function(...)
      --       return require("telescope.actions").cycle_history_prev(...)
      --     end,
      --     ["<C-f>"] = function(...)
      --       return require("telescope.actions").preview_scrolling_down(...)
      --     end,
      --     ["<C-b>"] = function(...)
      --       return require("telescope.actions").preview_scrolling_up(...)
      --     end,
      --   },
      --   n = {
      --     ["q"] = function(...)
      --       return require("telescope.actions").close(...)
      --     end,
      --   }
      -- }
    }
  }
}

