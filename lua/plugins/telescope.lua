return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
		},
	},
	config = function()
		local lga_actions = require("telescope-live-grep-args.actions")

		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules", "dist" },
				-- layout_strategy = "vertical",
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
					mappings = { -- extend mappings
						i = {
							["<C-s>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --i " }),
							["C-space"] = lga_actions.to_fuzzy_refine,
						},
					},
				},
			}
		})
		require("telescope").load_extension("live_grep_args")
	end,
}
