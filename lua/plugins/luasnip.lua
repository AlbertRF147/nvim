local ls = require("luasnip")

-- vim.keymap.set({"i"}, "<C-n>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-b>", function() ls.jump(-1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-n>", function() ls.jump( 1) end, {silent = true})

-- Load snippets
require("luasnip.loaders.from_snipmate").load()
require("luasnip.loaders.from_vscode").lazy_load()

-- Load custom javascript
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
