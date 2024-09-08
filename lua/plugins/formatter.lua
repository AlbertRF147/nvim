local util = require("formatter.util")

local prettierd_conf = {
	function()
		return {
			exe = "prettierd",
			args = { vim.api.nvim_buf_get_name(0) },
			stdin = true,
			-- env = {
			-- 	string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
			-- },
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

local prettier_haml = {
	function()
		return {
			exe = "npx prettier",
			args = {
				util.escape_path(util.get_current_buffer_file_path()),
				"-plugin=@prettier/plugin-haml",
			},
			stdin = true,
		}
	end,
}

local prettier_html = {
	function()
		return {
			exe = "npx prettier",
			args = {
				util.escape_path(util.get_current_buffer_file_path()),
				"-plugin=prettier-plugin-erb",
			},
			stdin = true,
		}
	end,
}

local beautify = function()
	return {
		exe = "html-beautify",
		args = {
			util.escape_path(util.get_current_buffer_file_path()),
		},
		stdin = true,
	}
end

local rustywind = function()
	return {
		exe = "rustywind",
		args = {
			util.escape_path(util.get_current_buffer_file_path()),
			"--write"
		},
		stdin = false,
	}
end

require("formatter").setup({
	logging = true,
	filetype = {
		astro = { prettier_ejs_conf, rustywind },
		javascript = prettier_ejs_conf,
		javarcriptreact = prettier_ejs_conf,
		typescript = prettier_ejs_conf,
		typescriptreact = prettier_ejs_conf,
		css = prettier_ejs_conf,
		-- other formatters ...
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		embedded_template = { prettier_ejs_conf, ts_lsp_actions },
		haml = prettier_haml,
		eruby = {
			beautify,
			-- rustywind,
		},
	},
})
