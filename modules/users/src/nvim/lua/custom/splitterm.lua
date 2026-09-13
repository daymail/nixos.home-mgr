local term_buf = nil
local term_win = nil

local function toggle_term()
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  vim.cmd('botright split')
  vim.cmd('resize 12')
  term_win = vim.api.nvim_get_current_win()

  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.api.nvim_win_set_buf(term_win, term_buf)
  else
    vim.cmd('terminal')
    term_buf = vim.api.nvim_get_current_buf()

    vim.wo[term_win].number = false
    vim.wo[term_win].relativenumber = false
    vim.wo[term_win].signcolumn = 'no'
  end
  vim.cmd('startinsert')
end

vim.api.nvim_create_user_command('TTerm', toggle_term, {})
-- vim.keymap.set('n', '<C-j>', toggle_term, {desc = 'Toggle bottom terminal'})
vim.keymap.set('n', '<leader>x', toggle_term, {desc = 'Toggle bottom terminal'})

vim.keymap.set('t', '<C-j>', [[<C-\><C-n>]] .. '<Cmd>lua toggle_term()<CR>', { desc = 'Toggle bottom terminal' })
vim.keymap.set('t', '<leader>x', [[<C-\><C-n>]] .. '<Cmd>lua toggle_term()<CR>', { desc = 'Toggle bottom terminal' })
