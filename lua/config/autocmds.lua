local api = vim.api
local telescope_builtin = require("telescope.builtin")

api.nvim_create_autocmd(
	"FileType",
	{ pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("help_window_right", {}),
	-- pattern = { "*.txt" },
	callback = function()
		if vim.o.filetype == "help" then
			vim.cmd.wincmd("L")
		end
	end,
})

-- api.nvim_create_autocmd("VimEnter", {
-- 	callback = function()
-- 		telescope_builtin.find_files()
-- 	end,
-- })

api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	command = [[
    nnoremap <buffer><silent> dd :.Reject<CR>
    xnoremap <buffer><silent> d :'<,'>Reject<CR>
  ]],
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Format ERB with htmlbeautifier and rustywind",

	group = vim.api.nvim_create_augroup("__format__", { clear = true }),
	callback = function(opts)
		if vim.bo[opts.buf].filetype == "eruby" then
			local current_buffer_path = vim.fn.expand('%:p')
			vim.cmd("w!")
			vim.fn.system(string.format("rustywind %s --write", current_buffer_path))
			vim.cmd("e!")
			-- ERB is formatting incorrectly when embedded JS exists
			-- vim.cmd("FormatWrite")
		end
	end,
})

