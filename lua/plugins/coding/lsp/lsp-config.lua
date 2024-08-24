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

    -- inlay_hints = { enabled = true },

    -- options for vim.diagnostic.config()
    diagnostics = {
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      -- signs = { active = signs }, -- show sings
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "󰹞",
      },
      -- virtual_text = false,
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
    -- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

    -- LSP settings (for overriding per client)
    local handlers =  {
      ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}),
      ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"}),
    }

    local options = {
      mason_lspconfig =require ("plugins.coding.lsp.mason-lspconfig"),
      mason = require ("plugins.coding.lsp.mason")
    }


    -- set up in order --

    -- 1.mason
    ---@diagnostic disable-next-line : different-requires
    require("mason").setup(options.mason)

    -- 2.mason_lspconfig
    ---@diagnostic disable-next-line : different-requires
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup(options.mason_lspconfig)
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- 3.setup servers : automatic 
    mason_lspconfig.setup_handlers {
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
          handlers = handlers
        }
      end,

      -- Next, you can provide a dedicated handler for specific servers.
      -- For example, a handler override for the `lua_ls`:
      ["lua_ls"] = function ()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              }
            }
          }
        }
      end,

    }

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
