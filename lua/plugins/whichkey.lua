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
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Harpoon
wk.register({
	["<C-h>"] = {
		function()
			ui.nav_prev()
		end,
		"Harpoon nav prev",
	},
	["<C-l>"] = {
		function()
			ui.nav_next()
		end,
		"Harpoon nav next",
	},
}, { mode = "n" })
wk.register({
	a = {
		function()
			mark.add_file()
		end,
		"Harpoon add file",
	},
	h = {
		function()
			ui.toggle_quick_menu()
		end,
		"Harpoon toggle menu",
	},
}, opts)

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
		t = { "<cmd>NvimTreeOpen<cr>", "Open Tree" },
		f = {
			function()
				require("telescope.builtin").find_files({})
			end,
			"Find files",
		},
		g = { "<cmd>Telescope git_files<cr>", "Find Git Files" },
		v = { "<cmd>Oil<CR>", "View/Edit project" },
		s = {
			function()
				builtin.live_grep()
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
