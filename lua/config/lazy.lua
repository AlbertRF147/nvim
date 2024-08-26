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

require("lazy").setup({
	-- Heuristic buffer settings
	"tpope/vim-sleuth",

	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "node_modules" },
				},
			})
			require("telescope").load_extension("live_grep_args")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "embedded_template" },
				modules = {},
				ignore_install = {},
				embedded_template = { enable = true },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},

	{ "nvim-treesitter/playground",       enabled = true },

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "monokai-pro",
				},
				sections = { lualine_c = { "vim.fn.expand('%')" } },
			})
		end,
	},

	-- File shortcuts
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			require('harpoon'):setup({
				menu = {
					width = vim.api.nvim_win_get_width(0) - 4,
				}
			})
		end
	},

	-- Undo tree
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Tablines everywhere
	-- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- Indent scope
	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			require("mini.indentscope").setup()
		end,
	},
	-- Pretty delimiters
	-- "HiPhish/rainbow-delimiters.nvim",

	-- Comment with gc
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "VonHeikemen/lsp-zero.nvim",        branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ "hrsh7th/cmp-cmdline" },

	-- Project navigation/edit in buffers
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()
		end,
	},

	-- Keymap legend
	{
		"folke/which-key.nvim",
	},

	-- Nvim lua signatures
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({})
		end,
	},

	-- Keep cursor centered
	{
		"arnamak/stay-centered.nvim",
		config = function()
			require("stay-centered").setup()
		end,
	},

	"tpope/vim-surround",

	-- Git
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Tree navigation
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- },

	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
	},

	-- Format files
	"mhartington/formatter.nvim",

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- Disable search highlighting when done
	"haya14busa/is.vim",

	-- Repeat plugin maps
	"tpope/vim-repeat",

	-- TPope string replacement
	"tpope/vim-abolish",

	-- Quickfix list operations
	"romainl/vim-qf",

	-- Autopairs
	-- {
	-- 	"windwp/nvim-autopairs",
	-- 	config = function()
	-- 		require("nvim-autopairs").setup({})
	-- 	end,
	-- },
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},

	{
		"echasnovski/mini.map",
		version = false,
		config = function()
			require("mini.map").setup()
		end,
	},

	-- File outline
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {
			-- Your setup opts here
		},
	},

	-- null-ls replacement
	"nvimtools/none-ls.nvim",

	-- Align text
	{
		"echasnovski/mini.align",
		config = function()
			require("mini.align").setup()
		end,
	},

	-- Make f,F,t,T work on multiple lines
	-- Repeat action by pressing key again
	{
		"echasnovski/mini.jump",
		version = false,
		config = function()
			require("mini.jump").setup()
		end,
	},

	{
		"echasnovski/mini.files",
		version = false,
		config = function()
			require("mini.files").setup()
		end,
	},

	{
		"echasnovski/mini.notify",
		version = false,
		config = function()
			require("mini.notify").setup({
				lsp_progress = {
					enable = true,
				},
			})
		end,
	},

	-- {
	-- 	"echasnovski/mini.splitjoin",
	-- 	version = false,
	-- 	config = function()
	-- 		require("mini.splitjoin").setup()
	-- 	end,
	-- },

	-- Split and join
	{
		'Wansmer/treesj',
		-- keys = { 'gm', 'gj', 'gs' },
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = function()
			local tsj_utils = require('treesj.langs.utils')
			local html = require('treesj.langs.html')
			require('treesj').setup({
				langs = {
					ruby = tsj_utils.merge_preset(html, {})
				},
				max_join_length = 1000,
			})
		end,
	},

	-- Colors
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		ft = { "javascript", "html", "css", "erb", "haml", "ejs" },
	},

	-- QMK Ferris layout formatter (local plugin)
	{
		"AlbertRF147/qmk-formatter.nvim",
		opts = {},
	},

	-- Local LLMs
	{
		"David-Kunz/gen.nvim",
		opts = {
			model = "mistral", -- The default model to use.
			show_model = true, -- Displays which model you are using at the beginning of your chat session.
		},
	},

	-- Floating popups to telescope
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},

	-- Sync remote files (ssh, etc.)
	-- {
	-- 	'OscarCreator/rsync.nvim',
	-- 	build = 'make',
	-- 	dependencies = 'nvim-lua/plenary.nvim',
	-- 	config = function()
	-- 		require("rsync").setup()
	-- 	end,
	-- }

	-- Theme
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup()
		end,
	},

	{ "tpope/vim-rails" },

	-- Sticky scroll scope
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-context",
	-- 	config = function()
	-- 		require("treesitter-context").setup()
	-- 	end,
	-- },

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					auto_refresh = true,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>"
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = 'node', -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},
})
