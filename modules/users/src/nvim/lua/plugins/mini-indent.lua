return{
  -- Automatically expands and adds indents when pressing Enter inside {}
  'echasnovski/mini.pairs',
  version = false,
  event = 'VeryLazy',
  config = function()
    local pairs = require('mini.pairs')
    pairs.setup({})
    vim.keymap.set('i', '<CR>', function()
      return pairs.cr()
    end, { expr = true, replace_keycodes = true })
  end,
}
