local lsp_zero = require("lsp-zero")
local nvim_command = vim.api.nvim_command

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
	local opts = { buffer = bufnr, remap = false }

	-- client.server_capabilities = capabilities
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>rui", function()
		vim.lsp.buf.code_action({ apply = true, context = { only = { "source.organizeImports.ts" } } })
	end, opts)
	vim.keymap.set("n", "<leader>ai", function()
		vim.lsp.buf.code_action({ apply = true, context = { only = { "source.addMissingImports.ts" } } })
	end, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

	nvim_command("autocmd CursorHold <buffer> lua vim.diagnostic.open_float({ focusable = false })")
end)

-- lsp_zero.extend_lspconfig({
-- 	sign_text = true,
-- 	capabilities = capabilities,
-- })
--
