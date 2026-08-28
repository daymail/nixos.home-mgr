return{
  'HiPhish/info.vim',
  cmd = 'Info',
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "info",
      callback = function(opts)
        local function map(key, action)
          vim.keymap.set('n', key, action, {buffer = opts.buf, silent = true})
        end

        vim.keymap.set('n', '<CR>', 'K', {buffer = opts.buf, silent = true, remap = true})

        map('gu', '<Plug>(InfoUp)')   -- 'gu' & 'Backspace' to go up a level
        map('<BS>', '<Plug>(InfoUp)')

        map('gn', '<Plug>(InfoNext)') -- GO NEXT
        map('gp', '<Plug>(InfoPrev)') -- GO PREVIOUS
      end,
    })
  end
}
