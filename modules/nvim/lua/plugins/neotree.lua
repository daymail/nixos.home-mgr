return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local function apply_neotree_highlights()
        local c = require('config.colorscheme').active
        local highlights = {
          NeoTreeNormal        = { bg = c.c0, fg = c.c5 }, -- Force main sidebar background to c0
          NeoTreeNormalNC      = { bg = c.c0, fg = c.c5 }, -- Force inactive sidebar background to c0
          NeoTreeSignColumn    = { bg = c.c0 },
          NeoTreeWinSeparator  = { fg = c.c2, bg = c.c0 }, -- Blends window vertical split line smoothly
          NeoTreeDirectoryName = { fg = c.c14, bold = true },
          NeoTreeDirectoryIcon = { fg = c.c14 },
          NeoTreeFileName      = { fg = c.c5 },
          NeoTreeGitUnstaged   = { fg = c.c12 },
          NeoTreeGitIgnored    = { fg = c.c3, italic = true },
          NeoTreeGitUntracked  = { fg = c.c5 },
          NeoTreeGitModified   = { fg = c.c12, bold = true },
          NeoTreeIndentMarker  = { fg = c.c6 },
          NeoTreeExpander      = { fg = c.c6 },
        }
        for group, settings in pairs(highlights) do
          vim.api.nvim_set_hl(0, group, settings)
        end
      end

      apply_neotree_highlights()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            show_hidden_count = true,
            hide_gitignored = false,
          },
        },
        default_component_configs = {
          git_status = {
            symbols = {
              untracked = "U",
              ignored   = "I",
              unstaged  = "M",
              staged    = "S",
              conflict  = "C",
            },
          },
        },
      })

      vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle [E]xplorer' })
      vim.keymap.set('n', '<leader>gs', ':Neotree float git_status<CR>', { desc = 'Git Status (Float)' })
      vim.keymap.set('n', '<leader>f', ':Neotree reveal<CR>', { desc = 'Reveal current file in tree' })

      vim.api.nvim_create_autocmd("User", {
        pattern = "ThemeChanged",
        callback = function()
          apply_neotree_highlights()
          pcall(function() require('nvim-web-devicons') end)
        end,
      })
    end
  }
}
