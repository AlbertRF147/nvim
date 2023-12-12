local prettierd_conf = {
	function()
		return {
			exe = "prettierd",
			args = { vim.api.nvim_buf_get_name(0) },
			stdin = true,
		}
	end,
}

require("formatter").setup({
	logging = false,
	filetype = {
		javascript = prettierd_conf,
		javarcriptreact = prettierd_conf,
		typescript = prettierd_conf,
		typescriptreact = prettierd_conf,
    css = prettierd_conf,
		-- other formatters ...
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
	},
})
