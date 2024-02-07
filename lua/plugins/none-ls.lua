local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.tags,
		null_ls.builtins.diagnostics.rubocop,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.diagnostics.clang_check
	},
})

-- vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, {})
