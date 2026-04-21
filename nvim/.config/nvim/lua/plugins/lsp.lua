return {
  {
    "neovim/nvim-lspconfig",  -- still needed for server definitions
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- ✅ New 0.11+ API
      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "h" },
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
        filetypes = { "python" },
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
            },
          },
        },
      })

      -- Enable both
      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")

      -- Completions
      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]     = cmp.mapping.select_next_item(),
          ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
          ["<C-e>"]     = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
        }),
      })
    end,
  },
}
