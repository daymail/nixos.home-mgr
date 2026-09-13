return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Function to dynamically compute highlights from your active palette
      local function apply_dashboard_highlights()
        local c = require('config.colorscheme').active

        vim.api.nvim_set_hl(0, "icon",            { fg = c.c14, bold = true }) -- Matches your Function highlight
        vim.api.nvim_set_hl(0, "desc",            { fg = c.c5 })               -- Matches your standard Text foreground
        vim.api.nvim_set_hl(0, "key",             { fg = c.c12, italic = true }) -- Matches your Type/Title highlight
        vim.api.nvim_set_hl(0, "dashboardquit",   { fg = c.c11, bold = true }) -- Matches your Red/Statement alert color
        vim.api.nvim_set_hl(0, "DashboardHeader", { fg = c.c12, bold = true }) -- Title/Banner color balance
        vim.api.nvim_set_hl(0, "DashboardFooter", { fg = c.c3, italic = true })  -- Matches your Comment color
      end

      -- Run initial highlights on boot
      apply_dashboard_highlights()

      -- Hot-reload colorscheme dynamically when your custom :MyTheme event triggers
      vim.api.nvim_create_autocmd("User", {
        pattern = "ThemeChanged",
        callback = apply_dashboard_highlights,
      })
      require("dashboard").setup({
        theme = "doom",
        config = {
          header = {
            "",
            "",
            "",
            "",
            "    ███╗     ███╗██╗███╗   ██╗██╗███╗     ███╗ █████╗ ██╗     ",
            "    ████╗   ████║██║████╗  ██║██║████╗   ████║██╔══██╗██║     ",
            "    ██╔██╗ ██╔██║██║██╔██╗ ██║██║██╔██╗ ██╔██║███████║██║     ",
            "    ██║╚████╔╝██║██║██║╚██╗██║██║██║╚████╔╝██║██╔══██║██║     ",
            "    ██║ ╚███╔╝██║██║██║ ╚████║██║██║ ╚███╔╝██║██║  ██║███████╗",
            "    ╚═╝  ╚══╝ ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚══╝ ╚═╝╚═╝  ╚═╝╚══════╝",
            "",
            "",
            "",
            "",
          },
          header_pad = 20,
          center = {
            {
              icon = "󱘞  ",
              icon_hl = "icon",
              desc = "Find file",
              desc_hl = "desc",
              action = "Telescope find_files",
              key = "f",
              key_format = "     -     %s",
              key_hl = "key",
            },
            {
              icon = "  ",
              icon_hl = "icon",
              desc = "History",
              desc_hl = "desc",
              action = "Telescope oldfiles",
              key = "h",
              key_format = "     -     %s",
              key_hl = "key",
            },
            {
              icon = "  ",
              icon_hl = "icon",
              desc = "Config",
              desc_hl = "desc",
              action = "edit ~/.config/nvim/init.lua",
              key = "c",
              key_format = "     -     %s",
              key_hl = "key",
            },
            {
              icon = "  ",
              icon_hl = "icon",
              desc = "Work",
              desc_hl = "desc",
              action = "Telescope find_files cwd=~/src/work",
              key = "w",
              key_format = "     -     %s",
              key_hl = "key",
            },
            {
              icon = "  ",
              icon_hl = "icon",
              desc = "Plugins",
              desc_hl = "desc",
              action = "Lazy",
              key = "p",
              key_format = "     -     %s",
              key_hl = "key",
            },
            {
              icon = "󰈆  ",
              icon_hl = "icon",
              group = "dashboardquit",
              desc = "Quit",
              desc_hl = "desc",
              action = function()
                vim.cmd("cd ~")
                vim.cmd("qa")
              end,
              key = "q",
              key_format = "     -     %s",
              key_hl = "key",
            },
          },
          footer = {
            "",
            "",
            "",
            "",
            "",
            "         It's always for the larp.",
          },
          vertical_center = true,
        },
      })
    end,
  },
}
