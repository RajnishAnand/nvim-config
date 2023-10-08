-- nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  lazy = true,

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
      -- virtual_text = {
      --   spacing = 4,
      --   source = "if_many",
      --   -- prefix = "●",
      -- },
      virtual_text = false,
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

  },

  config = function(_, opts)

    -- lspInfo enable border
    require('lspconfig.ui.windows').default_options.border = 'single';
    -- automaic floating diagnostic
    vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

    -- LSP settings (for overriding per client)
    local handlers =  {
      ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
      ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
    }


    -- --
    local options = {
      mason = require ("plugins.coding.lsp.mason").opts,
      mason_lspconfig = require ("plugins.coding.lsp.mason-lspconfig").opts
    }

    require ("mason").setup(options.mason) local mason_lspconfig = require ("mason-lspconfig") local lspconfig = require("lspconfig")
    mason_lspconfig.setup(options.mason_lspconfig)
    local installed_servers = mason_lspconfig.get_installed_servers()

    -- --
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    for _, server in pairs(installed_servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
        handlers = handlers
      })
    end

    -- diagnostics 
    vim.diagnostic.config(opts.diagnostics)
    for _, sign in ipairs(opts.signs) do
	  	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	  end

  end,

  keys = {
    { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
    { "gl", vim.diagnostic.open_float, desc= "Line Diagnostic"},
    { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
    { "K", vim.lsp.buf.hover, desc = "Hover" },

    -- { "<leader>cf", format, desc = "Format Document", has = "formatting" },
    -- { "<leader>cf", format, desc = "Format Range", mode = "v", has = "rangeFormatting" },
    -- { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
  }
}
