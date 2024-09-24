local wk = require("which-key")
local harpoon = require('harpoon')
local minimap = require('mini.map')
local treesj = require('treesj')

-- Treesj Split/Join

wk.add({
  { "gS", treesj.toggle, desc = "Split/Join", mode = "n" }
})

-- Harpoon navigation

wk.add({
  { "<Left>",  function() harpoon:list():prev() end, desc = "Harpoon nav prev", mode = "n" },
  { "<Right>", function() harpoon:list():next() end, desc = "Harpoon nav next", mode = "n" }
})

-- Harpoon file management
wk.add({

  { "<Leader>a", function() harpoon:list():append() end,                      desc = "Harpoon add file" },
  { "<Leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon toggle menu" }
})

-- Resize buffers
wk.add({
  { "<Esc>.", ":vertical res +5<Enter>", desc = "Increase buffer width to the right", mode = "n" },
  { "<Esc>,", ":vertical res -5<Enter>", desc = "Increase buffer width to the left",  mode = "n" }
})

-- Visual mode mappings
wk.add({
  { "J", ":m '>+1<CR>gv=gv", desc = "Move selection up",   mode = "v" },

  { "K", ":m '<-2<CR>gv=gv", desc = "Move selection down", mode = "v" }
})

-- Normal mode text movement
wk.add({
  { "J",     "mzJ`z",   desc = "Join lines without losing cursor", mode = "n" },
  { "<C-u>", "<C-u>zz", desc = "Move up without losing cursor",    mode = "n" },
  { "<C-d>", "<C-d>zz", desc = "Move down without losing cursor",  mode = "n" },
  { "n",     "nzzzv",   desc = "Next search result" },
  { "N",     "Nzzzv",   desc = "Previous search result" }
})

-- Visual mode paste
wk.add({
  { "p", '"_dP', desc = "Paste into the void registry", mode = "x" }
})

-- Normal mode yank
wk.add({
  { "y", '"+y', desc = "Yank into the void registry",      mode = "n" },
  { "Y", '"+Y', desc = "Yank line into the void registry", mode = "n" }
})

wk.add({
  { "<Tab>",   "<Esc>",      desc = "Escape", mode = { "n", "o" } },
  { "<Tab>",   "<Esc>gV",    desc = "Escape", mode = "v" },
  { "<Tab>",   "<C-C><Esc>", desc = "Escape", mode = "c" },
  { "<Tab>",   "<Esc>`^",    desc = "Escape", mode = "i" },
  { "<S-Tab>", "<Tab>",      desc = "Insert", mode = "i" },
})

-- Visual mode yank
wk.add({
  { "y", '"+y', desc = "Yank into the void registry", mode = "v" }
})

-- File operations
wk.add({
  { "<leader>fb", function() require('telescope.builtin').buffers() end,                          desc = "Buffers" },
  { "<leader>ft", MiniFiles.open,                                                                 desc = "Open Tree" },
  { "<leader>fT", function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end,                    desc = "Open Tree in current dir" },
  { "<leader>ff", function() require("telescope.builtin").find_files({ hidden = true }) end,      desc = "Find files" },
  { "<leader>fg", "<cmd>Telescope git_files<cr>",                                                 desc = "Find Git Files" },
  { "<leader>fv", "<cmd>Oil<CR>",                                                                 desc = "View/Edit project" },
  { "<leader>fs", function() require('telescope').extensions.live_grep_args.live_grep_args() end, desc = "Find in files" }
}, { mode = "n" })

-- Minimap toggle
wk.add({
  { "m", minimap.toggle, desc = "Minimap toggle" }
})

-- Buffer operations
wk.add({
  { "<leader>bD", function() vim.cmd("%bd|e#") end,    desc = "Delete buffers" },

  { "<leader>bq", function() vim.cmd("QmkFormat") end, desc = "Format QMK keymap" },
  { "<leader>bf", vim.lsp.buf.format,                  desc = "Format buffer" },
  {
    "<leader>bv",
    function()
      vim.cmd("vsplit")
      local win = vim.api.nvim_get_current_win()
      local buf = vim.api.nvim_create_buf(true, true)
      vim.api.nvim_win_set_buf(win, buf)
    end,
    desc = "Vertical split"
  },
  {
    "<leader>bs",
    function()
      vim.cmd("split")
      local win = vim.api.nvim_get_current_win()
      local buf = vim.api.nvim_create_buf(true, true)
      vim.api.nvim_win_set_buf(win, buf)
    end,
    desc = "Horizontal split"
  }
}, { mode = "n" })

-- Window and buffer navigation
wk.add({
  { "<leader>w",       "<C-w>",       desc = "Splits movement" },
  { "<leader>q",       "<cmd>q<CR>",  desc = "Exit vim" },
  { "<leader>s",       "<cmd>w<CR>",  desc = "Save" },
  { "<leader>ss",      "<cmd>so<CR>", desc = "Source" },
  { "<leader><space>", "<C-^>",       desc = "Swap buffer" }
}, { mode = "n" })

-- LazyGit
wk.add({
  { "<leader>g", "<cmd>LazyGit<CR>", desc = "Lazy Git" }
}, { mode = "n" })

-- Fine cmdline
wk.add({
  {
    "<CR>",
    function()
      require("fine-cmdline").open({ default_value = "" })
    end,
    mode = { "n", "v" },
  }
})
