local dap = require("dap")

require("dap-vscode-js").setup({
	adapters = {
		"pwa-chrome",
	},
})

for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-chrome",
			request = "launch",
			name = "Chrome Launch",
		},
	}
end
