return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		require('harpoon'):setup({
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
			}
		})
	end
}
