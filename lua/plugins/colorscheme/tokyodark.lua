-- tokyodark.nvim
-- https://github.com/tiagovla/tokyodark.nvim

return {
  "tiagovla/tokyodark.nvim",
  opts = {
      -- custom options here
  },

  config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
      vim.cmd [[colorscheme tokyodark]]
  end,

  init = function ()
    -- vim.cmd[[colorschem tokyodark]];
  end

}
