-- tokyonight.nvim
-- https://github.com/folke/tokyonight.nvim#%EF%B8%8F-configuration

return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    style = "night",
    floats = "transparent",
  },
  init = function () 
    vim.cmd[[colorschem tokyonight]];
  end
}
