-- mason
-- https://github.com/williamboman/mason.nvim

return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  opts = {
    ui = {
      border = "single",
      height = 0.8,
    },
  },
}
