local builtin = require("telescope.builtin")
local wk = require("which-key")
local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
}
local harpoon = require('harpoon')

-- Harpoon
wk.register({
	["<C-h>"] = {
		function()
			harpoon:list():prev()
		end,
		"Harpoon nav prev",
	},
	["<C-l>"] = {
		function()
			harpoon:list():next()
		end,
		"Harpoon nav next",
	},
}, { mode = "n" })

wk.register({
	a = {
		function()
			harpoon:list():append()
		end,
		"Harpoon add file",
	},
	h = {
		function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		"Harpoon toggle menu",
	},
}, opts)

wk.register({
	["<Esc>."] = { ":vertical res +5<Enter>", "Increase buffer width to the right" },
	["<Esc>,"] = { ":vertical res -5<Enter>", "Increase buffer width to the left" },
}, { mode = "n" })

wk.register({
	J = { ":m '>+1<CR>gv=gv", "Move selection up" },
	K = { ":m '<-2<CR>gv=gv", "Move selection down" },
}, { mode = "v" })

wk.register({
	J = { "mzJ`z", "Join lines without losing cursor" },
	["<C-u>"] = { "<C-u>zz", "Move up without losing cursor" },
	["<C-d>"] = { "<C-d>zz", "Move down without losing cursor" },
	["n"] = { "nzzzv" },
	["N"] = { "Nzzzv" },
}, { mode = "n" })

-- Copy and paste within voind registry
wk.register({
	p = { '"_dP', "Paste into the void registry" },
}, { mode = "x" })

wk.register({
	y = { '"+y', "Yank into the void registry" },
	Y = { '"+Y', "Yank line into the void registry" },
}, { mode = "n" })

wk.register({
	y = { '"+y', "Yank into the void registry" },
}, { mode = "v" })
-----

wk.register({
	f = {
		name = "file",
		b = {
			function()
				require('telescope.builtin').buffers()
			end,
			"Buffers",
		},
		t = { MiniFiles.open, "Open Tree" },
		f = {
			function()
				require("telescope.builtin").find_files({
					hidden = true,
				})
			end,
			"Find files",
		},
		g = { "<cmd>Telescope git_files<cr>", "Find Git Files" },
		v = { "<cmd>Oil<CR>", "View/Edit project" },
		s = {
			function()
				-- builtin.live_grep()
				require('telescope').extensions.live_grep_args.live_grep_args()
			end,
			"Find in files",
		},
	},
}, opts)

wk.register({
	b = {
		q = {
			function()
				vim.cmd("QmkFormat")
			end,
			"Format QMK keymap",
		},
		f = { vim.lsp.buf.format, "Format buffer" },
		v = {
			function()
				vim.cmd("vsplit")
				local win = vim.api.nvim_get_current_win()
				local buf = vim.api.nvim_create_buf(true, true)
				vim.api.nvim_win_set_buf(win, buf)
			end,
			"Vertical split",
		},
		s = {
			function()
				vim.cmd("split")
				local win = vim.api.nvim_get_current_win()
				local buf = vim.api.nvim_create_buf(true, true)
				vim.api.nvim_win_set_buf(win, buf)
			end,
			"Horizontal split",
		},
	},
}, opts)

wk.register({
	w = { "<C-w>", "Splits movement" },
	q = { "<cmd>q<CR>", "Exit vim" },
	s = { "<cmd>w<CR>", "Save" },
	["ss"] = { "<cmd>so<CR>", "Source" },
	[" "] = { "<C-^>", "Swap buffer" },
}, opts)

wk.register({
	g = { "<cmd>LazyGit<CR>", "Lazy Git" },
}, opts)
