-- local signs = { Error = "❌", Warn = "⚠️", Hint = "💡", Info = "ℹ️" }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
--
local lsp_zero = require("lsp-zero")
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "eslint", "emmet_ls", "lua_ls", "rust_analyzer" },
	handlers = {
		function(server_name)
			if server_name == "tsserver" then
				server_name = "ts_ls"
				require("lspconfig")[server_name].setup({
					-- on_attach = on_attach,
					-- flags = lsp_flags,
					settings = {
						completions = {
							completeFunctionCalls = true
						}
					}
				})
			end
			if server_name == "eslint" then
				require("lspconfig")[server_name].setup({
					bin = 'eslint_d', -- or `eslint_d`
					code_actions = {
						enable = true,
						apply_on_save = {
							enable = true,
							types = { "directive", "problem", "suggestion", "layout" },
						},
						disable_rule_comment = {
							enable = true,
							location = "separate_line", -- or `same_line`
						},
					},
					diagnostics = {
						enable = true,
						report_unused_disable_directives = false,
						run_on = "type", -- or `save`
					}
				})
			end
		end,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
		emmet_ls = function()
			require("lspconfig").emmet_ls.setup({
				filetypes = { "css", "eruby", "html", "embedded_template", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
				init_options = {
					html = {
						options = {
							-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
							["bem.enabled"] = true,
						},
					},
				}
			})
		end,
	},
})

