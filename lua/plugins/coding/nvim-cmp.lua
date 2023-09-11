-- nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp

return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",  -- lsp
    "hrsh7th/cmp-buffer", -- buffer 
    "hrsh7th/cmp-path", -- path
    "saadparwaiz1/cmp_luasnip", -- snippets
    -- TODO: try codium  AI : https://github.com/jcdickinson/codeium.nvim
    
    "onsails/lspkind.nvim", -- lsp icons
    "nvim-tree/nvim-web-devicons"
  },

  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },

      snippet = {
        expand = function(args) 
          require("luasnip").lsp_expand(args.body) 
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = {

        -- FIX: Supertab 
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings

        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then cmp.select_next_item()
        --   -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
        --   -- they way you will only jump inside the snippet region
        --   elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
        --   elseif has_words_before() then cmp.complete()
        --   else fallback() end
        -- end, { "i", "s" }),

        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then cmp.select_prev_item()
        --   elseif luasnip.jumpable(-1) then luasnip.jump(-1)
        --   else fallback() end
        -- end, { "i", "s" }),

        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --
        -- ["<S-CR>"] = cmp.mapping.confirm({
        --   behavior = cmp.ConfirmBehavior.Replace,
        --   select = true,
        -- }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      },

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }), 

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)

          -- king icons
          if vim.tbl_contains({ 'path' }, entry.source.name) then
            local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
            if icon then
              vim_item.kind = icon
              vim_item.kind_hl_group = hl_group
              return vim_item
            end
          end

          -- source icons
          vim_item.menu = ({
            -- copilot =  " Copilot",
            nvim_lsp = "⌘ LSP",
            luasnip =  " Snippet",
            buffer =   "𝌎 Buffer",
            path =     "⎇ Path",
            rg =       " Fuzzy",
          })[entry.source.name]

          return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
        end
      }, 

      experimental = { ghost_text = { hl_group = "CmpGhostText" } },
      sorting = defaults.sorting,
    }
  end,
}

