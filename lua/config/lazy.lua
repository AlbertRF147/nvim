local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Workaround until tailwind-tools issue is solved
-- New lspconfig versions prevent tailwindcss from being registered
do
  local ok, lspconfig = pcall(require, "lspconfig")
  if ok and not rawget(lspconfig, "tailwindcss") then
    local configs = require("lspconfig.configs")
    local server = require("lspconfig.server_configurations.tailwindcss")
    configs.tailwindcss = configs.tailwindcss or server
    lspconfig.tailwindcss = server
  end
end

require("lazy").setup({
	spec = {
		{ import = "plugins" }
	},
	checker = { enabled = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		}
	},
	cache = { enabled = true },
})
