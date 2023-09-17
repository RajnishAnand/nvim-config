local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- { "folke/lazy.nvim", version = "*" },

    -- default LazyVim plugins
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- import plugin directories here
    { import = "plugins.colorscheme" },
    { import = "plugins.editor" },
    { import = "plugins.ui" },
    { import = "plugins.utils" },
    { import = "plugins.coding" },
    { import = "plugins.coding.lsp" },
    -- { import = "plugins" },
  },
  ui = { border = "single" },
  defaults = {
    lazy = true, -- all plugins to be lazyloaded by default

    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
