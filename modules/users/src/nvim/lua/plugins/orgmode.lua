return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
        -- Customizing status keyword colors for extra flair
        org_todo_keyword_faces = {
          TODO = ':foreground #EA6962 :weight bold', -- Matches your red
          NEXT = ':foreground #D8A657 :weight bold', -- Matches your yellow
          DONE = ':foreground #A9B665 :weight bold', -- Matches your green
        },
      })
    end,
  },

  {
    'nvim-orgmode/org-bullets.nvim',
    ft = { 'org' },
    config = function()
      require('org-bullets').setup({
        symbols = {
          -- Customize these to whatever Nerd Font icons you like best
          headlines = { "◉", "○", "✸", "✿" },
          checkboxes = {
            todo = { "☐", "OrgTodo" },
            done = { "✔", "OrgDone" },
          }
        }
      })
    end,
  },

  -- 3. Render Markdown (Adds full background highlight aesthetics to headings, blocks, & tables)
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
    ft = { 'markdown', 'org' }, -- Handles both beautifully!
    opts = {
      enabled = true,
      file_types = { 'markdown', 'org' },
      heading = {
        -- Turns on gorgeous full-line or partial-line background blocks
        backgrounds = {
          'DiffAdd',    -- Level 1 Heading style
          'DiffChange', -- Level 2 Heading style
          'DiffDelete', -- Level 3 Heading style
        },
      },
      code = {
        sign = true,
        width = 'block', -- Extends background highlight of code snippets to a nice block
        right_pad = 4,
      },
    },
  },
}
