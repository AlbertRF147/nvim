--lazy.nvim
--nvim-dap config
return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		-- Keymaps for controlling the debugger
		vim.keymap.set("n", "Q", function()
			dap.terminate()
			dap.clear_breakpoints()
		end, { desc = "Terminate and clear breakpoints" })
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/continue debugging" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
		vim.keymap.set("n", "<leader>B", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<leader>dO", dap.step_over, { desc = "Step over (alt)" })
		vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to cursor" })
		vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle DAP REPL" })
		vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Go down stack frame" })
		vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Go up stack frame" })

		dap.adapters.coreclr_manual = {
			type = "executable",
			command = "netcoredbg", -- el binari que has compilat
			args = { "--interpreter=vscode" },
		}

		dap.configurations.cs = {
      {

        type = "coreclr_manual",
        request = "launch",
        name = "Host (nospa)",
        program = function()
          return vim.fn.getcwd() .. "/../Host/bin/Debug/net8.0/Nestle.GenerativeAI.Host.dll"
        end,
        cwd = "${workspaceFolder}/../Host",
        stopAtEntry = false,
        justMyCode = false,
        env = {
          ASPNETCORE_ENVIRONMENT = "Development",
          ASPNETCORE_URLS = "https://localhost:5001;http://localhost:5002",
        },
      }
		}

		-- .NET specific setup using `easy-dotnet`
		require("easy-dotnet.netcoredbg").register_dap_variables_viewer() -- special variables viewer specific for .NET
	end,
}
