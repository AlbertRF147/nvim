-- local signs = { Error = "❌", Warn = "⚠️", Hint = "💡", Info = "ℹ️" }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
--
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  -- custom keymaps or config per server if needed
end)

lsp_zero.setup_servers({
  "eslint",
  "emmet_ls",
  "lua_ls",
  "rust_analyzer",
  "pyright",
})

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "eslint", "emmet_ls", "lua_ls", "rust_analyzer", "pyright" },
  handlers = {
    lsp_zero.default_setup, -- this automatically sets up each LSP with recommended defaults
    -- Custom handlers (like your tailwindcss, volar, etc.) go below:
    tailwindcss = function()
      require("lspconfig").tailwindcss.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        filetypes = {
          "css", "eruby", "html", "embedded_template", "javascript", "javascriptreact", "less",
          "sass", "scss", "svelte", "pug", "typescriptreact", "vue",
        },
      })
    end,

    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  },
})
