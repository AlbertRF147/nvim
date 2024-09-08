local lsp_zero = require("lsp-zero")
local nvim_command = vim.api.nvim_command
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_attach = function(client, bufnr)
	vim.notify("Lsp Zero attached!!!")
	local opts = { buffer = bufnr, remap = false }

	-- client.server_capabilities = capabilities
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

	nvim_command('autocmd CursorHold <buffer> lua vim.diagnostic.open_float({ focusable = false })')
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = capabilities,
})
