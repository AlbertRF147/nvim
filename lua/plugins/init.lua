return {
	"tpope/vim-sleuth", -- Heuristic buffer settings
	{ "nvim-treesitter/playground", enabled = true },
	-- Tablines everywhere
	-- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
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
		cmd = "Mason",
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})
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
	{ "nvim-mini/mini.bufremove" },
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
		cmd = "Oil",
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
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- Disable search highlighting when done
	-- "haya14busa/is.vim",
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
	-- Split and join
	{
		"Wansmer/treesj",
		-- keys = { 'gm', 'gj', 'gs' },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
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
	{
		"AlbertRF147/qmk-formatter.nvim",
		config = function()
			require("qmk-formatter").setup()
		end,
	},
	-- Local LLMs
	-- {
	-- 	"David-Kunz/gen.nvim",
	-- 	opts = {
	-- 		model = "mistral", -- The default model to use.
	-- 		show_model = true, -- Displays which model you are using at the beginning of your chat session.
	-- 	},
	-- },
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
				transparent = false,
				term_colors = true,
				highlights = {
					-- ["LazyGitFloat"] = { fg = "$white", bg = "$grey" },
				},
				lualine = {
					transparent = false,
				},
			})
			require("onedark").load()
		end,
	},
	{ "romainl/vim-cool" },
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
					on_attach = function(client, bufnr)
						client.server_capabilities.definitionProvider = false
					end,
					settings = {
						jsx_close_tag = {
							enable = true,
							filetypes = { "javascript", "javascriptreact", "typescriptreact" },
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
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup({
				file_history_panel = {
					win_config = {
						height = 10,
					},
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = "<Tab>",
						dismiss = "<Esc>",
					},
				},
				should_attach = function(_, bufname)
					local weekday = tonumber(os.date("%w"))
					local hour = tonumber(os.date("%H"))
					if weekday >= 1 and weekday <= 5 then
						if hour >= 8 and hour <= 17 and bufname:match("/controlamaterial/") then
							return false
						end
					end
					return true
				end,
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				json = { "jsonlint" },
				yaml = { "yamllint" },
			}
		end,
	},
	{
		"seblyng/roslyn.nvim",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			-- your configuration comes here; leave empty for default settings
		},
	},
}
