return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = false,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
