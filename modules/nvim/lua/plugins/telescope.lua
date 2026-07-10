return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function() return vim.fn.executable 'make' == 1 end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    event = 'VimEnter',
    config = function()
      local function apply_telescope_highlights()
        local c = require('config.colorscheme').active
        vim.api.nvim_set_hl(0, "TelescopeSelection",      { bg = c.c2, fg = c.c6 })
        vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = c.c2, fg = c.c12 })
        vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { bg = c.c1, fg = c.c8 })
        vim.api.nvim_set_hl(0, "TelescopeBorder",         { fg = c.c7 })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder",   { fg = c.c9 })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder",  { fg = c.c7 })
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder",  { fg = c.c14 })
        vim.api.nvim_set_hl(0, "TelescopeMatching",       { fg = c.c14, bold = true })
        vim.api.nvim_set_hl(0, "TelescopePromptPrefix",   { fg = c.c9 })
        vim.api.nvim_set_hl(0, "TelescopeNormal",         { bg = c.c0, fg = c.c4 })
        vim.api.nvim_set_hl(0, "TelescopePreviewNormal",  { bg = c.c0 })
        vim.api.nvim_set_hl(0, "TelescopePromptNormal",   { bg = c.c1 })
        vim.api.nvim_set_hl(0, "TelescopeResultsNormal",  { bg = c.c0 })
        vim.api.nvim_set_hl(0, "TelescopeTitle",          { fg = c.c8, bold = true })
        vim.api.nvim_set_hl(0, "TelescopePromptTitle",    { fg = c.c9, bold = true })
        vim.api.nvim_set_hl(0, "TelescopePreviewTitle",   { fg = c.c14, bold = true })
      end

      apply_telescope_highlights()

      require('telescope').setup({
        defaults = {
          preview = { filesize_limit = 1, timeout = 500, treesitter = false },
          layout_config = { preview_width = 0.6, width = 0.9, height = 0.9 },
          mappings = { i = {}, n = {} },
        },
        extensions = {
          ['ui-select'] = { require('telescope.themes').get_dropdown() },
        },
      })

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<C-P>', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = true,
        }))
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep({ grep_open_files = true, prompt_title = 'Live Grep in Open Files' })
      end, { desc = '[S]earch [/] in Open Files' })

      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files({ cwd = vim.fn.stdpath 'config' })
      end, { desc = '[S]earch [N]eovim files' })

      vim.api.nvim_create_autocmd("User", {
        pattern = "ThemeChanged",
        callback = apply_telescope_highlights,
      })
    end,
  },
}
