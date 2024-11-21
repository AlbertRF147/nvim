-- local signs = { Error = "❌", Warn = "⚠️", Hint = "💡", Info = "ℹ️" }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
--
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lsp_zero = require("lsp-zero")

require("mason-lspconfig").setup({
	ensure_installed = { "eslint", "emmet_ls", "lua_ls", "rust_analyzer", "pyright" },
	handlers = {
		function(server_name)
			-- if server_name == "tsserver" then
			-- 	server_name = "ts_ls"
			-- 	require("lspconfig")[server_name].setup({
			-- 		-- on_attach = on_attach,
			-- 		-- flags = lsp_flags,
			-- 		settings = {
			-- 			completions = {
			-- 				completeFunctionCalls = true
			-- 			}
			-- 		}
			-- 	})
			-- end
			if server_name == "eslint" then
				require("lspconfig")[server_name].setup({
					bin = "eslint_d", -- or `eslint_d`
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
					},
				})
			end
		end,
		tailwindcss = function()
			require("lspconfig").tailwindcss.setup({
				capabilities = capabilities,
				filetypes = {
					"css",
					"eruby",
					"html",
					"embedded_template",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
				},
			})
		end,
		ts_ls = function()
			local mason_registry = require("mason-registry")
			local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"
			print(vue_language_server_path)
			require("lspconfig").ts_ls.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_language_server_path,
							languages = { "vue" },
						},
					},
				},
				filetypes = { "vue" },
			})
		end,
		volar = function()
			require("lspconfig").volar.setup({
				init_options = {
					vue = {
						hybridMode = false,
					},
				},
			})
		end,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
		bashls = function()
			require("lspconfig").bashls.setup({
				capabilities = capabilities,
			})
		end,
		pylsp = function()
			require("lspconfig").pylsp.setup({
				capabilities = capabilities,
			})
		end,
		emmet_ls = function()
			require("lspconfig").emmet_ls.setup({
				filetypes = {
					"css",
					"eruby",
					"html",
					"embedded_template",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
				},
				init_options = {
					html = {
						options = {
							-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
							["bem.enabled"] = true,
						},
					},
				},
			})
		end,
	},
})
