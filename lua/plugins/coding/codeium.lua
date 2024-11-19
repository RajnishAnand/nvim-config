-- codeium.nvim
-- https://github.com/Exafunction/codeium.nvim

return {
  "Exafunction/codeium.nvim",
  dependencies = {
      "nvim-lua/plenary.nvim",
  },
  config = function()
    require("codeium").setup({
    })
  end
}

