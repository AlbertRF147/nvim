local fine_cmdline = require('fine-cmdline')

fine_cmdline.setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = ': '
  },

  popup = {
    position = {
      row = '10%',
      col = '50%',
    },
    size = {
      width = '60%',
    },
    border = {
      style = 'rounded',
    },
    win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:DiagnosticOk',
    },
  },
  hooks = {
    before_mount = function(input)
      -- code
    end,
    after_mount = function(input)
      -- code
    end,

    set_keymaps = function(imap, feedkeys)
      imap('<Esc>', fine_cmdline.fn.close)
      imap('<C-c>', fine_cmdline.fn.close)
      imap('<Tab>', fine_cmdline.fn.complete_or_next_item)
      imap('<S-Tab>', fine_cmdline.fn.down_search_history)
      imap('<Up>', fine_cmdline.fn.up_history)
      imap('<Down>', fine_cmdline.fn.down_history)
    end
  }
})
