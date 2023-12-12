local ls = require("luasnip")

vim.keymap.set(
'i',
'<c-l>',
function()
  if ls.jumpable() then
    ls.jump(1)
  end
end
)

-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

-- Load custom javascript
require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/snippets" } }
