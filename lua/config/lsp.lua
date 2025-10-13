local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_zero = require("lsp-zero")
local function with_capabilities(opts) opts.capabilities = capabilities; return opts end

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })

  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, remap = false, silent = true, desc = desc })
  end

  -- LSP core
  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "K",  vim.lsp.buf.hover, "Hover docs")
  map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, "Workspace symbols")
  map("n", "<leader>vd",  vim.diagnostic.open_float, "Line diagnostics")
  map("n", "[d", vim.diagnostic.goto_next, "Next diagnostic")
  map("n", "]d", vim.diagnostic.goto_prev, "Prev diagnostic")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
  map("n", "gr", vim.lsp.buf.references, "References")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
  map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature help")

  -- Only add TS Tools mappings when in a TS/JS buffer
  local ft = vim.bo[bufnr].filetype
  if ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
    map("n", "<leader>rf", function() vim.cmd.TSToolsRenameFile() end, "TS: Rename file")
    map("n", "<leader>rui", function() vim.cmd.TSToolsRemoveUnusedImports() end, "TS: Remove unused imports")
    map("n", "<leader>ai", function() vim.cmd.TSToolsAddMissingImports() end, "TS: Add missing imports")
  end

  -- non-focusable diagnostic popup on hover, without duplicating autocmds
  local aug = vim.api.nvim_create_augroup("LspLineDiagnostics", { clear = false })
  vim.api.nvim_clear_autocmds({ group = aug, buffer = bufnr })
  vim.api.nvim_create_autocmd("CursorHold", {
    group = aug,
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float(nil, { focusable = false })
    end,
    desc = "Show diagnostics on hover",
  })
end)

-- TypeScript (disable some providers from tsserver)
vim.lsp.config('ts_ls', with_capabilities({
  on_attach = function(client, bufnr)
    client.server_capabilities.definitionProvider = false
    client.server_capabilities.referencesProvider = false
    -- optionally:
    -- client.server_capabilities.typeDefinitionProvider = false
    -- client.server_capabilities.implementationProvider = false
  end,
}))

-- ESLint (these options belong to the ESLint LSP)
vim.lsp.config('eslint', {
  capabilities = capabilities,
  -- If you want eslint_d specifically, set cmd. Otherwise omit and let it find eslint-lsp.
  cmd = { "vscode-eslint-language-server", "--stdio" },
  settings = {
    -- ESLint LSP settings mirror VSCode’s schema
    -- These roughly correspond to your old fields
    codeAction = {
      disableRuleComment = { enable = true, location = "separateLine" },
      showDocumentation = { enable = true },
    },
    codeActionsOnSave = {
      mode = "all", -- "all" | "problems"
      enable = true,
    },
    -- diagnostics/run_on -> run?
    run = "onType", -- or "onSave"
    -- If you rely on eslint_d, ensure it’s on PATH and consider null-ls/none-ls for formatting.
  },
})

-- TailwindCSS
vim.lsp.config('tailwindcss', with_capabilities({
  filetypes = {
    "css","eruby","html","embedded_template","javascript","javascriptreact",
    "less","sass","scss","svelte","pug","typescriptreact","vue"
  },
}))

-- Volar (Vue)
vim.lsp.config('volar', {
  init_options = { vue = { hybridMode = false } },
  capabilities = capabilities,
})

-- Lua
vim.lsp.config('lua_ls', with_capabilities({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
}))

-- Bash / Clangd / PyLSP / Emmet / C# (light configs)
vim.lsp.config('bashls',   with_capabilities({}))
vim.lsp.config('clangd',   with_capabilities({}))
vim.lsp.config('pylsp',    with_capabilities({}))
vim.lsp.config('emmet_ls', {
  filetypes = {
    "css","eruby","html","embedded_template","javascript","javascriptreact",
    "less","sass","scss","svelte","pug","typescriptreact","vue"
  },
  init_options = { html = { options = { ["bem.enabled"] = true } } },
  capabilities = capabilities,
})
vim.lsp.config('csharp_ls', with_capabilities({ cmd = { "csharp-ls" } }))

-- === Enable servers ===
-- If mason-lspconfig.setup(automatic_enable=true) is set, you can skip the enables
-- and let it auto-enable installed servers. Otherwise, uncomment these:
-- for _, name in ipairs({ "eslint","emmet_ls","lua_ls","rust_analyzer","pyright","ts_ls","tailwindcss","volar","bashls","clangd","pylsp","csharp_ls" }) do
--   vim.lsp.enable(name)
-- endd
