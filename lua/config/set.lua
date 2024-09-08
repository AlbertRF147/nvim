vim.opt.guicursor = ""

vim.o.mouse = "a"

vim.o.clipboard = "unnamedplus"

vim.o.breakindent = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = "menuone,noselect"

vim.opt.timeoutlen = 500
vim.g.which_key_timeout = 500

vim.opt.nu = true
-- vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.autoread = true
-- vim.opt.buftype = "nofile"

-- vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.cursorline = true

vim.filetype.add({
  extension = {
    ejs = 'embedded_template'
  }
})
