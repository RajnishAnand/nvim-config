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
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
  },


  opts = {
    -- inlay_hints = { enabled = true },
    -- options for vim.diagnostic.config()
    diagnostics = {
    -- line diagnostic sings 
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = "󰋼 ",
          [vim.diagnostic.severity.HINT] = "󰌵 ",
        },
        texthl = {
          [vim.diagnostic.severity.ERROR] = "Error",
          [vim.diagnostic.severity.WARN] = "Error",
          [vim.diagnostic.severity.HINT] = "Hint",
          [vim.diagnostic.severity.INFO] = "Info",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
      },

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
      -- mason_lspconfig =require ("plugins.coding.lsp.mason-lspconfig"),
      mason = require ("plugins.coding.lsp.mason")
    }

    ---------------------------------------------------------
    ------------set up in order -----------------------------
    ---------------------------------------------------------

    -- STEP:1 mason
    ---@diagnostic disable-next-line : different-requires
    require("mason").setup(options.mason)


    -- STEP:2 mason_lspconfig
    ---@diagnostic disable-next-line : different-requires
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup()
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities()


    -- STEP:3 setup servers : automatic 
    -- mason_lspconfig.setup_handlers {
    --   -- The first entry (without a key) will be the default handler
    --   -- and will be called for each installed server that doesn't have
    --   -- a dedicated handler.
      -- function (server_name) -- default handler (optional)
      --   require("lspconfig")[server_name].setup {
      --     capabilities = capabilities,
      --     handlers = handlers
      --   }
      -- end,

    --   -- Next, you can provide a dedicated handler for specific servers.
    --   -- For example, a handler override for the `lua_ls`:
    --   ["lua_ls"] = function ()
    --     local lspconfig = require("lspconfig")
    --     lspconfig.lua_ls.setup {
    --       settings = {
    --         Lua = {
    --           diagnostics = {
    --             globals = { "vim" }
    --           }
    --         }
    --       }
    --     }
    --   end,
    --



    -- diagnostics 
    vim.diagnostic.config(opts.diagnostics)



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
