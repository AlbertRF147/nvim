return {
	"tpope/vim-sleuth", -- Heuristic buffer settings
	{ "nvim-treesitter/playground", enabled = true },
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
	{ "VonHeikemen/lsp-zero.nvim", branch = "v4.x", priority = 2 },
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
		end,
	},

	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },
	-- Breadcrumbs lsp
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("nvim-navic").setup({
				lsp = {
					auto_attach = true,
				},
			})
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()
		end,
	},
	-- Nvim lua signatures
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup()
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
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
	},
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
	-- Cmp suggestion pictograms
	"onsails/lspkind.nvim",
	-- Autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
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
		opts = {},
	},
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
	-- Split and join
	{
		"Wansmer/treesj",
		-- keys = { 'gm', 'gj', 'gs' },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup()
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
	{ "AlbertRF147/qmk-formatter.nvim", opts = {} },
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
	-- Theme
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "darker",
				highlights = {
					-- ["LazyGitFloat"] = { fg = "$white", bg = "$grey" },
				}
			})
			require("onedark").load()
		end,
	},
	-- Sticky scroll scope
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-context",
	-- 	config = function()
	-- 		require("treesitter-context").setup()
	-- 	end,
	-- },
	-- TS
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		priority = 1,
		config = {
			function()
				require("typescript-tools").setup({
					settings = {
						jsx_close_tag = {
							enable = true,
							filetypes = { "javascriptreact", "typescriptreact" },
						},
					},
				})
			end,
		},
	},
	-- Floating cmd
	{
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
}
