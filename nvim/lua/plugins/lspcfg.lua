return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "svelte", "tailwindcss", "gopls", "clangd", "csharp_ls", "ast_grep", "html", "cssls", "pyright" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
        end
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })
      lspconfig.svelte.setup({
        capabilities = capabilities
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        capabilities = capabilities
      })
      lspconfig.prismals.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.zls.setup({
        capabilities = capabilities
      })
      lspconfig.volar.setup({
        capabilities = capabilities
      })
      lspconfig.csharp_ls.setup({
        capabilities = capabilities
      })
      lspconfig.ocamllsp.setup({
        capabilities = capabilities
      })
      lspconfig.ast_grep.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end
  }
}
