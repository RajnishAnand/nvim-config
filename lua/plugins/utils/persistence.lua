-- persistence
-- https://github.com/folke/persistence.nvim

return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
    pre_save = nil, -- a function to call before saving the session
  },

  -- automatically loads last session
  -- init = function () require("persistence").load() end
}
