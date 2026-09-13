return {
  "sphamba/smear-cursor.nvim",
  config = function()
    -- Note the underscore instead of a hyphen
    local sc = require("smear_cursor")
    
    sc.setup({
      cursor_color = require('config.colorscheme').active.c14,
      trailing_exponent = 4,
      enabled = true,
      smear_between_buffers = true,
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.3,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "ThemeChanged",
      callback = function()
        sc.setup({ cursor_color = require('config.colorscheme').active.c14 })
      end,
    })
  end,
}
