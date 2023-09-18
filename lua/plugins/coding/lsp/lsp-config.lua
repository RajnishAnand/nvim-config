-- nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    -- configuration manager 
    -- { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    -- completion and documentaion for function parameters and alike
    -- { "folke/neodev.nvim", opts = {} },

    { "hrsh7th/cmp-nvim-lsp" },
    -- package manager for lsp
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
  },

  opts = {

    -- line diagnostic sings 
    signs = {
	  	{ name = "DiagnosticSignError", text = "" },
	  	{ name = "DiagnosticSignWarn", text = "" },
	  	{ name = "DiagnosticSignHint", text = "" },
	  	{ name = "DiagnosticSignInfo", text = "" },
	  },

    -- options for vim.diagnostic.config()
    diagnostics = {
      underline = true,
      update_in_insert = false,
      severity_sort = true,
		  -- signs = { active = signs }, -- show sings
      virtual_text = {
        spacing = 4,
        source = "if_many",
        -- prefix = "●",
      },
		  float = {
		  	focusable = true,
		  	style = "minimal",
		  	border = "rounded",
		  	source = "always",
		  	header = "",
		  	prefix = "",
		  },
    },


    -- TODO: find withs these options ownwards

    -- -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
    -- -- Be aware that you also will need to properly configure your LSP server to
    -- -- provide the inlay hints.
    -- inlay_hints = {
    --   enabled = false,
    -- },
    --
    -- -- add any global capabilities here
    -- capabilities = {},
    -- -- Automatically format on save
    -- autoformat = false,
    -- -- Useful for debugging formatter issues
    -- format_notify = false,
    --
    -- -- options for vim.lsp.buf.format
    -- -- `bufnr` and `filter` is handled by the LazyVim formatter,
    -- -- but can be also overridden when specified
    -- format = {
    --   formatting_options = nil,
    --   timeout_ms = nil,
    -- },
    --
    -- -- LSP Server Settings
    -- ---@type lspconfig.options
    -- servers = {
    --   jsonls = {},
    --   lua_ls = {
    --     -- Use this to add any additional keymaps
    --     -- for specific lsp servers
    --     ---@type LazyKeys[]
    --     -- keys = {},
    --     settings = {
    --       Lua = {
    --         workspace = { checkThirdParty = false },
    --         completion = { callSnippet = "Replace", },
    --       },
    --     },
    --   },
    -- },
    --
    -- -- you can do any additional lsp server setup here
    -- -- return true if you don't want this server to be setup with lspconfig
    -- ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    -- setup = {
    --   -- example to setup with typescript.nvim
    --   -- tsserver = fu;nction(_, opts)
    --   --   require("typescript").setup({ server = opts })
    --   --   return true
    --   -- end,
    --   -- Specify * to use this function as a fallback for any server
    --   -- ["*"] = function(server, opts) end,
    -- },
  },

  config = function(_, opts)
    local options = {
      mason = require ("plugins.coding.lsp.mason").opts,
      mason_lspconfig = require ("plugins.coding.lsp.mason-lspconfig").opts
    }

    require ("mason").setup(options.mason)
    local mason_lspconfig = require ("mason-lspconfig")
    local lspconfig = require("lspconfig")

    mason_lspconfig.setup(options.mason_lspconfig)
    local installed_servers = mason_lspconfig.get_installed_servers()

    for _, server in pairs(installed_servers) do
      lspconfig[server].setup({})
    end


    -- diagnostics 
    vim.diagnostic.config(opts.diagnostics)
    for _, sign in ipairs(opts.signs) do
	  	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	  end

  end,
}
