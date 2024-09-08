if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = 'xclip',
    copy = {
      ['+'] = 'xclip -selection clipboard -in',
      ['*'] = 'xclip -selection primary -in',
    },
    paste = {
      ['+'] = 'xclip -selection clipboard -out',
      ['*'] = 'xclip -selection primary -out',

    },
    cache_enabled = 0,
  }
end

