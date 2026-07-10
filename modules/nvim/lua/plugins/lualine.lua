return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local function get_lualine_theme()
        local c = require('config.colorscheme').active
        local base = {
          b = { fg = c.c6, bg = c.c1 },
          c = { fg = c.c5, bg = c.c0 },
        }

        return {
          normal  = vim.tbl_deep_extend("force", base, { a = { fg = c.c0, bg = c.c8, gui = "bold" } }),
          insert  = vim.tbl_deep_extend("force", base, { a = { fg = c.c0, bg = c.c7, gui = "bold" } }),
          visual  = vim.tbl_deep_extend("force", base, { a = { fg = c.c0, bg = c.c12, gui = "bold" } }),
          replace = vim.tbl_deep_extend("force", base, { a = { fg = c.c0, bg = c.c11, gui = "bold" } }),
          command = vim.tbl_deep_extend("force", base, { a = { fg = c.c0, bg = c.c13, gui = "bold" } }),
          inactive = {
            a = { fg = c.c3, bg = c.c0, gui = "bold" },
            b = { fg = c.c3, bg = c.c0 },
            c = { fg = c.c3, bg = c.c0 },
          },
        }
      end

      -- Unified render function handles both initial boot and hot-reloads
      local function render_lualine()
        require('lualine').setup({
          options = {
            theme = get_lualine_theme(),
            component_separators = { left = '|', right = '|' },
            section_separators = { left = '', right = '' },
            icons_enabled = true,
            globalstatus = true,
          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'},
          },
        })
      end

      -- Initial run
      render_lualine()

      -- Triggers full component cycle update when :MyTheme executes
      vim.api.nvim_create_autocmd("User", {
        pattern = "ThemeChanged",
        callback = function()
          render_lualine()
        end,
      })
    end,
  },
}
