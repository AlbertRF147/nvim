
local prettier_ejs_conf = function(util)
	return {
			exe = "prettier",
			args = {
				util.escape_path(util.get_current_buffer_file_path()),
				"--parser html",
				"--embedded-language-formatting=off",
			},
			stdin = true,
	}
end

local prettier_haml = function(util)
	return {
		exe = "npx prettier",
		args = {
			util.escape_path(util.get_current_buffer_file_path()),
			"-plugin=@prettier/plugin-haml",
		},
		stdin = true,
	}
end


local beautify = function(util)
	return {
		exe = "html-beautify",
		args = {
			util.escape_path(util.get_current_buffer_file_path()),
		},
		stdin = true,
	}
end

local rustywind = function(util)
	return {
		exe = "rustywind",
		args = {
			util.escape_path(util.get_current_buffer_file_path()),
			"--write"
		},
		stdin = false,
	}
end

return {
	"mhartington/formatter.nvim",
	config = function()
		local util = require("formatter.util")
		require("formatter").setup({
			logging = true,
			filetype = {
				html = prettier_ejs_conf(util),
				astro = { prettier_ejs_conf(util), rustywind(util) },
				javascript = prettier_ejs_conf(util),
				javarcriptreact = prettier_ejs_conf(util),
				typescript = {
					require("formatter.filetypes.typescript").prettierd
				},
				typescriptreact = {
					require("formatter.filetypes.typescriptreact").prettierd
				},
				vue = {
					require("formatter.filetypes.vue").prettierd
				},
				python = {
					function()
						return {
							exe = "ruff",
							args = { "format", "--line-length", "110", util.escape_path(util.get_current_buffer_file_path()) },
							stdin = false
						}
					end
				},
				json = {
					require("formatter.filetypes.json").prettierd,
				},
				css = prettier_ejs_conf(util),
				-- other formatters ...
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				embedded_template = { prettier_ejs_conf(util) },
				haml = prettier_haml(util),
				eruby = {
					beautify(util),
					-- rustywind,
				},
			},
		})
	end
}
