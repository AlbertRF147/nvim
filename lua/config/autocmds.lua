local api = vim.api
local telescope_builtin = require("telescope.builtin")

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
