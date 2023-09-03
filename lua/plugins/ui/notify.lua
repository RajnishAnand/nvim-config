-- nvim notify
-- https://github.com/rcarriga/nvim-notify
-- notification 

return {
  "rcarriga/nvim-notify",
  opts = {
    background_colour = "#000000",
    render = "compact",
    stages = "static"
  },

  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all Notifications",
    },
  },
  opts = {
    timeout = 3000,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
  },
  init = function()  vim.notify = require("notify") end,
}
