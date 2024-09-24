return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {},
	priority = 1,
	config = {
		function()
			require("typescript-tools").setup({
				-- settings = {
				-- 	jsx_close_tag = {
				-- 		enable = true,
				-- 		filetypes = { "javascriptreact", "typescriptreact" }
				-- 	}
				-- }
			})
		end
	}
}
