local api = vim.api

api.nvim_create_autocmd(
	"FileType",
	{ pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)

api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("help_window_right", {}),
	-- pattern = { "*.txt" },
	callback = function()
		if vim.o.filetype == "help" then
			vim.cmd.wincmd("L")
		end
	end,
})

api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	command = [[
    nnoremap <buffer><silent> dd :.Reject<CR>
    xnoremap <buffer><silent> d :'<,'>Reject<CR>
  ]],
})

-- Disable hover in favor of Pyright
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then
			return
		end
		if client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
	end,
	desc = "LSP: Disable hover capability from Ruff",
})

-- Linter
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint()

		-- You can call `try_lint` with a linter name or a list of names to always
		-- run specific linters, independent of the `linters_by_ft` configuration
		-- require("lint").try_lint("cspell")
	end,
})

-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--   pattern = {"*.scss"},
--   callback = function()
--     -- Look for Tailwind-style @apply or @tailwind to switch filetype
--     if vim.fn.search("@apply\\|@tailwind", "nw") ~= 0 then
--       vim.bo.filetype = "css"
--     end
--   end
-- })
--

local function apply_bg()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
end

-- Define your preferred cursor per mode (edit this block to taste)
local function apply_guicursor()
	vim.opt.guicursor = table.concat({
		"n-v-c:block", -- normal/visual/command = steady block
		"i-ci:ver25-blinkwait700-blinkon400-blinkoff250", -- insert/cmdline insert = blinking bar
		"r-cr:hor20", -- replace = underline
		"o:hor50", -- operator-pending = thick underline
	}, ",")
end

-- Apply now, and re-apply whenever a colorscheme is set
local grp = vim.api.nvim_create_augroup("force_guicursor", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
	group = grp,
	callback = function()
		apply_guicursor()
		apply_bg()
	end,
})

-- Optional: if some plugin keeps changing it later, this catches any change and re-asserts yours
vim.api.nvim_create_autocmd("OptionSet", {
	group = grp,
	pattern = "guicursor",
	callback = function()
		apply_guicursor()
		apply_bg()
	end,
})
