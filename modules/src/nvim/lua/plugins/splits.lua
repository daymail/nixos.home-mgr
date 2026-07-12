return {
  'mrjones2014/smart-splits.nvim',
  -- optional: pin to a specific version
  -- version = '>=1.0.0',
  -- If using Kitty terminal and want multiplexer support, uncomment the build line:
  -- build = './kitty/install-kittens.bash',
  -- Recommended: don't lazy load this plugin for best multiplexer integration
  -- lazy = false,  -- loads on startup
  config = function()
    require('smart-splits').setup({
      -- Default config (you can customize as needed)
      ignored_buftypes = {
        'nofile',
        'quickfix',
        'prompt',
      },
      ignored_filetypes = { 'NvimTree' },
      default_amount = 3,
      at_edge = 'wrap',        -- wrap to opposite side when at edge
      float_win_behavior = 'previous',
      move_cursor_same_row = false,
      cursor_follows_swapped_bufs = false,
      -- multiplexer integration auto-detected by default
      multiplexer_integration = nil,  -- auto-detects tmux, wezterm, kitty, zellij
      disable_multiplexer_nav_when_zoomed = true,
      log_level = 'info',
    })

    -- Recommended key mappings
    -- Resizing splits (Alt + direction)
    vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)

    -- Moving between splits (Ctrl + direction)
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)

    -- Swapping buffers between windows (optional)
    -- vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
    -- vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
    -- vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
    -- vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
  end,
}
