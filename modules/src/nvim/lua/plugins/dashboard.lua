return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Set your custom highlights
      vim.api.nvim_set_hl(0, "icon", { fg = "#7C644D", bold = true })
      vim.api.nvim_set_hl(0, "desc", { fg = "#AEA492" })
      vim.api.nvim_set_hl(0, "key", { fg = "#AEA492", italic = true })
      vim.api.nvim_set_hl(0, "dashboardquit", { fg = "#ff5555", bold = true })
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#A9B665", bold = true })
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#747465", italic = true })

      -- Auto-reload highlights when colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "icon", { fg = "#d08770", bold = true })
          vim.api.nvim_set_hl(0, "desc", { fg = "#CBD7E8" })
          vim.api.nvim_set_hl(0, "key", { fg = "#CBD7E8", italic = true })
          vim.api.nvim_set_hl(0, "dashboardquit", { fg = "#ff5555", bold = true })
          vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#D9696A", bold = true })
          vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#9DBAA8", italic = true })
        end,
      })

      require("dashboard").setup({
        theme = "doom",
        config = {
		header = {
			"",
			"",
			"",
			"",
			"   ██████╗ ██████╗ ██╗   ██╗██╗   ██╗██████╗  ██████╗ ██╗  ██╗",
			"  ██╔════╝ ██╔══██╗██║   ██║██║   ██║██╔══██╗██╔═══██╗╚██╗██╔╝",
			"  ██║  ███╗██████╔╝██║   ██║██║   ██║██████╔╝██║   ██║ ╚███╔╝ ",
			"  ██║   ██║██╔══██╗██║   ██║╚██╗ ██╔╝██╔══██╗██║   ██║ ██╔██╗ ",
			"  ╚██████╔╝██║  ██║╚██████╔╝ ╚████╔╝ ██████╔╝╚██████╔╝██╔╝ ██╗",
			"   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═╝",
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
            "        He was aware that he was still a child.",
          },
          vertical_center = true,
        },
      })
    end,
  },
}
