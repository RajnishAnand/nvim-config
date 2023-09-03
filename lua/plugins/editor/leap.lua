-- leap.nvim
-- https://github.com/ggandor/leap.nvim

return {
    "ggandor/leap.nvim",
    dependencies = {"tpope/vim-repeat"},
    lazy = false,

    init = function () require('leap').add_default_mappings() end,
}
