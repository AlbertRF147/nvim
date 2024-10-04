return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	build = "make tiktoken",       -- Only on MacOS or Linux
	opts = {
		debug = true,                -- Enable debugging
		-- See Configuration section for rest
	},
	config = function()
		require("CopilotChat").setup({
			prompts = {
				ConvertToTs = {
					prompt = "/COPILOT_GENERATE Convert this Javascript code to TypeScript",
				},
				ModulesToEs6 = {
					prompt =
					"/COPILOT_GENERATE For the selection of code, convert the modules export/import sybtax to ES6 imports. I am only interested in the code, no explanations or comments.",
				}
			}
		})
	end,
}
