local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "eslint", "emmet_ls", "lua_ls", "rust_analyzer", "pyright" },
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = lsp_capabilities,
			})

			if server_name == "ts_ls" then
				require("lspconfig").ts_ls.setup({
					capabilities = lsp_capabilities,
					on_attach = function(client, bufnr)
						client.server_capabilities.definitionProvider  = false
						client.server_capabilities.referencesProvider  = false
						-- optionally also:
						-- client.server_capabilities.typeDefinitionProvider = false
						-- client.server_capabilities.implementationProvider = false
					end,
				})
			end

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
				capabilities = lsp_capabilities,
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
		-- ts_ls = function()
		-- 	local mason_registry = require("mason-registry")
		-- 	local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
		-- 		.. "/node_modules/@vue/language-server"
		-- 	require("lspconfig").ts_ls.setup({
		-- 		init_options = {
		-- 			plugins = {
		-- 				{
		-- 					name = "@vue/typescript-plugin",
		-- 					location = vue_language_server_path,
		-- 					languages = { "vue" },
		-- 				},
		-- 			},
		-- 		},
		-- 		filetypes = {
		-- 			"javascript",
		-- 			"javascriptreact",
		-- 			"typescript",
		-- 			"typescriptreact",
		-- 			"vue",
		-- 		},
		-- 	})
		-- end,
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
				capabilities = lsp_capabilities,
			})
		end,
		clangd = function()
			require("lspconfig").clangd.setup({
				capabilities = lsp_capabilities,
			})
		end,
		pylsp = function()
			require("lspconfig").pylsp.setup({
				capabilities = lsp_capabilities,
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
		csharp_ls = function()
			require('lspconfig').csharp_ls.setup({
				capabilities = lsp_capabilities,
				cmd = { "csharp-ls" },
			})
		end,
	},
})

