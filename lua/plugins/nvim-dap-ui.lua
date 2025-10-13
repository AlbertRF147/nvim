return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup({
			layouts = {
				{ elements = { "scopes", "watches", "stacks", "breakpoints" }, size = 40, position = "left" },
				{ elements = { "repl", "console" }, size = 10, position = "bottom" },
			},
			expand_lines = true,
			floating = { border = "rounded" },
		})

		dap.listeners.after.event_initialized["dapui"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui"] = function()
			dapui.close()
		end

		vim.keymap.set({ "n", "v" }, "K", function()
			require("dap.ui.widgets").hover()
		end, { desc = "DAP Hover (variable sota cursor)" })
		vim.keymap.set("n", "<leader>de", function()
			dapui.eval()
		end, { desc = "Eval/Watch expressió" })
	end,
}
