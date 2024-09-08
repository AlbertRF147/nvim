return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local navic = require("nvim-navic")
		require("lualine").setup({
			options = {
				theme = "monokai-pro",
			},
			sections = {
				lualine_c = {
					"vim.fn.expand('%')",
				},
				lualine_x = {
					{
						function()
							return navic.get_location()
						end,
						cond = function()
							return navic.is_available()
						end,
					}
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {}
			},
		})
	end,
}
