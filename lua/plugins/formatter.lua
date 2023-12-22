local util = require("formatter.util")

local prettierd_conf = {
	function()
		return {
			exe = "prettierd",
			args = { vim.api.nvim_buf_get_name(0) },
			stdin = true,
		}
	end,
}

local prettier_ejs_conf = {
	function()
		return {
			exe = "prettier",
			args = {
				util.escape_path(util.get_current_buffer_file_path()),
				"--parser html",
				"--embedded-language-formatting=off",
			},
			stdin = true,
		}
	end,
}

local js_beautify_conf = {
	function()
		return {
			exe = "js-beautify",
			args = {
				util.escape_path(util.get_current_buffer_file_path()),
				"--html",
			},
			stdin = true,
		}
	end,
}

require("formatter").setup({
	logging = true,
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
		embedded_template = prettier_ejs_conf,
	},
})
