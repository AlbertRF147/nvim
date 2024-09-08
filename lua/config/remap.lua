vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("v", "<C><C>", "<Esc>")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
-- vim.keymap.set("n", "<leader>w", "<C-w>")
-- vim.keymap.set("n", "<leader><leader>", "<C-^>")
-- vim.keymap.set("n", "<leader>s", "<cmd>w<CR>")
-- vim.keymap.set("i", "jj", "<Esc>")
-- vim.keymap.set("n", "<leader>ss", "<cmd>so %<CR>")
-- 
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- 
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- 
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
-- 
-- -- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])
-- 
-- -- next greatest remap ever : asbjornHaland
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
-- 
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
-- 
-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tms<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- 
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- 
-- vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

