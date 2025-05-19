return {
	-- Align text
	{
		"echasnovski/mini.align",
		config = function()
			require("mini.align").setup()
		end,
	},
	-- Make f,F,t,T work on multiple lines
	-- Repeat action by pressing key again
	{
		"echasnovski/mini.jump",
		version = false,
		config = function()
			require("mini.jump").setup()
		end,
	},
	{
		"echasnovski/mini.files",
		version = false,
		config = function()
			require("mini.files").setup()
		end,
	},
	-- {
	-- 	"echasnovski/mini.notify",
	-- 	version = false,
	-- 	config = function()
	-- 		require("mini.notify").setup({
	-- 			lsp_progress = {
	-- 				enable = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"echasnovski/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},

	{
		"echasnovski/mini.map",
		version = false,
		config = function()
			require("mini.map").setup()
		end,
	},
	-- Indent scope
	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			require("mini.indentscope").setup()
		end,
	},
	{
		"echasnovski/mini.starter",
		version = false,
		config = function()
			require("mini.starter").setup()
		end,
	}
}
