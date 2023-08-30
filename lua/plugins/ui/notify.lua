-- nvim notify
-- https://github.com/rcarriga/nvim-notify

return {
  "rcarriga/nvim-notify",
  opts = {
    background_colour = "#000000",
    render = "compact",
    stages = "static",

    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = "",
    },
  },
}
