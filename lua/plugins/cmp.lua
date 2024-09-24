-- local copilot_suggestion = require("copilot.suggestion")
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end


return {
	"hrsh7th/nvim-cmp",
	dependencies = { "L3MON4D3/LuaSnip", "hrsh7th/nvim-cmp", "VonHeikemen/lsp-zero.nvim" },
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lsp_zero = require("lsp-zero")
		-- `/` cmdline setup.
		cmp.setup.cmdline('/', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' }
			}
		})

		-- `:` cmdline setup.
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{
					name = 'cmdline',
					option = {
						ignore_cmds = { 'Man', '!' }
					}
				}
			})
		})

		require("cmp").setup({
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = 'nvim_lsp_signature_help' },
			},
			formatting = lsp_zero.cmp_format(),
			mapping = {
				["<Tab>"] = cmp.mapping({
					s = function(fallback)
						if luasnip.jumpable(1) then
							return luasnip.jump(1)
						else
							-- fallback()
						end
					end
				}),
				["<S-Tab>"] = cmp.mapping({
					c = function()
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
						else
							cmp.complete()
						end
					end,
					i = function(fallback)
						if luasnip.jumpable(-1) then
							return luasnip.jump(-1)
						elseif cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
						else
							fallback()
						end
					end,
					s = function(fallback)
						if luasnip.jumpable(-1) then
							return luasnip.jump(-1)
						else
							fallback()
						end
					end
				}),
				['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
				['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
				['<C-n>'] = cmp.mapping({
					c = function()
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
						end
					end,
					i = function(fallback)
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end
				}),
				['<C-p>'] = cmp.mapping({
					c = function()
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
						else
							vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
						end
					end,
					i = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end
				}),
				['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
				['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
				['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
				['<Right>'] = cmp.mapping({
					i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
				}),
			}
		})
	end
}
